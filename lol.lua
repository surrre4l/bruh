-- Soluna Rayfield Mobile UI — repaired build
-- Fixes applied: flag guards, getMap cache, DescendantAdded early-out,
--                troll list filtering, lobby teleport pcall, LoadConfiguration order.

local players           = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local textChatService   = game:GetService("TextChatService")
local runService        = game:GetService("RunService")
local userInputService  = game:GetService("UserInputService")
local httpService       = game:GetService("HttpService")
local tweenService      = game:GetService("TweenService")
local coreGui           = game:GetService("CoreGui")

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local typeOf = typeof
local localPlayer = players.LocalPlayer

-- FIX #5: config restored before any auto-enable block runs.
pcall(function() Rayfield:LoadConfiguration() end)

-- ============================================================
-- Options compatibility layer
-- ============================================================
local options = {}

local function normalizeDropdownValue(value, multi)
  if multi then return value end
  if type(value) == "table" then return value[1] end
  return value
end

local function makeOption(flag, kind, defaultValue)
  local option = { Flag = flag, Kind = kind, Value = defaultValue, Control = nil }

  function option:SetValue(value)
    if self.Kind == "Dropdown" then
      value = normalizeDropdownValue(value, false)
      self.Value = value
      if self.Control and self.Control.Set then self.Control:Set({ value }) end
    else
      self.Value = value
      if self.Control and self.Control.Set then self.Control:Set(value) end
    end
  end

  function option:SetValues(values)
    if self.Kind == "Dropdown" and self.Control and self.Control.Refresh then
      self.Control:Refresh(values)
    end
  end

  options[flag] = option
  return option
end

local function wrapRayfieldTab(rayTab)
  local tab = {}

  function tab:AddSection(title)
    rayTab:CreateSection(title)
    local section = {}

    function section:AddButton(config)
      return rayTab:CreateButton({
        Name = config.Title or "Button",
        Callback = config.Callback or function() end,
      })
    end

    function section:AddParagraph(config)
      return rayTab:CreateParagraph({
        Title = config.Title or "",
        Content = config.Content or "",
      })
    end

    function section:AddToggle(flag, config)
      local option = makeOption(flag, "Toggle", config.Default == true)
      local control = rayTab:CreateToggle({
        Name = config.Title or flag,
        CurrentValue = config.Default == true,
        Flag = flag,
        Callback = function(value)
          option.Value = value
          if config.Callback then config.Callback(value) end
        end,
      })
      option.Control = control
      return control
    end

    function section:AddSlider(flag, config)
      local increment = 1
      if config.Rounding and config.Rounding > 0 then
        increment = 1 / (10 ^ config.Rounding)
      end
      local option = makeOption(flag, "Slider", config.Default)
      local control = rayTab:CreateSlider({
        Name = config.Title or flag,
        Range = { config.Min or 0, config.Max or 100 },
        Increment = increment,
        Suffix = "",
        CurrentValue = config.Default or 0,
        Flag = flag,
        Callback = function(value)
          option.Value = value
          if config.Callback then config.Callback(value) end
        end,
      })
      option.Control = control
      return control
    end

    function section:AddDropdown(flag, config)
      local defaultValue = normalizeDropdownValue(config.Default, config.Multi == true)
      local option = makeOption(flag, "Dropdown", defaultValue)
      local currentOption
      if config.Multi then
        currentOption = type(config.Default) == "table" and config.Default or { config.Default }
      else
        currentOption = { defaultValue }
      end
      local control = rayTab:CreateDropdown({
        Name = config.Title or flag,
        Options = config.Values or {},
        CurrentOption = currentOption,
        MultipleOptions = config.Multi == true,
        Flag = flag,
        Callback = function(value)
          local normalized = normalizeDropdownValue(value, config.Multi == true)
          option.Value = normalized
          if config.Callback then config.Callback(normalized) end
        end,
      })
      option.Control = control
      return control
    end

    function section:AddKeybind(flag, config)
      local option = makeOption(flag, "Keybind", config.Default)
      local control = rayTab:CreateKeybind({
        Name = config.Title or flag,
        CurrentKeybind = config.Default or "F",
        HoldToInteract = config.Mode == "Hold",
        Flag = flag,
        Callback = function()
          if config.Callback then config.Callback(true) end
        end,
      })
      option.Control = control
      return control
    end

    return section
  end

  return tab
end

local function wrapRayfieldWindow(rayWindow)
  local window = { Raw = rayWindow }
  function window:AddTab(config)
    return wrapRayfieldTab(rayWindow:CreateTab(config.Title or "Tab", config.Icon))
  end
  function window:SelectTab(_) end
  return window
end

local function hasFunction(name)
  if typeOf(_G[name]) == "function" then return true end
  if typeOf(getfenv) == "function" then
    local ok, env = pcall(getfenv)
    return ok and typeOf(env) == "table" and typeOf(env[name]) == "function"
  end
  return false
end

-- ============================================================
-- State
-- ============================================================
local state = {
  fly = { active = false, gyro = nil, velocity = nil, speed = 1 },
}

local coinState = {
  list = {}, container = nil, addedConn = nil, removedConn = nil,
}

local characterCache = { character = nil, parts = {} }
local roleData = {}
local Utils = {}

-- FIX #perf: cached map reference. Invalidated on workspace child change.
local _cachedMap = nil
local function getMap()
  if _cachedMap and _cachedMap.Parent then return _cachedMap end
  for _, v in ipairs(workspace:GetChildren()) do
    if v:FindFirstChild("CoinContainer") and v:FindFirstChild("Spawns") then
      _cachedMap = v
      return v
    end
  end
  return nil
end

workspace.ChildRemoved:Connect(function(c) if c == _cachedMap then _cachedMap = nil end end)
workspace.ChildAdded:Connect(function(c)
  if not _cachedMap and c:FindFirstChild("CoinContainer") and c:FindFirstChild("Spawns") then
    _cachedMap = c
  end
end)

-- ============================================================
-- Coin container / character cache
-- ============================================================
local function skipCoin(p1)
  if not p1 then return end
  for i = #coinState.list, 1, -1 do
    if coinState.list[i] == p1 then table.remove(coinState.list, i); break end
  end
  pcall(function() p1:SetAttribute("SolunaSkip", true) end)
  task.delay(2, function()
    pcall(function()
      if p1 and p1.Parent then p1:SetAttribute("SolunaSkip", nil) end
    end)
  end)
end

local function clearCoinContainer()
  if coinState.addedConn then coinState.addedConn:Disconnect(); coinState.addedConn = nil end
  if coinState.removedConn then coinState.removedConn:Disconnect(); coinState.removedConn = nil end
  coinState.list = {}
  coinState.container = nil
end

local function cacheCharacterParts(p2)
  if characterCache.character == p2 and p2 then return characterCache.parts end
  local v5 = {}
  if p2 then
    for _, value in ipairs(p2:GetDescendants()) do
      if value:IsA("BasePart") then table.insert(v5, value) end
    end
  end
  characterCache = { character = p2, parts = v5 }
  return v5
end

local function watchCoinContainer(p3)
  if not p3 then clearCoinContainer(); return end
  if coinState.container == p3 then return end
  clearCoinContainer()
  coinState.container = p3

  for _, value2 in ipairs(p3:GetChildren()) do
    pcall(function() value2:SetAttribute("SolunaSkip", nil) end)
    table.insert(coinState.list, value2)
  end

  coinState.addedConn = p3.ChildAdded:Connect(function(child)
    pcall(function() child:SetAttribute("SolunaSkip", nil) end)
    table.insert(coinState.list, child)
  end)

  coinState.removedConn = p3.ChildRemoved:Connect(function(child2)
    for j = #coinState.list, 1, -1 do
      if coinState.list[j] == child2 then table.remove(coinState.list, j); break end
    end
  end)
end

-- ============================================================
-- Utils (part 1: notify + string helpers)
-- ============================================================
function Utils:Notify(title, content, duration, _)
  if options.enableNotifications and options.enableNotifications.Value == false then return end
  Rayfield:Notify({
    Title = title or "Soluna",
    Content = tostring(content or ""),
    Duration = duration or 3,
  })
end

function Utils.SplitString(p7, p8)
  local v9 = {}
  for match in p7:gmatch("[^" .. (p8 or ",") .. "]+") do table.insert(v9, match) end
  return v9
end

function Utils.ToTokens(p9)
  local v10 = {}
  for match2, v11 in p9:gmatch("([+-])([^+-]+)") do
    table.insert(v10, { Operator = match2, Name = v11 })
  end
  return v10
end

function Utils.OnlyIncludeInTable(p10, p11)
  local v12, v13 = {}, {}
  if not p11 then return p10 end
  for _, value3 in pairs(p11) do
    if value3 and value3.Name then v12[value3.Name] = true end
  end
  for _, value4 in pairs(p10) do
    if value4 and value4.Name and v12[value4.Name] then table.insert(v13, value4) end
  end
  return v13
end

function Utils.RemoveTableMatches(p12, p13)
  local v14, v15 = {}, {}
  if not p13 then return p12 end
  for _, value5 in pairs(p13) do
    if value5 and value5.Name then v14[value5.Name] = true end
  end
  for _, value6 in pairs(p12) do
    if value6 and value6.Name and not v14[value6.Name] then table.insert(v15, value6) end
  end
  return v15
end

function Utils.GetPlayersByName(p14)
  local v16 = {}
  local v17 = #p14
  local lower = p14:lower()
  for _, value7 in pairs(players:GetPlayers()) do
    if lower:sub(1, 1) == "@" then
      if value7.Name:lower():sub(1, v17 - 1) == lower:sub(2) then table.insert(v16, value7) end
    elseif value7.Name:lower():sub(1, v17) == lower
        or value7.DisplayName:lower():sub(1, v17) == lower then
      table.insert(v16, value7)
    end
  end
  return v16
end

function Utils.GetPlayer(p15, p16)
  local localPlayer2 = p16 or players.LocalPlayer
  if p15 == nil then return localPlayer2 end
  local v18 = {}
  for _, value8 in pairs(Utils.SplitString(p15, ",")) do
    if value8:sub(1, 1) ~= "+" and value8:sub(1, 1) ~= "-" then value8 = "+" .. value8 end
    local v19 = Utils.ToTokens(value8)
    local getPlayers = players:GetPlayers()
    for _, value9 in pairs(v19) do
      if value9.Operator == "+" then
        getPlayers = Utils.OnlyIncludeInTable(getPlayers, Utils.GetPlayersByName(value9.Name))
      else
        getPlayers = Utils.RemoveTableMatches(getPlayers, Utils.GetPlayersByName(value9.Name))
      end
    end
    for _, value10 in pairs(getPlayers) do table.insert(v18, value10) end
  end
  return v18[1]
end

