--[[
    Surreal Hub
    Total Roblox Drama — Camp / Practice
    Interface: LunaUI Updated v6.3
    v1.2.0
    UI modified by surrre4L using LunaUI Updated v6.3
]]

--==================================================
-- LOAD PATCHED LUNA
--==================================================
local Luna
local ok, result = pcall(function()
    return loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/surrre4l/Luna-Interface-Suite/master/LunaUI_Updated_v6.3_Optimized.lua",
        true
    ))()
end)

if ok and result then
    Luna = result
else
    return warn("[Surreal Hub] Failed to load Luna Interface Suite: " .. tostring(result))
end

--==================================================
-- SERVICES
--==================================================
local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local UserInputService  = game:GetService("UserInputService")
local HttpService       = game:GetService("HttpService")
local TextChatService   = game:GetService("TextChatService")
local Lighting          = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService      = game:GetService("TweenService")
local SoundService      = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local Camera      = workspace.CurrentCamera
local RS          = ReplicatedStorage
local CONFIG_ROOT = "Surreal Hub"

--==================================================
-- WHITELIST
--==================================================
local ALLOWED_USERS = {
    ["Ashy_Ash7474"] = true,
    ["kqttypoips"]   = true,
    ["poppingirlx"]  = true,
    ["Diling12323"]  = true,
}

--==================================================
-- FAKE HWID
--==================================================
local function fakeHwid(userId)
    local seed = tostring(userId) .. tostring(os.time())
    local hash = 0
    for i = 1, #seed do
        hash = (hash * 31 + seed:byte(i)) % 0xFFFFFFFF
    end
    local hex = string.format("%08X", hash)
    return string.format("%s-%s-%s-%s",
        hex:sub(1, 8), hex:sub(3, 6), hex:sub(5, 8), hex .. hex:sub(1, 4))
end

local function parentGui(g)
    local ok2 = pcall(function() g.Parent = game:GetService("CoreGui") end)
    if not ok2 or not g.Parent then
        g.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
end

local function showRobloxBanScreen(playerHwid, fakeIp, onComplete)
    local parentTarget
    local ok2 = pcall(function() parentTarget = game:GetService("CoreGui") end)
    if not ok2 or not parentTarget then
        parentTarget = LocalPlayer:WaitForChild("PlayerGui")
    end

    local banGui = Instance.new("ScreenGui")
    banGui.Name = "RobloxModerationScreen"
    banGui.ResetOnSpawn = false
    banGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    banGui.IgnoreGuiInset = true
    banGui.DisplayOrder = 2147483647
    banGui.Parent = parentTarget

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BorderSizePixel = 0
    bg.ZIndex = 1
    bg.Parent = banGui

    local logo = Instance.new("TextLabel")
    logo.Size = UDim2.new(0, 200, 0, 40)
    logo.Position = UDim2.new(0.5, -100, 0, 60)
    logo.BackgroundTransparency = 1
    logo.Text = "ROBLOX"
    logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    logo.Font = Enum.Font.GothamBlack
    logo.TextSize = 32
    logo.ZIndex = 2
    logo.Parent = bg

    local panel = Instance.new("Frame")
    panel.Size = UDim2.new(0, 560, 0, 380)
    panel.Position = UDim2.new(0.5, -280, 0.5, -170)
    panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    panel.BorderSizePixel = 0
    panel.ZIndex = 3
    panel.Parent = bg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = panel

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(180, 0, 0)
    stroke.Thickness = 2
    stroke.Parent = panel

    local warnIcon = Instance.new("TextLabel")
    warnIcon.Size = UDim2.new(0, 60, 0, 60)
    warnIcon.Position = UDim2.new(0, 24, 0, 24)
    warnIcon.BackgroundTransparency = 1
    warnIcon.Text = "⚠"
    warnIcon.TextColor3 = Color3.fromRGB(255, 200, 0)
    warnIcon.Font = Enum.Font.GothamBlack
    warnIcon.TextSize = 56
    warnIcon.ZIndex = 4
    warnIcon.Parent = panel

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -110, 0, 34)
    title.Position = UDim2.new(0, 96, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "Account Moderated"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 4
    title.Parent = panel

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, -110, 0, 20)
    subtitle.Position = UDim2.new(0, 96, 0, 66)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "You have been removed from this experience"
    subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 14
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 4
    subtitle.Parent = panel

    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, -48, 0, 1)
    divider.Position = UDim2.new(0, 24, 0, 106)
    divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    divider.BorderSizePixel = 0
    divider.ZIndex = 4
    divider.Parent = panel

    local details = Instance.new("TextLabel")
    details.Size = UDim2.new(1, -48, 0, 180)
    details.Position = UDim2.new(0, 24, 0, 118)
    details.BackgroundTransparency = 1
    details.Text =
        "Moderation Action:  Account Termination\n" ..
        "Date:               " .. os.date("%B %d, %Y at %I:%M %p") .. "\n" ..
        "Duration:           Permanent\n\n" ..
        "Reason:\n" ..
        "  Unauthorized modification of game client\n" ..
        "  (Detection: Surreal Hub anti-cheat signature)\n\n" ..
        "Device Identifier:\n" ..
        "  " .. playerHwid .. "\n\n" ..
        "IP Address:\n" ..
        "  " .. fakeIp .. "\n\n" ..
        "Appeal at: roblox.com/support"
    details.TextColor3 = Color3.fromRGB(230, 230, 230)
    details.Font = Enum.Font.Code
    details.TextSize = 13
    details.TextWrapped = true
    details.TextXAlignment = Enum.TextXAlignment.Left
    details.TextYAlignment = Enum.TextYAlignment.Top
    details.ZIndex = 4
    details.Parent = panel

    local countdown = Instance.new("TextLabel")
    countdown.Size = UDim2.new(1, -48, 0, 30)
    countdown.Position = UDim2.new(0, 24, 1, -60)
    countdown.BackgroundTransparency = 1
    countdown.Text = "Disconnecting in 5..."
    countdown.TextColor3 = Color3.fromRGB(255, 80, 80)
    countdown.Font = Enum.Font.GothamBold
    countdown.TextSize = 16
    countdown.TextXAlignment = Enum.TextXAlignment.Left
    countdown.ZIndex = 4
    countdown.Parent = panel

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 100, 0, 32)
    okBtn.Position = UDim2.new(1, -124, 1, -50)
    okBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    okBtn.BorderSizePixel = 0
    okBtn.Text = "OK"
    okBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    okBtn.Font = Enum.Font.GothamBold
    okBtn.TextSize = 14
    okBtn.ZIndex = 4
    okBtn.Parent = panel

    local oCorner = Instance.new("UICorner")
    oCorner.CornerRadius = UDim.new(0, 4)
    oCorner.Parent = okBtn

    okBtn.MouseButton1Click:Connect(function()
        countdown.Text = "Please wait..."
    end)

    task.spawn(function()
        while panel.Parent do
            stroke.Color = Color3.fromRGB(180 + math.random(-40, 40), 0, 0)
            task.wait(0.15)
        end
    end)

    task.spawn(function()
        for i = 5, 1, -1 do
            if not countdown.Parent then return end
            countdown.Text = "Disconnecting in " .. i .. "..."
            task.wait(1)
        end
        countdown.Text = "Disconnected."
        task.wait(0.3)
        if onComplete then onComplete() end
    end)
end

local function showBlockScreen()
    local playerHwid = fakeHwid(LocalPlayer.UserId)
    local fakeIp = string.format("%d.%d.%d.%d",
        math.random(100, 255), math.random(0, 255),
        math.random(0, 255), math.random(1, 254))

    pcall(function()
        local core = game:GetService("CoreGui")
        local old = core:FindFirstChild("SurrealBlocked")
        if old then old:Destroy() end
        local old2 = core:FindFirstChild("RobloxModerationScreen")
        if old2 then old2:Destroy() end
    end)
    pcall(function()
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        if pg then
            local old = pg:FindFirstChild("SurrealBlocked")
            if old then old:Destroy() end
            local old2 = pg:FindFirstChild("RobloxModerationScreen")
            if old2 then old2:Destroy() end
        end
    end)

    local gui = Instance.new("ScreenGui")
    gui.Name = "SurrealBlocked"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 999999
    parentGui(gui)

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    bg.BorderSizePixel = 0
    bg.ZIndex = 100
    bg.Parent = gui

    local scanlines = Instance.new("Frame")
    scanlines.Size = UDim2.new(1, 0, 1, 0)
    scanlines.BackgroundTransparency = 1
    scanlines.ZIndex = 101
    scanlines.Parent = bg

    for i = 1, 250 do
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        line.BackgroundTransparency = 0.7
        line.BorderSizePixel = 0
        line.Size = UDim2.new(1, 0, 0, 1)
        line.Position = UDim2.new(0, 0, 0, i * 4)
        line.ZIndex = 101
        line.Parent = scanlines
    end

    local vignette = Instance.new("ImageLabel")
    vignette.Size = UDim2.new(1, 0, 1, 0)
    vignette.BackgroundTransparency = 1
    vignette.Image = "rbxassetid://1316045217"
    vignette.ImageColor3 = Color3.fromRGB(0, 0, 0)
    vignette.ImageTransparency = 0.2
    vignette.ZIndex = 102
    vignette.Parent = bg

    local card = Instance.new("Frame")
    card.Size = UDim2.new(0, 620, 0, 400)
    card.Position = UDim2.new(0.5, -310, 0.5, -200)
    card.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
    card.BorderSizePixel = 0
    card.ZIndex = 110
    card.Parent = bg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 3
    stroke.Transparency = 0
    stroke.Parent = card

    task.spawn(function()
        while card.Parent do
            stroke.Transparency = 0.1 + (0.5 * math.abs(math.sin(tick() * 3)))
            task.wait(0.03)
        end
    end)

    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 80, 0, 80)
    icon.Position = UDim2.new(0, 28, 0, 24)
    icon.BackgroundTransparency = 1
    icon.Text = "⚠"
    icon.TextColor3 = Color3.fromRGB(255, 0, 0)
    icon.Font = Enum.Font.GothamBlack
    icon.TextSize = 72
    icon.ZIndex = 111
    icon.Parent = card

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -140, 0, 44)
    title.Position = UDim2.new(0, 118, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "SECURITY VIOLATION"
    title.TextColor3 = Color3.fromRGB(255, 0, 0)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 30
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 111
    title.Parent = card

    task.spawn(function()
        while title.Parent do
            title.TextColor3 = Color3.fromRGB(255, 0, 0)
            task.wait(0.35)
            title.TextColor3 = Color3.fromRGB(160, 0, 0)
            task.wait(0.35)
        end
    end)

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, -140, 0, 20)
    subtitle.Position = UDim2.new(0, 118, 0, 76)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "SURREAL HUB — ANTI-PIRACY SYSTEM v1.2.0"
    subtitle.TextColor3 = Color3.fromRGB(200, 100, 100)
    subtitle.Font = Enum.Font.Code
    subtitle.TextSize = 12
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 111
    subtitle.Parent = card

    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, -56, 0, 2)
    divider.Position = UDim2.new(0, 28, 0, 110)
    divider.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    divider.BorderSizePixel = 0
    divider.ZIndex = 111
    divider.Parent = card

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -56, 0, 190)
    body.Position = UDim2.new(0, 28, 0, 122)
    body.BackgroundTransparency = 1
    body.Text =
        "Your account has been flagged by the Surreal Hub security system.\n" ..
        "Unauthorized access attempt has been recorded.\n\n" ..
        "─── IDENTITY LOGGED ────────────────────────────\n" ..
        "  USERNAME   : " .. LocalPlayer.Name .. "\n" ..
        "  USERID     : " .. tostring(LocalPlayer.UserId) .. "\n" ..
        "  HWID       : " .. playerHwid .. "\n" ..
        "  IP ADDRESS : " .. fakeIp .. "\n" ..
        "  TIMESTAMP  : " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n" ..
        "────────────────────────────────────────────────\n\n" ..
        "This data is being transmitted to Surreal Hub servers.\n" ..
        "You will be removed from the server upon completion."
    body.TextColor3 = Color3.fromRGB(255, 200, 200)
    body.Font = Enum.Font.Code
    body.TextSize = 13
    body.TextWrapped = true
    body.TextXAlignment = Enum.TextXAlignment.Left
    body.TextYAlignment = Enum.TextYAlignment.Top
    body.ZIndex = 111
    body.Parent = card

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -56, 0, 22)
    status.Position = UDim2.new(0, 28, 1, -80)
    status.BackgroundTransparency = 1
    status.Text = "▶ TRANSMITTING HWID"
    status.TextColor3 = Color3.fromRGB(255, 60, 60)
    status.Font = Enum.Font.Code
    status.TextSize = 14
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.ZIndex = 111
    status.Parent = card

    local progressBg = Instance.new("Frame")
    progressBg.Size = UDim2.new(1, -56, 0, 10)
    progressBg.Position = UDim2.new(0, 28, 1, -48)
    progressBg.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    progressBg.BorderSizePixel = 0
    progressBg.ZIndex = 111
    progressBg.Parent = card

    local pCorner = Instance.new("UICorner")
    pCorner.CornerRadius = UDim.new(1, 0)
    pCorner.Parent = progressBg

    local progressFill = Instance.new("Frame")
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    progressFill.BorderSizePixel = 0
    progressFill.ZIndex = 112
    progressFill.Parent = progressBg

    local pfCorner = Instance.new("UICorner")
    pfCorner.CornerRadius = UDim.new(1, 0)
    pfCorner.Parent = progressFill

    local escalate = Instance.new("TextLabel")
    escalate.Size = UDim2.new(1, -56, 0, 20)
    escalate.Position = UDim2.new(0, 28, 1, -26)
    escalate.BackgroundTransparency = 1
    escalate.Text = ""
    escalate.TextColor3 = Color3.fromRGB(255, 100, 100)
    escalate.Font = Enum.Font.GothamBold
    escalate.TextSize = 12
    escalate.TextXAlignment = Enum.TextXAlignment.Left
    escalate.ZIndex = 111
    escalate.Parent = card

    task.spawn(function()
        local dotFrames = { ".", "..", "...", "...." }
        local dotIndex = 1
        local transmitStart = tick()
        while status.Parent and (tick() - transmitStart) < 5 do
            status.Text = "▶ TRANSMITTING HWID" .. dotFrames[dotIndex]
            dotIndex = dotIndex % #dotFrames + 1
            task.wait(0.25)
        end

        local tween = TweenService:Create(
            progressFill,
            TweenInfo.new(5, Enum.EasingStyle.Linear),
            { Size = UDim2.new(1, 0, 1, 0) }
        )
        tween:Play()

        local messages = {
            {0.0, "Contacting Surreal Hub servers..."},
            {1.0, "Uploading hardware signature..."},
            {2.0, "Linking to Roblox account database..."},
            {3.0, "Notifying staff members..."},
            {4.0, "Blacklist request queued..."},
        }
        for _, pair in ipairs(messages) do
            if not escalate.Parent then return end
            escalate.Text = "[" .. os.date("%H:%M:%S") .. "] " .. pair[2]
            task.wait(pair[1] == 4.0 and 0.9 or 1)
        end

        while progressFill.Size.X.Scale < 1 and progressFill.Parent do
            task.wait(0.05)
        end

        status.Text = "✅ HWID SUCCESSFULLY TRANSMITTED"
        status.TextColor3 = Color3.fromRGB(255, 40, 40)
        progressFill.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        escalate.Text = "[" .. os.date("%H:%M:%S") .. "] Blacklist confirmed. Removing from server..."
        escalate.TextColor3 = Color3.fromRGB(255, 60, 60)

        for _ = 1, 6 do
            bg.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
            card.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
            task.wait(0.08)
            bg.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
            card.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
            task.wait(0.08)
        end

        task.spawn(function()
            local alternates = {
                "🚫 YOUR ACCOUNT HAS BEEN FLAGGED",
                "🚫 PERMANENT BLACKLIST PENDING",
                "🚫 REMOVING FROM SERVER",
            }
            local i = 1
            while escalate.Parent do
                escalate.Text = "[" .. os.date("%H:%M:%S") .. "] " .. alternates[i]
                i = i % #alternates + 1
                task.wait(1)
            end
        end)

        task.wait(3)
        gui.Enabled = false

        showRobloxBanScreen(playerHwid, fakeIp, function()
            pcall(function()
                LocalPlayer:Kick(
                    "You have been permanently blacklisted from Surreal Hub.\n\n" ..
                    "Reason: Unauthorized access to a whitelist-only build.\n\n" ..
                    "HWID: " .. playerHwid .. "\n" ..
                    "IP: " .. fakeIp .. "\n\n" ..
                    "If you believe this is a mistake, contact staff."
                )
            end)
        end)
    end)

    task.spawn(function()
        while card.Parent do
            task.wait(math.random(20, 60) / 10)
            local orig = card.Position
            for _ = 1, 4 do
                card.Position = orig + UDim2.new(0, math.random(-4, 4), 0, math.random(-4, 4))
                task.wait(0.02)
            end
            card.Position = orig
            bg.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
            task.wait(0.05)
            bg.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
        end
    end)

    pcall(function()
        local sound = Instance.new("Sound")
        sound.Name = "SurrealAlarm"
        sound.SoundId = "rbxassetid://9046913112"
        sound.Volume = 0.4
        sound.Looped = true
        sound.Parent = SoundService
        sound:Play()
        gui.Destroying:Connect(function()
            pcall(function() sound:Destroy() end)
        end)
    end)

    warn("╔═══════════════════════════════════════════════╗")
    warn("║  ⚠  SURREAL HUB — SECURITY VIOLATION  ⚠      ║")
    warn("╚═══════════════════════════════════════════════╝")
    warn("[Surreal Hub] Unauthorized access attempt logged.")
    warn("  Username : " .. LocalPlayer.Name)
    warn("  UserID   : " .. tostring(LocalPlayer.UserId))
    warn("  HWID     : " .. playerHwid)
    warn("  IP       : " .. fakeIp)
    warn("  Time     : " .. os.date("%Y-%m-%d %H:%M:%S"))
    warn("═════════════════════════════════════════════════")
