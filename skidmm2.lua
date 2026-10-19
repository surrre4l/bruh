-- MM2 script reconstructed from behavior trace (part 1 of 2)
-- ALL exfiltration removed.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local TextChatService = game:GetService("TextChatService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

local rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = rayfield:CreateWindow({
    Name = "Jann Hub | MM2",
    ConfigurationSaving = { Enabled = true, FileName = "config", FolderName = "JannHubMM2" },
    DisableRayfieldPrompts = true,
    LoadingSubtitle = "by energypetals on discord",
    LoadingTitle = "Jann Hub",
    ShowText = "Jann Hub",
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.RightShift
})

local function getChar() return LocalPlayer.Character end
local function getHRP()
    local c = getChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end
local function getHum()
    local c = getChar()
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function hasTool(p, name)
    if not p then return false end
    if p.Character and p.Character:FindFirstChild(name) then return true end
    local bp = p:FindFirstChild("Backpack")
    return bp and bp:FindFirstChild(name) ~= nil
end

local function getMurderer()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and hasTool(p, "Knife") then return p end
    end
end

local function getSheriff()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and hasTool(p, "Gun") then return p end
    end
end

local function equipTool(name)
    local c = getChar()
    if not c then return nil end
    local held = c:FindFirstChild(name)
    if held and held:IsA("Tool") then return held end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then
        local tool = bp:FindFirstChild(name)
        if tool then
            local hum = getHum()
            if hum then hum:EquipTool(tool); return tool end
        end
    end
    return nil
end

local function tpBehind(p)
    local hrp = getHRP()
    if hrp and p and p.Character then
        local t = p.Character:FindFirstChild("HumanoidRootPart")
        if t then hrp.CFrame = t.CFrame * CFrame.new(0, 0, 2) end
    end
end

local Tab = Window:CreateTab("Main", "swords")
local Tab2 = Window:CreateTab("ESP", "eye")
local Tab3 = Window:CreateTab("Player", "user")
local Tab4 = Window:CreateTab("Visual", "palette")
local Tab5 = Window:CreateTab("Misc", "settings")
Window:CreateTab("Universal", "type")

-- ============ MAIN / SHERIFF ============
Tab:CreateSection("Sheriff")

local autoShoot = false
task.spawn(function()
    while task.wait(0.1) do
        if autoShoot then
            local m = getMurderer()
            if m and m.Character then
                local head = m.Character:FindFirstChild("Head") or m.Character:FindFirstChild("HumanoidRootPart")
                if head then
                    workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, head.Position)
                    local g = equipTool("Gun")
                    if g then pcall(function() g:Activate() end) end
                end
            end
        end
    end
end)

Tab:CreateToggle({Name="Auto Shoot Murderer",CurrentValue=false,Flag="AutoShoot",Callback=function(s) autoShoot=s end})

Tab:CreateButton({
    Name = "Shoot Murderer",
    Callback = function()
        local m = getMurderer()
        if not m or not m.Character then return end
        local head = m.Character:FindFirstChild("Head") or m.Character:FindFirstChild("HumanoidRootPart")
        if head then
            workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, head.Position)
            local g = equipTool("Gun")
            if g then pcall(function() g:Activate() end) end
        end
    end
})

Tab:CreateButton({
    Name = "Bring Gun to Me",
    Callback = function()
        local map = workspace:FindFirstChild("Map")
        local hrp = getHRP()
        if map and hrp then
            local gd = map:FindFirstChild("GunDrop")
            if gd then
                gd.CFrame = hrp.CFrame
                rayfield:Notify({Title="Done",Content="Gun moved to you!",Duration=3,Image="check"})
            end
        end
    end
})

local autoPickup = false
task.spawn(function()
    while task.wait(0.5) do
        if autoPickup then
            local map = workspace:FindFirstChild("Map")
            local hrp = getHRP()
            if map and hrp then
                local gd = map:FindFirstChild("GunDrop")
                if gd then hrp.CFrame = gd.CFrame end
            end
        end
    end
end)