-- ============================================================
-- Utils (part 2: targeting, fling, gun pickup)
-- ============================================================
function Utils.getClosestModelToPlayer(p17, p18)
  local huge = math.huge
  local v20 = not p17 or not p17.Character
    or not p17.Character:FindFirstChild("HumanoidRootPart")
  if v20 then return nil, math.huge end
  local v21
  local position = p17.Character.HumanoidRootPart.Position

  for _, value11 in ipairs(p18) do
    if value11 and value11.Parent then
      local position2 = nil
      if typeOf(value11.IsA) == "function" then
        if value11:IsA("Model") then
          if value11.PrimaryPart then
            position2 = value11.PrimaryPart.Position
          elseif typeOf(value11.GetPivot) == "function" then
            local getPivot = value11:GetPivot()
            if getPivot and typeOf(getPivot) == "CFrame" then position2 = getPivot.Position end
          end
        elseif value11:IsA("BasePart") then
          position2 = value11.Position
        end
      elseif value11.ClassName == "Model" then
        if value11.PrimaryPart then position2 = value11.PrimaryPart.Position end
      elseif rawget(value11, "Position") then
        position2 = value11.Position
      end
      if position2 then
        local magnitude = (position2 - position).Magnitude
        if magnitude < huge then huge = magnitude; v21 = value11 end
      end
    end
  end
  return v21, huge
end

function Utils.miniFling(p19)
  local localPlayer3 = players.LocalPlayer
  if not p19 then
    Utils.Notify("Fling target is nil.", "Fling Error", 3)
    return
  end

  local character = localPlayer3.Character
  local humanoid2 = character and character:FindFirstChildOfClass("Humanoid")
  local rootPart = humanoid2 and humanoid2.RootPart

  if not (character and humanoid2 and rootPart) then
    Utils.Notify("Your character is not set up to perform this action.", "Fling Error", 3)
    return
  end

  local character2 = p19.Character
  if not character2 then
    Utils.Notify(p19.Name .. " has no character to fling.", "Fling Error", 3)
    return
  end

  local humanoid = character2:FindFirstChildOfClass("Humanoid")
  local rootPart2 = humanoid and humanoid.RootPart
  local head = character2:FindFirstChild("Head")
  local accessory = character2:FindFirstChildOfClass("Accessory")
  local handle = accessory and accessory:FindFirstChild("Handle")
  local cframe = nil

  if rootPart.Velocity.Magnitude < 50 then
    cframe = rootPart.CFrame
  else
    Utils.Notify("You are moving quickly; fling reset position might be less accurate.", "Fling Info", 2)
  end

  if head then
    if head.Velocity.Magnitude > 500 then
      Utils.Notify(p19.Name .. " is already moving very fast. Not flinging again.", "Fling Info", 3)
      return
    end
  elseif handle then
    if handle.Velocity.Magnitude > 500 then
      Utils.Notify(p19.Name .. " (via accessory) is already moving very fast. Not flinging again.", "Fling Info", 3)
      return
    end
  end

  if head then
    workspace.CurrentCamera.CameraSubject = head
  elseif handle then
    workspace.CurrentCamera.CameraSubject = handle
  elseif humanoid and rootPart2 then
    workspace.CurrentCamera.CameraSubject = humanoid
  end

  if not character2:FindFirstChildWhichIsA("BasePart") then
    Utils.Notify(p19.Name .. " has no base parts to target for fling.", "Fling Error", 3)
    return
  end

  local function setFlingPosition(p20, p21, p22)
    if not rootPart or not rootPart.Parent then return end
    rootPart.CFrame = CFrame.new(p20.Position) * p21 * p22
    if character and character.PrimaryPart then
      character:SetPrimaryPartCFrame(CFrame.new(p20.Position) * p21 * p22)
    end
    rootPart.Velocity = Vector3.new(4782969, 47829690, 4782969)
    rootPart.RotVelocity = Vector3.new(43046721, 43046721, 43046721)
  end

  local function runFling(p23)
    local v23 = tick()
    local total = 0
    local v25

    repeat
      if rootPart and humanoid and p23 and p23.Parent then
        total = total + 100
        local moveDirection = humanoid.MoveDirection
        local magnitude2 = p23.Velocity.Magnitude
        local walkSpeed = humanoid.WalkSpeed

        if magnitude2 < 50 then
          setFlingPosition(p23, CFrame.new(0, 1.5, 0) + moveDirection * magnitude2 / 1.25, CFrame.Angles(math.rad(total), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, 0) + moveDirection * magnitude2 / 1.25, CFrame.Angles(math.rad(total), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(2.25, 1.5, -2.25) + moveDirection * magnitude2 / 1.25, CFrame.Angles(math.rad(total), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(-2.25, -1.5, 2.25) + moveDirection * magnitude2 / 1.25, CFrame.Angles(math.rad(total), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, 1.5, 0) + moveDirection, CFrame.Angles(math.rad(total), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, 0) + moveDirection, CFrame.Angles(math.rad(total), 0, 0)); task.wait()
        else
          setFlingPosition(p23, CFrame.new(0, 1.5, walkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, -walkSpeed), CFrame.Angles(0, 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, 1.5, walkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, 1.5, magnitude2 / 1.25), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, -magnitude2 / 1.25), CFrame.Angles(0, 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, 1.5, magnitude2 / 1.25), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0)); task.wait()
          setFlingPosition(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0)); task.wait()
        end

        local v26 = not p23.Parent
        v25 = v26
        if not v26 then
          local v27 = p23.Velocity.Magnitude > 500
          local sit = v27
          if not v27 then
            sit = p19.Parent ~= players or p19.Character ~= character2
              or (humanoid and humanoid.Sit) or (humanoid2 and humanoid2.Health <= 0)
              or tick() > v23 + 2
          end
          v25 = sit
        end
      else
        break
      end
    until v25
  end

  local savedDestroyHeight = workspace.FallenPartsDestroyHeight
  workspace.FallenPartsDestroyHeight = (0 / 0)

  local solunaFlingVel = Instance.new("BodyVelocity")
  solunaFlingVel.Name = "SolunaFlingVel"
  solunaFlingVel.Parent = rootPart
  solunaFlingVel.Velocity = Vector3.new(43046721, 43046721, 43046721)
  solunaFlingVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

  if humanoid2 and humanoid2.Parent then
    humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
  end

  pcall(function()
    if rootPart2 and head then
      if (rootPart2.CFrame.Position - head.CFrame.Position).Magnitude > 5 then
        runFling(head)
      else
        runFling(rootPart2)
      end
    elseif rootPart2 then
      runFling(rootPart2)
    elseif head then
      runFling(head)
    elseif accessory and handle then
      runFling(handle)
    else
      Utils.Notify("Can't find a proper part of " .. p19.Name .. " to fling.", "Fling Error", 3)
    end
  end)

  if solunaFlingVel and solunaFlingVel.Parent then solunaFlingVel:Destroy() end
  if humanoid2 and humanoid2.Parent then
    humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
  end
  if workspace.CurrentCamera and humanoid2 and humanoid2.Parent then
    workspace.CurrentCamera.CameraSubject = humanoid2
  end

  if cframe and rootPart and rootPart.Parent then
    local count = 0
    repeat
      rootPart.CFrame = cframe * CFrame.new(0, 0.5, 0)
      if character and character.PrimaryPart then
        character:SetPrimaryPartCFrame(cframe * CFrame.new(0, 0.5, 0))
      end
      if humanoid2 and humanoid2.Parent then
        humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
      end
      if character then
        for _, value12 in ipairs(character:GetChildren()) do
          if value12:IsA("BasePart") then
            value12.Velocity = Vector3.new()
            value12.RotVelocity = Vector3.new()
          end
        end
      end
      task.wait()
      count = count + 1
      local done = not rootPart.Parent
      done = done or (rootPart.Position - cframe.Position).Magnitude < 25 or count > 50
      if done then break end
    until false
  end

  workspace.FallenPartsDestroyHeight = savedDestroyHeight
  Utils.Notify("Fling attempt on " .. p19.Name .. " finished.", "Fling Action", 2)
end

function Utils.pickupGun()
  local v30 = _G.firetouchinterest or firetouchinterest
  if not v30 then
    Utils.Notify("`firetouchinterest` is not available in your executor.", "Error", 4)
    return false
  end

  local character3 = localPlayer.Character
  local humanoidRootPart = character3 and character3:FindFirstChild("HumanoidRootPart")
  if not humanoidRootPart then
    Utils.Notify("Cannot pick up gun: Your character is not available.", "Error", 2)
    return false
  end

  local findFirstChild = workspace:FindFirstChild("GunDrop", true)
  if not (findFirstChild and findFirstChild:IsA("BasePart")) then
    Utils.Notify("No dropped gun found anywhere in the game.", "Info", 2)
    return false
  end

  Utils.Notify("Gun detected! Initiating cheat pickup...", "Gun Pickup")
  local cframe2 = humanoidRootPart.CFrame
  local v31 = {}
  for _, value14 in ipairs(character3:GetDescendants()) do
    if value14:IsA("BasePart") then
      v31[value14] = value14.CanCollide
      value14.CanCollide = false
    end
  end

  humanoidRootPart.CFrame = findFirstChild.CFrame * CFrame.new(0, 2, 0)
  task.wait(0.1)
  pcall(v30, findFirstChild, humanoidRootPart, 0)
  task.wait(0.1)
  pcall(v30, findFirstChild, humanoidRootPart, 1)
  task.wait(0.2)
  humanoidRootPart.CFrame = cframe2

  for part, val in pairs(v31) do
    if part and part.Parent then part.CanCollide = val end
  end

  if not findFirstChild.Parent then
    Utils.Notify("Successfully picked up the gun!", "Success")
    if hasFunction("ReloadPlayerESP") then _G.ReloadPlayerESP() end
    return true
  end

  Utils.Notify("Failed to pick up the gun.", "Error", 2)
  return false
end

-- ============================================================
-- Safe zone
-- ============================================================
local solunaSafeZone

local function createSafeZone()
  if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
    Utils.Notify("Waiting for character to spawn to create Safe Zone...", "Info")
    localPlayer.CharacterAdded:Wait()
  end

  local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
  if not hrp then
    Utils.Notify("Could not get character position for Safe Zone.", "Error")
    return
  end

  if solunaSafeZone and solunaSafeZone.Parent then solunaSafeZone:Destroy() end

  solunaSafeZone = Instance.new("Part")
  solunaSafeZone.Name = "SolunaSafeZone"
  solunaSafeZone.Size = Vector3.new(500, 2, 500)
  solunaSafeZone.CFrame = hrp.CFrame * CFrame.new(0, 5000, 0)
  solunaSafeZone.Anchored = true
  solunaSafeZone.Transparency = 0.5
  solunaSafeZone.Color = Color3.fromRGB(0, 255, 255)
  solunaSafeZone.Material = Enum.Material.ForceField
  solunaSafeZone.CanCollide = true
  solunaSafeZone.Parent = workspace

  Utils.Notify("Safe Zone platform created 5000 studs above you.", "Success")
end