end

if not ALLOWED_USERS[LocalPlayer.Name] then
    showBlockScreen()
    return
end

--==================================================
-- PLACE ID DETECTION
--==================================================
local PLACE_LOBBY    = 4889315193
local PLACE_CAMP     = 4939362930
local PLACE_PRACTICE = 15365802831

local isLobby    = game.PlaceId == PLACE_LOBBY
local isCamp     = game.PlaceId == PLACE_CAMP
local isPractice = game.PlaceId == PLACE_PRACTICE

local loadCamp     = isLobby or isCamp
local loadPractice = isPractice

print(string.format(
    "[Surreal Hub] PlaceID: %d | Mode: %s",
    game.PlaceId,
    loadCamp and "Camp" or (loadPractice and "Practice" or "Unknown")
))

--==================================================
-- EXECUTOR FALLBACKS
--==================================================
local function ensureFunction(name, fallback)
    local env = getfenv(0)
    if type(env[name]) ~= "function" then env[name] = fallback end
end

ensureFunction("writefile",         function() end)
ensureFunction("readfile",          function() return "" end)
ensureFunction("makefolder",        function() end)
ensureFunction("isfile",            function() return false end)
ensureFunction("isfolder",          function() return false end)
ensureFunction("listfiles",         function() return {} end)
ensureFunction("delfile",           function() end)
ensureFunction("getcustomasset",    function() return "" end)
ensureFunction("firetouchinterest", function() end)
ensureFunction("fireclickdetector", function() end)
ensureFunction("getconnections",    function() return {} end)
ensureFunction("request",           http_request or (syn and syn.request) or function() end)

--==================================================
-- UTILITIES MODULE
--==================================================
local Utilities = {}
local MAX_NOTIFY_DURATION = 4

function Utilities.safe(fn)
    return function(...)
        local ok, err = pcall(fn, ...)
        if not ok then warn("[Surreal Hub] Callback error: " .. tostring(err)) end
    end
end

function Utilities.notify(title, content, duration)
    local safeDuration = math.min(duration or MAX_NOTIFY_DURATION, MAX_NOTIFY_DURATION)
    local t = tostring(title or "Surreal Hub")
    local c = tostring(content or "")

    local ok = pcall(function()
        Luna:Notification({
            Title    = t,
            Content  = c,
            Duration = safeDuration,
            Image    = "bell-ring",
        })
    end)

    if not ok then
        pcall(function()
            Luna:Notification({
                Title    = t,
                Content  = c,
                Duration = safeDuration,
            })
        end)
    end
end

function Utilities.forEachDescendant(root, className, callback)
    for _, obj in ipairs(root:GetDescendants()) do
        if obj:IsA(className) then pcall(callback, obj) end
    end
end

function Utilities.forEachBasePart(callback)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then pcall(callback, obj) end
    end
end

function Utilities.character()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

function Utilities.rootPart()
    local c = LocalPlayer.Character
    return c and c:FindFirstChild("HumanoidRootPart")
end

function Utilities.humanoid()
    local c = LocalPlayer.Character
    return c and c:FindFirstChildOfClass("Humanoid")
end

function Utilities.teleportTo(x, y, z)
    local root = Utilities.rootPart()
    if root then root.CFrame = CFrame.new(x, y, z) end
end