Tab:CreateToggle({Name="Auto Pickup Gun",CurrentValue=false,Flag="AutoPickupGun",Callback=function(s) autoPickup=s end})

local autoEquip = false
task.spawn(function()
    while task.wait(0.5) do
        if autoEquip then equipTool("Gun") end
    end
end)

Tab:CreateToggle({Name="Auto Equip Gun",CurrentValue=false,Flag="AutoEquipGun",Callback=function(s) autoEquip=s end})

local camAim = false
RunService.RenderStepped:Connect(function()
    if camAim then
        local m = getMurderer()
        if m and m.Character then
            local head = m.Character:FindFirstChild("Head") or m.Character:FindFirstChild("HumanoidRootPart")
            if head then
                workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, head.Position)
            end
        end
    end
end)

Tab:CreateToggle({Name="Gun Aimbot (Camera Only)",CurrentValue=false,Flag="GunAimbot",Callback=function(s) camAim=s end})

local silentAim = false
pcall(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if silentAim and not checkcaller() and (self == workspace or self == game) then
            if method == "Raycast" or method == "FindPartOnRay" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRayWithWhitelist" then
                local m = getMurderer()
                if m and m.Character then
                    local head = m.Character:FindFirstChild("Head")
                    if head then
                        local args = {...}
                        if method == "Raycast" and #args >= 2 then
                            args[2] = head.Position - args[1]
                            return old(self, unpack(args))
                        elseif #args >= 1 and typeof(args[1]) == "Ray" then
                            args[1] = Ray.new(args[1].Origin, head.Position - args[1].Origin)
                            return old(self, unpack(args))
                        end
                    end
                end
            end
        end
        return old(self, ...)
    end)
    setreadonly(mt, true)
end)

Tab:CreateToggle({Name="Bullet Teleport (Silent Aim)",CurrentValue=false,Flag="BulletTeleport",Callback=function(s) silentAim=s end})

-- ============ MURDERER ============
Tab:CreateSection("Murderer")

local killAll = false
task.spawn(function()
    while task.wait(0.5) do
        if killAll then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    tpBehind(p)
                    task.wait(0.15)
                    local k = equipTool("Knife")
                    if k then pcall(function() k:Activate() end) end
                end
            end
        end
    end
end)

Tab:CreateToggle({Name="Kill All",CurrentValue=false,Flag="KillAll",Callback=function(s) killAll=s end})

local autoThrow = false
task.spawn(function()
    while task.wait(0.3) do
        if autoThrow then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                    local hrp = getHRP()
                    if hrp then
                        workspace.CurrentCamera.CFrame = CFrame.lookAt(hrp.Position, p.Character.Head.Position)
                        local k = equipTool("Knife")
                        if k then pcall(function() k:Activate() end) end
                    end
                end
            end
        end
    end
end)

Tab:CreateToggle({Name="Auto Throw Knife",CurrentValue=false,Flag="AutoThrowKnife",Callback=function(s) autoThrow=s end})

Tab:CreateButton({
    Name = "Kill Player at Mouse",
    Callback = function()
        local mouse = LocalPlayer:GetMouse()
        if mouse.Target and mouse.Target.Parent then
            local victim = Players:GetPlayerFromCharacter(mouse.Target.Parent)
            if victim then
                tpBehind(victim)
                task.wait(0.15)
                local k = equipTool("Knife")
                if k then pcall(function() k:Activate() end) end
            end
        end
    end
})

Tab:CreateButton({
    Name = "Throw Knife at Mouse",
    Callback = function()
        local mouse = LocalPlayer:GetMouse()
        if mouse.Hit then
            workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, mouse.Hit.Position)
            local k = equipTool("Knife")
            if k then pcall(function() k:Activate() end) end
        end
    end
})

Tab:CreateButton({
    Name = "Teleport to Mouse",
    Callback = function()
        local mouse = LocalPlayer:GetMouse()
        local hrp = getHRP()
        if mouse.Hit and hrp then
            hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,3,0))
        end
    end
})