-- ============================================================
-- ESP Indicator
-- ============================================================
local ESPIndicator = {}
ESPIndicator.__index = ESPIndicator

local function getGuiParent()
  if get_hidden_gui then return get_hidden_gui() end
  if gethui then return gethui() end
  if syn and syn.protect_gui then
    local instance = Instance.new("ScreenGui", coreGui)
    instance.Name = httpService:GenerateGUID(false)
    syn.protect_gui(instance)
    return instance
  end
  return coreGui
end

-- FIX #latent: Parent resolved at construct time, not module-load time.
ESPIndicator.Defaults = {
  AccentColor = Color3.new(1, 1, 0),
  HighlightFillTransparency = 0.7,
  HighlightOutlineTransparency = 0,
  HighlightDepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
  ArrowShow = false,
  ArrowEdgePadding = 50,
  ArrowMinDistance = 0,
  ArrowSize = UDim2.new(0, 30, 0, 30),
  ArrowImage = "rbxassetid://97136202386756",
  ArrowShowDistanceText = true,
  ArrowDistanceFont = Enum.Font.Gotham,
  ArrowDistanceTextSize = 14,
  ShowLabel = false,
  LabelText = "Target",
  LabelMaxDistance = 200,
  LabelOffset = Vector3.new(0, 2.5, 0),
}

function ESPIndicator._allArrows(p24)
  local v33 = {}
  for _, value16 in pairs(p24.Indicators) do
    if value16.Arrow then table.insert(v33, value16.Arrow) end
  end
  return v33
end

function ESPIndicator._allHighlights(p45)
  local v48 = {}
  for _, value27 in pairs(p45.Indicators) do
    if value27.Highlight then table.insert(v48, value27.Highlight) end
  end
  return v48
end

function ESPIndicator._allLabels(p46)
  local v49 = {}
  for _, value28 in pairs(p46.Indicators) do
    if value28.Label then table.insert(v49, value28.Label) end
  end
  return v49
end

function ESPIndicator.new(p25)
  local v34 = setmetatable({}, ESPIndicator)
  v34.Settings = {}
  for key11, value17 in pairs(ESPIndicator.Defaults) do
    v34.Settings[key11] = p25 and p25[key11] ~= nil and p25[key11] or value17
  end
  v34.Settings.Parent = (p25 and p25.Parent) or getGuiParent()

  v34.ScreenGui = Instance.new("ScreenGui")
  v34.ScreenGui.Name = "SolunaESPContainer_" .. httpService:GenerateGUID(false)
  v34.ScreenGui.IgnoreGuiInset = true
  v34.ScreenGui.ResetOnSpawn = false
  v34.ScreenGui.Parent = v34.Settings.Parent

  v34.ArrowTemplate = Instance.new("ImageLabel")
  v34.ArrowTemplate.Name = "ArrowTemplate"
  v34.ArrowTemplate.Size = v34.Settings.ArrowSize
  v34.ArrowTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
  v34.ArrowTemplate.BackgroundTransparency = 1
  v34.ArrowTemplate.Image = v34.Settings.ArrowImage
  v34.ArrowTemplate.ImageColor3 = v34.Settings.AccentColor
  v34.ArrowTemplate.Visible = false
  v34.ArrowTemplate.Parent = v34.ScreenGui

  v34.Scaler = Instance.new("UIScale", v34.ArrowTemplate)
  v34.Scaler.Name = "Scaler"
  v34.Scaler.Scale = 0

  v34.Indicators = {}
  v34.Groups = {}
  v34.TargetIndex = {}

  v34._updateConn = runService.RenderStepped:Connect(function()
    if v34.ScreenGui and v34.ScreenGui.Parent then v34:_update() end
  end)

  v34._cleanupConn = runService.Heartbeat:Connect(function()
    if v34.ScreenGui and v34.ScreenGui.Parent then
      v34:_cleanupOrphaned("Highlight", "_allHighlights")
      v34:_cleanupOrphaned("ImageLabel", "_allArrows", "^Arrow_")
      v34:_cleanupOrphaned("BillboardGui", "_allLabels", "^Label_")
    end
  end)

  return v34
end

function ESPIndicator:AddGroup(p26)
  local v35 = self.Groups[p26]
  if not v35 then
    v35 = { enabled = true, properties = {}, targets = {} }
    self.Groups[p26] = v35
  end
  return v35
end

function ESPIndicator.GetGroup(p27, p28)
  return p27.Groups[p28]
end

function ESPIndicator:GetGroupTargets(p29)
  local v36 = self.Groups[p29]
  return v36 and v36.targets or {}
end

function ESPIndicator:RemoveGroup(p30)
  local v37 = self.Groups[p30]
  if not v37 then return false end
  for _, value18 in ipairs(v37.targets) do
    local v38 = self.TargetIndex[value18]
    if v38 then
      for i = #v38, 1, -1 do
        if v38[i] == p30 then table.remove(v38, i); break end
      end
      if #v38 == 0 then self.TargetIndex[value18] = nil end
    end
    if not self.TargetIndex[value18] then self:Remove(value18) end
  end
  self.Groups[p30] = nil
  return true
end

function ESPIndicator:ClearAllGroups()
  for key12 in pairs(self.Groups) do self:RemoveGroup(key12) end
end

function ESPIndicator.ToggleGroup(p31, p32, p33)
  local v39 = p31.Groups[p32]
  if not v39 then return end
  v39.enabled = p33 ~= nil and p33 or not v39.enabled
  for _, value21 in ipairs(v39.targets) do
    local v40 = p31.Indicators[value21]
    if v40 then
      if v40.Highlight then v40.Highlight.Enabled = v39.enabled end
      if v40.Arrow then
        v40.Arrow.Visible = v39.enabled and (v40.Options.ArrowShow or p31.Settings.ArrowShow)
      end
      if v40.Label then v40.Label.Enabled = v39.enabled end
    end
  end
  return v39.enabled
end

function ESPIndicator:SetGroupProperty(p34, p35, p36)
  local addGroup = self:AddGroup(p34)
  addGroup.properties[p35] = p36
  for _, value22 in ipairs(addGroup.targets) do
    local v41 = self.Indicators[value22]
    if v41 and p35 == "AccentColor" then
      if v41.Highlight then
        v41.Highlight.FillColor = p36
        v41.Highlight.OutlineColor = p36
      end
      if v41.Arrow then v41.Arrow.ImageColor3 = p36 end
      if v41.DistanceLabel then v41.DistanceLabel.TextColor3 = p36 end
      if v41.Label and v41.Label:FindFirstChild("TextLabel") then
        v41.Label.TextLabel.TextColor3 = p36
      end
    end
  end
end

function ESPIndicator:Add(p37, p38)
  assert(p37, "ESPIndicator:Add requires a non-nil target")
  if not p37.Parent then
    Utils.Notify("ESP target is invalid or has no parent: " .. tostring(p37), "ESP Error")
    return
  end

  local v42 = p38 or {}
  local generateGUID = httpService:GenerateGUID(false)
  local highlight = nil

  if p37:IsA("Model") or p37:IsA("BasePart") or p37:IsA("Accoutrement") then
    highlight = Instance.new("Highlight")
    highlight.Name = "Highlight_" .. generateGUID
    highlight.Adornee = p37
    highlight.FillTransparency = v42.HighlightFillTransparency or self.Settings.HighlightFillTransparency
    highlight.FillColor = v42.AccentColor or self.Settings.AccentColor
    highlight.OutlineColor = v42.AccentColor or self.Settings.AccentColor
    highlight.OutlineTransparency = v42.HighlightOutlineTransparency or self.Settings.HighlightOutlineTransparency
    highlight.DepthMode = v42.HighlightDepthMode or self.Settings.HighlightDepthMode
    highlight.Parent = self.ScreenGui
  end

  local scaler, distanceLabel, clone

  if v42.ArrowShow or self.Settings.ArrowShow then
    clone = self.ArrowTemplate:Clone()
    clone.Name = "Arrow_" .. generateGUID
    clone.ImageColor3 = v42.AccentColor or self.Settings.AccentColor
    clone.Size = v42.ArrowSize or self.Settings.ArrowSize
    clone.Visible = true
    clone.Parent = self.ScreenGui
    scaler = clone:FindFirstChild("Scaler") or Instance.new("UIScale", clone)

    if v42.ArrowShowDistanceText or self.Settings.ArrowShowDistanceText then
      distanceLabel = Instance.new("TextLabel")
      distanceLabel.Name = "DistanceLabel"
      distanceLabel.AnchorPoint = Vector2.new(0.5, 0)
      distanceLabel.BackgroundTransparency = 1
      distanceLabel.Font = v42.ArrowDistanceFont or self.Settings.ArrowDistanceFont
      distanceLabel.TextSize = v42.ArrowDistanceTextSize or self.Settings.ArrowDistanceTextSize
      distanceLabel.TextColor3 = v42.AccentColor or self.Settings.AccentColor
      distanceLabel.Parent = clone
    end
  end

  local billboardGui

  if (v42.ShowLabel or self.Settings.ShowLabel) and (p37:IsA("Model") or p37:IsA("BasePart")) then
    billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "Label_" .. generateGUID
    billboardGui.AlwaysOnTop = true
    billboardGui.MaxDistance = v42.LabelMaxDistance or self.Settings.LabelMaxDistance
    billboardGui.Size = UDim2.new(0, 100, 0, 20)
    billboardGui.StudsOffset = v42.LabelOffset or self.Settings.LabelOffset
    billboardGui.Adornee = p37
    billboardGui.Parent = self.ScreenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "TextLabel"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextScaled = true
    textLabel.TextWrapped = true
    textLabel.TextColor3 = v42.AccentColor or self.Settings.AccentColor
    textLabel.Text = v42.LabelText or self.Settings.LabelText
    textLabel.Parent = billboardGui
    Instance.new("UIStroke", textLabel)
  end

  self.Indicators[p37] = {
    Highlight = highlight,
    Arrow = clone,
    Scaler = scaler,
    DistanceLabel = distanceLabel,
    Label = billboardGui,
    Options = v42,
  }

  if v42.GroupName then self:AddToGroup(p37, v42.GroupName) end
end

function ESPIndicator:Remove(p39)
  local v43 = self.Indicators[p39]
  if not v43 then return end
  if v43.Highlight then v43.Highlight:Destroy() end
  if v43.Arrow then v43.Arrow:Destroy() end
  if v43.Label then v43.Label:Destroy() end
  local v44 = self.TargetIndex[p39]
  if v44 then
    for _, groupName in ipairs(v44) do
      local group = self.Groups[groupName]
      if group then
        for i = #group.targets, 1, -1 do
          if group.targets[i] == p39 then table.remove(group.targets, i) end
        end
      end
    end
    self.TargetIndex[p39] = nil
  end
  self.Indicators[p39] = nil
end