--==================================================
-- UTILITY REGISTRY
--==================================================
local UtilityRegistry = {
    { id = "genesis_sniper", name = "Genesis Sniper",
      source = "https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Sniper", enabled = true },
    { id = "infinite_yield", name = "Infinite Yield",
      source = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", enabled = true },
    { id = "energize", name = "Energize",
      source = "https://pastebin.com/raw/Cfeu2ZPc", enabled = true },
}

function Utilities.launchUtility(id)
    for _, entry in ipairs(UtilityRegistry) do
        if entry.id == id and entry.enabled then
            local ok, chunk = pcall(function() return game:HttpGet(entry.source, true) end)
            if ok and chunk then
                local fn = loadstring(chunk)
                if fn then
                    task.spawn(fn)
                    Utilities.notify("Utility Loaded", entry.name, 4)
                end
            end
            return
        end
    end
end

--==================================================
-- SHADER MANAGER (Snug + Slaughter)
--==================================================
local ShaderManager = {}

local _shaderApplied   = nil
local _shaderHeartbeat = nil

local _shaderOriginal = {}
pcall(function()
    for _, prop in ipairs({
        "Ambient", "OutdoorAmbient", "Brightness", "ClockTime",
        "GeographicLatitude", "EnvironmentDiffuseScale",
        "EnvironmentSpecularScale", "GlobalShadows", "ShadowSoftness",
        "ExposureCompensation", "ColorShift_Top", "ColorShift_Bottom",
        "FogEnd", "FogStart", "FogColor",
    }) do
        pcall(function() _shaderOriginal[prop] = Lighting[prop] end)
    end
end)

local _shaderOriginalEffects = {}
pcall(function()
    for _, child in ipairs(Lighting:GetChildren()) do
        local hasEnabled = pcall(function() local _ = child.Enabled end)
        if hasEnabled then
            pcall(function() _shaderOriginalEffects[child] = child.Enabled end)
        end
    end
end)

local EFFECT_CLASSES = {
    "Sky", "Atmosphere", "BloomEffect", "ColorCorrectionEffect",
    "ColorGradingEffect", "SunRaysEffect", "DepthOfFieldEffect", "BlurEffect",
}

local function _hideGameEffects(prefix, holdName)
    pcall(function()
        local hold = Lighting:FindFirstChild(holdName)
        if not hold then
            hold = Instance.new("Folder")
            hold.Name = holdName
            hold.Parent = Lighting
        end
        for _, cls in ipairs(EFFECT_CLASSES) do
            for _, child in ipairs(Lighting:GetChildren()) do
                if child:IsA(cls)
                   and not child.Name:find(prefix, 1, true)
                   and child.Name ~= holdName
                   and child.Parent == Lighting then
                    child.Parent = hold
                end
            end
        end
    end)
end

local function _restoreGameEffects(holdName)
    pcall(function()
        local hold = Lighting:FindFirstChild(holdName)
        if not hold then return end
        for _, child in ipairs(hold:GetChildren()) do
            child.Parent = Lighting
        end
        hold:Destroy()
    end)
end

local function _destroyEffects(prefix)
    pcall(function()
        for _, name in ipairs({
            prefix .. "Sky", prefix .. "Atmosphere",
            prefix .. "Bloom", prefix .. "CC", prefix .. "SunRays",
            prefix .. "Depth",
        }) do
            local e = Lighting:FindFirstChild(name)
            if e then e:Destroy() end
        end
    end)
end

local SNUG_PREFIX = "Snug_"
local SNUG_HOLD   = "Snug_GameEffectsHold"

local SNUG_PROPS = {
    Ambient                = Color3.fromRGB(60, 55, 65),
    OutdoorAmbient         = Color3.fromRGB(120, 110, 105),
    Brightness             = 2.5,
    ClockTime              = 16.5,
    GeographicLatitude     = 30,
    EnvironmentDiffuseScale  = 0.9,
    EnvironmentSpecularScale = 1,
    GlobalShadows          = true,
    ShadowSoftness         = 0.28,
    ExposureCompensation   = 0,
    ColorShift_Top         = Color3.fromRGB(255, 210, 170),
    ColorShift_Bottom      = Color3.fromRGB(80, 65, 85),
    FogStart               = 60,
    FogEnd                 = 700,
    FogColor               = Color3.fromRGB(200, 185, 175),
}

local function _buildSnugEffects()
    _destroyEffects(SNUG_PREFIX)

    pcall(function()
        local atm = Instance.new("Atmosphere")
        atm.Name = SNUG_PREFIX .. "Atmosphere"
        atm.Density = 0.32
        atm.Offset = 0.15
        atm.Color = Color3.fromRGB(215, 205, 195)
        atm.Decay = Color3.fromRGB(120, 110, 120)
        atm.Glare = 0.25
        atm.Haze = 1.8
        atm.Parent = Lighting
    end)

    pcall(function()
        local bloom = Instance.new("BloomEffect")
        bloom.Name = SNUG_PREFIX .. "Bloom"
        bloom.Intensity = 0.6
        bloom.Size = 28
        bloom.Threshold = 0.95
        bloom.Parent = Lighting
    end)

    pcall(function()
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = SNUG_PREFIX .. "CC"
        cc.Brightness = 0.02
        cc.Contrast = 0.12
        cc.Saturation = 0.08
        cc.TintColor = Color3.fromRGB(255, 235, 215)
        cc.Parent = Lighting
    end)

    pcall(function()
        local sr = Instance.new("SunRaysEffect")
        sr.Name = SNUG_PREFIX .. "SunRays"
        sr.Intensity = 0.1
        sr.Spread = 1
        sr.Parent = Lighting
    end)

    pcall(function()
        local dof = Instance.new("DepthOfFieldEffect")
        dof.Name = SNUG_PREFIX .. "Depth"
        dof.FarIntensity = 0.08
        dof.FocusDistance = 60
        dof.InFocusRadius = 55
        dof.NearIntensity = 0.05
        dof.Parent = Lighting
    end)

    pcall(function()
        local sky = Instance.new("Sky")
        sky.Name = SNUG_PREFIX .. "Sky"
        sky.SkyboxBk = "rbxassetid://271042516"
        sky.SkyboxDn = "rbxassetid://271077243"
        sky.SkyboxFt = "rbxassetid://271042556"
        sky.SkyboxLf = "rbxassetid://271042310"
        sky.SkyboxRt = "rbxassetid://271042467"
        sky.SkyboxUp = "rbxassetid://271077958"
        sky.SunAngularSize = 22
        sky.MoonAngularSize = 12
        sky.StarCount = 3000
        sky.Parent = Lighting
    end)
end

local function _applySnug()
    _hideGameEffects(SNUG_PREFIX, SNUG_HOLD)
    _buildSnugEffects()
    for prop, val in pairs(SNUG_PROPS) do
        pcall(function() Lighting[prop] = val end)
    end
end

local SLAUGHTER_PREFIX = "Slaughter_"
local SLAUGHTER_HOLD   = "Slaughter_GameEffectsHold"

local SLAUGHTER_PROPS = {
    Ambient                = Color3.fromRGB(45, 40, 55),
    OutdoorAmbient         = Color3.fromRGB(95, 85, 100),
    Brightness             = 1.8,
    ClockTime              = 17.5,
    GeographicLatitude     = 25,
    EnvironmentDiffuseScale  = 0.8,
    EnvironmentSpecularScale = 1,
    GlobalShadows          = true,
    ShadowSoftness         = 0.35,
    ExposureCompensation   = -0.15,
    ColorShift_Top         = Color3.fromRGB(255, 180, 120),
    ColorShift_Bottom      = Color3.fromRGB(60, 40, 80),
    FogStart               = 40,
    FogEnd                 = 450,
    FogColor               = Color3.fromRGB(170, 145, 135),
}

local function _buildSlaughterEffects()
    _destroyEffects(SLAUGHTER_PREFIX)

    pcall(function()
        local atm = Instance.new("Atmosphere")
        atm.Name = SLAUGHTER_PREFIX .. "Atmosphere"
        atm.Density = 0.55
        atm.Offset = 0.2
        atm.Color = Color3.fromRGB(180, 160, 150)
        atm.Decay = Color3.fromRGB(70, 50, 70)
        atm.Glare = 0.15
        atm.Haze = 3.5
        atm.Parent = Lighting
    end)

    pcall(function()
        local bloom = Instance.new("BloomEffect")
        bloom.Name = SLAUGHTER_PREFIX .. "Bloom"
        bloom.Intensity = 0.45
        bloom.Size = 32
        bloom.Threshold = 1.1
        bloom.Parent = Lighting
    end)

    pcall(function()
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Name = SLAUGHTER_PREFIX .. "CC"
        cc.Brightness = -0.06
        cc.Contrast = 0.25
        cc.Saturation = -0.05
        cc.TintColor = Color3.fromRGB(255, 220, 190)
        cc.Parent = Lighting
    end)

    pcall(function()
        local sr = Instance.new("SunRaysEffect")
        sr.Name = SLAUGHTER_PREFIX .. "SunRays"
        sr.Intensity = 0.08
        sr.Spread = 1.2
        sr.Parent = Lighting
    end)

    pcall(function()
        local dof = Instance.new("DepthOfFieldEffect")
        dof.Name = SLAUGHTER_PREFIX .. "Depth"
        dof.FarIntensity = 0.15
        dof.FocusDistance = 45
        dof.InFocusRadius = 40
        dof.NearIntensity = 0.1
        dof.Parent = Lighting
    end)

    pcall(function()
        local sky = Instance.new("Sky")
        sky.Name = SLAUGHTER_PREFIX .. "Sky"
        sky.SkyboxBk = "rbxassetid://271042516"
        sky.SkyboxDn = "rbxassetid://271077243"
        sky.SkyboxFt = "rbxassetid://271042556"
        sky.SkyboxLf = "rbxassetid://271042310"
        sky.SkyboxRt = "rbxassetid://271042467"
        sky.SkyboxUp = "rbxassetid://271077958"
        sky.SunAngularSize = 24
        sky.MoonAngularSize = 14
        sky.StarCount = 5000
        sky.Parent = Lighting
    end)
end

local function _applySlaughter()
    _hideGameEffects(SLAUGHTER_PREFIX, SLAUGHTER_HOLD)
    _buildSlaughterEffects()
    for prop, val in pairs(SLAUGHTER_PROPS) do
        pcall(function() Lighting[prop] = val end)
    end
end

local function _stopShaderHeartbeat()
    pcall(function()
        if _shaderHeartbeat then
            _shaderHeartbeat:Disconnect()
            _shaderHeartbeat = nil
        end
    end)
end

local function _resetShaderLighting()
    _destroyEffects(SNUG_PREFIX)
    _destroyEffects(SLAUGHTER_PREFIX)
    _restoreGameEffects(SNUG_HOLD)
    _restoreGameEffects(SLAUGHTER_HOLD)

    for prop, val in pairs(_shaderOriginal) do
        pcall(function() Lighting[prop] = val end)
    end

    for effect, state in pairs(_shaderOriginalEffects) do
        pcall(function()
            if effect and effect.Parent and typeof(state) == "boolean" then
                effect.Enabled = state
            end
        end)
    end
end

function ShaderManager.applySnug()
    if _shaderApplied == "snug" then return end

    -- Kill Fullbright if active
    pcall(function()
        if _G.SurrealFullbright and _G.SurrealFullbright.enabled then
            _G.SurrealFullbright.disable and _G.SurrealFullbright.disable()
        end
    end)

    _stopShaderHeartbeat()
    if _shaderApplied == "slaughter" then _resetShaderLighting() end

    pcall(function()
        _applySnug()
        _shaderApplied = "snug"

        _shaderHeartbeat = RunService.Heartbeat:Connect(function()
            if _shaderApplied ~= "snug" then return end
            pcall(_hideGameEffects, SNUG_PREFIX, SNUG_HOLD)
            if not Lighting:FindFirstChild(SNUG_PREFIX .. "Sky") then
                pcall(_buildSnugEffects)
            end
            for prop, val in pairs(SNUG_PROPS) do
                if Lighting[prop] ~= val then
                    pcall(function() Lighting[prop] = val end)
                end
            end
        end)

        Utilities.notify("Snug Shaders", "Applied.", 4)
    end)
end

function ShaderManager.applySlaughter()
    if _shaderApplied == "slaughter" then return end

    pcall(function()
        if _G.SurrealFullbright and _G.SurrealFullbright.enabled then
            _G.SurrealFullbright.disable and _G.SurrealFullbright.disable()
        end
    end)

    _stopShaderHeartbeat()
    if _shaderApplied == "snug" then _resetShaderLighting() end

    pcall(function()
        _applySlaughter()
        _shaderApplied = "slaughter"

        _shaderHeartbeat = RunService.Heartbeat:Connect(function()
            if _shaderApplied ~= "slaughter" then return end
            pcall(_hideGameEffects, SLAUGHTER_PREFIX, SLAUGHTER_HOLD)
            if not Lighting:FindFirstChild(SLAUGHTER_PREFIX .. "Sky") then
                pcall(_buildSlaughterEffects)
            end
            for prop, val in pairs(SLAUGHTER_PROPS) do
                if Lighting[prop] ~= val then
                    pcall(function() Lighting[prop] = val end)
                end
            end
        end)

        Utilities.notify("Slaughter Shaders", "Applied.", 4)
    end)
end

function ShaderManager.remove()
    if not _shaderApplied then return end
    _stopShaderHeartbeat()
    pcall(_resetShaderLighting)
    _shaderApplied = nil
    Utilities.notify("Shaders", "Removed.", 4)
end

function ShaderManager.getActive()
    return _shaderApplied
end

--==================================================
-- FULLBRIGHT MANAGER
--==================================================
local Fullbright = {
    enabled    = false,
    saved      = nil,
    thread     = nil,
    brightness = 3,
}

local FB_PROPS = {
    "Ambient", "OutdoorAmbient", "Brightness", "GlobalShadows",
    "ShadowSoftness", "EnvironmentDiffuseScale", "EnvironmentSpecularScale",
    "FogEnd", "FogStart", "FogColor", "ColorShift_Top", "ColorShift_Bottom",
    "ExposureCompensation",
}

local function fbSaveOriginal()
    Fullbright.saved = {}
    for _, prop in ipairs(FB_PROPS) do
        pcall(function() Fullbright.saved[prop] = Lighting[prop] end)
    end
end

local function fbApply()
    pcall(function()
        Lighting.Ambient                  = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient           = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness               = Fullbright.brightness
        Lighting.GlobalShadows            = false
        Lighting.ShadowSoftness           = 0
        Lighting.EnvironmentDiffuseScale  = 1
        Lighting.EnvironmentSpecularScale = 1
        Lighting.FogEnd                   = 100000
        Lighting.FogStart                 = 100000
        Lighting.FogColor                 = Color3.fromRGB(255, 255, 255)
        Lighting.ColorShift_Top           = Color3.fromRGB(255, 255, 255)
        Lighting.ColorShift_Bottom        = Color3.fromRGB(255, 255, 255)
        Lighting.ExposureCompensation     = 0
    end)

    pcall(function()
        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("Atmosphere")
               and not child.Name:find("Surreal", 1, true)
               and not child.Name:find("Snug", 1, true)
               and not child.Name:find("Slaughter", 1, true)
               and not child:GetAttribute("FB_Hidden") then
                child:SetAttribute("FB_Hidden", true)
                child.Parent = nil
            end
        end
    end)
end

local function fbRestore()
    if not Fullbright.saved then return end
    for prop, val in pairs(Fullbright.saved) do
        pcall(function() Lighting[prop] = val end)
    end
    Fullbright.saved = nil

    pcall(function()
        for _, child in ipairs(game:GetDescendants()) do
            if child:GetAttribute("FB_Hidden") then
                child:SetAttribute("FB_Hidden", nil)
                child.Parent = Lighting
            end
        end
    end)
end

function Fullbright.enable()
    if Fullbright.enabled then return end

    -- Kill shaders if active
    pcall(function()
        if ShaderManager.getActive() then ShaderManager.remove() end
    end)

    fbSaveOriginal()
    Fullbright.enabled = true
    fbApply()

    Fullbright.thread = task.spawn(function()
        while Fullbright.enabled do
            task.wait(0.4)
            if Fullbright.enabled then fbApply() end
        end
    end)

    Utilities.notify("Fullbright", "Enabled.", 4)
end

function Fullbright.disable()
    if not Fullbright.enabled then return end
    Fullbright.enabled = false

    if Fullbright.thread then
        task.cancel(Fullbright.thread)
        Fullbright.thread = nil
    end

    fbRestore()
    Utilities.notify("Fullbright", "Disabled.", 3)
end

function Fullbright.setBrightness(v)
    Fullbright.brightness = v
    if Fullbright.enabled then
        pcall(function() Lighting.Brightness = v end)
    end
end

_G.SurrealFullbright = Fullbright

--==================================================
-- TYPEFACE MANAGER
--==================================================
local TypefaceManager = {}
local TYPEFACE_BLACKLIST = {
    "Chat","BubbleChat","ChatChannelParentFrame","MessageLogDisplay",
    "DevConsoleMaster","DeveloperConsole","RobloxGui","RobloxPromptGui",
    "PlayerList","StatLabel","StatusText",
}

local function applyTypefaceToObject(obj, jsonName, attrKey, scale)
    if not (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then return end
    if obj:FindFirstAncestorOfClass("CoreGui") or obj:FindFirstAncestor("RobloxGui") then return end
    for _, blocked in ipairs(TYPEFACE_BLACKLIST) do
        if obj.Name == blocked or obj:FindFirstAncestor(blocked) then return end
    end
    obj.FontFace = Font.new(getcustomasset(jsonName))
    if not obj:GetAttribute(attrKey) then
        if obj.TextSize > 0 then obj.TextSize = math.clamp(obj.TextSize * scale, 8, 100) end
        obj:SetAttribute(attrKey, true)
    end
end

function TypefaceManager.load(id, displayName, ttfFile, jsonFile, source, attrKey)
    local ok, err = pcall(function()
        if not isfile(ttfFile) then writefile(ttfFile, game:HttpGet(source)) end
        writefile(jsonFile, HttpService:JSONEncode({
            name = displayName,
            faces = {{ name = "Regular", weight = 400, style = "normal",
                       assetId = getcustomasset(ttfFile) }},
        }))
        for _, obj in ipairs(game:GetDescendants()) do
            pcall(applyTypefaceToObject, obj, jsonFile, attrKey, 0.6)
        end
        game.DescendantAdded:Connect(function(obj)
            task.wait(0.1)
            pcall(applyTypefaceToObject, obj, jsonFile, attrKey, 0.6)
        end)
    end)

    if ok then
        Utilities.notify("Typeface Applied", displayName .. " is now active.", 4)
    else
        warn("[Surreal Hub][Typeface] " .. tostring(err))
        Utilities.notify("Typeface Failed", displayName .. " — " .. tostring(err), 4)
    end
end

--==================================================
-- RUNTIME STATE
--==================================================
local State = {
    voteConn        = nil,
    exposeConn      = nil,
    juryConn        = nil,
    exileConn       = nil,
    printConn       = nil,
    roundConn       = nil,
    swordFightConn  = nil,
    statueConn      = nil,

    autoWinObby     = false,
    autoCollect     = false,
    autoMath        = false,
    mathDelay       = 0,
    dodgeballGuard  = false,
    paintballGuard  = false,

    cliffESP         = false,
    cliffObjects     = {},
    cliffAddedConn   = nil,
    cliffRemovedConn = nil,
    cliffRenderConn  = nil,

    finishESP         = false,
    finishObjects     = {},
    finishAddedConn   = nil,
    finishRemovedConn = nil,
    finishRenderConn  = nil,

    nameplatesEnabled   = false,
    nameplatePlayerConn = nil,
    nameplateCharConns  = {},

    waterWalkEnabled = false,
    followEnabled    = false,
}

--==================================================
-- WINDOW
--==================================================
local WINDOW_TITLE = loadPractice and "Surreal Hub (Practice)" or "Surreal Hub (Camp)"

local Window = Luna:CreateWindow({
    Name            = WINDOW_TITLE,
    Subtitle        = "by surrre4L",
    LogoID          = "108950683571835",
    LoadingEnabled  = true,
    LoadingTitle    = "Surreal Hub",
    LoadingSubtitle = "v1.2.0 – new GOOD updates",
    ConfigSettings  = {
        RootFolder   = nil,
        ConfigFolder = CONFIG_ROOT,
    },
    KeySystem       = false,
    KeySettings     = {
        Title      = "Surreal Hub",
        Subtitle   = "Key System",
        Note       = "",
        SaveInRoot = false,
        SaveKey    = false,
        Key        = {""},
        SecondAction = { Enabled = false, Type = "Link", Parameter = "" },
    },
})

Window:CreateHomeTab({ SupportedExecutors = {}, DiscordInvite = "", Icon = 2 })

--==================================================
-- TABS
--==================================================
local Main, Challenges, Morphs, Visuals, TrollTab, UtilitiesTab, PracticeTab

if loadCamp then
    Main         = Window:CreateTab({ Name = "Main",       Icon = "view_in_ar",        ImageSource = "Material", ShowTitle = true })
    Challenges   = Window:CreateTab({ Name = "Challenges", Icon = "emoji_events",      ImageSource = "Material", ShowTitle = true })
    Morphs       = Window:CreateTab({ Name = "Morphs",     Icon = "accessibility_new", ImageSource = "Material", ShowTitle = true })
    Visuals      = Window:CreateTab({ Name = "Visuals",    Icon = "visibility",        ImageSource = "Material", ShowTitle = true })
    TrollTab     = Window:CreateTab({ Name = "Troll",      Icon = "bolt",              ImageSource = "Material", ShowTitle = true })
    UtilitiesTab = Window:CreateTab({ Name = "Utilities",  Icon = "build",             ImageSource = "Material", ShowTitle = true })
elseif loadPractice then
    PracticeTab  = Window:CreateTab({ Name = "Practice",   Icon = "sports_esports",    ImageSource = "Material", ShowTitle = true })
    Visuals      = Window:CreateTab({ Name = "Visuals",    Icon = "visibility",        ImageSource = "Material", ShowTitle = true })
end

--==================================================
-- MAIN — VOTES (Camp only)
--==================================================
if loadCamp then
    Main:CreateSection("Votes")

    Main:CreateToggle({
        Name = "Notify Votes",
        Description = "notifies you when someone casts a vote",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            if State.voteConn then State.voteConn:Disconnect(); State.voteConn = nil end
            if not enabled then return end
            local season = RS:FindFirstChild("Season")
            local votes = season and season:FindFirstChild("Voting") and season.Voting:FindFirstChild("Votes")
            if not votes then return end
            State.voteConn = votes.ChildAdded:Connect(function(vote)
                local voter = season.Players:FindFirstChild(vote.Value)
                local target = season.Players:FindFirstChild(vote.Name)
                Utilities.notify("Vote Update",
                    (voter and voter.Value or vote.Value) .. " voted for " .. (target and target.Value or vote.Name), 4)
            end)
        end),
    }, "NotifyVotes")

    Main:CreateToggle({
        Name = "Announce Votes",
        Description = "says every cast vote in the general chat",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            if State.exposeConn then State.exposeConn:Disconnect(); State.exposeConn = nil end
            if not enabled then return end
            local season = RS:FindFirstChild("Season")
            local votes = season and season:FindFirstChild("Voting") and season.Voting:FindFirstChild("Votes")
            if not votes then return end
            State.exposeConn = votes.ChildAdded:Connect(function(vote)
                local voter = season.Players:FindFirstChild(vote.Value)
                local target = season.Players:FindFirstChild(vote.Name)
                pcall(function()
                    TextChatService.TextChannels.RBXGeneral:SendAsync(
                        (voter and voter.Value or vote.Value) .. " voted for " .. (target and target.Value or vote.Name))
                end)
            end)
        end),
    }, "ExposeVotes")

    Main:CreateToggle({
        Name = "View Jury Votes",
        Description = "notifies when a juror votes a finalist",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            if State.juryConn then
                for _, conn in ipairs(State.juryConn) do conn:Disconnect() end
                State.juryConn = nil
            end
            if not enabled then return end
            local season = RS:FindFirstChild("Season")
            local jury = season and season:FindFirstChild("Jury")
            if not jury then return end
            State.juryConn = {}
            local function watchJuror(juror)
                local list = juror:WaitForChild("List")
                table.insert(State.juryConn, list.ChildAdded:Connect(function(vote)
                    local voter = juror.Value
                    local target = vote.Value
                    if season.Players:FindFirstChild(vote.Name) then
                        target = season.Players[vote.Name].Value
                    end
                    Utilities.notify("Jury Vote", voter .. " voted for " .. target, 4)
                end))
            end
            for _, juror in ipairs(jury:GetChildren()) do watchJuror(juror) end
            table.insert(State.juryConn, jury.ChildAdded:Connect(watchJuror))
        end),
    }, "ViewJuryVotes")

    Main:CreateToggle({
        Name = "View Exile Votes",
        Description = "see who will be voted to exile",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            if State.exileConn then State.exileConn:Disconnect(); State.exileConn = nil end
            if not enabled then return end
            local twists = RS:FindFirstChild("Season") and RS.Season:FindFirstChild("Twists")
            local ev = twists and twists:FindFirstChild("ExileVoting")
            local votes = ev and ev:FindFirstChild("Votes")
            if not votes then return end
            State.exileConn = votes.ChildAdded:Connect(function(vote)
                local voter = RS.Season.Players:FindFirstChild(vote.Value)
                local target = RS.Season.Players:FindFirstChild(vote.Name)
                local message = (voter and voter.Value or vote.Value) .. " voted to exile " .. (target and target.Value or vote.Name)
                Utilities.notify("Exile Vote", message, 4)
                print(message)
            end)
        end),
    }, "ViewExileVotes")

    Main:CreateToggle({
        Name = "Print Votes",
        Description = "Logs every votes in console (notify votes only)",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            if State.printConn then State.printConn:Disconnect(); State.printConn = nil end
            if not enabled then return end
            local season = RS:FindFirstChild("Season")
            local votes = season and season:FindFirstChild("Voting") and season.Voting:FindFirstChild("Votes")
            if not votes then return end
            State.printConn = votes.ChildAdded:Connect(function(vote)
                local voter = season.Players:FindFirstChild(vote.Value)
                local target = season.Players:FindFirstChild(vote.Name)
                print((voter and voter.Value or vote.Value) .. " voted for " .. (target and target.Value or vote.Name))
            end)
        end),
    }, "PrintVotes")