-- ============ INNOCENT ============
Tab:CreateSection("Innocent")

local autoCoin = false
task.spawn(function()
    while task.wait(0.6) do
        if autoCoin then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and (v.Name == "Coin" or v.Name == "CoinDrop") then
                    local hrp = getHRP()
                    if hrp then
                        hrp.CFrame = v.CFrame + Vector3.new(0,3,0)
                        task.wait(0.03)
                    end
                end
            end
        end
    end
end)

Tab:CreateToggle({Name="Auto Farm Coin (Tweened)",CurrentValue=false,Flag="AutoCoin",Callback=function(s) autoCoin=s end})

Tab:CreateButton({
    Name = "Collect All Coins (Instant TP)",
    Callback = function()
        local n = 0
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and (v.Name == "Coin" or v.Name == "CoinDrop") then
                local hrp = getHRP()
                if hrp then
                    hrp.CFrame = v.CFrame + Vector3.new(0,3,0)
                    n = n + 1
                    task.wait(0.03)
                end
            end
        end
        rayfield:Notify({Title="Done",Content="Collected "..n.." coins.",Duration=3,Image="check"})
    end
})

-- ============ ROLE INFO ============
Tab:CreateSection("Role Info")

local roleLabel = Tab:CreateLabel("Waiting for round data...")

task.spawn(function()
    while task.wait(1) do
        local m = getMurderer()
        local s = getSheriff()
        local alive = 0
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChildOfClass("Humanoid") and p.Character.Humanoid.Health > 0 then
                alive = alive + 1
            end
        end
        if roleLabel then
            roleLabel:Set("Murderer: " .. (m and m.Name or "none") ..
                "  Sheriff: " .. (s and s.Name or "none") ..
                "  Alive: " .. alive)
        end
    end
end)

Tab:CreateButton({
    Name = "Notify Roles",
    Callback = function()
        local m = getMurderer()
        local s = getSheriff()
        rayfield:Notify({
            Title = "Role Info",
            Content = "Murderer: " .. (m and m.Name or "?") .. " | Sheriff: " .. (s and s.Name or "?"),
            Duration = 5,
            Image = "info"
        })
    end
})

Tab:CreateButton({
    Name = "Send Roles in Chat",
    Callback = function()
        local m = getMurderer()
        local s = getSheriff()
        local msg = "Murderer: " .. (m and m.Name or "?") .. " | Sheriff: " .. (s and s.Name or "?")
        pcall(function() TextChatService.TextChannels.RBXGeneral:SendAsync(msg) end)
    end
})

Tab:CreateButton({Name="Teleport to Murderer",Callback=function() local m=getMurderer(); if m then tpBehind(m) end end})
Tab:CreateButton({Name="Teleport to Sheriff",Callback=function() local s=getSheriff(); if s then tpBehind(s) end end})

-- ============ DEFENSE ============
Tab:CreateSection("Defense")

local dodgeBullet, dodgeKnife, antiStab = false, false, false

task.spawn(function()
    while task.wait(0.05) do
        if dodgeBullet then
            local s = getSheriff()
            if s and s.Character and s.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = getHRP()
                local t = s.Character.HumanoidRootPart
                if hrp and (hrp.Position - t.Position).Magnitude < 100 then
                    hrp.CFrame = hrp.CFrame + (hrp.Position - t.Position).Unit * 3
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.05) do
        if dodgeKnife or antiStab then
            local m = getMurderer()
            if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = getHRP()
                local t = m.Character.HumanoidRootPart
                if hrp then
                    local d = (hrp.Position - t.Position).Magnitude
                    local limit = dodgeKnife and 100 or (antiStab and 20)
                    if d < limit then hrp.CFrame = hrp.CFrame + (hrp.Position - t.Position).Unit * 5 end
                end
            end
        end
    end
end)