function ESPIndicator:AddToGroup(p40, p41)
  local addGroup2 = self:AddGroup(p41)
  if not table.find(addGroup2.targets, p40) then table.insert(addGroup2.targets, p40) end
  local v45 = self.TargetIndex[p40]
  if not v45 then v45 = {}; self.TargetIndex[p40] = v45 end
  if not table.find(v45, p41) then table.insert(v45, p41) end

  for key13, value24 in pairs(addGroup2.properties) do
    self:SetGroupProperty(p41, key13, value24)
  end

  if not addGroup2.enabled then
    local v46 = self.Indicators[p40]
    if v46 then
      if v46.Highlight then v46.Highlight.Enabled = false end
      if v46.Arrow then v46.Arrow.Visible = false end
      if v46.Label then v46.Label.Enabled = false end
    end
  end
  return true
end

function ESPIndicator:_cleanupOrphaned(p42, p43, p44)
  if not self.ScreenGui or not self.ScreenGui.Parent then return end
  for _, value25 in ipairs(self.ScreenGui:GetChildren()) do
    if value25:IsA(p42) and (not p44 or value25.Name:match(p44)) then
      local found = false
      for _, value26 in ipairs(self[p43](self)) do
        if value26 == value25 then found = true; break end
      end
      if not found then
        if value25:IsA("Highlight") or value25:IsA("BillboardGui") then
          value25.Adornee = nil
        end
        value25:Destroy()
      end
    end
  end
end

function ESPIndicator:_update()
  if not self.ScreenGui or not self.ScreenGui.Parent then return end
  local currentCamera = workspace.CurrentCamera
  if not currentCamera then return end

  local viewportSize = currentCamera.ViewportSize
  local y2 = viewportSize.Y
  local x2 = viewportSize.X

  for key16, value29 in pairs(self.Indicators) do
    if not key16 or not key16.Parent then
      self:Remove(key16)
    else
      local options2 = value29.Options
      local arrow2 = value29.Arrow
      local scaler2 = value29.Scaler

      if arrow2 and scaler2 and arrow2.Parent and scaler2.Parent then
        if arrow2.Visible or options2.ArrowShow or self.Settings.ArrowShow then
          local position3
          if key16:IsA("Model") and key16.PrimaryPart then
            position3 = key16.PrimaryPart.Position
          elseif key16:IsA("BasePart") then
            position3 = key16.Position
          end

          if position3 then
            local v51, v52 = currentCamera:WorldToViewportPoint(position3)
            local magnitude3 = (currentCamera.CFrame.Position - position3).Magnitude
            local arrowMinDistance = options2.ArrowMinDistance or self.Settings.ArrowMinDistance
            local arrowEdgePadding = options2.ArrowEdgePadding or self.Settings.ArrowEdgePadding

            if v52 and magnitude3 > arrowMinDistance then
              if scaler2.Scale ~= 0 then
                tweenService:Create(scaler2,
                  TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  { Scale = 0 }):Play()
              end
            else
              if scaler2.Scale ~= 1 then
                tweenService:Create(scaler2,
                  TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  { Scale = 1 }):Play()
              end

              local pointToObjectSpace = currentCamera.CFrame:PointToObjectSpace(position3)
              local v58 = math.atan2(pointToObjectSpace.X, -pointToObjectSpace.Z)
              local x, y, v55

              if v52 then
                x = v51.X
                y = v51.Y
                v55 = math.deg(math.atan2(v51.X - x2 / 2, -(v51.Y - y2 / 2)))
              else
                local v53, v54
                if math.abs(pointToObjectSpace.X / -pointToObjectSpace.Z) > x2 / y2 then
                  v54 = pointToObjectSpace.X > 0 and x2 - arrowEdgePadding or arrowEdgePadding
                  v53 = y2 / 2 - pointToObjectSpace.Y * (x2 / 2 - arrowEdgePadding)
                    / math.abs(pointToObjectSpace.X)
                else
                  v53 = pointToObjectSpace.Y > 0 and arrowEdgePadding or y2 - arrowEdgePadding
                  v54 = x2 / 2 + pointToObjectSpace.X * (y2 / 2 - arrowEdgePadding)
                    / math.abs(pointToObjectSpace.Y)
                end
                x = math.clamp(v54, arrowEdgePadding, x2 - arrowEdgePadding)
                y = math.clamp(v53, arrowEdgePadding, y2 - arrowEdgePadding)
                v55 = math.deg(v58)
              end

              tweenService:Create(arrow2,
                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                { Position = UDim2.fromOffset(x, y), Rotation = v55 }):Play()
            end

            if value29.DistanceLabel then
              value29.DistanceLabel.Text = string.format("%dm", math.round(magnitude3))
              local offset = options2.ArrowSize and options2.ArrowSize.Y.Offset
                or self.Settings.ArrowSize.Y.Offset
              value29.DistanceLabel.Position = UDim2.new(0.5, 0, 0, offset / 2 + 5)
            end
          end
        end
      end
    end
  end
end

function ESPIndicator:Destroy()
  if self._updateConn then self._updateConn:Disconnect(); self._updateConn = nil end
  if self._cleanupConn then self._cleanupConn:Disconnect(); self._cleanupConn = nil end
  self:ClearAllGroups()
  for key17 in pairs(self.Indicators) do self:Remove(key17) end
  if self.ScreenGui then self.ScreenGui:Destroy(); self.ScreenGui = nil end
  self.Indicators = {}
  self.Groups = {}
  self.TargetIndex = {}
end

-- ============================================================
-- Window & tabs
-- ============================================================
local solunaWindow = wrapRayfieldWindow(Rayfield:CreateWindow({
  Name = "Soluna — Murder Mystery 2",
  LoadingTitle = "Soluna",
  LoadingSubtitle = "Murder Mystery 2",
  ShowText = "Soluna",
  Theme = "Default",
  ToggleUIKeybind = "RightShift",
  DisableRayfieldPrompts = false,
  DisableBuildWarnings = false,
  ConfigurationSaving = {
    Enabled = true,
    FolderName = "Soluna",
    FileName = "MurderMystery2",
  },
  Discord = { Enabled = false },
  KeySystem = false,
}))

local Tabs = {
  Player     = solunaWindow:AddTab({ Title = "Player",     Icon = "user" }),
  Combat     = solunaWindow:AddTab({ Title = "Combat",     Icon = "swords" }),
  Visuals    = solunaWindow:AddTab({ Title = "Visuals",    Icon = "eye" }),
  Automation = solunaWindow:AddTab({ Title = "Automation", Icon = "bot" }),
  Teleport   = solunaWindow:AddTab({ Title = "Teleport",   Icon = "move" }),
  Misc       = solunaWindow:AddTab({ Title = "Misc",       Icon = "box" }),
  Trolling   = solunaWindow:AddTab({ Title = "Trolling",   Icon = "smile" }),
  Settings   = solunaWindow:AddTab({ Title = "Settings",   Icon = "settings" }),
}

-- ============================================================
-- Role lookup / prediction
-- ============================================================
local function getRolePlayer(p47)
  for key18, value31 in pairs(roleData) do
    if value31.Role == p47 or (p47 == "Sheriff" and value31.Role == "Hero") then
      local findFirstChild2 = players:FindFirstChild(key18)
      if findFirstChild2 then return findFirstChild2 end
    end
  end

  for _, value32 in ipairs(players:GetPlayers()) do
    if value32.Backpack:FindFirstChild(
        p47 == "Murderer" and "Knife"
        or (p47 == "Sheriff" or p47 == "Hero") and "Gun" or "None") then
      return value32
    end
    if value32.Character and value32.Character:FindFirstChild(
        p47 == "Murderer" and "Knife"
        or (p47 == "Sheriff" or p47 == "Hero") and "Gun" or "None") then
      return value32
    end
  end
  return nil
end

local function getPredictedPosition(p48, p49)
  if not p48 or not p48.Character then
    return Vector3.new(), "Target has no character"
  end
  local hrp = p48.Character:FindFirstChild("HumanoidRootPart")
  local humanoid3 = p48.Character:FindFirstChildOfClass("Humanoid")
  if not hrp or not humanoid3 then
    return Vector3.new(), "Target missing HRP or Humanoid"
  end
  local assemblyLinearVelocity = hrp.AssemblyLinearVelocity
  local moveDirection2 = humanoid3.MoveDirection
  local v61 = localPlayer:GetNetworkPing()
    * (options.offsetToPingMult and options.offsetToPingMult.Value or 1)
  return hrp.Position + assemblyLinearVelocity * v61
    + moveDirection2 * p49 * (1 + v61 * 2)
    + Vector3.new(0, hrp.Size.Y * 0.25, 0)
end

-- ============================================================
-- Fly
-- ============================================================
function SetFlyState(p50)
  state.fly.active = p50
  Utils.Notify("Fly", p50 and "Flight Systems Engaged." or "Flight Systems Disengaged.")
  local character5 = localPlayer.Character
  if not character5 then return end

  pcall(function()
    local humanoid4 = character5:FindFirstChildOfClass("Humanoid")
    local hrp = character5:FindFirstChild("HumanoidRootPart")
    if not humanoid4 or not hrp then return end

    if p50 then
      humanoid4.PlatformStand = true
      if not state.fly.gyro then
        state.fly.gyro = Instance.new("BodyGyro", hrp)
        state.fly.gyro.P = 50000
        state.fly.gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
      end
      if not state.fly.velocity then
        state.fly.velocity = Instance.new("BodyVelocity", hrp)
        state.fly.velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        state.fly.velocity.Velocity = Vector3.new()
      end
    else
      humanoid4.PlatformStand = false
      if state.fly.gyro then state.fly.gyro:Destroy(); state.fly.gyro = nil end
      if state.fly.velocity then state.fly.velocity:Destroy(); state.fly.velocity = nil end
    end
  end)
end

runService:BindToRenderStep("SolunaFly", Enum.RenderPriority.Character.Value, function()
  if not state.fly.active or not state.fly.velocity or not state.fly.gyro then return end
  local v62 = { W = 0, A = 0, S = 0, D = 0, Q = 0, E = 0 }
  if userInputService:IsKeyDown(Enum.KeyCode.W) then v62.W = 1 end
  if userInputService:IsKeyDown(Enum.KeyCode.S) then v62.S = -1 end
  if userInputService:IsKeyDown(Enum.KeyCode.A) then v62.A = -1 end
  if userInputService:IsKeyDown(Enum.KeyCode.D) then v62.D = 1 end
  if userInputService:IsKeyDown(Enum.KeyCode.E) then v62.E = 1 end
  if userInputService:IsKeyDown(Enum.KeyCode.Q) then v62.Q = -1 end

  local currentCamera2 = workspace.CurrentCamera
  local vector = Vector3.new(v62.A + v62.D, v62.Q + v62.E, v62.S + v62.W)
  state.fly.velocity.Velocity = (currentCamera2.CFrame.RightVector * vector.X
      + currentCamera2.CFrame.UpVector * vector.Y
      + currentCamera2.CFrame.LookVector * vector.Z) * (50 * state.fly.speed)
  state.fly.gyro.CFrame = currentCamera2.CFrame
end)