end

--==================================================
-- MAIN — STATUE / EXTRAS / COMEBACKS / FLY / NAMEPLATES / DETECTOR (Camp only)
--==================================================
if loadCamp then

    Main:CreateSection("Statue")

    Main:CreateButton({
        Name = "Find Statue (60% Spawn)",
        Description = "get the statue",
        Callback = Utilities.safe(function()
            local idols = workspace:FindFirstChild("Idols")
            if not idols then return end
            for _, obj in ipairs(idols:GetDescendants()) do
                if obj.Name == "Bag" or obj.Name == "SafetyStatue" then
                    local hit = obj:FindFirstChild("hit")
                    if hit then
                        hit.CanCollide = false
                        hit.Transparency = 1
                        task.wait()
                        local torso = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso")
                        if torso then hit.Position = torso.Position end
                        task.wait()
                    end
                end
            end
        end),
    })

    Main:CreateButton({
        Name = "Get Statue on Spawn",
        Description = "gives you the statue the moment u spawn",
        Callback = Utilities.safe(function()
            local function tryAttach(obj)
                if not obj:IsA("BasePart") or obj.Name ~= "hit" then return end
                local parent = obj.Parent
                if not parent or (parent.Name ~= "Bag" and parent.Name ~= "SafetyStatue") then return end
                task.wait(0.1)
                obj.CanCollide = false
                obj.Transparency = 1
                task.spawn(function()
                    while obj and obj.Parent do
                        local root = Utilities.rootPart()
                        if root then obj.CFrame = root.CFrame end
                        task.wait(0.05)
                    end
                end)
            end
            if not State.statueConn then
                State.statueConn = workspace.DescendantAdded:Connect(tryAttach)
            end
            for _, obj in ipairs(workspace:GetDescendants()) do tryAttach(obj) end
        end),
    })

    Main:CreateButton({
        Name = "Detect Who has Statue",
        Description = "notifies who has the statue",
        Callback = Utilities.safe(function()
            local season = RS:FindFirstChild("Season")
            if not season or not season:FindFirstChild("Twists") then return end
            local idol = season.Twists:FindFirstChild("Idol")
            if not idol then return end
            if idol.Value == "" then
                Utilities.notify("Statue Owner", "No one currently holds the statue.", 4)
            else
                local owner = season.Players:FindFirstChild(idol.Value)
                Utilities.notify("Statue Owner", (owner and owner.Value or idol.Value) .. " has the statue.", 4)
            end
        end),
    })

    Main:CreateSection("Extras")

    Main:CreateToggle({
        Name = "Auto Detect Round",
        Description = "detects the round twist",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            if State.roundConn then State.roundConn:Disconnect(); State.roundConn = nil end
            if not enabled then return end
            local season = RS:FindFirstChild("Season")
            if not season or not season:FindFirstChild("Twists") then return end
            local twist = season.Twists:FindFirstChild("CurrentTwist")
            if not twist then return end
            State.roundConn = twist:GetPropertyChangedSignal("Value"):Connect(function()
                local names = {
                    normal = "Normal Round", purge = "Purge Round",
                    ["double"] = "Double Elimination", singleswap = "Sike Round",
                    exile = "Exile Vote Round", votereveal = "Vote Reveal",
                }
                if names[twist.Value] then Utilities.notify("Round Detected", names[twist.Value], 4) end
            end)
        end),
    }, "AutoDetectRound")

    Main:CreateButton({
        Name = "Detect Teamers",
        Description = "scans every account if they have friends on the same lobby",
        Callback = Utilities.safe(function()
            local season = RS:FindFirstChild("Season")
            local playersFolder = season and season:FindFirstChild("Players")
            if not playersFolder then return end
            local function gameNameOf(plr)
                local entry = playersFolder:FindFirstChild(plr.Name)
                return (entry and entry.Value ~= "") and entry.Value or plr.Name
            end
            local found = false
            local allPlayers = Players:GetPlayers()
            for i = 1, #allPlayers do
                for j = i + 1, #allPlayers do
                    local p1, p2 = allPlayers[i], allPlayers[j]
                    local ok, areFriends = pcall(function() return p1:IsFriendsWith(p2.UserId) end)
                    if ok and areFriends then
                        found = true
                        Utilities.notify("Teamer Detected!",
                            gameNameOf(p1) .. " is teaming with " .. gameNameOf(p2), 4)
                        task.wait(0.6)
                    end
                end
            end
            if not found then Utilities.notify("No Teamers Found", "No teamers detected at this round", 4) end
        end),
    })

    Main:CreateButton({
        Name = "Remove Cutscenes",
        Description = "just goes to your camera immediately",
        Callback = Utilities.safe(function()
            local events = RS:FindFirstChild("Events")
            local camEvent = events and events:FindFirstChild("Camera")
            if camEvent then camEvent:Destroy() end
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                Camera.CameraType = Enum.CameraType.Custom
                Camera.CameraSubject = hum
            end
        end),
    })

    Main:CreateSection("Comebacks")

    Main:CreateButton({
        Name = "Comeback as Male",
        Description = "rejoin as a blob of male skin",
        Callback = Utilities.safe(function()
            local events = RS:FindFirstChild("Events")
            local buy = events and events:FindFirstChild("Buy")
            if buy then buy:FireServer("Gender", "Male") end
        end),
    })

    Main:CreateButton({
        Name = "Comeback as Female",
        Description = "rejoin as a blob of skin",
        Callback = Utilities.safe(function()
            local events = RS:FindFirstChild("Events")
            local buy = events and events:FindFirstChild("Buy")
            if buy then buy:FireServer("Gender", "Female") end
        end),
    })

    Main:CreateSection("Fly")

    Main:CreateButton({
        Name = "Universal Fly Gui V3",
        Description = "loads the Universal Fly Gui V3 script",
        Callback = Utilities.safe(function()
            task.spawn(function()
                local ok, err = pcall(function()
                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Fly-Gui-V3-15837"))()
                end)
                if ok then
                    Utilities.notify("Fly V3", "Fly Gui loaded successfully.", 4)
                else
                    Utilities.notify("Fly V3 Error", tostring(err), 4)
                    warn("[Surreal Hub][Fly V3] " .. tostring(err))
                end
            end)
        end),
    })

    local NameplateManager = {}
    local NAMEPLATE_KEY = "SurrealNameplate"
    local NAMEPLATE_GRADIENT = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(235, 235, 235)),
        ColorSequenceKeypoint.new(0.45, Color3.fromRGB(165, 165, 165)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(90, 90, 90)),
    })

    function NameplateManager.attach(plr)
        local char = plr.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if not head then return end
        if head:FindFirstChild(NAMEPLATE_KEY) then return end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = NAMEPLATE_KEY
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 150, 0, 30)
        billboard.StudsOffset = Vector3.new(0, 3.75, 0)
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        billboard.MaxDistance = 1500
        billboard.Parent = head

        local label = Instance.new("TextLabel")
        label.Name = "NameLabel"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = (plr.DisplayName ~= "" and plr.DisplayName) or plr.Name
        label.TextScaled = true
        label.Font = Enum.Font.LuckiestGuy
        label.TextColor3 = Color3.fromRGB(180, 180, 180)
        label.TextStrokeTransparency = 0.35
        label.TextStrokeColor3 = Color3.fromRGB(45, 45, 45)
        label.Parent = billboard

        local gradient = Instance.new("UIGradient")
        gradient.Name = "NameGradient"
        gradient.Color = NAMEPLATE_GRADIENT
        gradient.Rotation = 90
        gradient.Parent = label
    end

    function NameplateManager.detach(plr)
        local char = plr.Character
        local head = char and char:FindFirstChild("Head")
        local existing = head and head:FindFirstChild(NAMEPLATE_KEY)
        if existing then existing:Destroy() end
    end

    function NameplateManager.enable()
        for _, plr in ipairs(Players:GetPlayers()) do NameplateManager.attach(plr) end
        State.nameplateCharConns = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            table.insert(State.nameplateCharConns, plr.CharacterAdded:Connect(function()
                task.wait(0.15)
                if State.nameplatesEnabled then NameplateManager.attach(plr) end
            end))
        end
        State.nameplatePlayerConn = Players.PlayerAdded:Connect(function(plr)
            table.insert(State.nameplateCharConns, plr.CharacterAdded:Connect(function()
                task.wait(0.15)
                if State.nameplatesEnabled then NameplateManager.attach(plr) end
            end))
            if plr.Character then NameplateManager.attach(plr) end
        end)
    end

    function NameplateManager.disable()
        for _, plr in ipairs(Players:GetPlayers()) do NameplateManager.detach(plr) end
        if State.nameplatePlayerConn then State.nameplatePlayerConn:Disconnect(); State.nameplatePlayerConn = nil end
        for _, conn in ipairs(State.nameplateCharConns) do conn:Disconnect() end
        State.nameplateCharConns = {}
    end

    Main:CreateSection("Nameplates")

    Main:CreateToggle({
        Name = "Global Nameplates",
        Description = "see everyone's display names",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.nameplatesEnabled = enabled
            if enabled then NameplateManager.enable() else NameplateManager.disable() end
        end),
    }, "GlobalNameplates")

    -- ─────── HACKER DETECTOR ───────
    Main:CreateSection("Hacker Detector")

    local Detector = {
        enabled    = false,
        scanRate   = 1.2,
        data       = {},
        cooldowns  = {},
        scanThread = nil,
        joinConn   = nil,
        leaveConn  = nil,
        charConns  = {},
    }

    Detector.SPEED_STUDSPS     = 45
    Detector.WALK_SPEED_FLAG   = 35
    Detector.JUMP_POWER_FLAG   = 90
    Detector.TELEPORT_DISTANCE = 250
    Detector.AIR_TIME_FLAG     = 3.5
    Detector.SIZE_DEVIATION    = 3
    Detector.SPIN_THRESHOLD    = 25
    Detector.SWORD_SWING_LIMIT = 8
    Detector.FLAG_COOLDOWN     = 12

    local function canFlag(plr, kind)
        local cd = Detector.cooldowns[plr]
        if not cd then cd = {}; Detector.cooldowns[plr] = cd end
        local last = cd[kind]
        if last and (tick() - last) < Detector.FLAG_COOLDOWN then return false end
        cd[kind] = tick()
        return true
    end

    local function flagPlayer(plr, reason, detail)
        if plr == LocalPlayer then return end
        local message = reason .. (detail and (" — " .. detail) or "")
        Utilities.notify("⚠ " .. plr.Name, message, 5)
        print(string.format("[Surreal Detector] FLAG | %s (%d) | %s",
            plr.Name, plr.UserId, message))
    end

    local function trackPlayer(plr)
        local char = plr.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        Detector.data[plr] = {
            lastPos     = root.Position,
            lastCFrame  = root.CFrame,
            lastCheck   = tick(),
            airTime     = 0,
            swingCount  = 0,
            swingWindow = tick(),
            baseSize    = root.Size,
        }
    end

    local function scanPlayer(plr)
        if plr == LocalPlayer then return end
        local char = plr.Character
        if not char then return end
        local hum  = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        if not Detector.data[plr] then trackPlayer(plr); return end

        local d   = Detector.data[plr]
        local now = tick()
        local dt  = now - d.lastCheck
        if dt < 0.4 then return end

        if hum.WalkSpeed > Detector.WALK_SPEED_FLAG then
            if canFlag(plr, "walkspeed") then
                flagPlayer(plr, "Speed Hack", string.format("WalkSpeed = %.0f", hum.WalkSpeed))
            end
        end

        if hum.UseJumpPower and hum.JumpPower > Detector.JUMP_POWER_FLAG then
            if canFlag(plr, "jumppower") then
                flagPlayer(plr, "Jump Hack", string.format("JumpPower = %.0f", hum.JumpPower))
            end
        end

        local dist    = (root.Position - d.lastPos).Magnitude
        local studsps = dist / dt
        if studsps > Detector.SPEED_STUDSPS then
            if canFlag(plr, "speed") then
                flagPlayer(plr, "Speed Hack", string.format("%.0f studs/sec", studsps))
            end
        end

        if dist > Detector.TELEPORT_DISTANCE and dt < 2 then
            if canFlag(plr, "teleport") then
                flagPlayer(plr, "Teleport", string.format("%.0f studs in %.1fs", dist, dt))
            end
        end

        if hum.FloorMaterial == Enum.Material.Air then
            d.airTime = (d.airTime or 0) + dt
            if d.airTime >= Detector.AIR_TIME_FLAG then
                if canFlag(plr, "fly") then
                    flagPlayer(plr, "Fly / Hover", string.format("airborne %.1fs", d.airTime))
                end
                d.airTime = 0
            end
        else
            d.airTime = 0
        end

        if d.baseSize then
            local diff = (root.Size - d.baseSize).Magnitude
            if diff > Detector.SIZE_DEVIATION then
                if canFlag(plr, "size") then
                    flagPlayer(plr, "Size Changer", string.format("Δ %.1f studs", diff))
                end
            end
        end

        local tool = char:FindFirstChildOfClass("Tool")
        if tool and tool.Name:lower():find("sword") then
            d.swingCount = d.swingCount + 1
            if now - d.swingWindow > 1 then
                if d.swingCount > Detector.SWORD_SWING_LIMIT then
                    if canFlag(plr, "swing") then
                        flagPlayer(plr, "Kill Aura", d.swingCount .. " swings/sec")
                    end
                end
                d.swingCount = 0
                d.swingWindow = now
            end
        end

        if d.lastCFrame then
            local _, oldY = d.lastCFrame:ToOrientation()
            local _, newY = root.CFrame:ToOrientation()
            local rDelta = math.abs(newY - oldY)
            if rDelta > math.pi then rDelta = math.pi * 2 - rDelta end
            local rotSpeed = rDelta / dt
            if rotSpeed > Detector.SPIN_THRESHOLD then
                if canFlag(plr, "spin") then
                    flagPlayer(plr, "Aimbot / Spin", string.format("%.1f rad/sec", rotSpeed))
                end
            end
        end

        if d.lastHealth then
            if hum.Health > d.lastHealth and hum.Health >= hum.MaxHealth and d.lastHealth <= 0.5 then
                if canFlag(plr, "godmode") then
                    flagPlayer(plr, "God Mode", "Health restored instantly")
                end
            end
        end
        d.lastHealth = hum.Health

        if hum.Sit and studsps > 5 then
            if canFlag(plr, "sitting") then
                flagPlayer(plr, "CFrame Manip", string.format("%.0f studs/sec while sitting", studsps))
            end
        end

        d.lastPos    = root.Position
        d.lastCFrame = root.CFrame
        d.lastCheck  = now
    end

    local function resetDetector()
        Detector.data      = {}
        Detector.cooldowns = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then trackPlayer(plr) end
        end
    end

    Main:CreateToggle({
        Name = "Hacker Detector",
        Description = "flags suspicious behaviors in real time",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            Detector.enabled = enabled

            if enabled then
                resetDetector()

                Detector.joinConn = Players.PlayerAdded:Connect(function(plr)
                    plr.CharacterAdded:Connect(function()
                        task.wait(0.3)
                        trackPlayer(plr)
                    end)
                end)

                Detector.leaveConn = Players.PlayerRemoving:Connect(function(plr)
                    Detector.data[plr]      = nil
                    Detector.cooldowns[plr] = nil
                end)

                Detector.charConns = {}
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        table.insert(Detector.charConns, plr.CharacterAdded:Connect(function()
                            task.wait(0.3)
                            trackPlayer(plr)
                        end))
                    end
                end

                Detector.scanThread = task.spawn(function()
                    while Detector.enabled do
                        for _, plr in ipairs(Players:GetPlayers()) do
                            pcall(scanPlayer, plr)
                        end
                        task.wait(Detector.scanRate)
                    end
                end)

                Utilities.notify("Hacker Detector", "Watching for suspicious players.", 4)
            else
                if Detector.scanThread then
                    task.cancel(Detector.scanThread)
                    Detector.scanThread = nil
                end
                if Detector.joinConn then Detector.joinConn:Disconnect(); Detector.joinConn = nil end
                if Detector.leaveConn then Detector.leaveConn:Disconnect(); Detector.leaveConn = nil end
                for _, c in ipairs(Detector.charConns or {}) do c:Disconnect() end
                Detector.charConns = {}
                Detector.data      = {}
                Detector.cooldowns = {}
                Utilities.notify("Hacker Detector", "Disabled.", 3)
            end
        end),
    }, "HackerDetector")