Tab:CreateToggle({Name="Dodge Bullet",CurrentValue=false,Flag="DodgeBullet",Callback=function(s) dodgeBullet=s end})
Tab:CreateToggle({Name="Dodge Knife Throw",CurrentValue=false,Flag="DodgeKnife",Callback=function(s) dodgeKnife=s end})
Tab:CreateToggle({Name="Anti-Stab (Dodge Close Murderer)",CurrentValue=false,Flag="AntiStab",Callback=function(s) antiStab=s end})

Tab:CreateToggle({
    Name = "Master Defense (All Dodge)",
    CurrentValue = false,
    Flag = "MasterDefense",
    Callback = function(s) dodgeBullet=s; dodgeKnife=s; antiStab=s end
})

Tab:CreateSlider({Name="Murderer Proximity Range",CurrentValue=50,Flag="MurdProxRange",Increment=5,Range={10,200},Suffix=" studs",Callback=function() end})

local proxAlert = false
task.spawn(function()
    while task.wait(0.5) do
        if proxAlert then
            local m = getMurderer()
            local hrp = getHRP()
            if m and m.Character and hrp and m.Character:FindFirstChild("HumanoidRootPart") then
                if (hrp.Position - m.Character.HumanoidRootPart.Position).Magnitude < 50 then
                    rayfield:Notify({Title="Warning",Content="Murderer nearby!",Duration=2,Image="triangle-alert"})
                end
            end
        end
    end
end)

Tab:CreateToggle({Name="Murderer Proximity Alert",CurrentValue=false,Flag="MurdProxAlert",Callback=function(s) proxAlert=s end})

-- MM2 script reconstructed from behavior trace (part 2 of 2)
-- Run immediately after part 1.

-- ============ ESP ============
Tab2:CreateSection("Player ESP")

local espM, espS, espI = false, false, false
local function applyHighlight(p, col)
    if p == LocalPlayer or not p.Character then return end
    local h = p.Character:FindFirstChild("ESPHighlight")
    if not h then
        h = Instance.new("Highlight")
        h.Name = "ESPHighlight"
        h.Parent = p.Character
    end
    h.FillColor = col
    h.OutlineColor = col
    h.FillTransparency = 0.5
    h.OutlineTransparency = 0
end

task.spawn(function()
    while task.wait(0.5) do
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local role = hasTool(p, "Knife") and "murderer" or hasTool(p, "Gun") and "sheriff" or "innocent"
                local show = (role == "murderer" and espM) or (role == "sheriff" and espS) or (role == "innocent" and espI)
                local ex = p.Character:FindFirstChild("ESPHighlight")
                if show then
                    local c = role == "murderer" and Color3.fromRGB(255,0,0) or role == "sheriff" and Color3.fromRGB(0,150,255) or Color3.fromRGB(0,255,0)
                    applyHighlight(p, c)
                elseif ex then
                    ex:Destroy()
                end
            end
        end
    end
end)

Tab2:CreateSlider({Name="ESP Distance Limit",CurrentValue=9999,Flag="ESPDistance",Increment=100,Range={100,9999},Suffix=" studs",Callback=function() end})
Tab2:CreateToggle({Name="Murderer ESP",CurrentValue=false,Flag="MurdererESP",Callback=function(s) espM=s end})
Tab2:CreateToggle({Name="Sheriff ESP",CurrentValue=false,Flag="SheriffESP",Callback=function(s) espS=s end})
Tab2:CreateToggle({Name="Innocent ESP",CurrentValue=false,Flag="InnocentESP",Callback=function(s) espI=s end})
Tab2:CreateToggle({Name="Tracer ESP",CurrentValue=false,Flag="Tracers",Callback=function() end})

Tab2:CreateToggle({
    Name = "White Outline",
    CurrentValue = false,
    Flag = "WhiteOutline",
    Callback = function(state)
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                local h = p.Character:FindFirstChild("ESPHighlight")
                if h then h.OutlineColor = state and Color3.new(1,1,1) or h.FillColor end
            end
        end
    end
})