-- ============================================================
-- Player tab
-- ============================================================
local player = Tabs.Player
local character6 = player:AddSection("Character")

character6:AddSlider("universal_walkspeed_slider", {
  Title = "Walkspeed", Default = 16, Min = 1, Max = 100, Rounding = 0,
  Callback = function(value33)
    if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
      localPlayer.Character.Humanoid.WalkSpeed = value33
    end
  end,
})

character6:AddSlider("universal_fov_val", {
  Title = "Field of View (FOV)", Default = 70, Min = 1, Max = 120, Rounding = 0,
  Callback = function(value34)
    if workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView = value34 end
  end,
})

character6:AddToggle("universal_loopWsFov_toggle", {
  Title = "Loop Walkspeed & FOV", Default = false,
  Callback = function(value35) end,  -- handled by render loop below
})

local connect
character6:AddToggle("universal_infiniteJump_toggle", {
  Title = "Infinite Jump", Default = false,
  Callback = function(value36)
    if value36 then
      if connect then connect:Disconnect() end
      connect = userInputService.JumpRequest:Connect(function()
        if options.universal_infiniteJump_toggle and options.universal_infiniteJump_toggle.Value
          and localPlayer.Character
          and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
          localPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(
            Enum.HumanoidStateType.Jumping)
        end
      end)
    elseif connect then
      connect:Disconnect()
      connect = nil
    end
  end,
})

local movement = player:AddSection("Movement")

if userInputService.KeyboardEnabled and userInputService.MouseEnabled then
  movement:AddToggle("universal_ctrlClickTp_toggle", {
    Title = "Ctrl+Click Teleport", Default = false,
    Callback = function(value37) end,
  })
end

localPlayer.CharacterAdded:Connect(function(character7)
  if options.universal_fly_toggle and options.universal_fly_toggle.Value then
    task.wait(1)
    -- FIX #7: re-check flag after wait in case user toggled off.
    if options.universal_fly_toggle and options.universal_fly_toggle.Value then
      SetFlyState(true)
    end
  end
  characterCache = { character = nil, parts = {} }
end)

localPlayer.CharacterRemoving:Connect(function() characterCache = { character = nil, parts = {} } end)

movement:AddToggle("universal_fly_toggle", {
  Title = "Fly", Default = false,
  Callback = function(value38) SetFlyState(value38) end,
})

movement:AddSlider("universal_flySpeed_slider", {
  Title = "Fly Speed Multiplier", Default = 1, Min = 0.1, Max = 10, Rounding = 1,
  Callback = function(value39) state.fly.speed = value39 end,
})

local connect2
movement:AddToggle("universal_noclip_toggle", {
  Title = "Noclip", Default = false,
  Callback = function(value40)
    if connect2 and connect2.Connected then connect2:Disconnect() end
    if value40 then
      connect2 = runService.Stepped:Connect(function()
        local character8 = localPlayer.Character
        if character8 then
          for _, value41 in ipairs(character8:GetDescendants()) do
            if value41:IsA("BasePart") then value41.CanCollide = false end
          end
        end
      end)
      Utils.Notify("Noclip: Enabled")
    else
      Utils.Notify("Noclip: Disabled")
      Utils.Notify("Noclip disabled. Character reset might be needed to restore collisions.", "Warning", 4)
    end
  end,
})

runService.RenderStepped:Connect(function()
  if options.universal_loopWsFov_toggle and options.universal_loopWsFov_toggle.Value then
    if workspace.CurrentCamera and options.universal_fov_val then
      workspace.CurrentCamera.FieldOfView = tonumber(options.universal_fov_val.Value) or 70
    end
    if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
      and options.universal_walkspeed_slider then
      localPlayer.Character.Humanoid.WalkSpeed = options.universal_walkspeed_slider.Value
    end
  end
end)

userInputService.InputBegan:Connect(function(input, p51)
  if p51 then return end
  if options.universal_ctrlClickTp_toggle and options.universal_ctrlClickTp_toggle.Value
    and userInputService:IsKeyDown(Enum.KeyCode.LeftControl)
    and input.UserInputType == Enum.UserInputType.MouseButton1 then
    local getMouse = localPlayer:GetMouse()
    local screenPointToRay = workspace.CurrentCamera:ScreenPointToRay(getMouse.X, getMouse.Y)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = { localPlayer.Character }
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycast = workspace:Raycast(
      screenPointToRay.Origin, screenPointToRay.Direction * 1000, raycastParams)
    if raycast and raycast.Position and localPlayer.Character
      and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
      localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(raycast.Position)
      Utils.Notify("Teleported to mouse position.")
    else
      Utils.Notify("Could not find a place to teleport.", "Error", nil)
    end
  end
end)

-- ============================================================
-- Combat tab
-- ============================================================
local combat = Tabs.Combat
local sheriffHeroActions = combat:AddSection("Sheriff/Hero Actions")
local murdererActions = combat:AddSection("Murderer Actions")

local function shootTarget()
  if getRolePlayer("Sheriff") ~= localPlayer and getRolePlayer("Hero") ~= localPlayer then
    Utils.Notify("You are not the Sheriff/Hero.", "Error", nil)
    return
  end

  if not localPlayer.Character or not localPlayer.Character:FindFirstChild("Gun") then
    if localPlayer.Backpack:FindFirstChild("Gun") then
      localPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(localPlayer.Backpack.Gun)
      task.wait(0.2)
      if not localPlayer.Character:FindFirstChild("Gun") then
        Utils.Notify("Failed to equip the gun.", "Error", nil); return
      end
    else
      Utils.Notify("You don't have the gun.", "Error", nil); return
    end
  end

  local murderer = getRolePlayer("Murderer")
  if not murderer then
    local v65 = {}
    for _, value42 in ipairs(players:GetPlayers()) do
      if value42 ~= localPlayer and (
          (roleData[value42.Name] and (roleData[value42.Name].Role == "Sheriff"
            or roleData[value42.Name].Role == "Hero"))
          or value42.Backpack:FindFirstChild("Gun")
          or (value42.Character and value42.Character:FindFirstChild("Gun"))) then
        table.insert(v65, value42)
      end
    end
    if #v65 > 0 then
      local huge2 = math.huge
      if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local position4 = localPlayer.Character.HumanoidRootPart.Position
        for _, value43 in ipairs(v65) do
          if value43.Character and value43.Character:FindFirstChild("HumanoidRootPart") then
            local magnitude4 = (value43.Character.HumanoidRootPart.Position - position4).Magnitude
            if magnitude4 < huge2 then huge2 = magnitude4; murderer = value43 end
          end
        end
      else
        murderer = v65[1]
      end
      Utils.Notify("Murderer not found. Targeting other Sheriff/Hero: " .. murderer.Name, "Targeting", 2)
    end
  end

  if not murderer or not murderer.Character then
    Utils.Notify("No target found (Murderer or other Sheriff/Hero).", "Error", nil); return
  end

  local v66, v67 = getPredictedPosition(murderer,
    options.shootOffset and options.shootOffset.Value or 2.8)
  if v67 then Utils.Notify(v67, "Prediction Error", nil); return end

  if not localPlayer.Character:FindFirstChild("Gun") then
    if localPlayer.Backpack:FindFirstChild("Gun") then
      localPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(localPlayer.Backpack.Gun)
      task.wait(0.1)
      if not localPlayer.Character:FindFirstChild("Gun") then
        Utils.Notify("Gun became unequipped before firing.", "Error", nil); return
      end
    else
      Utils.Notify("Gun lost before firing.", "Error", nil); return
    end
  end

  local gun = localPlayer.Character:FindFirstChild("Gun")
  local shoot = gun and gun:FindFirstChild("Shoot")
  if not shoot then
    Utils.Notify("Shoot remote not found in Gun.", "Error", nil); return
  end

  -- FIX #4: GetPivot inside pcall.
  local cframe3 = CFrame.new(v66)
  local ok, err = pcall(function()
    shoot:FireServer(gun:GetPivot(), cframe3)
  end)
  if ok then
    Utils.Notify("Shot at " .. murderer.Name)
  else
    Utils.Notify("Failed to shoot: " .. tostring(err), "Error", nil)
  end
end

local aimingPrediction = combat:AddSection("Aiming & Prediction")

sheriffHeroActions:AddButton({ Title = "Shoot Target (Murderer/Other)", Callback = shootTarget })
sheriffHeroActions:AddKeybind("shootMurderer_keybind", {
  Title = "Shoot Murderer", Mode = "Toggle", Default = "F",
  Callback = function(value44) if value44 then shootTarget() end end,
})

murdererActions:AddButton({
  Title = "Kill Nearest Player",
  Callback = function()
    if getRolePlayer("Murderer") ~= localPlayer then
      Utils.Notify("You are not the Murderer.", "Error", nil); return
    end
    if not localPlayer.Character or not localPlayer.Character:FindFirstChild("Knife") then
      if localPlayer.Backpack:FindFirstChild("Knife") then
        localPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(localPlayer.Backpack.Knife)
        task.wait(0.2)
      else
        Utils.Notify("You don't have the knife.", "Error", nil); return
      end
    end

    local target, v72 = nil, math.huge
    for _, value45 in ipairs(players:GetPlayers()) do
      if value45 ~= localPlayer and value45.Character
        and value45.Character:FindFirstChild("HumanoidRootPart")
        and getRolePlayer("Murderer") ~= value45
        and getRolePlayer("Sheriff") ~= value45
        and getRolePlayer("Hero") ~= value45 then
        local magnitude5 = (localPlayer.Character.HumanoidRootPart.Position
          - value45.Character.HumanoidRootPart.Position).Magnitude
        if magnitude5 < v72 then target = value45; v72 = magnitude5 end
      end
    end

    if not target then Utils.Notify("No nearby players (non-role).", "Error", nil); return end

    if options.simulateKnifeThrow and options.simulateKnifeThrow.Value then
      local pred, perr = getPredictedPosition(target,
        options.shootOffset and options.shootOffset.Value or 2.8)
      if perr then Utils.Notify(perr, "Prediction Error", nil); return end
      pcall(function()
        localPlayer.Character.Knife.Throw:FireServer(
          localPlayer.Character.Knife:GetPivot(), pred)
        Utils.Notify("Threw knife at " .. target.Name)
      end)
      return
    end

    local targetHrp = target.Character.HumanoidRootPart
    local myHrp = localPlayer.Character.HumanoidRootPart
    local cframe4 = targetHrp.CFrame
    local anchored = targetHrp.Anchored
    targetHrp.Anchored = true
    targetHrp.CFrame = myHrp.CFrame * CFrame.new(0, 0, -2)
    task.wait(0.05)

    local knife = localPlayer.Character:FindFirstChild("Knife")
      or localPlayer.Backpack:FindFirstChild("Knife")
    if knife and knife:FindFirstChild("Events")
      and knife.Events:FindFirstChild("KnifeStabbed") then
      knife.Events.KnifeStabbed:FireServer()
    end
    task.wait(0.05)
    if targetHrp and targetHrp.Parent then
      targetHrp.CFrame = cframe4
      targetHrp.Anchored = anchored
    end
    Utils.Notify("Stabbed " .. target.Name)
  end,
})