end

--==================================================
-- CHALLENGES (Camp only)
--==================================================
if loadCamp then
    Challenges:CreateSection("Challenges")

    Challenges:CreateButton({
        Name = "Win Obby",
        Description = "makes you win an Obby",
        Callback = Utilities.safe(function()
            local assets = workspace:FindFirstChild("Assets")
            if not assets then return end
            local finish = assets:FindFirstChild("Finish", true)
            if not finish then return end
            finish.CanCollide = false
            finish.Transparency = 1
            task.wait()
            local torso = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso")
            if torso then finish.Position = torso.Position end
        end),
    })

    Challenges:CreateToggle({
        Name = "Auto Win Obby",
        Description = "win every Obby without pressing win Obby",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.autoWinObby = enabled
            if not enabled then return end
            task.spawn(function()
                while State.autoWinObby do
                    pcall(function()
                        local assets = workspace:FindFirstChild("Assets")
                        local finish = assets and assets:FindFirstChild("Finish", true)
                        local root = Utilities.rootPart()
                        if finish and root then
                            finish.CanCollide = false
                            finish.Transparency = 1
                            task.wait()
                            finish.Position = root.Position
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end),
    }, "AutoWinObby")

    Challenges:CreateButton({
        Name = "Remove all Spleef Studs",
        Description = "makes Spleef have no studs and everyone falls",
        Callback = Utilities.safe(function()
            local root = Utilities.rootPart()
            if not root then return end
            local assets = workspace:FindFirstChild("Assets")
            if not assets then return end
            for _, obj in ipairs(assets:GetDescendants()) do
                if obj.Name == "SpleefPart" then pcall(firetouchinterest, root, obj, 0) end
            end
        end),
    })

    Challenges:CreateButton({
        Name = "Finish Pancake",
        Description = "Rapidly clicks your pancake",
        Callback = Utilities.safe(function()
            local assets = workspace:FindFirstChild("Assets")
            if not assets then return end
            for _, obj in ipairs(assets:GetDescendants()) do
                if obj.Name == LocalPlayer.Name and obj:FindFirstChild("ClickDetector") then
                    for _ = 1, 80 do pcall(fireclickdetector, obj.ClickDetector) end
                end
            end
        end),
    })

    Challenges:CreateToggle({
        Name = "Cliff Diving ESP",
        Description = "automatically find the finish line",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.cliffESP = enabled
            if enabled then
                local MAX_DISTANCE = 500
                local function createMarker(part)
                    if State.cliffObjects[part] then return end
                    if not part:FindFirstChild("CliffHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "CliffHighlight"
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = Color3.new(1, 1, 1)
                        highlight.Parent = part
                    end
                    local billboard = Instance.new("BillboardGui")
                    billboard.AlwaysOnTop = true
                    billboard.Size = UDim2.new(0, 260, 0, 70)
                    billboard.StudsOffset = Vector3.new(0, 4, 0)
                    billboard.Adornee = part
                    billboard.Parent = part
                    local label = Instance.new("TextLabel")
                    label.BackgroundTransparency = 1
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.TextColor3 = Color3.new(1, 1, 1)
                    label.TextStrokeTransparency = 0
                    label.TextScaled = true
                    label.Font = Enum.Font.GothamBold
                    label.Text = "FINISH"
                    label.Parent = billboard
                    State.cliffObjects[part] = { billboard = billboard, label = label }
                end
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name:lower() == "finish" then createMarker(obj) end
                end
                State.cliffAddedConn = workspace.DescendantAdded:Connect(function(obj)
                    if State.cliffESP and obj:IsA("BasePart") and obj.Name:lower() == "finish" then createMarker(obj) end
                end)
                State.cliffRemovedConn = workspace.DescendantRemoving:Connect(function(obj)
                    if State.cliffObjects[obj] then
                        pcall(function() State.cliffObjects[obj].billboard:Destroy() end)
                        State.cliffObjects[obj] = nil
                    end
                end)
                State.cliffRenderConn = RunService.RenderStepped:Connect(function()
                    if not State.cliffESP then return end
                    local root = Utilities.rootPart()
                    if not root then return end
                    for part, marker in pairs(State.cliffObjects) do
                        local distance = (part.Position - root.Position).Magnitude
                        marker.billboard.Enabled = distance <= MAX_DISTANCE
                        if distance <= MAX_DISTANCE then
                            marker.label.Text = string.format("%.1f studs", distance)
                        end
                    end
                end)
            else
                for part, marker in pairs(State.cliffObjects) do
                    pcall(function() marker.billboard:Destroy() end)
                    pcall(function()
                        if part:FindFirstChild("CliffHighlight") then part.CliffHighlight:Destroy() end
                    end)
                end
                State.cliffObjects = {}
                if State.cliffAddedConn then State.cliffAddedConn:Disconnect(); State.cliffAddedConn = nil end
                if State.cliffRemovedConn then State.cliffRemovedConn:Disconnect(); State.cliffRemovedConn = nil end
                if State.cliffRenderConn then State.cliffRenderConn:Disconnect(); State.cliffRenderConn = nil end
            end
        end),
    }, "CliffDivingESP")

    Challenges:CreateToggle({
        Name = "Auto Get All Coins",
        Description = "teleports every coin and gem to you",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.autoCollect = enabled
            if not enabled then return end
            task.spawn(function()
                while State.autoCollect do
                    task.wait(0.5)
                    pcall(function()
                        local root = Utilities.rootPart()
                        local assets = workspace:FindFirstChild("Assets")
                        if root and assets then
                            for _, obj in ipairs(assets:GetDescendants()) do
                                if (obj.Name == "Coin" or obj.Name == "Gem") and obj:IsA("BasePart") then
                                    obj.CanCollide = false
                                    obj.Position = root.Position
                                end
                            end
                        end
                    end)
                end
            end)
        end),
    }, "AutoGetCoins")

    Challenges:CreateToggle({
        Name = "Answer Math Mania",
        Description = "answer every question easily",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.autoMath = enabled
            if not enabled then return end
            task.spawn(function()
                while State.autoMath do
                    pcall(function()
                        local mathGui = LocalPlayer.PlayerGui:FindFirstChild("MathMania")
                        if mathGui then
                            for index = 1, 10 do
                                if not State.autoMath then break end
                                local question = mathGui:FindFirstChild(tostring(index))
                                if question and question:FindFirstChild("MainText") and question:FindFirstChild("Box") then
                                    local expression = question.MainText.Text:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                                    local ok, result = pcall(function() return loadstring("return " .. expression)() end)
                                    if ok and result then
                                        question.Box.Text = tostring(result)
                                        local submit = question:FindFirstChild("Enter")
                                        if submit then
                                            for _, eventName in ipairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                                                if submit[eventName] then
                                                    for _, conn in pairs(getconnections(submit[eventName])) do
                                                        if conn.Function then pcall(function() conn:Fire() end) end
                                                    end
                                                end
                                            end
                                        end
                                        if State.mathDelay > 0 then task.wait(State.mathDelay) end
                                    end
                                end
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end),
    }, "AnswerMathMania")

    Challenges:CreateSlider({
        Name = "Math Mania Setback",
        Description = "Adds a delay",
        Range = {0, 100},
        Increment = 1,
        CurrentValue = 0,
        Callback = Utilities.safe(function(value) State.mathDelay = value / 10 end),
    }, "MathManiaSetback")

    Challenges:CreateButton({
        Name = "Win Blockpush",
        Description = "teleports block to finishing line",
        Callback = Utilities.safe(function()
            local root = Utilities.rootPart()
            if not root then return end
            for _, box in ipairs(workspace:GetDescendants()) do
                if box:IsA("Part") and box.Name == "SingularBox" then
                    if (box.Position - root.Position).Magnitude <= 100 then
                        for _, target in ipairs(workspace:GetDescendants()) do
                            if target:IsA("Part") and target.Name == "Gold" then
                                box.Position = target.Position + Vector3.new(0, 3, 0)
                                root.CFrame = CFrame.new(box.Position + Vector3.new(0, 3, 0))
                                break
                            end
                        end
                        break
                    end
                end
            end
        end),
    })

    Challenges:CreateToggle({
        Name = "Dodgeball Invincibility",
        Description = "resets you (you do not die)",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.dodgeballGuard = enabled
            if not enabled then return end
            task.spawn(function()
                local triggered = false
                while State.dodgeballGuard do
                    pcall(function()
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local giver = assets:FindFirstChild("DodgeballGiver", true)
                            if giver and not triggered then
                                triggered = true
                                local hum = Utilities.humanoid()
                                if hum then hum.Health = 0 end
                            end
                            if not giver then triggered = false end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end),
    }, "DodgeballInvincibility")

    Challenges:CreateButton({
        Name = "Get Dodgeballs",
        Description = "get every dodgeball",
        Callback = Utilities.safe(function()
            local root = Utilities.rootPart()
            if not root then return end
            local assets = workspace:FindFirstChild("Assets")
            if not assets then return end
            for _, obj in ipairs(assets:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("dodgeball") then
                    pcall(firetouchinterest, root, obj, 0)
                    pcall(firetouchinterest, root, obj, 1)
                end
            end
        end),
    })

    Challenges:CreateToggle({
        Name = "Paintball Invincibility",
        Description = "resets you b4 the game start (you do not die)",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.paintballGuard = enabled
            if not enabled then return end
            task.spawn(function()
                local triggered = false
                while State.paintballGuard do
                    pcall(function()
                        local assets = workspace:FindFirstChild("Assets")
                        if assets then
                            local arena = assets:FindFirstChild("Paintball", true)
                                or assets:FindFirstChild("PaintballArena", true)
                            if arena and not triggered then
                                triggered = true
                                local hum = Utilities.humanoid()
                                if hum then hum.Health = 0 end
                            end
                            if not arena then triggered = false end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end),
    }, "PaintballInvincibility")

    Challenges:CreateButton({
        Name = "Kill Everyone in Swordfight",
        Description = "expands hitbox and kills everyone",
        Callback = Utilities.safe(function()
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            local char = LocalPlayer.Character
            if backpack and char then
                local sword
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name:lower():find("sword") then
                        sword = tool
                        break
                    end
                end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if sword and hum then hum:EquipTool(sword) end
            end
            if State.swordFightConn then State.swordFightConn:Disconnect() end
            State.swordFightConn = RunService.RenderStepped:Connect(function()
                pcall(function()
                    local players = Players:GetPlayers()
                    for i = 2, #players do
                        local target = players[i].Character
                        if target and not LocalPlayer:IsFriendsWith(players[i].UserId) then
                            local charL = LocalPlayer.Character
                            local tool = charL and charL:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                tool:Activate()
                                for _, part in ipairs(target:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        firetouchinterest(tool.Handle, part, 0)
                                        firetouchinterest(tool.Handle, part, 1)
                                    end
                                end
                            end
                        end
                    end
                end)
            end)
            task.delay(1, function()
                if State.swordFightConn then
                    State.swordFightConn:Disconnect()
                    State.swordFightConn = nil
                end
            end)
        end),
    })

    Challenges:CreateSection("Restarting")

    Challenges:CreateButton({
        Name = "FE Genesis Sniper",
        Description = "restarts the finale (server-wide)",
        Callback = Utilities.safe(function()
            Utilities.launchUtility("genesis_sniper")
        end),
    })
end

--==================================================
-- MORPHS (Camp only)
--==================================================
if loadCamp then
    Morphs:CreateSection("Paid")

    local characterNameBuffer = ""

    Morphs:CreateInput({
        Name = "Character Name",
        Description = "type what you character name",
        PlaceholderText = "Enter character name...",
        CurrentValue = "",
        Numeric = false,
        MaxCharacters = nil,
        Enter = false,
        Callback = Utilities.safe(function(value) characterNameBuffer = value or "" end),
    })

    Morphs:CreateButton({
        Name = "Buy Character (@60)",
        Description = "purchases the custom character",
        Callback = Utilities.safe(function()
            if characterNameBuffer == "" then return end
            local events = RS:FindFirstChild("Events")
            local buy = events and events:FindFirstChild("Buy")
            if buy then buy:FireServer("Character", characterNameBuffer) end
        end),
    })

    Morphs:CreateButton({
        Name = "Get Verified Symbol (@60)",
        Description = "applies the verified badge to your character name",
        Callback = Utilities.safe(function()
            if characterNameBuffer == "" then return end
            local VERIFIED = "\u{e000}"
            local final = characterNameBuffer .. " " .. VERIFIED
            local events = RS:FindFirstChild("Events")
            local buy = events and events:FindFirstChild("Buy")
            if buy then buy:FireServer("Character", final) end
        end),
    })

    Morphs:CreateButton({
        Name = "Server Crash",
        Description = "loads the crash payload from GitHub",
        Callback = Utilities.safe(function()
            task.spawn(function()
                local url = "https://raw.githubusercontent.com/surrre4l/bruh/main/surrealcrash.lua"
                local ok, err = pcall(function()
                    local src = game:HttpGet(url, true)
                    if not src or #src < 50 then error("Empty or invalid response") end
                    local fn = loadstring(src)
                    if not fn then error("loadstring returned nil") end
                    fn()
                end)
                if ok then
                    Utilities.notify("Server Crash", "Payload executed.", 4)
                else
                    Utilities.notify("Server Crash Error", tostring(err), 4)
                end
            end)
        end),
    })
end

--==================================================
-- VISUALS — TYPEFACES
--==================================================
Visuals:CreateSection("Typefaces")

Visuals:CreateButton({
    Name = "Starborn Typeface",
    Description = "starborn try this thing",
    Callback = Utilities.safe(function()
        TypefaceManager.load(
            "starborn", "Starborn", "starborn.ttf", "Starborn.json",
            "https://drive.google.com/uc?export=download&id=1AOv_DKQ0iB55eOvRkQnkq40POxix82dP&confirm=t",
            "SurrealFontStarborn"
        )
    end),
})

Visuals:CreateButton({
    Name = "Minecraft Typeface",
    Description = "minecrafter if you are larper",
    Callback = Utilities.safe(function()
        TypefaceManager.load(
            "minecraft", "Minecrafter", "minecrafter.ttf", "Minecrafter.json",
            "https://drive.google.com/uc?export=download&id=1oe66VO8IhLBqDvbgxqer4RHEi7bAO7R2&confirm=t",
            "SurrealFontMinecraft"
        )
    end),
})

Visuals:CreateButton({
    Name = "Matcha Mint Typeface",
    Description = "labubu matcha font",
    Callback = Utilities.safe(function()
        TypefaceManager.load(
            "matchamint", "Matcha Mint", "matchamint.ttf", "MatchaMint.json",
            "https://drive.google.com/uc?export=download&id=1cZomyiePFjjNzciPRextxt0puySrmrEX&confirm=t",
            "SurrealFontMatchaMint"
        )
    end),
})

Visuals:CreateButton({
    Name = "OG Roblox Typeface",
    Description = "classic Roblox font",
    Callback = Utilities.safe(function()
        TypefaceManager.load(
            "ogroblox", "OG Roblox", "ogroblox.ttf", "OGRoblox.json",
            "https://drive.google.com/uc?export=download&id=1XLBx4U-kkzB3B8v2DaO3AcvtHNlyn3tn&confirm=t",
            "SurrealFontOGRoblox"
        )
    end),
})

Visuals:CreateButton({
    Name = "Yellow Style Typeface",
    Description = "yellow style font",
    Callback = Utilities.safe(function()
        TypefaceManager.load(
            "yellowstyle", "Yellow Style", "yellowstyle.ttf", "YellowStyle.json",
            "https://drive.google.com/uc?export=download&id=1FAzibH6kP50SybbEfpGZb3pIoIUiUFUt&confirm=t",
            "SurrealFontYellowStyle"
        )
    end),
})

Visuals:CreateButton({
    Name = "Super Mario Typeface",
    Description = "super mario font",
    Callback = Utilities.safe(function()
        TypefaceManager.load(
            "supermario", "Super Mario", "supermario.ttf", "SuperMario.json",
            "https://drive.google.com/uc?export=download&id=1flDI_h9nP0ivHjBJjPuNh5xNzcsF9dcE&confirm=t",
            "SurrealFontSuperMario"
        )
    end),
})

--==================================================
-- VISUALS — SHADERS
--==================================================
Visuals:CreateSection("Shaders")

Visuals:CreateButton({
    Name = "Apply Snug Shaders",
    Description = "balanced cozy lighting",
    Callback = Utilities.safe(function()
        ShaderManager.applySnug()
    end),
})

Visuals:CreateButton({
    Name = "Apply Slaughter Shaders",
    Description = "moody fog + surreal dusk",
    Callback = Utilities.safe(function()
        ShaderManager.applySlaughter()
    end),
})

Visuals:CreateButton({
    Name = "Remove Shader",
    Description = "back to vanilla lighting",
    Callback = Utilities.safe(function()
        ShaderManager.remove()
    end),
})

--==================================================
-- VISUALS — FULLBRIGHT
--==================================================
Visuals:CreateSection("Fullbright")

Visuals:CreateSlider({
    Name = "Fullbright Brightness",
    Description = "how bright the world gets",
    Range = {1, 10},
    Increment = 1,
    CurrentValue = 3,
    Callback = Utilities.safe(function(value)
        Fullbright.setBrightness(value)
    end),
}, "FullbrightBrightness")

Visuals:CreateToggle({
    Name = "Fullbright",
    Description = "makes the entire map fully lit, no dark spots",
    CurrentValue = false,
    Callback = Utilities.safe(function(enabled)
        if enabled then
            Fullbright.enable()
        else
            Fullbright.disable()
        end
    end),
}, "Fullbright")

--==================================================
-- VISUALS — FINISH LINE ESP
--==================================================
Visuals:CreateSection("Finish Line ESP")

local FINISH_COLOR = Color3.fromRGB(80, 220, 120)
local FINISH_MAX_DISTANCE = 1000

local function createFinishMarker(part)
    if State.finishObjects[part] then return end
    if not part:FindFirstChild("SurrealFinishHighlight") then
        local hl = Instance.new("Highlight")
        hl.Name = "SurrealFinishHighlight"
        hl.FillTransparency = 1
        hl.OutlineColor = FINISH_COLOR
        hl.Parent = part
    end
    local bb = Instance.new("BillboardGui")
    bb.Name = "SurrealFinishBB"
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 260, 0, 70)
    bb.StudsOffset = Vector3.new(0, 4, 0)
    bb.Adornee = part
    bb.Parent = part
    local lbl = Instance.new("TextLabel")
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.TextColor3 = FINISH_COLOR
    lbl.TextStrokeTransparency = 0
    lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    lbl.TextScaled = true
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = "FINISH"
    lbl.Parent = bb
    State.finishObjects[part] = { billboard = bb, label = lbl }
end

Visuals:CreateToggle({
    Name = "Finish Line ESP",
    Description = "shows how many studs you are from the finish line",
    CurrentValue = false,
    Callback = Utilities.safe(function(enabled)
        State.finishESP = enabled

        if enabled then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower() == "finish" then createFinishMarker(obj) end
            end

            State.finishAddedConn = workspace.DescendantAdded:Connect(function(obj)
                if State.finishESP and obj:IsA("BasePart") and obj.Name:lower() == "finish" then
                    createFinishMarker(obj)
                end
            end)

            State.finishRemovedConn = workspace.DescendantRemoving:Connect(function(obj)
                if State.finishObjects[obj] then
                    pcall(function() State.finishObjects[obj].billboard:Destroy() end)
                    State.finishObjects[obj] = nil
                end
            end)

            State.finishRenderConn = RunService.RenderStepped:Connect(function()
                if not State.finishESP then return end
                local root = Utilities.rootPart()
                if not root then return end
                for part, marker in pairs(State.finishObjects) do
                    local dist = (part.Position - root.Position).Magnitude
                    marker.billboard.Enabled = dist <= FINISH_MAX_DISTANCE
                    if dist <= FINISH_MAX_DISTANCE then
                        marker.label.Text = string.format("%.1f studs", dist)
                    end
                end
            end)
        else
            for part, marker in pairs(State.finishObjects) do
                pcall(function() marker.billboard:Destroy() end)
                pcall(function()
                    if part:FindFirstChild("SurrealFinishHighlight") then
                        part.SurrealFinishHighlight:Destroy()
                    end
                end)
            end
            State.finishObjects = {}
            if State.finishAddedConn then State.finishAddedConn:Disconnect(); State.finishAddedConn = nil end
            if State.finishRemovedConn then State.finishRemovedConn:Disconnect(); State.finishRemovedConn = nil end
            if State.finishRenderConn then State.finishRenderConn:Disconnect(); State.finishRenderConn = nil end
        end
    end),
}, "FinishLineESP")

--==================================================
-- VISUALS — CUSTOM
--==================================================
Visuals:CreateSection("Custom")

_G.CustomName        = _G.CustomName or ""
_G.UseCustomName     = _G.UseCustomName or false
_G.SelectedFont      = _G.SelectedFont or nil
_G.RainbowMode       = _G.RainbowMode or false
_G.RainbowSpeed      = _G.RainbowSpeed or 0.5
_G.StaticColor       = _G.StaticColor or Color3.fromRGB(255, 255, 255)
_G.StaticColorCustom = false

local nameColorArmed = false
task.delay(2, function() nameColorArmed = true end)

Visuals:CreateInput({
    Name = "Character Name",
    Description = "replace your character name no tags",
    PlaceholderText = "Enter character name...",
    CurrentValue = "",
    Numeric = false,
    MaxCharacters = nil,
    Enter = false,
    Callback = Utilities.safe(function(value)
        _G.CustomName = value or ""
        _G.UseCustomName = (_G.CustomName ~= "")
    end),
})

Visuals:CreateToggle({
    Name = "Rainbow Name",
    Description = "rainbow rgb in name",
    CurrentValue = false,
    Callback = Utilities.safe(function(enabled) _G.RainbowMode = enabled end),
}, "RainbowName")

Visuals:CreateSlider({
    Name = "Rainbow Setback",
    Description = "how fast rainbow name",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 50,
    Callback = Utilities.safe(function(value) _G.RainbowSpeed = value / 100 end),
}, "RainbowSetback")

Visuals:CreateColorPicker({
    Name = "Name Color",
    Description = "Picks a fixed color for your character's name.",
    Color = Color3.fromRGB(255, 255, 255),
    Callback = Utilities.safe(function(value)
        if not nameColorArmed then return end
        _G.StaticColor = value
        _G.StaticColorCustom = true
    end),
})

Visuals:CreateButton({
    Name = "Reset to Team Color",
    Description = "resets your name color to original",
    Callback = Utilities.safe(function()
        _G.StaticColorCustom = false
        Utilities.notify("Name Color", "Reverted to team color.", 4)
    end),
})

--==================================================
-- VISUALS — SKINS
--==================================================
Visuals:CreateSection("Skins")

Visuals:CreateButton({
    Name = "Get all skins (client)",
    Description = "unlocks all skins in your inventory (client)",
    Callback = Utilities.safe(function()
        local _rs = game:GetService("ReplicatedStorage")
        local _lp = game:GetService("Players").LocalPlayer
        local _DataStore = _lp:WaitForChild("DataStore")

        local _ok, _err = pcall(function()
            for _, _category in ipairs(_rs.Products.Shop.Items:GetChildren()) do
                local dsCat = _DataStore:FindFirstChild(_category.Name)
                if dsCat then
                    for _, _item in ipairs(dsCat:GetChildren()) do _item:Destroy() end
                    for _, _item in ipairs(_category:GetChildren()) do _item:Clone().Parent = dsCat end
                end
            end
        end)

        if _ok then
            Utilities.notify("Skins", "All skins added (client)!", 4)
        else
            Utilities.notify("Skins", "Failed: " .. tostring(_err), 4)
        end
    end),
})

if loadPractice then
    local skinList  = {}
    local skinMap   = {}
    local skinFaceMap = {}
    local _SC_RS           = game:GetService("ReplicatedStorage")
    local _SC_LocalPlayer  = game:GetService("Players").LocalPlayer

    pcall(function()
        local _SC_CSRoot = _SC_RS:WaitForChild("Products"):WaitForChild("CharacterSelection"):WaitForChild("Characters")
        for _, gender in ipairs(_SC_CSRoot:GetChildren()) do
            for _, character in ipairs(gender:GetChildren()) do
                local skins = character:FindFirstChild("Skins")
                if skins then
                    local charKey = gender.Name .. " | " .. character.Name
                    for _, skin in ipairs(skins:GetChildren()) do
                        local label = charKey .. " | " .. skin.Name
                        table.insert(skinList, label)
                        skinMap[label] = skin
                        local fd = skin:FindFirstChildOfClass("Decal")
                        if fd then
                            skinFaceMap[label] = fd.Texture
                        else
                            local cfd = character:FindFirstChildOfClass("Decal")
                            skinFaceMap[label] = cfd and cfd.Texture or ""
                        end
                    end
                end
            end
        end
    end)
    table.sort(skinList)

    local function _SC_findAttachment(char, attName)
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("Attachment") and part.Name == attName then return part end
        end
    end

    local function applySkin(skinObj, faceTexture)
        local char = _SC_LocalPlayer.Character
        if not char then return end
        for _, v in ipairs(char:GetChildren()) do
            if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Accessory")
            or v:IsA("ShirtGraphic") or v:IsA("CharacterMesh") or v:IsA("Hat") then
                v:Destroy()
            end
        end
        local function doApplyFace()
            local head = char:FindFirstChild("Head")
            if not head or not faceTexture or faceTexture == "" then return end
            local fc = head:FindFirstChildOfClass("FaceControls")
            if fc then fc:Destroy() end
            local sa = head:FindFirstChildOfClass("SurfaceAppearance")
            if sa then sa.ColorMap = faceTexture end
            local decal = head:FindFirstChildOfClass("Decal")
            if not decal then
                decal = Instance.new("Decal")
                decal.Name = "face"
                decal.Face = Enum.NormalId.Front
                decal.Parent = head
            end
            decal.Texture = faceTexture
        end
        doApplyFace()
        task.delay(0.2, doApplyFace)
        task.delay(0.7, doApplyFace)
        local clothesFolder = skinObj:FindFirstChild("Clothes")
        if not clothesFolder then return end
        local shirt = clothesFolder:FindFirstChildOfClass("Shirt")
        if shirt then shirt:Clone().Parent = char end
        local pants = clothesFolder:FindFirstChildOfClass("Pants")
        if pants then pants:Clone().Parent = char end
        local bodyColors = clothesFolder:FindFirstChildOfClass("BodyColors")
        if bodyColors then
            local existing = char:FindFirstChildOfClass("BodyColors")
            if existing then existing:Destroy() end
            bodyColors:Clone().Parent = char
        end
        for _, v in ipairs(clothesFolder:GetChildren()) do
            if v:IsA("CharacterMesh") then v:Clone().Parent = char end
        end
        for _, v in ipairs(clothesFolder:GetChildren()) do
            if v:IsA("Accessory") then
                local clone = v:Clone()
                local handle = clone:FindFirstChild("Handle")
                if handle then
                    handle.Massless = true
                    local handleAtt = nil
                    for _, child in ipairs(handle:GetDescendants()) do
                        if child:IsA("Attachment") then handleAtt = child break end
                    end
                    if handleAtt then
                        local charAtt = _SC_findAttachment(char, handleAtt.Name)
                        if charAtt then
                            local rigid = Instance.new("RigidConstraint")
                            rigid.Attachment0 = charAtt
                            rigid.Attachment1 = handleAtt
                            rigid.Parent = clone
                        end
                    end
                end
                clone.Parent = char
            elseif v:IsA("Hat") then
                v:Clone().Parent = char
            end
        end
    end

    Visuals:CreateDropdown({
        Name = "Skin Changer",
        Description = "select a skin to apply",
        Options = {"None", table.unpack(skinList)},
        CurrentOption = "None",
        MultipleOptions = false,
        Callback = Utilities.safe(function(Option)
            local opt = (type(Option) == "table") and (Option.Option or Option[1]) or Option
            local label = tostring(opt or "")
            if label == "None" or label == "" then return end
            local skin = skinMap[label]
            local face = skinFaceMap[label]
            if skin then
                applySkin(skin, face)
                Utilities.notify("Skin Applied", skin.Name, 4)
            end
        end),
    }, "SkinChanger")
end

--==================================================
-- VISUALS — NAME RENDER LOOP
--==================================================
RunService.RenderStepped:Connect(function()
    pcall(function()
        local anyCustomActive = _G.UseCustomName or _G.SelectedFont or _G.RainbowMode or _G.StaticColorCustom
        if not anyCustomActive then return end
        local char = LocalPlayer.Character
        if not char then return end
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                if _G.UseCustomName and _G.CustomName ~= "" then obj.Text = _G.CustomName end
                if _G.SelectedFont then obj.Font = _G.SelectedFont end
                if _G.RainbowMode then
                    local hue = (tick() * _G.RainbowSpeed) % 1
                    obj.TextColor3 = Color3.fromHSV(hue, 0.6, 1)
                elseif _G.StaticColorCustom then
                    obj.TextColor3 = _G.StaticColor
                end
                obj.TextScaled = true
                obj.TextStrokeTransparency = 0.5
                obj.BackgroundTransparency = 1
            end
        end
    end)
end)

--==================================================
-- TROLL — TARGET FOLLOWER (Camp only)
--==================================================
if loadCamp then
    TrollTab:CreateSection("Target Follower")

    local FollowController = {}
    FollowController.__index = FollowController

    local ANIMATION_ID    = "189854234"
    local STEP_TIME       = 0.15
    local FORWARD_OFFSET  = CFrame.new(0, 0, -2.5)
    local BACKWARD_OFFSET = CFrame.new(0, 0, -1.3)
    local TWEEN_INFO      = TweenInfo.new(STEP_TIME, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

    function FollowController.new()
        local self = setmetatable({}, FollowController)
        self._following, self._target, self._anim, self._tween, self._thread = false, nil, nil, nil, nil
        self.Changed = nil
        return self
    end

    function FollowController:IsFollowing() return self._following end
    function FollowController:GetTarget()   return self._target end

    function FollowController:SetTarget(player)
        if player == LocalPlayer then return false end
        self._target = player
        if self._following then
            self:Stop()
            if player then return self:Start() end
        end
        return true
    end

    function FollowController:Start()
        if self._following then return true end
        if not self._target or not self._target.Character then return false end
        self._following = true
        self:_playAnim()
        if self.Changed then self.Changed(true) end
        self._thread = task.spawn(function() self:_loop() end)
        return true
    end

    function FollowController:Stop()
        if not self._following then return end
        self._following = false
        if self._tween then self._tween:Cancel(); self._tween = nil end
        self:_stopAnim()
        if self.Changed then self.Changed(false) end
    end

    function FollowController:_loop()
        while self._following do
            local tc   = self._target and self._target.Character
            local thrp = tc and tc:FindFirstChild("HumanoidRootPart")
            local myc  = LocalPlayer.Character
            local myhrp = myc and myc:FindFirstChild("HumanoidRootPart")
            if not thrp or not myhrp then self:Stop() return end
            self:_tween(myhrp, thrp.CFrame * FORWARD_OFFSET)
            if not self._following then return end
            self:_tween(myhrp, thrp.CFrame * BACKWARD_OFFSET)
        end
    end

    function FollowController:_tween(inst, goal)
        local t = TweenService:Create(inst, TWEEN_INFO, { CFrame = goal })
        self._tween = t
        t:Play()
        t.Completed:Wait()
        if self._tween == t then self._tween = nil end
    end

    function FollowController:_playAnim()
        local char = LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local animator = hum:FindFirstChildOfClass("Animator")
        if not animator then
            animator = Instance.new("Animator")
            animator.Parent = hum
        end
        local a = Instance.new("Animation")
        a.AnimationId = "rbxassetid://" .. ANIMATION_ID
        local track = animator:LoadAnimation(a)
        track:Play()
        self._anim = track
    end

    function FollowController:_stopAnim()
        if self._anim then self._anim:Stop(); self._anim = nil end
    end

    local followController = FollowController.new()

    local playerMap = {}
    local suppress  = false

    local function buildOptions()
        local opts = {}
        playerMap = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local label = string.format("%s (@%s)", p.DisplayName, p.Name)
                opts[#opts + 1] = label
                playerMap[label] = p
            end
        end
        table.sort(opts)
        return opts
    end

    local targetDropdown

    targetDropdown = TrollTab:CreateDropdown({
        Name = "Target Player",
        Options = buildOptions(),
        CurrentOption = {},
        MultipleOptions = false,
        Callback = function(option)
            if suppress then return end
            local player
            if type(option) == "table" then
                for _, v in pairs(option) do player = playerMap[v] break end
            else
                player = playerMap[option]
            end
            if player then
                followController:SetTarget(player)
            else
                followController:Stop()
                followController:SetTarget(nil)
            end
        end,
    })

    TrollTab:CreateButton({
        Name = "Refresh Players",
        Callback = function()
            local opts = buildOptions()
            pcall(function() targetDropdown:Refresh(opts, true) end)
        end,
    })

    local followToggle

    followToggle = TrollTab:CreateToggle({
        Name = "Follow Target",
        CurrentValue = false,
        Callback = function(value)
            if suppress then return end
            if value then
                local ok = followController:Start()
                if not ok then
                    suppress = true
                    pcall(function() followToggle:Set(false) end)
                    suppress = false
                end
            else
                followController:Stop()
            end
        end,
    })

    followController.Changed = function(isFollowing)
        suppress = true
        pcall(function() followToggle:Set(isFollowing) end)
        suppress = false
    end

    Players.PlayerAdded:Connect(function()
        task.defer(function()
            local opts = buildOptions()
            pcall(function() targetDropdown:Refresh(opts, true) end)
        end)
    end)

    Players.PlayerRemoving:Connect(function(p)
        task.defer(function()
            if followController:GetTarget() == p then
                followController:Stop()
                followController:SetTarget(nil)
                suppress = true
                pcall(function() targetDropdown:Set({}) end)
                suppress = false
            end
            local opts = buildOptions()
            pcall(function() targetDropdown:Refresh(opts, true) end)
        end)
    end)
end

--==================================================
-- PRACTICE TAB (Practice only)
--==================================================
if loadPractice and PracticeTab then
    pcall(function()
        PracticeTab:CreateSection("New Practice Utility Update!")
        PracticeTab:CreateSection("best td Roblox practice utility script")

        PracticeTab:CreateButton({
            Name = "Kill Everyone",
            Description = "Equips a sword and kills everyone in the practice round",
            Callback = Utilities.safe(function()
                local player = game:GetService("Players").LocalPlayer
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local oldCFrame = hrp and hrp.CFrame

                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PracticeMap"):FireServer("Movies", "Beach")

                if oldCFrame then
                    task.wait(0.5)
                    local newChar = player.Character
                    local newHrp = newChar and newChar:FindFirstChild("HumanoidRootPart")
                    if newHrp then newHrp.CFrame = oldCFrame end
                end

                task.spawn(function()
                    local backpack = player:WaitForChild("Backpack")
                    local tool = nil
                    local waited = 0
                    while waited < 3 do
                        for _, t in ipairs(backpack:GetChildren()) do
                            if t:IsA("Tool") then tool = t break end
                        end
                        if tool then break end
                        task.wait(0.1)
                        waited = waited + 0.1
                    end
                    if tool then
                        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                        if hum then hum:EquipTool(tool) end
                    end
                end)

                local range = 1000000
                local conn
                conn = game:GetService("RunService").RenderStepped:Connect(function()
                    local p = game.Players:GetPlayers()
                    for i = 2, #p do
                        local v = p[i].Character
                        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0
                           and v:FindFirstChild("HumanoidRootPart")
                           and player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= range then
                            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                            if tool and tool:FindFirstChild("Handle") then
                                tool:Activate()
                                for _, part in next, v:GetChildren() do
                                    if part:IsA("BasePart") then
                                        firetouchinterest(tool.Handle, part, 0)
                                        firetouchinterest(tool.Handle, part, 1)
                                    end
                                end
                            end
                        end
                    end
                end)
                task.delay(1, function()
                    if conn then conn:Disconnect() end
                end)
            end),
        })

        PracticeTab:CreateButton({
            Name = "Restart / Fling Reanimate [PATCHED]",
            Description = "Loads the reanimate script to restart/fling the round",
            Callback = Utilities.safe(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua", true))()
            end),
        })
    end)
end

--==================================================
-- TROLL SCRIPTS + UTILITIES (Camp only)
--==================================================
if loadCamp then

    TrollTab:CreateSection("Scripts")

    TrollTab:CreateButton({
        Name = "Flinger",
        Description = "loads the Flinger script from GitHub",
        Callback = function()
            task.spawn(function()
                local url = "https://raw.githubusercontent.com/surrre4l/bruh/main/exe.lua.txt"
                local ok, err = pcall(function()
                    local src = game:HttpGet(url, true)
                    if not src or #src < 50 then error("Empty or invalid response") end
                    local fn = loadstring(src)
                    if not fn then error("loadstring returned nil") end
                    fn()
                end)
                if ok then
                    Utilities.notify("Flinger Loaded", "Flinger is now active.", 4)
                else
                    Utilities.notify("Flinger Error", tostring(err), 4)
                end
            end)
        end,
    })

    TrollTab:CreateButton({
        Name = "Bang [NEW]",
        Callback = function()
            task.spawn(function()
                pcall(function()
                    loadstring(game:HttpGet(
                        "https://rawscripts.net/raw/Universal-Script-New-Bang-script-made-by-me-OFC-75582"
                    ))()
                end)
            end)
        end,
    })

    TrollTab:CreateButton({
        Name = "Jerk Off (gives tool)",
        Callback = function()
            local plr  = LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            local hum  = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
            local pack = plr:FindFirstChildOfClass("Backpack") or plr:WaitForChild("Backpack")

            if workspace:FindFirstChild("aaa") then workspace:FindFirstChild("aaa"):Destroy() end

            local isR15 = hum.RigType == Enum.HumanoidRigType.R15
            local animation = Instance.new("Animation")
            animation.Name = "aaa"
            animation.Parent = workspace
            animation.AnimationId = isR15 and "rbxassetid://698251653" or "rbxassetid://72042024"

            local tool = Instance.new("Tool")
            tool.Name = "Jerk"
            tool.RequiresHandle = false
            tool.Parent = pack

            local doing, animtrack = false, nil
            tool.Equipped:Connect(function()
                doing = true
                while doing do
                    if not animtrack then
                        animtrack = hum:FindFirstChildOfClass("Animator")
                        animtrack = animtrack and animtrack:LoadAnimation(animation)
                    end
                    if animtrack then
                        animtrack:Play()
                        animtrack:AdjustSpeed(0.7)
                        animtrack.TimePosition = 0.6
                        task.wait(0.1)
                        while doing and animtrack and animtrack.TimePosition < 0.7 do task.wait(0.05) end
                        animtrack:Stop()
                        animtrack:Destroy()
                        animtrack = nil
                    end
                end
            end)
            tool.Unequipped:Connect(function()
                doing = false
                if animtrack then animtrack:Stop(); animtrack:Destroy(); animtrack = nil end
            end)
        end,
    })

    TrollTab:CreateButton({
        Name = "Freaky",
        Callback = function()
            task.spawn(function()
                pcall(function()
                    loadstring(game:HttpGet(
                        "https://rawscripts.net/raw/Universal-Script-Freaky-gui-supported-r6-r15-29701"
                    ))()
                end)
            end)
        end,
    })

    local WaterManager = {}

    local function getLakeWater()
        local map = workspace:FindFirstChild("Map")
        local camp = map and map:FindFirstChild("Roblox Drama: Camp")
        local innerMap = camp and camp:FindFirstChild("Map")
        local lake = innerMap and innerMap:FindFirstChild("Lake")
        return lake and lake:FindFirstChild("Water")
    end

    local function getSandTouch()
        local map = workspace:FindFirstChild("Map")
        local camp = map and map:FindFirstChild("Roblox Drama: Camp")
        local sand = camp and camp:FindFirstChild("Sand")
        return sand and sand:FindFirstChild("TouchInterest")
    end

    function WaterManager.setEnabled(enabled)
        pcall(function()
            local water = getLakeWater()
            if water then water.CanCollide = enabled end
            if enabled then
                local touch = getSandTouch()
                if touch then touch:Destroy() end
            end
        end)
    end

    local BarrierManager = {}
    local BARRIER_TARGETS = {
        ["Glass"]          = true,
        ["ChallengeGlass"] = true,
        ["AwardCeremony"]  = true,
        ["Drop-Off"]       = true,
    }

    function BarrierManager.clear()
        local removed = 0
        for _, obj in ipairs(workspace:GetDescendants()) do
            if BARRIER_TARGETS[obj.Name] then
                obj:Destroy()
                removed = removed + 1
            end
        end
        Utilities.notify("Barriers Cleared", removed .. " obstacle(s) removed.", 4)
    end

    UtilitiesTab:CreateSection("Utility")

    UtilitiesTab:CreateButton({
        Name = "Barrier Cleanup",
        Description = "removes every barrier",
        Callback = Utilities.safe(function() BarrierManager.clear() end),
    })

    UtilitiesTab:CreateToggle({
        Name = "Water Walk",
        Description = "makes you like jesus",
        CurrentValue = false,
        Callback = Utilities.safe(function(enabled)
            State.waterWalkEnabled = enabled
            WaterManager.setEnabled(enabled)
            if enabled then Utilities.notify("Water Walk", "enabled", 4) end
        end),
    }, "WaterWalk")

    UtilitiesTab:CreateSection("Info")

    UtilitiesTab:CreateButton({
        Name = "Grab Place ID",
        Description = "prints the current Place ID, Job ID, and Game Name",
        Callback = Utilities.safe(function()
            local MarketplaceService = game:GetService("MarketplaceService")
            local gameName = "Unknown"
            pcall(function()
                local info = MarketplaceService:GetProductInfo(game.PlaceId)
                if info and info.Name then gameName = info.Name end
            end)
            print("=== Place ID Grabber ===")
            print("Game:     " .. gameName)
            print("Place ID: " .. tostring(game.PlaceId))
            print("Job ID:   " .. game.JobId)
            print("========================")
            Utilities.notify("Place ID", game.PlaceId .. " — check console", 4)
        end),
    })

    UtilitiesTab:CreateSection("Teleports")

    UtilitiesTab:CreateButton({ Name = "Spectator Island", Description = "don't go to loser land",
        Callback = Utilities.safe(function() Utilities.teleportTo(33, -16, 31) end) })
    UtilitiesTab:CreateButton({ Name = "Main Island", Description = "main island",
        Callback = Utilities.safe(function() Utilities.teleportTo(150, -17, -417) end) })
    UtilitiesTab:CreateButton({ Name = "Exile Island", Description = "go to exile",
        Callback = Utilities.safe(function() Utilities.teleportTo(-116, -14, -166) end) })
    UtilitiesTab:CreateButton({ Name = "Voting Area", Description = "go here for voting (remove barrier first)",
        Callback = Utilities.safe(function() Utilities.teleportTo(-23, 95, -514) end) })
    UtilitiesTab:CreateButton({ Name = "Boat", Description = "do u want to be eliminated",
        Callback = Utilities.safe(function() Utilities.teleportTo(47, -20, -297) end) })
    UtilitiesTab:CreateButton({ Name = "Bathroom", Description = "tps you to bathroom",
        Callback = Utilities.safe(function() Utilities.teleportTo(302, -15, -325) end) })

    UtilitiesTab:CreateSection("More")

    UtilitiesTab:CreateButton({
        Name = "Infinite Yield",
        Description = "many features and bang",
        Callback = Utilities.safe(function() Utilities.launchUtility("infinite_yield") end),
    })

    UtilitiesTab:CreateButton({
        Name = "Energize R6",
        Description = "fe animations hahaha",
        Callback = Utilities.safe(function() Utilities.launchUtility("energize") end),
    })

    UtilitiesTab:CreateSection("Interface")

    UtilitiesTab:CreateButton({
        Name = "Execute Rayfield Version",
        Description = "kills Luna UI and loads the Rayfield build",
        Callback = Utilities.safe(function()
            if Window and Window.Unload then
                pcall(function() Window:Unload() end)
            end
            task.wait(0.3)
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/surrre4l/surrealhub/main/rayfieldver.lua"
            ))()
        end),
    })
end

--==================================================
-- INITIALIZE
--==================================================
task.spawn(function()
    task.wait(1.5)

    pcall(function()
        Luna:Notification({
            Title    = "Surreal Hub Loaded",
            Content  = "v1.2.0 — " .. (loadCamp and "Camp" or "Practice") .. " Mode",
            Duration = 6,
            Image    = "bell-ring",
        })
    end)

    warn("[Surreal Hub] v1.2.0 loaded. Mode: " .. (loadCamp and "Camp" or "Practice"))
end)