Tab2:CreateToggle({Name="Player Names + Distance",CurrentValue=false,Flag="PlayerNames",Callback=function() end})

Tab2:CreateSection("Object ESP")

Tab2:CreateToggle({
    Name = "Coin ESP",
    CurrentValue = false,
    Flag = "CoinESP",
    Callback = function(state)
        if state then
            _G.CoinESPCon = RunService.Heartbeat:Connect(function()
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and (v.Name == "Coin" or v.Name == "CoinDrop") and not v:FindFirstChild("CoinESP") then
                        local h = Instance.new("Highlight")
                        h.Name = "CoinESP"
                        h.FillColor = Color3.fromRGB(255,215,0)
                        h.OutlineColor = Color3.fromRGB(255,215,0)
                        h.FillTransparency = 0.4
                        h.OutlineTransparency = 0
                        h.Adornee = v
                        h.Parent = v
                    end
                end
            end)
        else
            if _G.CoinESPCon then _G.CoinESPCon:Disconnect() end
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "CoinESP" then v:Destroy() end
            end
        end
    end
})

Tab2:CreateToggle({
    Name = "Gun Drop ESP",
    CurrentValue = false,
    Flag = "GunDropESP",
    Callback = function(state)
        if state then
            _G.GunESPCon = RunService.Heartbeat:Connect(function()
                local map = workspace:FindFirstChild("Map")
                local gd = map and map:FindFirstChild("GunDrop")
                if gd and not gd:FindFirstChild("GunDropESP") then
                    local h = Instance.new("Highlight")
                    h.Name = "GunDropESP"
                    h.FillColor = Color3.fromRGB(255,220,0)
                    h.OutlineColor = Color3.new(0,0,0)
                    h.FillTransparency = 0.4
                    h.OutlineTransparency = 0
                    h.Adornee = gd
                    h.Parent = gd
                end
            end)
        else
            if _G.GunESPCon then _G.GunESPCon:Disconnect() end
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "GunDropESP" then v:Destroy() end
            end
        end
    end
})

Tab2:CreateToggle({Name="Thrown Knife ESP",CurrentValue=false,Flag="KnifeESP",Callback=function() end})

-- ============ PLAYER ============
Tab3:CreateSection("Movement")

Tab3:CreateSlider({
    Name = "Walkspeed", CurrentValue = 16, Flag = "Walkspeed",
    Increment = 1, Range = {0, 200}, Suffix = "",
    Callback = function(v) local h = getHum(); if h then h.WalkSpeed = v end end
})

Tab3:CreateSlider({
    Name = "Jump Power", CurrentValue = 50, Flag = "JumpPower",
    Increment = 1, Range = {0, 300}, Suffix = "",
    Callback = function(v) local h = getHum(); if h then pcall(function() h.JumpPower = v end); pcall(function() h.UseJumpPower = true end) end end
})