local connect3
murdererActions:AddToggle("killAura_toggle", {
  Title = "Kill Aura", Default = false,
  Callback = function(value46)
    if value46 then
      if connect3 and connect3.Connected then connect3:Disconnect() end
      connect3 = runService.Heartbeat:Connect(function()
        if not (options.killAura_toggle and options.killAura_toggle.Value)
          or getRolePlayer("Murderer") ~= localPlayer
          or not localPlayer.Character
          or not localPlayer.Character:FindFirstChild("Knife") then return end

        local range = options.killAuraDistance_slider
            and options.killAuraDistance_slider.Value or 7

        for _, value48 in ipairs(players:GetPlayers()) do
          if value48 ~= localPlayer and value48.Character
            and value48.Character:FindFirstChild("HumanoidRootPart")
            and getRolePlayer("Murderer") ~= value48
            and getRolePlayer("Sheriff") ~= value48
            and getRolePlayer("Hero") ~= value48 then

            local myHrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myHrp then return end
            local targetHrp = value48.Character.HumanoidRootPart

            if (targetHrp.Position - myHrp.Position).Magnitude < range then
              local cframe5 = targetHrp.CFrame
              local anchored2 = targetHrp.Anchored
              targetHrp.Anchored = true
              targetHrp.CFrame = myHrp.CFrame * CFrame.new(0, 0, -2)
              task.wait(0.05)

              local knife3 = localPlayer.Character:FindFirstChild("Knife")
                or localPlayer.Backpack:FindFirstChild("Knife")
              if knife3 and knife3:FindFirstChild("Events")
                and knife3.Events:FindFirstChild("KnifeStabbed") then
                knife3.Events.KnifeStabbed:FireServer()
              end
              task.wait(0.05)
              if targetHrp and targetHrp.Parent then
                targetHrp.CFrame = cframe5
                targetHrp.Anchored = anchored2
              end
              return
            end
          end
        end
      end)
    elseif connect3 and connect3.Connected then
      connect3:Disconnect()
    end
  end,
})

murdererActions:AddSlider("killAuraDistance_slider", {
  Title = "Kill Aura Distance", Default = 7, Min = 1, Max = 20, Rounding = 0,
  Callback = function(value49) end,
})

murdererActions:AddButton({
  Title = "Kill Everyone",
  Callback = function()
    if getRolePlayer("Murderer") ~= localPlayer then
      Utils.Notify("You are not the Murderer.", "Error", nil); return
    end
    if not localPlayer.Character or not localPlayer.Character:FindFirstChild("Knife") then
      if localPlayer.Backpack:FindFirstChild("Knife") then
        localPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(localPlayer.Backpack.Knife)
        task.wait(0.2)
      else
        Utils.Notify("You don't have the knife.", "Error", nil); return
      end
    end

    local v74 = {}
    for _, value50 in ipairs(players:GetPlayers()) do
            if value50 ~= localPlayer and value50.Character
        and value50.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = value50.Character.HumanoidRootPart
        v74[value50] = { CFrame = hrp.CFrame, Anchored = hrp.Anchored }
        hrp.Anchored = true
        hrp.CFrame = localPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1)
        task.wait(0.01)
      end
    end

    local knife4 = localPlayer.Character:FindFirstChild("Knife")
      or localPlayer.Backpack:FindFirstChild("Knife")
    if knife4 and knife4:FindFirstChild("Events")
      and knife4.Events:FindFirstChild("KnifeStabbed") then
      knife4.Events.KnifeStabbed:FireServer()
    end
    task.wait(0.1)

    for plr, snap in pairs(v74) do
      if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        plr.Character.HumanoidRootPart.CFrame = snap.CFrame
        plr.Character.HumanoidRootPart.Anchored = snap.Anchored
      end
    end
    Utils.Notify("Attempted to kill everyone.")
  end,
})

aimingPrediction:AddParagraph({
  Title = "Combat Settings & Prediction",
  Content = "Tune how the script leads targets. Offset = studs ahead. Ping mult = scales with latency.",
})

aimingPrediction:AddToggle("simulateKnifeThrow", {
  Title = "Simulate Knife Throw for Kill Nearest", Default = false,
  Callback = function(value52) end,
})

aimingPrediction:AddSlider("shootOffset", {
  Title = "Aim Prediction Offset", Default = 2.8, Min = 0, Max = 10, Rounding = 1,
  Callback = function(value53) end,
})

aimingPrediction:AddSlider("offsetToPingMult", {
  Title = "Ping Multiplier for Prediction", Default = 1, Min = 0, Max = 5, Rounding = 1,
  Callback = function(value54) end,
})

-- ============================================================
-- Visuals (ESP)
-- ============================================================
local visuals = Tabs.Visuals
local playerESP = visuals:AddSection("Player ESP")
local objectESP = visuals:AddSection("Object ESP")
local ESP = ESPIndicator.new({ ArrowEdgePadding = 70, ArrowShowDistanceText = false })

local function reloadPlayerESP()
  if not ESP then return end
  ESP:RemoveGroup("players")
  if not (options.playerESP and options.playerESP.Value) then return end

  for _, value55 in ipairs(players:GetPlayers()) do
    if value55.Character then
      local roleName = "Innocent"
      local color = Color3.new(0, 1, 0.03)
      local arrowShow = false
      local displayName = value55.DisplayName
      local arrowMinDistance = 0

      if value55 == getRolePlayer("Murderer") then
        roleName = "Murderer"; color = Color3.new(1, 0, 0.015)
        arrowShow = true; displayName = "Murderer"; arrowMinDistance = 99999
      elseif value55 == getRolePlayer("Sheriff") or value55 == getRolePlayer("Hero") then
        roleName = "Sheriff/Hero"; color = Color3.new(0, 0.6, 1)
        displayName = "Sheriff/Hero"; arrowShow = true
      end

      -- FIX #1: nil-guard for showInnocentNamesESP
      local showInnocent = options.showInnocentNamesESP
        and options.showInnocentNamesESP.Value == true

      ESP:Add(value55.Character, {
        AccentColor = color,
        ArrowShow = arrowShow,
        ArrowMinDistance = arrowMinDistance,
        ArrowSize = UDim2.new(0, 35, 0, 35),
        LabelText = displayName,
        ShowLabel = roleName ~= "Innocent" or showInnocent,
        GroupName = "players",
      })
    end
  end
end

if replicatedStorage:FindFirstChild("Remotes")
  and replicatedStorage.Remotes:FindFirstChild("Gameplay")
  and replicatedStorage.Remotes.Gameplay:FindFirstChild("PlayerDataChanged") then
  replicatedStorage.Remotes.Gameplay.PlayerDataChanged.OnClientEvent:Connect(function(p52)
    -- FIX #6: merge instead of replace, in case payload is a diff.
    if type(p52) == "table" then
      for k, v in pairs(p52) do roleData[k] = v end
    else
      roleData = p52
    end
    if options.playerESP and options.playerESP.Value then
      task.defer(reloadPlayerESP)
    end
  end)
end

playerESP:AddToggle("playerESP", {
  Title = "Enable Player ESP", Default = false,
  Callback = function(value56) reloadPlayerESP() end,
})
playerESP:AddToggle("showInnocentNamesESP", {
  Title = "Show Innocent Names (ESP)", Default = false,
  Description = "If Player ESP is on, this will show names for Innocents too.",
  Callback = function(value57) reloadPlayerESP() end,
})

objectESP:AddToggle("gunDropESP", {
  Title = "Dropped Gun ESP", Default = false,
  Callback = function(value58)
    if not ESP then return end
    if value58 then
      local map = getMap()
      if map then
        for _, value59 in ipairs(map:GetChildren()) do
          if value59.Name == "GunDrop" then
            ESP:Add(value59, {
              AccentColor = Color3.new(0.95, 1, 0.07),
              ArrowShow = true, ArrowMinDistance = 99999,
              ArrowSize = UDim2.new(0, 30, 0, 30),
              LabelText = "Dropped Gun!", ShowLabel = true, GroupName = "gun",
            })
          end
        end
      end
    else
      ESP:RemoveGroup("gun")
    end
    Utils.Notify("Dropped Gun ESP: " .. (value58 and "Enabled" or "Disabled"))
  end,
})

objectESP:AddToggle("trapDetection", {
  Title = "Trap ESP", Default = false,
  Callback = function(value60)
    if not ESP then return end
    if value60 then
      for _, value61 in ipairs(workspace:GetDescendants()) do
        if value61.Name == "Trap" and value61.Parent
          and value61.Parent:IsDescendantOf(workspace) then
          value61.Transparency = 0
          ESP:Add(value61, {
            AccentColor = Color3.fromRGB(255, 100, 0),
            ShowLabel = true, LabelText = "Trap", GroupName = "traps",
          })
        end
      end
    else
      ESP:RemoveGroup("traps")
    end
    Utils.Notify("Trap ESP: " .. (value60 and "Enabled" or "Disabled"))
  end,
})

-- ============================================================
-- Automation
-- ============================================================
local automation = Tabs.Automation
local coinCollection = automation:AddSection("Coin Collection")

coinCollection:AddParagraph({
  Title = "Coin Collection",
  Content = "Automatically navigates to the nearest coin. Your character will move.",
})

coinCollection:AddSlider("coinFarmSpeed_slider", {
  Title = "Coin Farm Speed (studs/sec)", Default = 10, Min = 5, Max = 25, Rounding = 0,
  Callback = function(value62) end,
})

local coinFarmThread
coinCollection:AddToggle("coinMagnet_loop_toggle", {
  Title = "Coin Magnet (Auto Collect)", Default = false,
  Callback = function(value63)
    if value63 then
      if coinFarmThread then task.cancel(coinFarmThread) end
      coinFarmThread = task.spawn(function()
        local lastChar, tween, lastTarget
        while value63 and localPlayer and localPlayer.Character do
          task.wait(0.02)
          local character9 = localPlayer.Character
          if character9 ~= lastChar then cacheCharacterParts(character9); lastChar = character9 end

          local hrp = character9 and character9:FindFirstChild("HumanoidRootPart")
          if hrp then
            local map = getMap()
            if map then
              local coinContainer = map:FindFirstChild("CoinContainer")
              if coinContainer ~= coinState.container then
                watchCoinContainer(coinContainer)
              elseif coinContainer == nil then
                clearCoinContainer()
              end

              if #coinState.list > 0 then
                local best, bestCF, bestDist = nil, nil, math.huge
                for _, value64 in ipairs(coinState.list) do
                  if value64 and value64.Parent
                    and value64:GetAttribute("SolunaSkip") ~= true then
                    local position5
                    if value64:IsA("BasePart") then
                      position5 = value64.Position
                    else
                      position5 = value64:GetPivot().Position
                    end
                    local d = (hrp.Position - position5).Magnitude
                    if d < bestDist then bestDist = d; best = value64; bestCF = CFrame.new(position5) end
                  end
                end

                if best and best.Parent then
                  local targetCF = bestCF or best:GetPivot()
                  local v83 = math.clamp((hrp.Size and hrp.Size.Y or 0) * 0.5, 0.75, 2)
                  local v85 = targetCF * CFrame.new(0, math.max(v83 - 0.4, 0), 0)
                  local dist = (hrp.Position - v85.Position).Magnitude

                  if lastTarget ~= best or not tween
                    or tween.PlaybackState ~= Enum.PlaybackState.Playing then
                    if tween then tween:Cancel() end
                    lastTarget = best
                    local speed = options.coinFarmSpeed_slider
                        and options.coinFarmSpeed_slider.Value or 15
                    local dur = math.clamp(dist / math.max(speed, 1), 0.05, 2.5)
                    tween = tweenService:Create(hrp,
                      TweenInfo.new(dur, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                      { CFrame = v85 })
                    tween:Play()
                  end

                  if dist <= 1.5 then
                    skipCoin(best)
                    lastTarget = nil
                    if tween then tween:Cancel(); tween = nil end
                  end
                else
                  if tween then tween:Cancel(); tween = nil end
                  lastTarget = nil
                end
              end
            end
          end
        end
        if tween then tween:Cancel() end
      end)
    else
      if coinFarmThread then task.cancel(coinFarmThread); coinFarmThread = nil end
      clearCoinContainer()
    end
  end,
})

local gunPickup = automation:AddSection("Gun Pickup")
gunPickup:AddParagraph({
  Title = "Gun Pickup",
  Content = "If the Sheriff drops the gun, this will attempt to pick it up automatically.",
})

gunPickup:AddToggle("autoGetGun_toggle_farm", {
  Title = "Auto-Get Dropped Gun", Default = false,
  Callback = function(value66)
    if value66 then
      local map = getMap()
      if map and map:FindFirstChild("GunDrop") then
        Utils.Notify("Gun already on ground, attempting auto-pickup...", "Auto", 3)
        task.spawn(function() Utils.pickupGun() end)
      end
    end
  end,
})

gunPickup:AddKeybind("manualGetGun_keybind", {
  Title = "Manually Get Dropped Gun", Mode = "Hold", Default = "G",
  Callback = function(value67) if value67 then Utils.pickupGun() end end,
})

-- ============================================================
-- Teleport
-- ============================================================
local teleport = Tabs.Teleport
local gameTeleportation = teleport:AddSection("Game Teleportation")
local safeZone = teleport:AddSection("Safe Zone")

gameTeleportation:AddButton({
  Title = "Teleport to Lobby",
  Callback = function()
    -- FIX #3: pcall-guard on lobby model lookup
    local ok, err = pcall(function()
      local char = localPlayer.Character
      if not char or not char:FindFirstChild("HumanoidRootPart") then
        error("Your character is not available.")
      end
      local nikilis = workspace.Lobby.Lobby.Nikilis
      local cframe7 = nikilis.PrimaryPart and nikilis.PrimaryPart.CFrame or nikilis:GetPivot()
      char.HumanoidRootPart.CFrame = cframe7
    end)
    if ok then
      Utils.Notify("Teleported to Lobby.")
    else
      Utils.Notify("Teleport failed: " .. tostring(err), "Error", nil)
    end
  end,
})

gameTeleportation:AddButton({
  Title = "Teleport to Map Spawn",
  Callback = function()
    local map = getMap()
    if map and map:FindFirstChild("Spawns") then
      local children = map.Spawns:GetChildren()
      if #children > 0 then
        local spawn = children[math.random(1, #children)]
        local char = localPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
          char.HumanoidRootPart.CFrame = spawn.CFrame
        else
          Utils.Notify("Your character is not available.", "Error", nil)
        end
      else
        Utils.Notify("No spawns found on map.", "Error", nil)
      end
    else
      Utils.Notify("Map not loaded or no spawns folder.", "Error", nil)
    end
  end,
})

safeZone:AddButton({
  Title = "Teleport to Safe Zone",
  Callback = function()
    if not solunaSafeZone or not solunaSafeZone.Parent then
      Utils.Notify("Safe Zone does not exist. Try re-creating it.", "Error", nil); return
    end
    local char = localPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
      char.HumanoidRootPart.CFrame = CFrame.new(solunaSafeZone.Position + Vector3.new(0, 5, 0))
      Utils.Notify("Teleported to Safe Zone.", "Success")
    else
      Utils.Notify("Your character is not available to teleport.", "Error", nil)
    end
  end,
})

safeZone:AddButton({ Title = "Re-create Safe Zone", Callback = function() createSafeZone() end })

-- ============================================================
-- Misc
-- ============================================================
local misc = Tabs.Misc
local gameInformation = misc:AddSection("Game Information")
local spectateSystem = misc:AddSection("Spectate System")
local client = misc:AddSection("Client")

gameInformation:AddButton({
  Title = "Copy Murderer Username",
  Callback = function()
    local murderer2 = getRolePlayer("Murderer")
    if murderer2 and typeof(setclipboard) == "function" then
      setclipboard(murderer2.Name)
      Utils.Notify("Murderer username copied: " .. murderer2.Name)
    else
      Utils.Notify("Murderer not found or setclipboard is not available.", "Error", nil)
    end
  end,
})

gameInformation:AddButton({
  Title = "Copy Sheriff/Hero Username",
  Callback = function()
    local sheriff = getRolePlayer("Sheriff") or getRolePlayer("Hero")
    if sheriff and typeof(setclipboard) == "function" then
      setclipboard(sheriff.Name)
      Utils.Notify("Sheriff/Hero username copied: " .. sheriff.Name)
    else
      Utils.Notify("Sheriff/Hero not found or setclipboard is not available.", "Error", nil)
    end
  end,
})

gameInformation:AddButton({
  Title = "Send Roles to Chat",
  Callback = function()
    for _, value68 in ipairs(textChatService:WaitForChild("TextChannels"):GetChildren()) do
      if value68.Name ~= "RBXSystem" then
        local murderer3 = getRolePlayer("Murderer")
        local hero = getRolePlayer("Sheriff") or getRolePlayer("Hero")
        value68:SendAsync(string.format(
          "Murderer: %s | Sheriff/Hero: %s | [ Soluna ]",
          murderer3 and murderer3.Name or "-",
          hero and hero.Name or "-"))
        Utils.Notify("Roles sent to chat.")
        return
      end
    end
  end,
})

gameInformation:AddToggle("ignoreKnifeThrows_toggle", {
  Title = "Ignore Knife Throws (- Experimental)", Default = false,
  Callback = function(value69) end,
})

local spectateState = { player_list = {}, current_index = 0, is_active = false }

local function updateSpectateCamera()
  if not spectateState.is_active or #spectateState.player_list == 0 then
    if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
      workspace.CurrentCamera.CameraSubject =
        localPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    return
  end

  local target = spectateState.player_list[spectateState.current_index]
  if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
    workspace.CurrentCamera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
    Utils.Notify("Now spectating: " .. target.Name, "Spectate")
    return
  end

  table.remove(spectateState.player_list, spectateState.current_index)
  if #spectateState.player_list == 0 then
    spectateState.is_active = false
    spectateState.current_index = 0
    if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
      workspace.CurrentCamera.CameraSubject =
        localPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    Utils.Notify("No more players to spectate. Stopping.", "Spectate")
    return
  end
  if spectateState.current_index > #spectateState.player_list then
    spectateState.current_index = 1
  end
  updateSpectateCamera()
end

spectateSystem:AddButton({
  Title = "Start/Refresh Spectate List",
  Callback = function()
    spectateState.player_list = players:GetPlayers()
    if #spectateState.player_list == 0 then
      Utils.Notify("No players in server.", "Spectate Error", 3)
      spectateState.is_active = false
      spectateState.current_index = 0
      return
    end
    spectateState.current_index = 1
    spectateState.is_active = true
    Utils.Notify("Spectate list refreshed. Found " .. #spectateState.player_list
      .. " players. Spectating first player.", "Spectate")
    updateSpectateCamera()
  end,
})

spectateSystem:AddButton({
  Title = "Spectate Next Player",
  Callback = function()
    if not spectateState.is_active or #spectateState.player_list == 0 then
      Utils.Notify("Start spectating or refresh list first.", "Spectate Info", 3); return
    end
    spectateState.current_index = spectateState.current_index + 1
    if spectateState.current_index > #spectateState.player_list then
      spectateState.current_index = 1
    end
    updateSpectateCamera()
  end,
})

spectateSystem:AddButton({
  Title = "Spectate Previous Player",
  Callback = function()
    if not spectateState.is_active or #spectateState.player_list == 0 then
      Utils.Notify("Start spectating or refresh list first.", "Spectate Info", 3); return
    end
    spectateState.current_index = spectateState.current_index - 1
    if spectateState.current_index < 1 then
      spectateState.current_index = #spectateState.player_list
    end
    updateSpectateCamera()
  end,
})

spectateSystem:AddButton({
  Title = "Stop Spectating",
  Callback = function()
    if spectateState.is_active then
      spectateState.is_active = false
      spectateState.current_index = 0
      if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
        workspace.CurrentCamera.CameraSubject =
          localPlayer.Character:FindFirstChildOfClass("Humanoid")
      end
      Utils.Notify("Spectating stopped.", "Spectate")
    else
      Utils.Notify("Not currently spectating.", "Spectate Info", 3)
    end
  end,
})

client:AddButton({
  Title = "Get Ping",
  Callback = function()
    Utils.Notify("Your ping: " .. math.floor(localPlayer:GetNetworkPing() * 1000 + 0.5) .. "ms")
  end,
})

-- ============================================================
-- Trolling
-- ============================================================
local trolling = Tabs.Trolling
local generalPlayerFling = trolling:AddSection("General Player Fling")

generalPlayerFling:AddParagraph({
  Title = "Player Fling",
  Content = "Attempts to fling the selected player. Results can vary.",
})

local trollState = { target = nil, names = {} }

local function refreshTrollPlayers()
  table.clear(trollState.names)
  local hasPlayers = false

  for _, value70 in ipairs(players:GetPlayers()) do
    -- FIX #5: exclude LocalPlayer from the list.
    if value70 ~= localPlayer then
      table.insert(trollState.names, value70.Name)
      hasPlayers = true
    end
  end

  if not hasPlayers then table.insert(trollState.names, "No players found") end

  if options.troll_target_player_dropdown then
    local current = options.troll_target_player_dropdown.Value
    local selected = trollState.names[1]
    if table.find(trollState.names, current) then selected = current end
    options.troll_target_player_dropdown:SetValues(trollState.names)
    options.troll_target_player_dropdown:SetValue(selected)
    trollState.target = players:FindFirstChild(selected)
  end
  return trollState.names
end

refreshTrollPlayers()

generalPlayerFling:AddDropdown("troll_target_player_dropdown", {
  Title = "Select Player to Troll",
  Values = trollState.names,
  Multi = false,
  Default = trollState.names[1] or "No players found",
  Callback = function(value72)
    trollState.target = players:FindFirstChild(value72)
    if not trollState.target and value72 ~= "No players found" then
      Utils.Notify("Could not find player: " .. value72, "Error")
    end
  end,
})

generalPlayerFling:AddButton({
  Title = "Refresh Troll Player List",
  Callback = function() refreshTrollPlayers(); Utils.Notify("Troll player list refreshed.") end,
})

generalPlayerFling:AddButton({
  Title = "Fling Selected Player",
  Callback = function()
    -- FIX #5: re-resolve from the dropdown's live value, not a stale upvalue.
    local sel = options.troll_target_player_dropdown
      and options.troll_target_player_dropdown.Value
    local target = sel and players:FindFirstChild(sel) or trollState.target
    if not target then
      Utils.Notify("No target selected.", "Error", nil); return
    end
    Utils.miniFling(target)
  end,
})

generalPlayerFling:AddButton({
  Title = "Fling Murderer (MM2)",
  Callback = function()
    local m = getRolePlayer("Murderer")
    if not m then Utils.Notify("No Murderer found to fling.", "Error"); return end
    Utils.miniFling(m)
  end,
})

generalPlayerFling:AddButton({
  Title = "Fling Sheriff/Hero (MM2)",
  Callback = function()
    local s = getRolePlayer("Sheriff") or getRolePlayer("Hero")
    if not s then Utils.Notify("No Sheriff/Hero found to fling.", "Error"); return end
    Utils.miniFling(s)
  end,
})

local highRiskFeatures = trolling:AddSection("High-Risk Features")

highRiskFeatures:AddParagraph({
  Title = "God Mode (- Highly Risky)",
  Content = "EXPERIMENTAL: attempts invincibility. Very unstable. Character reset usually needed to undo.",
})

highRiskFeatures:AddButton({
  Title = "Activate God Mode",
  Callback = function()
    Utils.Notify("God Mode is highly unstable and may crash/kick.", "Warning", 5)
    task.wait(1)
    local cam = workspace.CurrentCamera
    local char = localPlayer.Character
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    if not hum then Utils.Notify("Humanoid not found.", "Error", nil); return end

    local cframe8 = cam.CFrame
    local clone2 = hum:Clone()
    clone2.Parent = char
    localPlayer.Character = nil

    clone2:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    clone2:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    clone2:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)

    hum:Destroy()
    localPlayer.Character = char
    task.wait()
    cam.CameraSubject = clone2
    cam.CFrame = cframe8
    clone2.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

    local animate = char:FindFirstChild("Animate")
    if animate then animate.Disabled = true; task.wait(); animate.Disabled = false end
    clone2.Health = clone2.MaxHealth
    Utils.Notify("God Mode activated (experimental).")
  end,
})

highRiskFeatures:AddParagraph({
  Title = "Hold Everyone Hostage (- Murderer)",
  Content = "As Murderer, teleports all other players to you and anchors them.",
})

highRiskFeatures:AddButton({
  Title = "Hold Everyone Hostage",
  Callback = function()
    if getRolePlayer("Murderer") ~= localPlayer then
      Utils.Notify("You are not the Murderer.", "Error", nil); return
    end
    local char = localPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then
      Utils.Notify("Your character is not available.", "Error", nil); return
    end
    local origin = char.HumanoidRootPart.Position
    for _, value73 in ipairs(players:GetPlayers()) do
      if value73 ~= localPlayer and value73.Character
        and value73.Character:FindFirstChild("HumanoidRootPart") then
        local tHrp = value73.Character.HumanoidRootPart
        tHrp.Anchored = true
        tHrp.CFrame = CFrame.new(origin + Vector3.new(math.random(-2, 2), 0, math.random(-2, 2)))
      end
    end
    Utils.Notify("Everyone gathered. Use Kill Everyone or Kill Nearest.")
  end,
})

-- ============================================================
-- Settings
-- ============================================================
local settings2 = Tabs.Settings
local uiScriptSettings = settings2:AddSection("UI & Script Settings")
local aboutCredits = settings2:AddSection("About & Credits")

uiScriptSettings:AddParagraph({
  Title = "Rayfield UI",
  Content = "Press RightShift to show or hide the interface.",
})

uiScriptSettings:AddToggle("enableNotifications", {
  Title = "Enable Notifications", Default = true,
  Callback = function(value75) end,
})

aboutCredits:AddButton({
  Title = "Join our Discord",
  Callback = function()
    if typeof(setclipboard) == "function" then
      setclipboard("https://discord.gg/e52GujVvbN")
      Utils.Notify("Discord link copied to clipboard!")
    else
      Utils.Notify("Could not copy link. setclipboard unavailable.", "Error")
    end
  end,
})

aboutCredits:AddParagraph({ Title = "Soluna", Content = "Soluna Script Hub for Murder Mystery 2." })
aboutCredits:AddParagraph({ Title = "discord.gg/e52GujVvbN", Content = "Script by Soluna Development Team." })

-- ============================================================
-- Player/character event wiring
-- ============================================================
players.PlayerAdded:Connect(function(player2)
  if options.playerESP and options.playerESP.Value and ESP then
    task.wait(0.1); reloadPlayerESP()
  end
  player2.CharacterAdded:Connect(function()
    if options.playerESP and options.playerESP.Value and ESP then
      task.wait(0.1); reloadPlayerESP()
    end
  end)
  player2.CharacterRemoving:Connect(function(character16)
    if ESP and character16 then ESP:Remove(character16) end
  end)
end)

players.PlayerRemoving:Connect(function(player3)
  if ESP and player3.Character then ESP:Remove(player3.Character) end
  if options.playerESP and options.playerESP.Value and ESP then reloadPlayerESP() end
end)

for _, value76 in ipairs(players:GetPlayers()) do
  value76.CharacterAdded:Connect(function()
    if options.playerESP and options.playerESP.Value and ESP then
      task.wait(0.1); reloadPlayerESP()
    end
  end)
  value76.CharacterRemoving:Connect(function(character18)
    if ESP and character18 then ESP:Remove(character18) end
  end)
end

-- ============================================================
-- Workspace event wiring (with early-outs)
-- ============================================================
workspace.DescendantAdded:Connect(function(descendant)
  if not ESP then return end

  -- FIX #perf: early-out before touching options table.
  local n = descendant.Name
  if n ~= "Trap" and n ~= "GunDrop" and n ~= "ThrowingKnife" then return end

  if options.trapDetection and options.trapDetection.Value
    and n == "Trap" and descendant.Parent
    and descendant.Parent:IsDescendantOf(workspace) then
    descendant.Transparency = 0
    ESP:Add(descendant, {
      AccentColor = Color3.fromRGB(255, 100, 0),
      ShowLabel = true, LabelText = "Trap", GroupName = "traps",
    })
    Utils.Notify("Murderer placed a trap!", "Alert", 3)
  end

  if n == "GunDrop" and descendant:IsA("BasePart") then
    if options.gunDropESP and options.gunDropESP.Value then
      ESP:Add(descendant, {
        AccentColor = Color3.new(0.95, 1, 0.07),
        ArrowShow = true, ArrowMinDistance = 99999,
        ArrowSize = UDim2.new(0, 30, 0, 30),
        LabelText = "Dropped Gun!", ShowLabel = true, GroupName = "gun",
      })
      Utils.Notify("Gun has been dropped!", "Alert")
    end
    if options.autoGetGun_toggle_farm and options.autoGetGun_toggle_farm.Value then
      Utils.Notify("Dropped gun detected, attempting auto-pickup...", "Auto", 2)
      task.spawn(function() Utils.pickupGun() end)
    end
  end

  if options.ignoreKnifeThrows_toggle and options.ignoreKnifeThrows_toggle.Value
    and n == "ThrowingKnife" then
    descendant:Destroy()
    Utils.Notify("Blocked a knife throw!", "Protection", 2)
  end
end)

workspace.DescendantRemoving:Connect(function(descendant2)
  if not ESP then return end
  local traps = ESP:GetGroupTargets("traps")
  if descendant2.Name == "Trap" and table.find(traps, descendant2) then
    ESP:Remove(descendant2)
  end
  local gun2 = ESP:GetGroupTargets("gun")
  if descendant2.Name == "GunDrop" and table.find(gun2, descendant2) then
    ESP:Remove(descendant2)
    Utils.Notify("Dropped gun picked up.", "Alert")
    task.wait(0.5)
    local sheriff4 = getRolePlayer("Sheriff") or getRolePlayer("Hero")
    if sheriff4 then Utils.Notify("New Sheriff/Hero: " .. sheriff4.Name, "Alert") end
    if typeOf(reloadPlayerESP) == "function" then reloadPlayerESP() end
  end
end)

workspace.ChildAdded:Connect(function(child3)
  if options.ignoreKnifeThrows_toggle and options.ignoreKnifeThrows_toggle.Value
    and child3.Name == "ThrowingKnife" then
    child3:Destroy()
    Utils.Notify("Blocked a knife throw!", "Protection", 2)
  end
end)

-- ============================================================
-- Bootstrap
-- ============================================================
solunaWindow:SelectTab(1)
task.spawn(createSafeZone)

Rayfield:Notify({
  Title = "Soluna",
  Content = "Soluna Script Loaded! Safe Zone feature added.",
  Duration = 5,
})

-- LoadConfiguration already ran at the top of Part 1, so these re-enable correctly.
if options.playerESP and options.playerESP.Value then
  task.wait(0.5)
  reloadPlayerESP()
end

if options.gunDropESP and options.gunDropESP.Value and ESP then
  local mapForGunESP = getMap()
  if mapForGunESP then
    for _, value77 in ipairs(mapForGunESP:GetChildren()) do
      if value77.Name == "GunDrop" then
        ESP:Add(value77, {
          AccentColor = Color3.new(0.95, 1, 0.07),
          ArrowShow = true, ArrowMinDistance = 99999,
          ArrowSize = UDim2.new(0, 30, 0, 30),
          LabelText = "Dropped Gun!", ShowLabel = true, GroupName = "gun",
        })
      end
    end
  end
end

if options.trapDetection and options.trapDetection.Value and ESP then
  for _, value78 in ipairs(workspace:GetDescendants()) do
    if value78.Name == "Trap" and value78.Parent
      and value78.Parent:IsDescendantOf(workspace) then
      value78.Transparency = 0
      ESP:Add(value78, {
        AccentColor = Color3.fromRGB(255, 100, 0),
        ShowLabel = true, LabelText = "Trap", GroupName = "traps",
      })
    end
  end
end