local noclip = false
RunService.Stepped:Connect(function()
    if noclip then
        local c = getChar()
        if c then
            for _, v in ipairs(c:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)

Tab3:CreateToggle({Name="Noclip",CurrentValue=false,Flag="Noclip",Callback=function(s) noclip=s end})

Tab3:CreateToggle({
    Name = "Infinite Jump", CurrentValue = false, Flag = "InfiniteJump",
    Callback = function(state)
        if state then
            _G.InfJumpCon = UserInputService.JumpRequest:Connect(function()
                local h = getHum()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        else
            if _G.InfJumpCon then _G.InfJumpCon:Disconnect() end
        end
    end
})

Tab3:CreateSlider({Name="Fly Speed",CurrentValue=50,Flag="FlySpeed",Increment=5,Range={10,300},Suffix=" studs/s",Callback=function() end})

local flyEnabled = false
local flyBV, flyBG, flyCon
Tab3:CreateToggle({
    Name = "Fly", CurrentValue = false, Flag = "Fly",
    Callback = function(state)
        flyEnabled = state
        local hrp = getHRP()
        if state and hrp then
            flyBV = Instance.new("BodyVelocity")
            flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBV.Velocity = Vector3.zero
            flyBV.Parent = hrp
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBG.P = 9000
            flyBG.CFrame = hrp.CFrame
            flyBG.Parent = hrp
            flyCon = RunService.RenderStepped:Connect(function()
                if not flyEnabled or not flyBV then return end
                local cam = workspace.CurrentCamera
                local d = Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then d = d + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then d = d - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then d = d - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then d = d + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then d = d + Vector3.yAxis end
                flyBV.Velocity = d.Magnitude > 0 and d.Unit * 50 or Vector3.zero
                flyBG.CFrame = cam.CFrame
            end)
        elseif flyBV then
            if flyCon then flyCon:Disconnect() end
            flyBV:Destroy(); flyBG:Destroy()
            flyBV, flyBG = nil, nil
        end
    end
})

Tab3:CreateSlider({
    Name = "Gravity", CurrentValue = 196.2, Flag = "Gravity",
    Increment = 1, Range = {0, 999}, Suffix = "",
    Callback = function(v) workspace.Gravity = v end
})

Tab3:CreateButton({
    Name = "Restore Defaults",
    Callback = function()
        workspace.Gravity = 196.2
        local h = getHum()
        if h then h.WalkSpeed = 16; pcall(function() h.JumpPower = 50 end) end
        rayfield:Notify({Title="Restored",Content="Values reset to default.",Duration=3,Image="rotate-ccw"})
    end
})

Tab3:CreateSection("Spectate")

Tab3:CreateToggle({
    Name = "Spectate Murderer", CurrentValue = false, Flag = "SpectateMurd",
    Callback = function(state)
        if state then
            _G.SpecCon = RunService.RenderStepped:Connect(function()
                local m = getMurderer()
                if m and m.Character then
                    local h = m.Character:FindFirstChildOfClass("Humanoid")
                    if h then workspace.CurrentCamera.CameraSubject = h end
                end
            end)
        else
            if _G.SpecCon then _G.SpecCon:Disconnect() end
            local h = getHum()
            if h then workspace.CurrentCamera.CameraSubject = h end
        end
    end
})

Tab3:CreateSection("Auto Respawn")

Tab3:CreateToggle({
    Name = "Auto Respawn on Death", CurrentValue = false, Flag = "AutoRespawn",
    Callback = function(state)
        if state then
            _G.RespawnCon = LocalPlayer.CharacterAdded:Connect(function(char)
                local h = char:WaitForChild("Humanoid")
                h.Died:Connect(function()
                    task.wait(0.5)
                    pcall(function() LocalPlayer:LoadCharacter() end)
                end)
            end)
        else
            if _G.RespawnCon then _G.RespawnCon:Disconnect() end
        end
    end
})

Tab3:CreateSection("Player Teleport")

local tpDropdown = Tab3:CreateDropdown({
    Name = "Teleport to Player", CurrentOption = "", Flag = "TpDropdown",
    Options = {},
    Callback = function(state)
        if state then
            local t = Players:FindFirstChild(state)
            if t and t.Character then
                local hrp = getHRP()
                local trp = t.Character:FindFirstChild("HumanoidRootPart")
                if hrp and trp then
                    hrp.CFrame = trp.CFrame + Vector3.new(0,5,0)
                    rayfield:Notify({Title="Done",Content="Teleported to "..state,Duration=3,Image="check"})
                end
            end
        end
    end
})

Tab3:CreateButton({
    Name = "Refresh List",
    Callback = function()
        local names = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then table.insert(names, p.Name) end
        end
        tpDropdown:Refresh(names)
        rayfield:Notify({Title="Done",Content="Player list refreshed.",Duration=3,Image="check"})
    end
})

-- ============ VISUAL ============
Tab4:CreateSection("Camera")
Tab4:CreateToggle({Name="Noclip Camera",CurrentValue=false,Flag="NoclipCamera",Callback=function() end})
Tab4:CreateToggle({Name="Always Allow Third Person",CurrentValue=false,Flag="AlwaysThirdPerson",Callback=function() end})
Tab4:CreateSlider({Name="Camera Max Zoom",CurrentValue=128,Flag="CamMaxZoom",Increment=1,Range={16,500},Suffix="",Callback=function(v) LocalPlayer.CameraMaxZoomDistance = v end})

Tab4:CreateSection("Lighting")

Tab4:CreateToggle({
    Name = "Full Bright", CurrentValue = false, Flag = "FullBright",
    Callback = function(state)
        if state then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
            Lighting.Ambient = Color3.fromRGB(128,128,128)
            local atm = Lighting:FindFirstChildOfClass("Atmosphere")
            if atm then atm.Density = 0 end
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
        end
    end
})

Tab4:CreateToggle({
    Name = "No Fog", CurrentValue = false, Flag = "NoFog",
    Callback = function(state)
        if state then
            Lighting.FogEnd = 100000
            Lighting.FogStart = 100000
        else
            Lighting.FogEnd = 10000
            Lighting.FogStart = 0
        end
    end
})

Tab4:CreateSection("X-Ray")

Tab4:CreateToggle({
    Name = "X-Ray (Transparent Walls)", CurrentValue = false, Flag = "Xray",
    Callback = function(state)
        if state then
            _G.XrayCon = RunService.Heartbeat:Connect(function()
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and not v:FindFirstChild("Humanoid") then
                        v.LocalTransparencyModifier = 0.9
                    end
                end
            end)
        else
            if _G.XrayCon then _G.XrayCon:Disconnect() end
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0 end
            end
        end
    end
})

Tab4:CreateSection("Character")

Tab4:CreateToggle({
    Name = "Invisible (Local)", CurrentValue = false, Flag = "Invisible",
    Callback = function(state)
        local c = getChar()
        if c then
            for _, v in ipairs(c:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") then
                    v.LocalTransparencyModifier = state and 1 or 0
                end
            end
        end
    end
})

Tab4:CreateButton({Name="Remove Doors/Barriers",Callback=function() rayfield:Notify({Title="Info",Content="Not implemented",Duration=3,Image="info"}) end})

-- ============ MISC ============
Tab5:CreateSection("Server")

Tab5:CreateButton({
    Name = "Rejoin",
    Callback = function()
        pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
    end
})

Tab5:CreateButton({
    Name = "Serverhop",
    Callback = function()
        rayfield:Notify({Title="Info",Content="Not implemented in this build",Duration=3,Image="info"})
    end
})

Tab5:CreateToggle({
    Name = "Anti AFK", CurrentValue = false, Flag = "AntiAFK",
    Callback = function(state)
        if state then
            _G.AFKCon = LocalPlayer.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        else
            if _G.AFKCon then _G.AFKCon:Disconnect() end
        end
    end
})

Tab5:CreateSection("Fling")

local function flingPlayer(t)
    if not t or not t.Character then return end
    local trp = t.Character:FindFirstChild("HumanoidRootPart")
    local hrp = getHRP()
    if not trp or not hrp then return end
    local spin = Instance.new("BodyAngularVelocity")
    spin.AngularVelocity = Vector3.new(0, 99999, 0)
    spin.MaxTorque = Vector3.new(99999, 99999, 99999)
    spin.Parent = hrp
    hrp.CFrame = trp.CFrame * CFrame.new(0, 0, 0.5)
    task.wait(0.1)
    spin:Destroy()
end

Tab5:CreateButton({Name="Fling Murderer",Callback=function() local m=getMurderer(); if m then flingPlayer(m) end end})
Tab5:CreateButton({Name="Fling Sheriff",Callback=function() local s=getSheriff(); if s then flingPlayer(s) end end})
Tab5:CreateToggle({Name="Auto Fling Murderer",CurrentValue=false,Flag="AutoFling",Callback=function() end})