-- ----------------------------------------------------
-- Dеоbfuѕсatеԁ Wіtһ LеaκD
-- https://discord.gg/hkQAMzyGum
-- ----------------------------------------------------
local v1 = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
)()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local PathfindingService = game:GetService("PathfindingService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local tbl = {}
local function func(arg1, ...)
    return pcall(arg1, ...)
end
local function func1()
    local Character = LocalPlayer.Character
    return Character and Character:FindFirstChild("HumanoidRootPart")
end
local function func2()
    local Character = LocalPlayer.Character
    return Character and Character:FindFirstChildOfClass("Humanoid")
end
local function func3()
    local v1 = workspace.Assets and workspace.Assets:FindFirstChild("Finish", true)
    local v2 = func1()
    if v1 and v2 then
        v1.CanCollide = false
        v1.Transparency = 1
        v1.Position = v2.Position
    end
end
local function func4()
    local MathMania = LocalPlayer.PlayerGui:FindFirstChild("MathMania")
    if not MathMania then
        return
    end
    for i = 1, 10 do
        local v1 = MathMania:FindFirstChild(tostring(i))
        if v1 then
            local MainText = v1:FindFirstChild("MainText")
            local Box = v1:FindFirstChild("Box")
            local Enter = v1:FindFirstChild("Enter")
            if MainText and Box then
                local v2 = MainText.Text:gsub("[=?%s]", "")
                local v3, v4 = pcall(
                    function()
                        return loadstring("return " .. v2)()
                    end
                )
                if v3 and v4 then
                    Box.Text = tostring(v4)
                    task.wait()
                    if Enter and getconnections then
                        for _, v5 in ipairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                            for _, v6 in ipairs(getconnections(Enter[v5])) do
                                if v6.Function then
                                    pcall(v6.Fire, v6)
                                end
                            end
                        end
                    end
                end
                task.wait(0.05)
            end
        end
    end
end
local function func5()
    local Character = LocalPlayer.Character
    local v1 = Character and Character:FindFirstChildOfClass("Tool")
    if not (v1 and v1:FindFirstChild("Handle")) then
        return
    end
    for _, v2 in ipairs(Players:GetPlayers()) do
        if v2 ~= LocalPlayer and v2.Character then
            func(
                function()
                    v1:Activate()
                end
            )
            for _, v3 in ipairs(v2.Character:GetChildren()) do
                if v3:IsA("BasePart") then
                    func(firetouchinterest, v1.Handle, v3, 0)
                    func(firetouchinterest, v1.Handle, v3, 1)
                end
            end
        end
    end
end
local function func6()
    local v3
    local huge = math.huge
    local v1 = func1()
    if not v1 then
        return nil
    end
    for _, v2 in pairs(Players:GetPlayers()) do
        if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild("HumanoidRootPart") then
            local Magnitude = (v2.Character.HumanoidRootPart.Position - v1.Position).Magnitude
            if Magnitude < huge then
                huge = Magnitude
                v3 = v2
            end
        end
    end
    return v3
end
if (function()
    if syn then
        return "Synapse X"
    end
    if KRNL_LOADED then
        return "KRNL"
    end
    if fluxus then
        return "Fluxus"
    end
    if identifyexecutor then
        local v1, v2 = pcall(identifyexecutor)
        if v1 and v2 then
            return tostring(v2)
        end
    end
    return "Unknown"
end)():lower():find("xeno") then
    task.spawn(
        function()
            task.wait(0.5)
            v1:Notify({Title = "Xeno Detected", Content = "Executing Legacy mode!", Duration = 6})
            task.wait(2)
            loadstring(
                game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/haha.lua")
            )()
        end
    )
    task.wait(3)
    return
end
local v2 = v1:CreateWindow(
    {
        Title = "Ella Hub V2", Icon = "solar:home-2-bold", Author = "by Ella", Folder = "EllaHub",
        Theme = "Dark", NewElements = true, Transparent = true, Acrylic = true, Resizable = true,
        SideBarWidth = 200, HideSearchBar = false, ScrollBarEnabled = true,
        ToggleKey = Enum.KeyCode.K,
    }
)
v2:Tag({Title = "TRD Script", Color = "Text"})
v2:Divider()
local v3 = v2:Tab({Title = "Camp", Icon = "solar:shield-bold"})
local v4 = v2:Tab({Title = "Movie", Icon = "solar:camera-bold"})
local v5 = v2:Tab({Title = "Expedition", Icon = "solar:map-bold"})
v2:Divider()
local v6 = v2:Tab({Title = "Main", Icon = "solar:home-2-bold"})
local v7 = v2:Tab({Title = "Characters", Icon = "solar:user-bold"})
local v8 = v2:Tab({Title = "Player", Icon = "solar:running-2-bold"})
v2:Divider()
local v9 = v2:Tab({Title = "Stats", Icon = "solar:chart-square-bold"})
local v10 = v2:Tab({Title = "Teleports", Icon = "solar:map-point-bold"})
local v11 = v2:Tab({Title = "Universal", Icon = "solar:global-bold"})
local v12 = v2:Tab({Title = "Client", Icon = "solar:cpu-bolt-bold"})
v2:Divider()
local v13 = v2:Tab({Title = "Other", Icon = "solar:settings-bold"})
local v14 = v2:Tab({Title = "Autoplay", Icon = "solar:play-bold"})
local v15 = v2:Tab({Title = "Troll", Icon = "solar:ghost-bold"})
local v16 = v2:Tab({Title = "Shop", Icon = "solar:shop-bold"})
v2:Divider()
local v17 = v2:Tab({Title = "Settings", Icon = "solar:settings-minimalistic-bold"})
v2:Divider()
v3:Select()
v3:Section({Title = "Obby"})
local v18 = v3:Group()
v18:Button(
    {
        Title = "Win Obby", Justify = "Center", Icon = "solar:flag-bold", IconAlign = "Left",
        Size = "Small", Callback = func3,
    }
)
v18:Space({Columns = 0.5})
v18:Button(
    {
        Title = "Godmode", Justify = "Center", Icon = "solar:shield-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            for _, v1 in pairs(workspace.Assets:GetDescendants()) do
                if v1.Name == "Mud" or v1.Name == "Water" or v1.Name == "Lava" then
                    local TouchInterest = v1:FindFirstChild("TouchInterest")
                    if TouchInterest then
                        TouchInterest:Destroy()
                    end
                end
            end
        end,
    }
)
tbl.campObby = false
v3:Toggle(
    {
        Title = "Auto-Win Obby", Desc = "Finish line loops to your position", Value = false,
        Callback = function(arg1)
            tbl.campObby = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.campObby do
                            func3()
                            task.wait(0.5)
                        end
                    end
                )
            end
        end,
    }
)
v3:Section({Title = "Food"})
v3:Button(
    {
        Title = "Eat / Finish Pancake", Desc = "Rapidly clicks your food item",
        Callback = function()
            for _, v1 in pairs(workspace.Assets:GetDescendants()) do
                if v1.Name == LocalPlayer.Name then
                    local ClickDetector = v1:FindFirstChildOfClass("ClickDetector")
                    if ClickDetector then
                        for _ = 1, 80 do
                            func(fireclickdetector, ClickDetector)
                        end
                    end
                end
            end
        end,
    }
)
v3:Section({Title = "Spleef"})
local v19 = v3:Group()
v19:Button(
    {
        Title = "Godmode", Justify = "Center", Icon = "solar:shield-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            local Spleef = workspace.Assets:FindFirstChild("Spleef")
            if not Spleef then
                return
            end
            local Part = Spleef:FindFirstChild("Part")
            if not Part then
                return
            end
            local TouchInterest = Part:FindFirstChild("TouchInterest")
            if TouchInterest then
                TouchInterest:Destroy()
            end
        end,
    }
)
v19:Space({Columns = 0.5})
v19:Button(
    {
        Title = "Clear Parts", Justify = "Center", Icon = "solar:trash-bin-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            local v1 = func1()
            if not v1 then
                return
            end
            for _, v2 in pairs(workspace.Assets:GetDescendants()) do
                if v2.Name == "SpleefPart" then
                    func(firetouchinterest, v1, v2, 0)
                end
            end
        end,
    }
)
v3:Section({Title = "Coins & Gems"})
tbl.campCoins = false
v3:Toggle(
    {
        Title = "Auto Collect Coins & Gems", Desc = "Moves all coins and gems to your character",
        Value = false,
        Callback = function(arg1)
            tbl.campCoins = arg1
            if arg1 then
                task.spawn(
                    function()
                        while true do
                            local campCoins = tbl.campCoins
                            if not campCoins then
                                break
                            end
                            campCoins = task.wait
                            campCoins(0.5)
                            campCoins = func1
                            campCoins = campCoins()
                            if campCoins then
                                func(
                                    function()
                                        for _, v1 in pairs(workspace.Assets:GetDescendants()) do
                                            if v1.Name == "Coin" or v1.Name == "Gem" then
                                                v1.CanCollide = false
                                                v1.Position = campCoins.Position
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    end
                )
            end
        end,
    }
)
v3:Section({Title = "Math Mania"})
tbl.mathCamp = false
v3:Toggle(
    {
        Title = "Auto-Win Math Mania", Desc = "Auto-solves and submits all math questions",
        Value = false,
        Callback = function(arg1)
            tbl.mathCamp = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.mathCamp do
                            func4()
                            task.wait(1)
                        end
                    end
                )
            end
        end,
    }
)
v3:Section({Title = "Block Push"})
v3:Button(
    {
        Title = "Win Block Push", Desc = "Pushes your box onto the gold target",
        Callback = function()
            local v1 = func1()
            if not v1 then
                return
            end
            local v3
            local v4
            for _, v2 in ipairs(workspace:GetDescendants()) do
                if v2:IsA("Part") and v2.Name == "SingularBox" and (v2.Position - v1.Position).Magnitude <= 100 then
                    v3 = v2
                end
                if v2:IsA("Part") and v2.Name == "Gold" then
                    v4 = v2
                end
                if v3 and v4 then
                    break
                end
            end
            if v3 and v4 then
                v3.Position = v4.Position + Vector3.new(0, 3, 0)
                v1.CFrame = CFrame.new(v3.Position + Vector3.new(0, 3, 0))
            end
        end,
    }
)
v3:Section({Title = "Sword Fight"})
tbl.sfLoop = nil
v3:Toggle(
    {
        Title = "Kill All In Sword Fight", Desc = "Fires sword touch on all players every frame",
        Value = false,
        Callback = function(arg1)
            if tbl.sfLoop then
                tbl.sfLoop:Disconnect()
                tbl.sfLoop = nil
            end
            if arg1 then
                tbl.sfLoop = RunService.RenderStepped:Connect(func5)
            end
        end,
    }
)
v3:Section({Title = "Dodgeball & Paintball"})
tbl.dgActive = false
v3:Toggle(
    {
        Title = "Bring Dodgeball Giver", Desc = "Moves giver to you", Value = false,
        Callback = function(arg1)
            tbl.dgActive = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.dgActive do
                            func(
                                function()
                                    local v1 = workspace:FindFirstChild("Assets") and workspace.Assets:FindFirstChild(
                                        "Dodgeball"
                                    ) and workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
                                    local v2 = func1()
                                    if v1 and v2 then
                                        for _, v3 in ipairs(v1:GetDescendants()) do
                                            if v3:IsA("BasePart") then
                                                v3.CanCollide = false
                                            end
                                        end
                                        local v4 = v1:FindFirstChildWhichIsA("BasePart") or v1:FindFirstChild(
                                            "HitBox"
                                        ) or v1:FindFirstChild("Hitbox")
                                        if v4 then
                                            v4.CFrame = v2.CFrame
                                        end
                                    end
                                end
                            )
                            task.wait(0.2)
                        end
                    end
                )
            end
        end,
    }
)
tbl.keepBall = false
tbl.ballConn = nil
v3:Toggle(
    {
        Title = "Keep Dodgeball After Round",
        Desc = "Re-equips the dodgeball if it gets taken away", Value = false,
        Callback = function(arg1)
            tbl.keepBall = arg1
            if tbl.ballConn then
                tbl.ballConn:Disconnect()
                tbl.ballConn = nil
            end
            if arg1 then
                tbl.ballConn = LocalPlayer.Backpack.ChildRemoved:Connect(
                    function(arg1)
                        if arg1.Name == "Dodgeball" and tbl.keepBall then
                            task.wait(0.5)
                            if tbl.keepBall and not LocalPlayer.Backpack:FindFirstChild("Dodgeball") then
                                local Dodgeball = workspace:FindFirstChild("Dodgeball", true)
                                if Dodgeball then
                                    Dodgeball:Clone().Parent = LocalPlayer.Backpack
                                end
                            end
                        end
                    end
                )
            end
        end,
    }
)
tbl.autoThrow = false
v3:Toggle(
    {
        Title = "Auto Throw Dodgeball", Desc = "Automatically fires the dodgeball remote",
        Value = false,
        Callback = function(arg1)
            tbl.autoThrow = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.autoThrow do
                            func(
                                function()
                                    local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(
                                        "Tool"
                                    )
                                    if v1 and v1.Name == "Dodgeball" then
                                        local Bounce = v1:FindFirstChild("Bounce")
                                        if Bounce then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    Bounce:FireServer(
                                                        v2.Character.HumanoidRootPart.Position
                                                    )
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.3)
                        end
                    end
                )
            end
        end,
    }
)
tbl.killAllDodge = false
v3:Toggle(
    {
        Title = "Kill All (Dodgeball)", Desc = "Slams ball into each player", Value = false,
        Callback = function(arg1)
            tbl.killAllDodge = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.killAllDodge do
                            func(
                                function()
                                    for _, v1 in pairs(workspace:GetDescendants()) do
                                        if v1:IsA("BasePart") and v1.Name == "Dodgeball" and not v1.Parent:IsA(
                                            "Tool"
                                        ) and not v1.Parent:IsA("Backpack") then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    v1.CFrame = v2.Character.HumanoidRootPart.CFrame
                                                    task.wait(0.05)
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
tbl.autoPaint = false
v3:Toggle(
    {
        Title = "Auto Fire Paintball", Desc = "Automatically fires paintball at all players",
        Value = false,
        Callback = function(arg1)
            tbl.autoPaint = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.autoPaint do
                            func(
                                function()
                                    local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(
                                        "Tool"
                                    )
                                    if v1 and v1.Name == "PaintballGun" then
                                        local Fire = v1:FindFirstChild("Fire")
                                        if Fire then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    Fire:FireServer(
                                                        CFrame.new(
                                                            v2.Character.HumanoidRootPart.Position
                                                        )
                                                    )
                                                    task.wait(0.1)
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.3)
                        end
                    end
                )
            end
        end,
    }
)
tbl.killAllPaint = false
v3:Toggle(
    {
        Title = "Kill All (Paintball)", Desc = "Moves pellets into each player", Value = false,
        Callback = function(arg1)
            tbl.killAllPaint = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.killAllPaint do
                            func(
                                function()
                                    for _, v1 in pairs(workspace:GetDescendants()) do
                                        local Name = v1.Name
                                        if v1:IsA("BasePart") and (Name == "Paintball" or Name == "PaintBall" or Name == "Pellet" or Name == "bullet" or Name == "Bullet") and not v1.Parent:IsA(
                                            "Tool"
                                        ) then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    v1.CFrame = v2.Character.HumanoidRootPart.CFrame
                                                    task.wait(0.05)
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
tbl.ballProt = false
v3:Toggle(
    {
        Title = "Dodgeball & Paintball Protection", Desc = "Destroys incoming balls", Value = false,
        Callback = function(arg1)
            tbl.ballProt = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.ballProt do
                            func(
                                function()
                                    for _, v1 in pairs(workspace:GetDescendants()) do
                                        local Name = v1.Name
                                        if (Name == "Dodgeball" or Name == "Paintball" or Name == "Ball" or Name == "PaintBall" or Name == "bullet" or Name == "Bullet" or Name == "Pellet") and v1:IsA(
                                            "BasePart"
                                        ) then
                                            if not v1.Parent:IsA("Tool") and not v1.Parent:IsA(
                                                "Backpack"
                                            ) then
                                                local TouchInterest = v1:FindFirstChild(
                                                    "TouchInterest"
                                                )
                                                if TouchInterest then
                                                    TouchInterest:Destroy()
                                                end
                                                func(
                                                    function()
                                                        v1.CanCollide = false
                                                    end
                                                )
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.05)
                        end
                    end
                )
            end
        end,
    }
)
v3:Section({Title = "Auto-Win All"})
tbl.awActive = false
tbl.awKill = nil
v3:Toggle(
    {
        Title = "Auto-Win All Challenges", Desc = "Enables all loops at once", Value = false,
        Callback = function(arg1)
            tbl.awActive = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.awActive do
                            func3()
                            task.wait(0.5)
                        end
                    end
                )
                task.spawn(
                    function()
                        while tbl.awActive do
                            task.wait(0.3)
                            func(
                                function()
                                    local v1 = func1()
                                    for _, v2 in pairs(workspace.Assets:GetDescendants()) do
                                        if v2.Name == "Coin" or v2.Name == "Gem" then
                                            v2.CanCollide = false
                                            if v1 then
                                                v2.Position = v1.Position
                                            end
                                        end
                                    end
                                end
                            )
                        end
                    end
                )
                task.spawn(
                    function()
                        while tbl.awActive do
                            task.wait(0.5)
                            func(
                                function()
                                    for _, v1 in pairs(workspace.Assets:GetDescendants()) do
                                        if v1.Name == LocalPlayer.Name then
                                            local ClickDetector = v1:FindFirstChildOfClass(
                                                "ClickDetector"
                                            )
                                            if ClickDetector then
                                                for _ = 1, 10 do
                                                    fireclickdetector(ClickDetector)
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                        end
                    end
                )
                task.spawn(
                    function()
                        while tbl.awActive do
                            func(
                                function()
                                    for _, v1 in pairs(workspace.Assets:GetDescendants()) do
                                        if v1.Name == "Mud" or v1.Name == "Water" or v1.Name == "Lava" then
                                            local TouchInterest = v1:FindFirstChild("TouchInterest")
                                            if TouchInterest then
                                                TouchInterest:Destroy()
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(1)
                        end
                    end
                )
            end
            if tbl.awKill then
                tbl.awKill:Disconnect()
                tbl.awKill = nil
            end
            if arg1 then
                tbl.awKill = RunService.RenderStepped:Connect(func5)
            end
            v1:Notify(
                {Title = "Auto-Win All", Content = arg1 and "ENABLED!" or "Disabled.", Duration = 3}
            )
        end,
    }
)
v4:Section({Title = "Obby"})
v4:Group():Button(
    {
        Title = "Win Obby", Justify = "Center", Icon = "solar:flag-bold", IconAlign = "Left",
        Size = "Small", Callback = func3,
    }
)
tbl.movObby = false
v4:Toggle(
    {
        Title = "Auto-Win Obby", Desc = "Finish line loops to your position", Value = false,
        Callback = function(arg1)
            tbl.movObby = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.movObby do
                            func3()
                            task.wait(0.5)
                        end
                    end
                )
            end
        end,
    }
)
v4:Section({Title = "Pirate"})
v4:Button(
    {
        Title = "Collect Keys & Open Chests",
        Desc = "Collects all pirate keys and opens matching chests",
        Callback = function()
            local Pirate = workspace.Assets:FindFirstChild("Pirate")
            if not Pirate then
                return
            end
            local function func()
                for _, v1 in ipairs(LocalPlayer.Backpack:GetChildren()) do
                    if v1:IsA("Tool") then
                        return v1
                    end
                end
                for _, v2 in ipairs(LocalPlayer.Character:GetChildren()) do
                    if v2:IsA("Tool") then
                        return v2
                    end
                end
            end
            while true do
                local v2
                for _, v1 in ipairs(Pirate:GetDescendants()) do
                    if v1.Name == "MainKey" then
                        v2 = v1
                        break
                    end
                end
                if v2 then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = v2.CFrame
                    task.wait(0.25)
                    local v3
                    local num = 0
                    while num < 5 and not v3 do
                        v3 = func()
                        if not v3 then
                            task.wait(0.1)
                            num = num + 0.1
                        end
                    end
                    if v3 then
                        v3.Parent = LocalPlayer.Character
                        task.wait(0.05)
                        local Chests = Pirate:FindFirstChild("Chests")
                        if Chests then
                            local v4 = Chests:FindFirstChild(v3.Name)
                            if v4 then
                                local Chest = v4:FindFirstChild("Chest")
                                if Chest then
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = Chest.CFrame
                                    task.wait(0.15)
                                end
                            end
                        end
                        continue
                    end
                end
                break
            end
        end,
    }
)
v4:Section({Title = "Beach Fight"})
tbl.beachLoop = nil
v4:Toggle(
    {
        Title = "Kill Everyone In Beach Fight",
        Desc = "Fires sword touch on all players every frame", Value = false,
        Callback = function(arg1)
            if tbl.beachLoop then
                tbl.beachLoop:Disconnect()
                tbl.beachLoop = nil
            end
            if arg1 then
                tbl.beachLoop = RunService.RenderStepped:Connect(func5)
            end
        end,
    }
)
v4:Section({Title = "Monster"})
v4:Button(
    {
        Title = "Monster Godmode", Desc = "Destroys the monster NPC to prevent damage",
        Callback = function()
            local Monster = workspace.Assets:FindFirstChild("Monster")
            if Monster then
                local MonsterNPC = Monster:FindFirstChild("MonsterNPC")
                if MonsterNPC then
                    MonsterNPC:Destroy()
                end
            end
        end,
    }
)
v4:Section({Title = "Alien"})
v4:Button(
    {
        Title = "Collect Egg", Desc = "Moves your egg to your character position",
        Callback = function()
            local v1 = func1()
            if not v1 then
                return
            end
            local Alien = workspace.Assets:WaitForChild("Alien")
            if not Alien then
                return
            end
            local v2 = ReplicatedStorage.Season.Players:FindFirstChild(LocalPlayer.Name)
            local v3 = v2 and v2.Value
            if not v3 then
                return
            end
            for _, v4 in pairs(Alien:GetDescendants()) do
                if v4.ClassName == "TextLabel" and v4.Text == v3 then
                    local Parent = v4.Parent.Parent.Parent
                    func(
                        function()
                            Parent.CFrame = v1.CFrame
                            Parent.CanCollide = false
                        end
                    )
                end
            end
        end,
    }
)
v4:Section({Title = "Pre-Historic"})
local connection
v4:Toggle(
    {
        Title = "Auto Collect Ancient Artifacts",
        Desc = "Teleports artifact coins to you as they spawn", Value = false,
        Callback = function(arg1)
            if arg1 then
                func(
                    function()
                        local PreHistoric = workspace.Assets:WaitForChild("Pre-Historic")
                        local v1 = PreHistoric and PreHistoric:WaitForChild("Coins")
                        if v1 then
                            connection = v1.ChildAdded:Connect(
                                function(arg1)
                                    local v1 = func1()
                                    if v1 then
                                        arg1.Position = v1.Position
                                        arg1.Transparency = 0
                                        arg1.CanCollide = false
                                    end
                                end
                            )
                        end
                    end
                )
            elseif connection then
                connection:Disconnect()
                connection = nil
            end
        end,
    }
)
v4:Section({Title = "Math Mania"})
tbl.mathMov = false
v4:Toggle(
    {
        Title = "Auto-Win Math Mania", Desc = "Auto-solves and submits all math questions",
        Value = false,
        Callback = function(arg1)
            tbl.mathMov = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.mathMov do
                            func4()
                            task.wait(1)
                        end
                    end
                )
            end
        end,
    }
)
v4:Section({Title = "Rock & Roll"})
tbl.guitarConn = nil
v4:Toggle(
    {
        Title = "Auto Collect Guitars", Desc = "Heartbeat collects all coins/gems in Rock & Roll",
        Value = false,
        Callback = function(arg1)
            if tbl.guitarConn then
                tbl.guitarConn:Disconnect()
                tbl.guitarConn = nil
            end
            if arg1 then
                tbl.guitarConn = RunService.Heartbeat:Connect(
                    function()
                        func(
                            function()
                                local v1 = func1()
                                if not v1 then
                                    return
                                end
                                local Assets = workspace:FindFirstChild("Assets")
                                if not Assets then
                                    return
                                end
                                for _, v2 in pairs(Assets:GetDescendants()) do
                                    if v2:IsA("BasePart") and (v2.Name == "Coin" or v2.Name == "Gem") then
                                        v2.CFrame = v1.CFrame * CFrame.new(0, 5, 0)
                                    end
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
v4:Section({Title = "Prison"})
v4:Button(
    {
        Title = "Instantly Eat Poison Bowl",
        Desc = "Fires clickdetector on every bowl in the prison",
        Callback = function()
            local num = 0
            func(
                function()
                    for _, v1 in pairs(workspace.Assets:GetDescendants()) do
                        if v1.Name == "bowl" then
                            local ClickDetector = v1:FindFirstChildOfClass("ClickDetector")
                            if ClickDetector then
                                for _ = 1, 10 do
                                    fireclickdetector(ClickDetector)
                                end
                                num = num + 1
                            end
                        end
                    end
                end
            )
            v1:Notify({Title = "Prison", Content = "Fired " .. num .. " bowl(s)!", Duration = 3})
        end,
    }
)
tbl.autoRaygun = false
v4:Toggle(
    {
        Title = "Auto Shoot Raygun (Sheriff)", Desc = "Fires ServerControl at nearest enemy",
        Value = false,
        Callback = function(arg1)
            tbl.autoRaygun = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.autoRaygun do
                            func(
                                function()
                                    local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(
                                        "Sheriff"
                                    ) or LocalPlayer.Backpack:FindFirstChild("Sheriff")
                                    if v1 then
                                        local ServerControl = v1:FindFirstChild("ServerControl")
                                        local ClientControl = v1:FindFirstChild("ClientControl")
                                        if ServerControl and ClientControl then
                                            local v2 = func6()
                                            if v2 and v2.Character and v2.Character:FindFirstChild(
                                                "HumanoidRootPart"
                                            ) then
                                                local Position = v2.Character.HumanoidRootPart.Position
                                                local HumanoidRootPart = v2.Character.HumanoidRootPart
                                                ClientControl.OnClientInvoke = function(arg1)
                                                    if arg1 == "MousePosition" then
                                                        return {
                                                            Position = Position,
                                                            Target = HumanoidRootPart
                                                        }
                                                    end
                                                end
                                                ServerControl:InvokeServer(
                                                    "MouseClick", {Down = true}
                                                )
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.5)
                        end
                    end
                )
            end
        end,
    }
)
tbl.killAllLaser = false
v4:Toggle(
    {
        Title = "Kill All (Sheriff / Raygun)", Desc = "Moves lasers onto each player",
        Value = false,
        Callback = function(arg1)
            tbl.killAllLaser = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.killAllLaser do
                            func(
                                function()
                                    for _, v1 in pairs(workspace:GetDescendants()) do
                                        local Name = v1.Name
                                        if v1:IsA("BasePart") and (Name == "LaserBlast" or Name == "Laser" or Name == "Blast") and not v1.Parent:IsA(
                                            "Tool"
                                        ) then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    v1.CFrame = v2.Character.HumanoidRootPart.CFrame
                                                    task.wait(0.05)
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
tbl.sheriffProt = false
v4:Toggle(
    {
        Title = "Raygun / Sheriff Protection", Desc = "Deletes incoming laser blasts",
        Value = false,
        Callback = function(arg1)
            tbl.sheriffProt = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.sheriffProt do
                            func(
                                function()
                                    for _, v1 in pairs(workspace:GetDescendants()) do
                                        if v1.Name == "LaserBlast" or v1.Name == "Laser" or v1.Name == "Blast" or v1.Name == "bullet" or v1.Name == "Bullet" then
                                            local TouchInterest = v1:FindFirstChild("TouchInterest")
                                            if TouchInterest then
                                                TouchInterest:Destroy()
                                            end
                                            func(
                                                function()
                                                    v1:Destroy()
                                                end
                                            )
                                        end
                                    end
                                end
                            )
                            task.wait(0.05)
                        end
                    end
                )
            end
        end,
    }
)
v5:Section({Title = "Obby"})
v5:Group():Button(
    {
        Title = "Win Obby", Justify = "Center", Icon = "solar:flag-bold", IconAlign = "Left",
        Size = "Small", Callback = func3,
    }
)
tbl.expObby = false
v5:Toggle(
    {
        Title = "Auto-Win Obby", Desc = "Finish line loops to your position", Value = false,
        Callback = function(arg1)
            tbl.expObby = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.expObby do
                            func3()
                            task.wait(0.5)
                        end
                    end
                )
            end
        end,
    }
)
v5:Section({Title = "Collectibles"})
tbl.clovers = false
v5:Toggle(
    {
        Title = "Auto-Collect Clovers", Desc = "Moves all gems and coins to your character",
        Value = false,
        Callback = function(arg1)
            tbl.clovers = arg1
            if arg1 then
                task.spawn(
                    function()
                        while true do
                            local clovers = tbl.clovers
                            if not clovers then
                                break
                            end
                            clovers = task.wait
                            clovers(0.1)
                            clovers = func1
                            clovers = clovers()
                            if clovers then
                                func(
                                    function()
                                        for _, v1 in pairs(workspace:GetDescendants()) do
                                            if v1.Name == "Gem" or v1.Name == "Coin" then
                                                v1.Transparency = 1
                                                v1.Position = clovers.Position
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    end
                )
            end
        end,
    }
)
tbl.rings = false
v5:Toggle(
    {
        Title = "Auto-Collect Rings", Desc = "Moves all ring hitboxes to your character",
        Value = false,
        Callback = function(arg1)
            tbl.rings = arg1
            if arg1 then
                task.spawn(
                    function()
                        while true do
                            local rings = tbl.rings
                            if not rings then
                                break
                            end
                            rings = task.wait
                            rings(0.1)
                            rings = func1
                            rings = rings()
                            if rings then
                                func(
                                    function()
                                        for _, v1 in pairs(workspace:GetDescendants()) do
                                            if v1.Name == "RingHitbox" then
                                                v1.Transparency = 1
                                                v1.Position = rings.Position
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    end
                )
            end
        end,
    }
)
v5:Section({Title = "Math Mania"})
tbl.mathExp = false
v5:Toggle(
    {
        Title = "Auto-Win Math Mania", Desc = "Auto-solves and submits all math questions",
        Value = false,
        Callback = function(arg1)
            tbl.mathExp = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.mathExp do
                            func4()
                            task.wait(1)
                        end
                    end
                )
            end
        end,
    }
)
v5:Section({Title = "Greece"})
tbl.greeceLoop = nil
v5:Toggle(
    {
        Title = "Kill Everyone in Greece", Desc = "Fires sword touch on all players every frame",
        Value = false,
        Callback = function(arg1)
            if tbl.greeceLoop then
                tbl.greeceLoop:Disconnect()
                tbl.greeceLoop = nil
            end
            if arg1 then
                tbl.greeceLoop = RunService.RenderStepped:Connect(func5)
            end
        end,
    }
)
v5:Section({Title = "Amazon"})
v5:Button(
    {
        Title = "Break Amazon (Spleef)", Desc = "Fires touchinterest on all Amazon spleef parts",
        Callback = function()
            local v1 = func1()
            if not v1 then
                return
            end
            for _, v2 in pairs(workspace.Assets:GetDescendants()) do
                if v2.Name == "SpleefPart" then
                    func(firetouchinterest, v1, v2, 0)
                end
            end
        end,
    }
)
v5:Section({Title = "France (Cheese Push)"})
local function func7(arg1)
    return workspace:FindFirstChild(arg1, true)
end
local function func8()
    for _, v1 in pairs(workspace:GetDescendants()) do
        if v1.Name == "FinishingFade" then
            local Hitbox = v1:FindFirstChild("Hitbox")
            if Hitbox then
                return Hitbox
            end
        end
    end
end
local v20 = v5:Group()
v20:Button(
    {
        Title = "Push Cheese 1", Justify = "Center", Icon = "solar:map-point-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            local v2 = func7("Cheese1")
            local v3 = func8()
            if v2 and v3 then
                v2.CFrame = v3.CFrame
                v1:Notify({Title = "France", Content = "Cheese1 pushed!", Duration = 3})
            else
                v1:Notify({Title = "France", Content = "Not found.", Duration = 3})
            end
        end,
    }
)
v20:Space({Columns = 0.5})
v20:Button(
    {
        Title = "Push Cheese 2", Justify = "Center", Icon = "solar:map-point-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            local v2 = func7("Cheese2")
            local v3 = func8()
            if v2 and v3 then
                v2.CFrame = v3.CFrame
                v1:Notify({Title = "France", Content = "Cheese2 pushed!", Duration = 3})
            else
                v1:Notify({Title = "France", Content = "Not found.", Duration = 3})
            end
        end,
    }
)
tbl.cheesePush = false
v5:Toggle(
    {
        Title = "Auto Push Cheese", Desc = "Continuously pushes both cheeses to the finish",
        Value = false,
        Callback = function(arg1)
            tbl.cheesePush = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.cheesePush do
                            func(
                                function()
                                    local v1 = func8()
                                    if v1 then
                                        for _, v2 in ipairs({"Cheese1", "Cheese2"}) do
                                            local v3 = func7(v2)
                                            if v3 then
                                                v3.CFrame = v1.CFrame
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
v5:Section({Title = "Italy"})
v5:Button(
    {
        Title = "Give Meatball", Desc = "Clones meatball into your backpack",
        Callback = function()
            func(
                function()
                    local Meatball = ReplicatedStorage.Products.Gear.Meatball:Clone()
                    if Meatball:FindFirstChild("Handle") then
                        Meatball.Handle.CanCollide = false
                    end
                    Meatball.Parent = LocalPlayer.Backpack
                    v1:Notify({Title = "Meatball", Content = "Meatball given!", Duration = 3})
                end
            )
        end,
    }
)
tbl.keepMeatball = false
tbl.meatballConn = nil
v5:Toggle(
    {
        Title = "Keep Meatball After Round", Desc = "Re-equips the meatball if it gets taken away",
        Value = false,
        Callback = function(arg1)
            tbl.keepMeatball = arg1
            if tbl.meatballConn then
                tbl.meatballConn:Disconnect()
                tbl.meatballConn = nil
            end
            if arg1 then
                tbl.meatballConn = LocalPlayer.Backpack.ChildRemoved:Connect(
                    function(arg1)
                        if arg1.Name == "Meatball" and tbl.keepMeatball then
                            task.wait(0.5)
                            if tbl.keepMeatball and not LocalPlayer.Backpack:FindFirstChild(
                                "Meatball"
                            ) then
                                func(
                                    function()
                                        local Meatball = ReplicatedStorage.Products.Gear.Meatball:Clone(
                                        )
                                        if Meatball:FindFirstChild("Handle") then
                                            Meatball.Handle.CanCollide = false
                                        end
                                        Meatball.Parent = LocalPlayer.Backpack
                                    end
                                )
                            end
                        end
                    end
                )
            end
        end,
    }
)
tbl.autoMeatball = false
v5:Toggle(
    {
        Title = "Auto Throw Meatball", Desc = "Throws meatball at all players", Value = false,
        Callback = function(arg1)
            tbl.autoMeatball = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.autoMeatball do
                            func(
                                function()
                                    local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(
                                        "Meatball"
                                    ) or LocalPlayer.Backpack:FindFirstChild("Meatball")
                                    if v1 then
                                        local Bounce = v1:FindFirstChild("Bounce")
                                        if Bounce then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    Bounce:FireServer(
                                                        v2.Character.HumanoidRootPart.Position
                                                    )
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.3)
                        end
                    end
                )
            end
        end,
    }
)
tbl.killAllMeat = false
v5:Toggle(
    {
        Title = "Kill All (Meatball)", Desc = "Slams meatball into each player", Value = false,
        Callback = function(arg1)
            tbl.killAllMeat = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.killAllMeat do
                            func(
                                function()
                                    for _, v1 in pairs(workspace:GetDescendants()) do
                                        if v1:IsA("BasePart") and v1.Name == "Meatball" and not v1.Parent:IsA(
                                            "Tool"
                                        ) and not v1.Parent:IsA("Backpack") then
                                            for _, v2 in pairs(Players:GetPlayers()) do
                                                if v2 ~= LocalPlayer and v2.Character and v2.Character:FindFirstChild(
                                                    "HumanoidRootPart"
                                                ) then
                                                    v1.CFrame = v2.Character.HumanoidRootPart.CFrame
                                                    task.wait(0.05)
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
tbl.mgActive = false
v5:Toggle(
    {
        Title = "Bring Meatball Giver", Desc = "Moves MeatballGiver to you", Value = false,
        Callback = function(arg1)
            tbl.mgActive = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.mgActive do
                            func(
                                function()
                                    local v1 = workspace:FindFirstChild("Assets") and workspace.Assets:FindFirstChild(
                                        "Italy"
                                    ) and workspace.Assets.Italy:FindFirstChild("MeatballGiver")
                                    local v2 = func1()
                                    if v1 and v2 then
                                        for _, v3 in ipairs(v1:GetDescendants()) do
                                            if v3:IsA("BasePart") then
                                                v3.CanCollide = false
                                            end
                                        end
                                        local v4 = v1:FindFirstChildWhichIsA("BasePart") or v1:FindFirstChild(
                                            "HitBox"
                                        ) or v1:FindFirstChild("Hitbox")
                                        if v4 then
                                            v4.CFrame = v2.CFrame
                                        end
                                    end
                                end
                            )
                            task.wait(0.2)
                        end
                    end
                )
            end
        end,
    }
)
v6:Section({Title = "Safety Statue"})
local v21 = v6:Group()
v21:Button(
    {
        Title = "Get Statue/Bag", Justify = "Center", Icon = "solar:diploma-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            func(
                function()
                    local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(
                        "Torso"
                    )
                    if not v1 then
                        return
                    end
                    for _, v2 in pairs(workspace.Idols:GetDescendants()) do
                        if v2.Name == "Bag" or v2.Name == "SafetyStatue" then
                            local hit = v2:FindFirstChild("hit")
                            if hit then
                                hit.CanCollide = false
                                hit.Transparency = 1
                                task.wait()
                                hit.Position = v1.Position
                                task.wait()
                            end
                        end
                    end
                end
            )
        end,
    }
)
v21:Space({Columns = 0.5})
v21:Button(
    {
        Title = "Who Has It", Justify = "Center", Icon = "solar:eye-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            func(
                function()
                    local Idol = ReplicatedStorage.Season.Twists.Idol
                    local v2 = Idol.Value == "" and "Nobody has the statue." or (ReplicatedStorage.Season.Players:FindFirstChild(
                        Idol.Value
                    ) and ReplicatedStorage.Season.Players[Idol.Value].Value or Idol.Value) .. " has the statue."
                    v1:Notify({Title = "Statue Status", Content = v2, Duration = 5})
                end
            )
        end,
    }
)
v6:Toggle(
    {
        Title = "Safety Bag ESP", Desc = "Shows white highlight and label on all safety bags",
        Value = false,
        Callback = function(arg1)
            if arg1 then
                func(
                    function()
                        for _, v1 in ipairs(workspace.Idols:GetDescendants()) do
                            if v1.Name == "Bag" and v1:IsA("Model") then
                                local v2 = v1.PrimaryPart or v1:FindFirstChildWhichIsA("BasePart")
                                if v2 then
                                    if not v1:FindFirstChild("BagHL") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "BagHL"
                                        highlight.FillColor = Color3.fromRGB(255, 255, 255)
                                        highlight.FillTransparency = 0.7
                                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        highlight.OutlineTransparency = 0
                                        highlight.Parent = v1
                                    end
                                    if not v1:FindFirstChild("BagESP") then
                                        local billboardGui = Instance.new("BillboardGui")
                                        billboardGui.Name = "BagESP"
                                        billboardGui.Size = UDim2.fromOffset(160, 28)
                                        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                                        billboardGui.AlwaysOnTop = true
                                        billboardGui.Adornee = v2
                                        billboardGui.Parent = workspace
                                        local textLabel = Instance.new("TextLabel", billboardGui)
                                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                                        textLabel.BackgroundTransparency = 1
                                        textLabel.Text = "BAG"
                                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        textLabel.TextStrokeTransparency = 0
                                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                        textLabel.TextSize = 14
                                        textLabel.Font = Enum.Font.GothamBold
                                    end
                                end
                            end
                        end
                    end
                )
            else
                for _, v1 in ipairs(workspace:GetDescendants()) do
                    if v1.Name == "BagHL" or v1.Name == "BagESP" then
                        func(
                            function()
                                v1:Destroy()
                            end
                        )
                    end
                end
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Safety Statue ESP", Desc = "Shows white highlight and label on all safety statues",
        Value = false,
        Callback = function(arg1)
            if arg1 then
                func(
                    function()
                        for _, v1 in ipairs(workspace.Idols:GetDescendants()) do
                            if v1.Name == "SafetyStatue" and v1:IsA("Model") then
                                local v2 = v1.PrimaryPart or v1:FindFirstChildWhichIsA("BasePart")
                                if v2 then
                                    if not v1:FindFirstChild("StatueHL") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "StatueHL"
                                        highlight.FillColor = Color3.fromRGB(255, 255, 255)
                                        highlight.FillTransparency = 0.7
                                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        highlight.OutlineTransparency = 0
                                        highlight.Parent = v1
                                    end
                                    if not v1:FindFirstChild("StatueESP") then
                                        local billboardGui = Instance.new("BillboardGui")
                                        billboardGui.Name = "StatueESP"
                                        billboardGui.Size = UDim2.fromOffset(160, 28)
                                        billboardGui.StudsOffset = Vector3.new(0, 4, 0)
                                        billboardGui.AlwaysOnTop = true
                                        billboardGui.Adornee = v2
                                        billboardGui.Parent = workspace
                                        local textLabel = Instance.new("TextLabel", billboardGui)
                                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                                        textLabel.BackgroundTransparency = 1
                                        textLabel.Text = "STATUE"
                                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        textLabel.TextStrokeTransparency = 0
                                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                        textLabel.TextSize = 14
                                        textLabel.Font = Enum.Font.GothamBold
                                    end
                                end
                            end
                        end
                    end
                )
            else
                for _, v1 in ipairs(workspace:GetDescendants()) do
                    if v1.Name == "StatueHL" or v1.Name == "StatueESP" then
                        func(
                            function()
                                v1:Destroy()
                            end
                        )
                    end
                end
            end
        end,
    }
)
tbl.idolESPConn = nil
v6:Toggle(
    {
        Title = "Idol Holder ESP", Desc = "Highlights whoever currently holds the statue",
        Value = false,
        Callback = function(arg1)
            if tbl.idolESPConn then
                tbl.idolESPConn:Disconnect()
                tbl.idolESPConn = nil
            end
            for _, v1 in pairs(workspace:GetDescendants()) do
                if v1.Name == "IdolHolderHL" then
                    func(
                        function()
                            v1:Destroy()
                        end
                    )
                end
            end
            if arg1 then
                local function func1()
                    for _, v1 in pairs(workspace:GetDescendants()) do
                        if v1.Name == "IdolHolderHL" then
                            func(
                                function()
                                    v1:Destroy()
                                end
                            )
                        end
                    end
                    local v2 = ReplicatedStorage:FindFirstChild("Season") and ReplicatedStorage.Season:FindFirstChild(
                        "Twists"
                    ) and ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
                    if not v2 or v2.Value == "" then
                        return
                    end
                    local v3 = Players:FindFirstChild(v2.Value)
                    if v3 and v3.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "IdolHolderHL"
                        highlight.FillColor = Color3.fromRGB(255, 215, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 215, 0)
                        highlight.FillTransparency = 0.4
                        highlight.OutlineTransparency = 0
                        highlight.Parent = v3.Character
                    end
                end
                func1()
                func(
                    function()
                        tbl.idolESPConn = ReplicatedStorage.Season.Twists.Idol.Changed:Connect(
                            function()
                                func1()
                            end
                        )
                    end
                )
            end
        end,
    }
)
tbl.idolSpam = false
v6:Toggle(
    {
        Title = "Play as Idol (Spam)",
        Desc = "Fires Idol remote rapidly — only works if you hold it", Value = false,
        Callback = function(arg1)
            tbl.idolSpam = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.idolSpam do
                            func(
                                function()
                                    ReplicatedStorage.Events.Idol:FireServer()
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
v6:Button(
    {
        Title = "Play as Idol (Once)", Desc = "Fires Idol remote once",
        Callback = function()
            local v2, v3 = func(
                function()
                    ReplicatedStorage.Events.Idol:FireServer()
                end
            )
            v1:Notify(
                {
                    Title = "Play as Idol",
                    Content = v2 and "Fired! Only works if you are the idol holder." or "Failed: " .. tostring(
                        v3
                    ):sub(1, 60), Duration = 4,
                }
            )
        end,
    }
)
v6:Section({Title = "Votes"})
local v32
local v33
local v34
local v35
local v36
local v37
v6:Toggle(
    {
        Title = "Notify Votes", Desc = "Shows a notification each time a vote is cast",
        Value = false,
        Callback = function(arg1)
            if v32 then
                v32:Disconnect()
                v32 = nil
            end
            if arg1 then
                v32 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v2, v3 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v4, v5 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v2 and v4 then
                            v1:Notify(
                                {Title = "Vote Cast", Content = v3 .. " voted for " .. v5, Duration = 5}
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Print Votes to Console", Desc = "Prints each vote to the F9 developer console",
        Value = false,
        Callback = function(arg1)
            if v33 then
                v33:Disconnect()
                v33 = nil
            end
            if arg1 then
                v33 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            print("[Ella Hub] Vote: " .. v2 .. " → " .. v4)
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Expose Votes in Chat", Desc = "Sends each vote publicly in the game chat",
        Value = false,
        Callback = function(arg1)
            if v34 then
                v34:Disconnect()
                v34 = nil
            end
            if arg1 then
                v34 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            func(
                                function()
                                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(
                                        v2 .. " voted for " .. v4
                                    )
                                end
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Notify & Expose Exile Votes", Desc = "Notifies and exposes exile votes in chat",
        Value = false,
        Callback = function(arg1)
            if v35 then
                v35:Disconnect()
                v35 = nil
            end
            if arg1 then
                v35 = ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v2, v3 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v4, v5 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v2 and v4 then
                            local v6 = v3 .. " voted to exile " .. v5
                            v1:Notify({Title = "Exile Vote", Content = v6, Duration = 5})
                            func(
                                function()
                                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v6)
                                end
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Notify Jury Votes", Desc = "Shows a notification each time a jury vote is cast",
        Value = false,
        Callback = function(arg1)
            if v36 then
                v36:Disconnect()
                v36 = nil
            end
            if arg1 then
                func(
                    function()
                        v36 = ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(
                            function(arg1)
                                local v2, v3 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Value].Value
                                    end
                                )
                                local v4, v5 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Name].Value
                                    end
                                )
                                if v2 and v4 then
                                    v1:Notify(
                                        {Title = "Jury Vote", Content = v3 .. " jury-voted for " .. v5, Duration = 5}
                                    )
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Expose Jury Votes in Chat", Desc = "Sends jury votes publicly in game chat",
        Value = false,
        Callback = function(arg1)
            if v37 then
                v37:Disconnect()
                v37 = nil
            end
            if arg1 then
                func(
                    function()
                        v37 = ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(
                            function(arg1)
                                local v1, v2 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Value].Value
                                    end
                                )
                                local v3, v4 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Name].Value
                                    end
                                )
                                if v1 and v3 then
                                    func(
                                        function()
                                            game.TextChatService.TextChannels.RBXGeneral:SendAsync(
                                                "[JURY] " .. v2 .. " jury-voted for " .. v4
                                            )
                                        end
                                    )
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
v6:Section({Title = "Safety Statue"})
local v22 = v6:Group()
v22:Button(
    {
        Title = "Get Statue/Bag", Justify = "Center", Icon = "solar:diploma-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            func(
                function()
                    local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(
                        "Torso"
                    )
                    if not v1 then
                        return
                    end
                    for _, v2 in pairs(workspace.Idols:GetDescendants()) do
                        if v2.Name == "Bag" or v2.Name == "SafetyStatue" then
                            local hit = v2:FindFirstChild("hit")
                            if hit then
                                hit.CanCollide = false
                                hit.Transparency = 1
                                task.wait()
                                hit.Position = v1.Position
                                task.wait()
                            end
                        end
                    end
                end
            )
        end,
    }
)
v22:Space({Columns = 0.5})
v22:Button(
    {
        Title = "Who Has It", Justify = "Center", Icon = "solar:eye-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            func(
                function()
                    local Idol = ReplicatedStorage.Season.Twists.Idol
                    local v2 = Idol.Value == "" and "Nobody has the statue." or (ReplicatedStorage.Season.Players:FindFirstChild(
                        Idol.Value
                    ) and ReplicatedStorage.Season.Players[Idol.Value].Value or Idol.Value) .. " has the statue."
                    v1:Notify({Title = "Statue Status", Content = v2, Duration = 5})
                end
            )
        end,
    }
)
v6:Toggle(
    {
        Title = "Safety Bag ESP", Desc = "Shows white highlight and label on all safety bags",
        Value = false,
        Callback = function(arg1)
            if arg1 then
                func(
                    function()
                        for _, v1 in ipairs(workspace.Idols:GetDescendants()) do
                            if v1.Name == "Bag" and v1:IsA("Model") then
                                local v2 = v1.PrimaryPart or v1:FindFirstChildWhichIsA("BasePart")
                                if v2 then
                                    if not v1:FindFirstChild("BagHL") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "BagHL"
                                        highlight.FillColor = Color3.fromRGB(255, 255, 255)
                                        highlight.FillTransparency = 0.7
                                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        highlight.OutlineTransparency = 0
                                        highlight.Parent = v1
                                    end
                                    if not v1:FindFirstChild("BagESP") then
                                        local billboardGui = Instance.new("BillboardGui")
                                        billboardGui.Name = "BagESP"
                                        billboardGui.Size = UDim2.fromOffset(160, 28)
                                        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                                        billboardGui.AlwaysOnTop = true
                                        billboardGui.Adornee = v2
                                        billboardGui.Parent = workspace
                                        local textLabel = Instance.new("TextLabel", billboardGui)
                                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                                        textLabel.BackgroundTransparency = 1
                                        textLabel.Text = "BAG"
                                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        textLabel.TextStrokeTransparency = 0
                                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                        textLabel.TextSize = 14
                                        textLabel.Font = Enum.Font.GothamBold
                                    end
                                end
                            end
                        end
                    end
                )
            else
                for _, v1 in ipairs(workspace:GetDescendants()) do
                    if v1.Name == "BagHL" or v1.Name == "BagESP" then
                        func(
                            function()
                                v1:Destroy()
                            end
                        )
                    end
                end
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Safety Statue ESP", Desc = "Shows white highlight and label on all safety statues",
        Value = false,
        Callback = function(arg1)
            if arg1 then
                func(
                    function()
                        for _, v1 in ipairs(workspace.Idols:GetDescendants()) do
                            if v1.Name == "SafetyStatue" and v1:IsA("Model") then
                                local v2 = v1.PrimaryPart or v1:FindFirstChildWhichIsA("BasePart")
                                if v2 then
                                    if not v1:FindFirstChild("StatueHL") then
                                        local highlight = Instance.new("Highlight")
                                        highlight.Name = "StatueHL"
                                        highlight.FillColor = Color3.fromRGB(255, 255, 255)
                                        highlight.FillTransparency = 0.7
                                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        highlight.OutlineTransparency = 0
                                        highlight.Parent = v1
                                    end
                                    if not v1:FindFirstChild("StatueESP") then
                                        local billboardGui = Instance.new("BillboardGui")
                                        billboardGui.Name = "StatueESP"
                                        billboardGui.Size = UDim2.fromOffset(160, 28)
                                        billboardGui.StudsOffset = Vector3.new(0, 4, 0)
                                        billboardGui.AlwaysOnTop = true
                                        billboardGui.Adornee = v2
                                        billboardGui.Parent = workspace
                                        local textLabel = Instance.new("TextLabel", billboardGui)
                                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                                        textLabel.BackgroundTransparency = 1
                                        textLabel.Text = "STATUE"
                                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        textLabel.TextStrokeTransparency = 0
                                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                        textLabel.TextSize = 14
                                        textLabel.Font = Enum.Font.GothamBold
                                    end
                                end
                            end
                        end
                    end
                )
            else
                for _, v1 in ipairs(workspace:GetDescendants()) do
                    if v1.Name == "StatueHL" or v1.Name == "StatueESP" then
                        func(
                            function()
                                v1:Destroy()
                            end
                        )
                    end
                end
            end
        end,
    }
)
tbl.idolESPConn = nil
v6:Toggle(
    {
        Title = "Idol Holder ESP", Desc = "Highlights whoever currently holds the statue",
        Value = false,
        Callback = function(arg1)
            if tbl.idolESPConn then
                tbl.idolESPConn:Disconnect()
                tbl.idolESPConn = nil
            end
            for _, v1 in pairs(workspace:GetDescendants()) do
                if v1.Name == "IdolHolderHL" then
                    func(
                        function()
                            v1:Destroy()
                        end
                    )
                end
            end
            if arg1 then
                local function func1()
                    for _, v1 in pairs(workspace:GetDescendants()) do
                        if v1.Name == "IdolHolderHL" then
                            func(
                                function()
                                    v1:Destroy()
                                end
                            )
                        end
                    end
                    local v2 = ReplicatedStorage:FindFirstChild("Season") and ReplicatedStorage.Season:FindFirstChild(
                        "Twists"
                    ) and ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
                    if not v2 or v2.Value == "" then
                        return
                    end
                    local v3 = Players:FindFirstChild(v2.Value)
                    if v3 and v3.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "IdolHolderHL"
                        highlight.FillColor = Color3.fromRGB(255, 215, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 215, 0)
                        highlight.FillTransparency = 0.4
                        highlight.OutlineTransparency = 0
                        highlight.Parent = v3.Character
                    end
                end
                func1()
                func(
                    function()
                        tbl.idolESPConn = ReplicatedStorage.Season.Twists.Idol.Changed:Connect(
                            function()
                                func1()
                            end
                        )
                    end
                )
            end
        end,
    }
)
tbl.idolSpam = false
v6:Toggle(
    {
        Title = "Play as Idol (Spam)",
        Desc = "Fires Idol remote rapidly — only works if you hold it", Value = false,
        Callback = function(arg1)
            tbl.idolSpam = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.idolSpam do
                            func(
                                function()
                                    ReplicatedStorage.Events.Idol:FireServer()
                                end
                            )
                            task.wait(0.1)
                        end
                    end
                )
            end
        end,
    }
)
v6:Button(
    {
        Title = "Play as Idol (Once)", Desc = "Fires Idol remote once",
        Callback = function()
            local v2, v3 = func(
                function()
                    ReplicatedStorage.Events.Idol:FireServer()
                end
            )
            v1:Notify(
                {
                    Title = "Play as Idol",
                    Content = v2 and "Fired! Only works if you are the idol holder." or "Failed: " .. tostring(
                        v3
                    ):sub(1, 60), Duration = 4,
                }
            )
        end,
    }
)
v6:Section({Title = "Votes"})
local v38
local v39
local v40
local v41
local v42
local v43
v6:Toggle(
    {
        Title = "Notify Votes", Desc = "Shows a notification each time a vote is cast",
        Value = false,
        Callback = function(arg1)
            if v38 then
                v38:Disconnect()
                v38 = nil
            end
            if arg1 then
                v38 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v2, v3 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v4, v5 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v2 and v4 then
                            v1:Notify(
                                {Title = "Vote Cast", Content = v3 .. " voted for " .. v5, Duration = 5}
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Print Votes to Console", Desc = "Prints each vote to the F9 developer console",
        Value = false,
        Callback = function(arg1)
            if v39 then
                v39:Disconnect()
                v39 = nil
            end
            if arg1 then
                v39 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            print("[Ella Hub] Vote: " .. v2 .. " → " .. v4)
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Expose Votes in Chat", Desc = "Sends each vote publicly in the game chat",
        Value = false,
        Callback = function(arg1)
            if v40 then
                v40:Disconnect()
                v40 = nil
            end
            if arg1 then
                v40 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            func(
                                function()
                                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(
                                        v2 .. " voted for " .. v4
                                    )
                                end
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Notify & Expose Exile Votes", Desc = "Notifies and exposes exile votes in chat",
        Value = false,
        Callback = function(arg1)
            if v41 then
                v41:Disconnect()
                v41 = nil
            end
            if arg1 then
                v41 = ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v2, v3 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v4, v5 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v2 and v4 then
                            local v6 = v3 .. " voted to exile " .. v5
                            v1:Notify({Title = "Exile Vote", Content = v6, Duration = 5})
                            func(
                                function()
                                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(v6)
                                end
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Notify Jury Votes", Desc = "Shows a notification each time a jury vote is cast",
        Value = false,
        Callback = function(arg1)
            if v42 then
                v42:Disconnect()
                v42 = nil
            end
            if arg1 then
                func(
                    function()
                        v42 = ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(
                            function(arg1)
                                local v2, v3 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Value].Value
                                    end
                                )
                                local v4, v5 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Name].Value
                                    end
                                )
                                if v2 and v4 then
                                    v1:Notify(
                                        {Title = "Jury Vote", Content = v3 .. " jury-voted for " .. v5, Duration = 5}
                                    )
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Expose Jury Votes in Chat", Desc = "Sends jury votes publicly in game chat",
        Value = false,
        Callback = function(arg1)
            if v43 then
                v43:Disconnect()
                v43 = nil
            end
            if arg1 then
                func(
                    function()
                        v43 = ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(
                            function(arg1)
                                local v1, v2 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Value].Value
                                    end
                                )
                                local v3, v4 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Name].Value
                                    end
                                )
                                if v1 and v3 then
                                    func(
                                        function()
                                            game.TextChatService.TextChannels.RBXGeneral:SendAsync(
                                                "[JURY] " .. v2 .. " jury-voted for " .. v4
                                            )
                                        end
                                    )
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
local flag = false
local v44
local tbl1 = {}
local tbl2 = {}
local function func9()
    flag = false
    for _, v1 in ipairs(tbl1) do
        func(
            function()
                v1.conn:Disconnect()
            end
        )
    end
    tbl1 = {}
    if v44 then
        func(
            function()
                v44:Destroy()
            end
        )
        v44 = nil
    end
end
local function func10()
    func9()
    flag = true
    local v1 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local v2 = v1 and 280 or 340
    local v3 = v1 and 210 or 270
    local v4 = v1 and 11 or 12
    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
    func(
        function()
            if gethui then
                PlayerGui = gethui()
            end
        end
    )
    if not PlayerGui then
        func(
            function()
                PlayerGui = game:GetService("CoreGui")
            end
        )
    end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "VoteLogGui"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    func(
        function()
            screenGui.IgnoreGuiInset = true
        end
    )
    screenGui.Parent = PlayerGui
    v44 = screenGui
    local frame = Instance.new("Frame")
    frame.Name = "VL"
    frame.Size = UDim2.fromOffset(v2, v3)
    frame.Position = UDim2.fromOffset(24, 130)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = screenGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local frame1 = Instance.new("Frame")
    frame1.Name = "TB"
    frame1.Size = UDim2.new(1, 0, 0, 30)
    frame1.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    frame1.BorderSizePixel = 0
    frame1.Parent = frame
    Instance.new("UICorner", frame1).CornerRadius = UDim.new(0, 8)
    local frame2 = Instance.new("Frame")
    frame2.Size = UDim2.new(1, 0, 0, 8)
    frame2.Position = UDim2.new(0, 0, 1, -8)
    frame2.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    frame2.BorderSizePixel = 0
    frame2.Parent = frame1
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.fromOffset(30, 30)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "🗑"
    textLabel.TextSize = 13
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    textLabel.Parent = frame1
    local textLabel1 = Instance.new("TextLabel")
    textLabel1.Size = UDim2.new(0, 80, 1, 0)
    textLabel1.Position = UDim2.fromOffset(32, 0)
    textLabel1.BackgroundTransparency = 1
    textLabel1.Text = "Vote Log"
    textLabel1.TextSize = 12
    textLabel1.Font = Enum.Font.GothamBold
    textLabel1.TextColor3 = Color3.fromRGB(210, 210, 210)
    textLabel1.TextXAlignment = Enum.TextXAlignment.Left
    textLabel1.Parent = frame1
    local function func1(arg1, arg2, arg3)
        local textButton = Instance.new("TextButton")
        textButton.Size = UDim2.fromOffset(30, 30)
        textButton.Position = UDim2.new(1, arg2, 0, 0)
        textButton.BackgroundTransparency = 1
        textButton.Text = arg1
        textButton.TextSize = arg3 or 14
        textButton.Font = Enum.Font.GothamBold
        textButton.TextColor3 = Color3.fromRGB(190, 190, 190)
        textButton.Parent = frame1
        return textButton
    end
    local v5 = func1("×", -30, 16)
    local v6 = func1("–", -60, 15)
    local v7 = func1("↓", -90, 13)
    local tbl = {
        {label = "Votes", key = "v", active = true, col = Color3.fromRGB(100, 180, 255)},
        {label = "Jury", key = "j", active = true, col = Color3.fromRGB(255, 200, 80)},
        {label = "Exile", key = "e", active = true, col = Color3.fromRGB(255, 120, 120)},
    }
    local num = 90
    for _, v8 in ipairs(tbl) do
        local textButton = Instance.new("TextButton")
        textButton.Size = UDim2.fromOffset(36, 16)
        textButton.Position = UDim2.fromOffset(num, 7)
        textButton.BackgroundColor3 = v8.active and v8.col or Color3.fromRGB(40, 40, 50)
        textButton.BackgroundTransparency = 0.3
        textButton.Text = v8.label
        textButton.TextSize = 9
        textButton.Font = Enum.Font.GothamBold
        textButton.TextColor3 = Color3.fromRGB(220, 220, 220)
        textButton.Parent = frame1
        Instance.new("UICorner", textButton).CornerRadius = UDim.new(1, 0)
        num = num + 38
        textButton.MouseButton1Click:Connect(
            function()
                v8.active = not v8.active
                textButton.BackgroundColor3 = v8.active and v8.col or Color3.fromRGB(40, 40, 50)
            end
        )
    end
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "SC"
    scrollingFrame.Size = UDim2.new(1, -4, 1, -33)
    scrollingFrame.Position = UDim2.new(0, 2, 0, 31)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 3
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 100)
    scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    scrollingFrame.CanvasSize = UDim2.fromOffset(0, 0)
    scrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Never
    scrollingFrame.Parent = frame
    local uIListLayout = Instance.new("UIListLayout")
    uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout.Padding = UDim.new(0, 1)
    uIListLayout.Parent = scrollingFrame
    local flag1 = true
    uIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            scrollingFrame.CanvasSize = UDim2.fromOffset(0, uIListLayout.AbsoluteContentSize.Y + 4)
            if flag1 then
                scrollingFrame.CanvasPosition = Vector2.new(0, math.huge)
            end
        end
    )
    scrollingFrame.InputBegan:Connect(
        function(arg1)
            if arg1.UserInputType == Enum.UserInputType.MouseWheel or arg1.UserInputType == Enum.UserInputType.Touch then
                flag1 = false
                v7.Text = "↑"
                v7.TextColor3 = Color3.fromRGB(160, 160, 160)
            end
        end
    )
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Name = "Empty"
    textLabel2.Size = UDim2.new(1, -6, 0, 22)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = "Waiting for votes..."
    textLabel2.TextSize = v4
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.TextColor3 = Color3.fromRGB(80, 80, 100)
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.LayoutOrder = 0
    textLabel2.Parent = scrollingFrame
    local num1 = 0
    local function func2(arg1, arg2, arg3)
        if not flag then
            return
        end
        local v2
        for _, v1 in ipairs(tbl) do
            if v1.key == arg3 then
                v2 = v1
                break
            end
        end
        if v2 and not v2.active then
            return
        end
        textLabel2.Visible = false
        num1 = num1 + 1
        table.insert(tbl2, {text = arg1, color = arg2, order = num1})
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, -6, 0, v4 + 5)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = arg1
        textLabel.TextColor3 = arg2
        textLabel.TextSize = v4
        textLabel.Font = Enum.Font.Gotham
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.TextTruncate = Enum.TextTruncate.AtEnd
        textLabel.LayoutOrder = num1
        textLabel.Parent = scrollingFrame
        if #tbl2 > 150 then
            for _, v3 in ipairs(scrollingFrame:GetChildren()) do
                if v3:IsA("TextLabel") and v3.Name ~= "Empty" then
                    v3:Destroy()
                    break
                end
            end
            table.remove(tbl2, 1)
        end
        if flag1 then
            scrollingFrame.CanvasPosition = Vector2.new(0, math.huge)
        end
    end
    if #tbl2 > 0 then
        textLabel2.Visible = false
    end
    for _, v9 in ipairs(tbl2) do
        local textLabel3 = Instance.new("TextLabel")
        textLabel3.Size = UDim2.new(1, -6, 0, v4 + 5)
        textLabel3.BackgroundTransparency = 1
        textLabel3.Text = v9.text
        textLabel3.TextColor3 = v9.color
        textLabel3.TextSize = v4
        textLabel3.Font = Enum.Font.Gotham
        textLabel3.TextXAlignment = Enum.TextXAlignment.Left
        textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
        textLabel3.LayoutOrder = v9.order
        textLabel3.Parent = scrollingFrame
    end
    num1 = #tbl2
    local function func3(arg1, arg2, arg3, arg4)
        local tbl = {}
        tbl.conn = nil
        local function func1()
            local v1, v2 = func(arg1)
            if not (v1 and v2) then
                return false
            end
            tbl.conn = v2.ChildAdded:Connect(
                function(arg1)
                    if not flag then
                        return
                    end
                    local v1, v2 = func(
                        function()
                            return ReplicatedStorage.Season.Players[arg1.Value].Value
                        end
                    )
                    local v3, v4 = func(
                        function()
                            return ReplicatedStorage.Season.Players[arg1.Name].Value
                        end
                    )
                    if v1 and v3 then
                        func2(
                            os.date("%H:%M") .. " " .. arg2 .. tostring(v2) .. " → " .. tostring(
                                v4
                            ), arg3, arg4
                        )
                    end
                end
            )
            table.insert(tbl1, tbl)
            return true
        end
        if not func1() then
            task.spawn(
                function()
                    while flag and not tbl.conn do
                        task.wait(1)
                        func1()
                    end
                end
            )
        end
    end
    func3(
        function()
            return ReplicatedStorage.Season.Voting.Votes
        end, "", Color3.fromRGB(140, 200, 255), "v"
    )
    func3(
        function()
            return ReplicatedStorage.Season.Players.JuryVotes
        end, "[JURY] ", Color3.fromRGB(255, 200, 80), "j"
    )
    func3(
        function()
            return ReplicatedStorage.Season.Twists.ExileVoting.Votes
        end, "[EXILE] ", Color3.fromRGB(255, 120, 120), "e"
    )
    v7.MouseButton1Click:Connect(
        function()
            flag1 = not flag1
            v7.Text = flag1 and "↓" or "↑"
            v7.TextColor3 = flag1 and Color3.fromRGB(90, 210, 90) or Color3.fromRGB(160, 160, 160)
            if flag1 then
                scrollingFrame.CanvasPosition = Vector2.new(0, math.huge)
            end
        end
    )
    local flag2 = false
    v6.MouseButton1Click:Connect(
        function()
            flag2 = not flag2
            frame.Size = UDim2.fromOffset(v2, flag2 and 30 or v3)
            scrollingFrame.Visible = not flag2
            v6.Text = flag2 and "+" or "–"
        end
    )
    v5.MouseButton1Click:Connect(func9)
    local flag3 = false
    local zero = Vector2.zero
    local zero1 = Vector2.zero
    frame1.InputBegan:Connect(
        function(arg1)
            if arg1.UserInputType == Enum.UserInputType.MouseButton1 or arg1.UserInputType == Enum.UserInputType.Touch then
                flag3 = true
                zero = Vector2.new(arg1.Position.X, arg1.Position.Y)
                local AbsolutePosition = frame.AbsolutePosition
                zero1 = Vector2.new(AbsolutePosition.X, AbsolutePosition.Y)
            end
        end
    )
    local connection = UserInputService.InputEnded:Connect(
        function(arg1)
            if arg1.UserInputType == Enum.UserInputType.MouseButton1 or arg1.UserInputType == Enum.UserInputType.Touch then
                flag3 = false
            end
        end
    )
    local connection1 = UserInputService.InputChanged:Connect(
        function(arg1)
            if not flag3 then
                return
            end
            if arg1.UserInputType == Enum.UserInputType.MouseMovement or arg1.UserInputType == Enum.UserInputType.Touch then
                local v1 = Vector2.new(arg1.Position.X, arg1.Position.Y) - zero
                local ViewportSize = workspace.CurrentCamera.ViewportSize
                frame.Position = UDim2.fromOffset(
                    math.clamp(zero1.X + v1.X, 0, ViewportSize.X - v2),
                    math.clamp(zero1.Y + v1.Y, 0, ViewportSize.Y - 30)
                )
            end
        end
    )
    screenGui.Destroying:Connect(
        function()
            connection:Disconnect()
            connection1:Disconnect()
        end
    )
end
v6:Button(
    {
        Title = "Vote Log GUI", Desc = "Opens a movable dark GUI logging all votes live",
        Callback = function()
            if flag then
                func9()
                v1:Notify({Title = "Vote Log", Content = "Closed.", Duration = 2})
            else
                func10()
                v1:Notify(
                    {Title = "Vote Log", Content = "Opened! Waiting for votes...", Duration = 3}
                )
            end
        end,
    }
)
local flag1 = false
local tbl3 = {}
v6:Toggle(
    {
        Title = "Tiebreaker Detector", Desc = "Watches votes live, alerts on tie and shows tally",
        Value = false,
        Callback = function(arg1)
            flag1 = arg1
            for _, v2 in ipairs(tbl3) do
                func(
                    function()
                        v2:Disconnect()
                    end
                )
            end
            tbl3 = {}
            if not arg1 then
                v1:Notify({Title = "Tiebreaker", Content = "Stopped.", Duration = 3})
                return
            end
            func(
                function()
                    local Votes = ReplicatedStorage:WaitForChild("Season", 5):WaitForChild(
                        "Voting", 5
                    ):WaitForChild("Votes", 5)
                    local tbl = {}
                    local function func1(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1].Value
                            end
                        )
                        return v1 and v2 ~= "" and v2 or arg1
                    end
                    local function func2()
                        local num = 0
                        for _, v2 in pairs(tbl) do
                            if v2 > num then
                                num = v2
                            end
                        end
                        if num == 0 then
                            return
                        end
                        local tbl1 = {}
                        for k, v3 in pairs(tbl) do
                            if v3 == num then
                                table.insert(tbl1, k)
                            end
                        end
                        if #tbl1 >= 2 then
                            local tbl2 = {}
                            for _, v4 in ipairs(tbl1) do
                                table.insert(tbl2, (func1(v4)))
                            end
                            v1:Notify(
                                {
                                    Title = "⚠ TIEBREAKER",
                                    Content = table.concat(tbl2, " vs ") .. " — " .. num .. " vote(s) each",
                                    Duration = 8,
                                }
                            )
                        end
                    end
                    for _, v2 in ipairs(Votes:GetChildren()) do
                        local Name = v2.Name
                        tbl[Name] = (tbl[Name] or 0) + 1
                    end
                    table.insert(
                        tbl3,
                        Votes.ChildAdded:Connect(
                            function(arg1)
                                if not flag1 then
                                    return
                                end
                                local Name = arg1.Name
                                tbl[Name] = (tbl[Name] or 0) + 1
                                v1:Notify(
                                    {
                                        Title = "Vote — " .. func1(arg1.Value),
                                        Content = func1(arg1.Value) .. " → " .. func1(Name) .. "  (" .. tbl[Name] .. " total)",
                                        Duration = 5,
                                    }
                                )
                                func2()
                            end
                        )
                    )
                    table.insert(
                        tbl3,
                        Votes.ChildRemoved:Connect(
                            function(arg1)
                                if not flag1 then
                                    return
                                end
                                local Name = arg1.Name
                                if tbl[Name] then
                                    tbl[Name] = tbl[Name] - 1
                                    if tbl[Name] <= 0 then
                                        tbl[Name] = nil
                                    end
                                end
                            end
                        )
                    )
                    v1:Notify({Title = "Tiebreaker", Content = "Watching votes.", Duration = 3})
                end
            )
        end,
    }
)
v6:Button(
    {
        Title = "Check Vote Tally", Desc = "Shows current vote counts",
        Callback = function()
            func(
                function()
                    local tbl = {}
                    for _, v2 in ipairs(ReplicatedStorage.Season.Voting.Votes:GetChildren()) do
                        local Name = v2.Name
                        tbl[Name] = (tbl[Name] or 0) + 1
                    end
                    local function func1(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1].Value
                            end
                        )
                        return v1 and v2 ~= "" and v2 or arg1
                    end
                    if next(tbl) == nil then
                        v1:Notify(
                            {Title = "Vote Tally", Content = "No votes cast yet.", Duration = 4}
                        )
                        return
                    end
                    local tbl1 = {}
                    for k, v3 in pairs(tbl) do
                        table.insert(tbl1, func1(k) .. ": " .. v3)
                    end
                    table.sort(
                        tbl1,
                        function(arg1, arg2)
                            return arg1 > arg2
                        end
                    )
                    v1:Notify(
                        {Title = "Vote Tally", Content = table.concat(tbl1, "\n"), Duration = 7}
                    )
                end
            )
        end,
    }
)
v6:Section({Title = "Round Info"})
local tbl4 = {
    Undecided = "Not decided yet.", normal = "Normal round.", purge = "🔥 PURGE round!",
    double = "⚡ Double elimination!", singleswap = "🔀 Sike — swap teams.",
    exile = "🏝️ Exile vote.", votereveal = "👁️ Vote reveal.", merge = "💥 MERGE!",
}
local v23 = v6:Group()
v23:Button(
    {
        Title = "Round Type", Justify = "Center", Icon = "solar:bolt-circle-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            func(
                function()
                    local CurrentTwist = ReplicatedStorage.Season.Twists:FindFirstChild(
                        "CurrentTwist"
                    )
                    if not CurrentTwist then
                        return
                    end
                    v1:Notify(
                        {Title = "Round Type", Content = tbl4[CurrentTwist.Value] or CurrentTwist.Value, Duration = 5}
                    )
                end
            )
        end,
    }
)
v23:Space({Columns = 0.5})
v23:Button(
    {
        Title = "Teamers", Justify = "Center", Icon = "solar:users-group-two-rounded-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            func(
                function()
                    local v2 = ReplicatedStorage:FindFirstChild("Season") and ReplicatedStorage.Season:FindFirstChild(
                        "Players"
                    )
                    if not v2 then
                        return
                    end
                    local function func1(arg1)
                        local v1 = v2:FindFirstChild(arg1.Name)
                        return v1 and v1.Value ~= "" and v1.Value or arg1.Name
                    end
                    local flag = false
                    local Players1 = Players:GetPlayers()
                    for i = 1, #Players1 do
                        for i1 = i + 1, #Players1 do
                            local v3, v4 = func(
                                function()
                                    return Players1[i]:IsFriendsWith(Players1[i1].UserId)
                                end
                            )
                            if v3 and v4 then
                                flag = true
                                v1:Notify(
                                    {
                                        Title = "Teamers!",
                                        Content = func1(Players1[i]) .. " & " .. func1(Players1[i1]) .. " are friends.",
                                        Duration = 5,
                                    }
                                )
                            end
                        end
                    end
                    if not flag then
                        v1:Notify(
                            {Title = "Teamers", Content = "No teamers detected.", Duration = 5}
                        )
                    end
                end
            )
        end,
    }
)
local flag2 = false
v6:Toggle(
    {
        Title = "Round Detector", Desc = "Notifies on twists BEFORE the round starts + merges",
        Value = false,
        Callback = function(arg1)
            flag2 = arg1
            if arg1 then
                task.spawn(
                    function()
                        local tbl = {}
                        local v2, v3 = func(
                            function()
                                return ReplicatedStorage.Season.Twists.CurrentTwist
                            end
                        )
                        if v2 and v3 then
                            if v3.Value and v3.Value ~= "" and v3.Value ~= "Undecided" then
                                v1:Notify(
                                    {Title = "Current Twist", Content = tbl4[v3.Value] or v3.Value, Duration = 6}
                                )
                            end
                            table.insert(
                                tbl,
                                v3.Changed:Connect(
                                    function(arg1)
                                        if not flag2 then
                                            return
                                        end
                                        local v2 = tbl4[arg1]
                                        if v2 then
                                            v1:Notify(
                                                {Title = "⚠️ Twist Incoming!", Content = v2, Duration = 8}
                                            )
                                        end
                                    end
                                )
                            )
                        end
                        while flag2 do
                            task.wait(1)
                        end
                        for _, v4 in ipairs(tbl) do
                            func(
                                function()
                                    v4:Disconnect()
                                end
                            )
                        end
                    end
                )
                v1:Notify(
                    {Title = "Round Detector", Content = "Watching for twists and merges.", Duration = 3}
                )
            end
        end,
    }
)
v6:Section({Title = "Server Hop"})
tbl.hopOnMerge = false
tbl.mergeHopConn = nil
v6:Toggle(
    {
        Title = "Server Hop on Merge", Desc = "Teleports to a new server when merge triggers",
        Value = false,
        Callback = function(arg1)
            tbl.hopOnMerge = arg1
            if tbl.mergeHopConn then
                tbl.mergeHopConn:Disconnect()
                tbl.mergeHopConn = nil
            end
            if arg1 then
                func(
                    function()
                        tbl.mergeHopConn = ReplicatedStorage:WaitForChild("Season", 5):WaitForChild(
                            "Values", 5
                        ):WaitForChild("Merge", 5).Changed:Connect(
                            function(arg1)
                                if arg1 == true and tbl.hopOnMerge then
                                    v1:Notify(
                                        {Title = "Server Hop", Content = "Merge detected! Hopping server...", Duration = 4}
                                    )
                                    task.wait(0.5)
                                    func(
                                        function()
                                            game:GetService("TeleportService"):Teleport(
                                                game.PlaceId, LocalPlayer
                                            )
                                        end
                                    )
                                end
                            end
                        )
                    end
                )
                v1:Notify({Title = "Server Hop", Content = "Watching for merge.", Duration = 3})
            end
        end,
    }
)
v6:Button(
    {
        Title = "Server Hop Now", Desc = "Immediately teleports to a new server",
        Callback = function()
            v1:Notify({Title = "Server Hop", Content = "Hopping to a new server...", Duration = 3})
            task.wait(0.5)
            local v2, v3 = func(
                function()
                    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
                end
            )
            if not v2 then
                v1:Notify(
                    {Title = "Server Hop", Content = "Failed: " .. tostring(v3):sub(1, 60), Duration = 5}
                )
            end
        end,
    }
)
v6:Section({Title = "Auto Farm & Rejoin"})
tbl.autoRejoinActive = false
tbl.gameStarted = false
tbl.rejoinConn = nil
v6:Toggle(
    {
        Title = "Auto Rejoin When Voted Out", Desc = "Rejoins Camp when voted out", Value = false,
        Callback = function(arg1)
            tbl.autoRejoinActive = arg1
            tbl.gameStarted = false
            if tbl.rejoinConn then
                tbl.rejoinConn:Disconnect()
                tbl.rejoinConn = nil
            end
            if arg1 then
                task.spawn(
                    function()
                        while tbl.autoRejoinActive do
                            func(
                                function()
                                    local Team = LocalPlayer.Team
                                    if Team then
                                        if Team.Name ~= "Spectator" and Team.Name ~= "Jury" then
                                            tbl.gameStarted = true
                                        elseif (Team.Name == "Spectator" or Team.Name == "Jury") and tbl.gameStarted then
                                            tbl.gameStarted = false
                                            v1:Notify(
                                                {Title = "Auto Rejoin", Content = "Voted out! Rejoining Camp...", Duration = 4}
                                            )
                                            task.wait(1)
                                            game:GetService("TeleportService"):Teleport(
                                                4889315193, LocalPlayer
                                            )
                                        end
                                    end
                                end
                            )
                            task.wait(1)
                        end
                    end
                )
                v1:Notify(
                    {Title = "Auto Rejoin", Content = "Active — watching your team status.", Duration = 3}
                )
            end
        end,
    }
)
tbl.aboveMapActive = false
tbl.abovePart = nil
v6:Toggle(
    {
        Title = "TP Above Map", Desc = "Creates invisible platform and keeps you there",
        Value = false,
        Callback = function(arg1)
            tbl.aboveMapActive = arg1
            if arg1 then
                func(
                    function()
                        if tbl.abovePart then
                            tbl.abovePart:Destroy()
                            tbl.abovePart = nil
                        end
                        tbl.abovePart = Instance.new("Part", workspace)
                        tbl.abovePart.Anchored = true
                        tbl.abovePart.Size = Vector3.new(300, 10, 300)
                        tbl.abovePart.CFrame = CFrame.new(0, 2900, 0)
                        tbl.abovePart.Transparency = 1
                        tbl.abovePart.CanCollide = true
                        tbl.abovePart.Name = "EllaHubPlatform"
                    end
                )
                task.spawn(
                    function()
                        while tbl.aboveMapActive do
                            func(
                                function()
                                    local v1 = func1()
                                    if v1 then
                                        v1.CFrame = CFrame.new(0, 3000, 0)
                                    end
                                end
                            )
                            task.wait(0.1)
                        end
                        if tbl.abovePart then
                            tbl.abovePart:Destroy()
                            tbl.abovePart = nil
                        end
                    end
                )
                v1:Notify({Title = "Above Map", Content = "Floating at Y=3000.", Duration = 3})
            else
                if tbl.abovePart then
                    tbl.abovePart:Destroy()
                    tbl.abovePart = nil
                end
                v1:Notify({Title = "Above Map", Content = "Disabled.", Duration = 2})
            end
        end,
    }
)
tbl.autoLobbyJoin = false
v6:Toggle(
    {
        Title = "Auto Join Camp From Lobby", Desc = "Fires Teleport:Camp remote every 5s",
        Value = false,
        Callback = function(arg1)
            tbl.autoLobbyJoin = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.autoLobbyJoin do
                            func(
                                function()
                                    ReplicatedStorage.Events.Teleport:FireServer("Camp")
                                end
                            )
                            task.wait(5)
                        end
                    end
                )
                v1:Notify(
                    {Title = "Auto Join", Content = "Firing Teleport:Camp every 5s...", Duration = 3}
                )
            else
                v1:Notify({Title = "Auto Join", Content = "Stopped.", Duration = 2})
            end
        end,
    }
)
v6:Section({Title = "Elimination Reason"})
local v45
local v46
local v47
tbl.hookedElim = {}
local function func11(arg1, arg2)
    task.spawn(
        function()
            local v1 = arg1:FindFirstChild("ElimReason") or arg1:WaitForChild("ElimReason", 5)
            if not v1 or tbl.hookedElim[v1] then
                return
            end
            tbl.hookedElim[v1] = true
            local Value = v1.Value
            v1.Changed:Connect(
                function(arg3)
                    if arg3 and arg3 ~= "" and arg3 ~= Value then
                        Value = arg3
                        arg2(arg1.Name, arg3)
                    end
                end
            )
        end
    )
end
v6:Button(
    {
        Title = "Check Elim Reason", Desc = "Shows current elimination reasons",
        Callback = function()
            func(
                function()
                    local flag = false
                    for _, v2 in pairs(
                        ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
                    ) do
                        local ElimReason = v2:FindFirstChild("ElimReason")
                        if ElimReason and ElimReason.Value ~= "" then
                            v1:Notify(
                                {Title = "Elim - " .. v2.Name, Content = ElimReason.Value, Duration = 5}
                            )
                            flag = true
                        end
                    end
                    if not flag then
                        v1:Notify({Title = "Elim Reason", Content = "None set yet.", Duration = 4})
                    end
                end
            )
        end,
    }
)
v6:Toggle(
    {
        Title = "Notify Elim Reason", Desc = "Shows notification when players are eliminated",
        Value = false,
        Callback = function(arg1)
            if v45 then
                v45:Disconnect()
                v45 = nil
            end
            tbl.hookedElim = {}
            if arg1 then
                func(
                    function()
                        local Characters = ReplicatedStorage.Products.CharacterSelection.Characters
                        for _, v2 in pairs(Characters:GetChildren()) do
                            func11(
                                v2,
                                function(arg1, arg2)
                                    v1:Notify(
                                        {Title = "Eliminated - " .. arg1, Content = arg2, Duration = 5}
                                    )
                                end
                            )
                        end
                        v45 = Characters.ChildAdded:Connect(
                            function(arg1)
                                func11(
                                    arg1,
                                    function(arg1, arg2)
                                        v1:Notify(
                                            {Title = "Eliminated - " .. arg1, Content = arg2, Duration = 5}
                                        )
                                    end
                                )
                            end
                        )
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Expose Elim in Chat", Desc = "Sends eliminations publicly in game chat",
        Value = false,
        Callback = function(arg1)
            if v46 then
                v46:Disconnect()
                v46 = nil
            end
            tbl.hookedElim = {}
            if arg1 then
                func(
                    function()
                        local Characters = ReplicatedStorage.Products.CharacterSelection.Characters
                        local function func1(arg1, arg2)
                            func(
                                function()
                                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(
                                        arg1 .. " was eliminated: " .. arg2
                                    )
                                end
                            )
                        end
                        for _, v1 in pairs(Characters:GetChildren()) do
                            func11(v1, func1)
                        end
                        v46 = Characters.ChildAdded:Connect(
                            function(arg1)
                                func11(arg1, func1)
                            end
                        )
                    end
                )
            end
        end,
    }
)
v6:Toggle(
    {
        Title = "Send Elim to Webhook", Desc = "Posts eliminations to your Discord webhook",
        Value = false,
        Callback = function(arg1)
            if v47 then
                v47:Disconnect()
                v47 = nil
            end
            tbl.hookedElim = {}
            if arg1 then
                func(
                    function()
                        local Characters = ReplicatedStorage.Products.CharacterSelection.Characters
                        local function func(arg1, arg2)
                            sendWH("**" .. arg1 .. " was eliminated:** " .. arg2)
                        end
                        for _, v1 in pairs(Characters:GetChildren()) do
                            func11(v1, func)
                        end
                        v47 = Characters.ChildAdded:Connect(
                            function(arg1)
                                func11(arg1, func)
                            end
                        )
                    end
                )
            end
        end,
    }
)
v6:Section({Title = "Utilities"})
v6:Button(
    {
        Title = "Remove Intro Cutscene", Desc = "Destroys the intro camera cutscene",
        Callback = function()
            func(
                function()
                    local Events = ReplicatedStorage:FindFirstChild("Events")
                    local v1 = Events and Events:FindFirstChild("Camera")
                    if v1 then
                        v1:Destroy()
                    end
                    local v2 = func2()
                    if v2 then
                        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                        workspace.CurrentCamera.CameraSubject = v2
                    end
                end
            )
        end,
    }
)
v6:Button(
    {
        Title = "Fling / Reanimate", Desc = "Executes the reanimate script",
        Callback = function()
            loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua"
                )
            )()
        end,
    }
)
v6:Button(
    {
        Title = "Open Console", Desc = "Opens the developer console",
        Callback = function()
            StarterGui:SetCore("DevConsoleVisible", true)
        end,
    }
)
local v48
v6:Toggle(
    {
        Title = "Auto-Block Long Usernames",
        Desc = "Truncates very long display names to prevent lag", Value = false,
        Callback = function(arg1)
            if v48 then
                v48:Disconnect()
                v48 = nil
            end
            if arg1 then
                v48 = RunService.RenderStepped:Connect(
                    function()
                        for _, v1 in pairs(Players:GetPlayers()) do
                            func(
                                function()
                                    local v2 = v1.Character and v1.Character:FindFirstChild("Head")
                                    if not v2 then
                                        return
                                    end
                                    local v3 = v2:FindFirstChild("NameGUI") or v2:FindFirstChild(
                                        "playerName"
                                    )
                                    if not v3 then
                                        return
                                    end
                                    local v4 = v3:FindFirstChild("Sector") and v3.Sector:FindFirstChild(
                                        "name"
                                    )
                                    if v4 and v4:IsA("TextLabel") and #v4.Text > 700 then
                                        v4.Text = v4.Text:sub(1, 1) .. "..."
                                    end
                                end
                            )
                        end
                    end
                )
            end
        end,
    }
)
v6:Section({Title = "Gear Keeper"})
tbl.gearActive = false
tbl.gearConns = {}
tbl.savedGear = {}
local function func12()
    for _, v1 in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if v1:IsA("Tool") then
            local v2 = v1:Clone()
            v2.Parent = nil
            tbl.savedGear[v1.Name] = v2
        end
    end
    if LocalPlayer.Character then
        for _, v3 in ipairs(LocalPlayer.Character:GetChildren()) do
            if v3:IsA("Tool") then
                local v4 = v3:Clone()
                v4.Parent = nil
                tbl.savedGear[v3.Name] = v4
            end
        end
    end
end
local function func13()
    tbl.gearActive = false
    for _, v1 in ipairs(tbl.gearConns) do
        func(
            function()
                v1:Disconnect()
            end
        )
    end
    tbl.gearConns = {}
end
v6:Toggle(
    {
        Title = "Gear Keeper", Desc = "Restores tools after round ends", Value = false,
        Callback = function(arg1)
            func13()
            tbl.savedGear = {}
            if not arg1 then
                v1:Notify({Title = "Gear Keeper", Content = "Off.", Duration = 2})
                return
            end
            tbl.gearActive = true
            func12()
            table.insert(
                tbl.gearConns,
                LocalPlayer.Backpack.ChildAdded:Connect(
                    function(arg1)
                        if not tbl.gearActive or not arg1:IsA("Tool") then
                            return
                        end
                        task.wait(0.05)
                        local v1 = arg1:Clone()
                        v1.Parent = nil
                        tbl.savedGear[arg1.Name] = v1
                    end
                )
            )
            table.insert(
                tbl.gearConns,
                LocalPlayer.Backpack.ChildRemoved:Connect(
                    function(arg1)
                        if not tbl.gearActive or not arg1:IsA("Tool") then
                            return
                        end
                        local v1 = tbl.savedGear[arg1.Name]
                        if not v1 then
                            return
                        end
                        task.defer(
                            function()
                                if not tbl.gearActive then
                                    return
                                end
                                if not func(
                                    function()
                                        v1:Clone().Parent = LocalPlayer.Backpack
                                    end
                                ) then
                                    func(
                                        function()
                                            if LocalPlayer.Character then
                                                v1:Clone().Parent = LocalPlayer.Character
                                            end
                                        end
                                    )
                                end
                            end
                        )
                    end
                )
            )
            table.insert(
                tbl.gearConns,
                LocalPlayer.CharacterAdded:Connect(
                    function()
                        task.wait(1)
                        if not tbl.gearActive then
                            return
                        end
                        for _, v1 in pairs(tbl.savedGear) do
                            func(
                                function()
                                    v1:Clone().Parent = LocalPlayer.Backpack
                                end
                            )
                        end
                    end
                )
            )
            local num = 0
            for _ in pairs(tbl.savedGear) do
                num = num + 1
            end
            v1:Notify(
                {Title = "Gear Keeper", Content = "Active — saved " .. num .. " tool(s).", Duration = 3}
            )
        end,
    }
)
v6:Button(
    {
        Title = "Snapshot Gear Now", Desc = "Manually saves current tools",
        Callback = function()
            func12()
            local num = 0
            for _ in pairs(tbl.savedGear) do
                num = num + 1
            end
            v1:Notify(
                {Title = "Gear Keeper", Content = "Saved " .. num .. " tool(s).", Duration = 3}
            )
        end,
    }
)
v6:Button(
    {
        Title = "Restore Gear Now", Desc = "Immediately returns saved tools",
        Callback = function()
            local num = 0
            for k, v2 in pairs(tbl.savedGear) do
                func(
                    function()
                        if not LocalPlayer.Backpack:FindFirstChild(k) then
                            v2:Clone().Parent = LocalPlayer.Backpack
                            num = num + 1
                        end
                    end
                )
            end
            v1:Notify(
                {Title = "Gear Keeper", Content = "Restored " .. num .. " tool(s).", Duration = 3}
            )
        end,
    }
)
v6:Section({Title = "Anti Gear Removal"})
tbl.antiGearActive = false
tbl.antiGearHooked = false
local function func14()
    if tbl.antiGearHooked then
        return
    end
    tbl.antiGearHooked = true
    func(
        function()
            local Gear = ReplicatedStorage.Events.Gear
            if hookmetamethod then
                local v2
                v2 = hookmetamethod(
                    game, "__namecall",
                    newcclosure(
                        function(arg1, ...)
                            local v3 = getnamecallmethod()
                            if tbl.antiGearActive then
                                if arg1 == Gear and (v3 == "FireServer" or v3 == "InvokeServer") then
                                    local v4 = select(1, ...)
                                    if tostring(v4):lower() == "remove" then
                                        v1:Notify(
                                            {Title = "Anti Gear", Content = "Blocked Gear Remove!", Duration = 3}
                                        )
                                        return
                                    end
                                end
                                if v3 == "ClearAllChildren" and arg1 == LocalPlayer.Backpack then
                                    v1:Notify(
                                        {Title = "Anti Gear", Content = "Blocked ClearAllChildren!", Duration = 3}
                                    )
                                    return
                                end
                                if v3 == "Destroy" then
                                    local v5, v6 = func(
                                        function()
                                            return arg1:IsA("Tool")
                                        end
                                    )
                                    if v5 and v6 and arg1.Parent == LocalPlayer.Backpack then
                                        return
                                    end
                                end
                            end
                            return v2(arg1, ...)
                        end
                    )
                )
            else
                local v3 = getrawmetatable(game)
                if not v3 then
                    return
                end
                local __namecall = v3.__namecall
                setreadonly(v3, false)
                v3.__namecall = newcclosure(
                    function(arg1, ...)
                        local v1 = getnamecallmethod()
                        if tbl.antiGearActive then
                            if arg1 == Gear and (v1 == "FireServer" or v1 == "InvokeServer") then
                                local v2 = select(1, ...)
                                if tostring(v2):lower() == "remove" then
                                    return
                                end
                            end
                            if v1 == "ClearAllChildren" and arg1 == LocalPlayer.Backpack then
                                return
                            end
                            if v1 == "Destroy" then
                                local v3, v4 = func(
                                    function()
                                        return arg1:IsA("Tool")
                                    end
                                )
                                if v3 and v4 and arg1.Parent == LocalPlayer.Backpack then
                                    return
                                end
                            end
                        end
                        return __namecall(arg1, ...)
                    end
                )
                setreadonly(v3, true)
            end
        end
    )
end
v6:Toggle(
    {
        Title = "Anti Gear Removal", Desc = "Blocks Gear:FireServer Remove + ClearBackpack",
        Value = false,
        Callback = function(arg1)
            tbl.antiGearActive = arg1
            if arg1 then
                func14()
                v1:Notify(
                    {Title = "Anti Gear", Content = "Active — Gear Remove calls blocked.", Duration = 3}
                )
            else
                v1:Notify(
                    {Title = "Anti Gear", Content = "Off — gear can be removed normally.", Duration = 2}
                )
            end
        end,
    }
)
v7:Section({Title = "Free"})
local v24 = v7:Group()
v24:Button(
    {
        Title = "Set Male", Justify = "Center", Icon = "solar:user-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            ReplicatedStorage.Events.Buy:FireServer("Gender", "Male")
        end,
    }
)
v24:Space({Columns = 0.5})
v24:Button(
    {
        Title = "Set Female", Justify = "Center", Icon = "solar:user-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            ReplicatedStorage.Events.Buy:FireServer("Gender", "Female")
        end,
    }
)
v7:Section({Title = "Buy Character"})
local str = ""
local str1 = ""
local tbl5 = {None = "", Verified = "", Premium = "", Robux = ""}
v7:Dropdown(
    {
        Title = "Symbol", Desc = "Choose a symbol to append to the character name",
        Values = {"None", "Verified", "Premium", "Robux"}, Value = 1,
        Callback = function(arg1)
            str = tbl5[arg1] or ""
        end,
    }
)
v7:Input(
    {
        Title = "Character Name", Desc = "Type the exact character name to purchase",
        Placeholder = "Enter name...",
        Callback = function(arg1)
            str1 = arg1
        end,
    }
)
v7:Button(
    {
        Title = "Buy Character (60 coins)", Desc = "Fires the buy remote with your entered name",
        Callback = function()
            if str1 == "" then
                v1:Notify({Title = "Buy", Content = "Enter a character name first.", Duration = 3})
                return
            end
            ReplicatedStorage.Events.Buy:FireServer(
                "Character", str1 .. (str ~= "" and " " .. str or "")
            )
        end,
    }
)
v7:Section({Title = "Map Themes"})
local function func15()
    func(
        function()
            Lighting.Ambient = Color3.fromRGB(127, 127, 127)
            Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            Lighting.FogEnd = 100000
            Lighting.ClockTime = 14
        end
    )
end
v7:Button(
    {
        Title = "Christmas Map", Desc = "Snow + white trees",
        Callback = function()
            for _, v2 in pairs(workspace:GetDescendants()) do
                if v2.Name == "SnowCover" or v2.Name == "SnowfallEmitter" then
                    func(
                        function()
                            v2:Destroy()
                        end
                    )
                end
            end
            local brickColor = BrickColor.new("White")
            for _, v3 in ipairs(workspace:GetDescendants()) do
                if v3:IsA("BasePart") then
                    local v4 = v3.BrickColor.Name:lower()
                    if v4 == "olivine" or v4:find("green") then
                        v3.BrickColor = brickColor
                    end
                end
                if v3:IsA("MeshPart") and v3.Name == "Leaves" then
                    func(
                        function()
                            local v1 = v3:Clone()
                            v1.Name = "SnowCover"
                            v1.BrickColor = brickColor
                            v1.Material = Enum.Material.SmoothPlastic
                            v1.Transparency = 0
                            v1.CanCollide = false
                            v1.Parent = v3.Parent
                            v1.CFrame = v3.CFrame * CFrame.new(0, 0.25, 0)
                            local weldConstraint = Instance.new("WeldConstraint")
                            weldConstraint.Part0 = v3
                            weldConstraint.Part1 = v1
                            weldConstraint.Parent = v1
                        end
                    )
                end
            end
            func15()
            v1:Notify({Title = "Map Theme", Content = "Christmas applied!", Duration = 3})
        end,
    }
)
v7:Button(
    {
        Title = "Halloween Map", Desc = "Rust leaves + dark foggy lighting",
        Callback = function()
            for _, v2 in pairs(workspace:GetDescendants()) do
                if v2.Name == "SnowCover" or v2.Name == "SnowfallEmitter" then
                    func(
                        function()
                            v2:Destroy()
                        end
                    )
                end
            end
            for _, v3 in ipairs(workspace:GetDescendants()) do
                if v3:IsA("BasePart") then
                    local v4 = v3.Name:lower()
                    if v4:find("leaf") or v4:find("leaves") then
                        v3.BrickColor = BrickColor.new("Rust")
                    elseif v4:find("trunk") or v4:find("tree") then
                        v3.BrickColor = BrickColor.new("Reddish brown")
                    elseif v4:find("grass") then
                        v3.BrickColor = BrickColor.new(Color3.fromRGB(122, 130, 102))
                    end
                end
            end
            func(
                function()
                    Lighting.Ambient = Color3.fromRGB(80, 80, 80)
                    Lighting.OutdoorAmbient = Color3.fromRGB(80, 80, 80)
                    Lighting.FogColor = Color3.fromRGB(70, 70, 70)
                    Lighting.FogEnd = 300
                    Lighting.ClockTime = 16
                end
            )
            v1:Notify({Title = "Map Theme", Content = "Halloween applied!", Duration = 3})
        end,
    }
)
v7:Button(
    {
        Title = "Valentines Map", Desc = "Pink leaves + rose water",
        Callback = function()
            for _, v2 in pairs(workspace:GetDescendants()) do
                if v2.Name == "SnowCover" or v2.Name == "SnowfallEmitter" then
                    func(
                        function()
                            v2:Destroy()
                        end
                    )
                end
            end
            local v3 = Color3.fromRGB(255, 152, 220)
            for _, v4 in ipairs(workspace:GetDescendants()) do
                if v4:IsA("MeshPart") and v4.Name == "Leaves" then
                    v4.Color = v3
                    v4.Material = Enum.Material.SmoothPlastic
                end
            end
            func15()
            v1:Notify({Title = "Map Theme", Content = "Valentines applied!", Duration = 3})
        end,
    }
)
v7:Button(
    {
        Title = "Reset Map", Desc = "Removes snow + restores lighting",
        Callback = function()
            for _, v2 in pairs(workspace:GetDescendants()) do
                if v2.Name == "SnowCover" or v2.Name == "SnowfallEmitter" then
                    func(
                        function()
                            v2:Destroy()
                        end
                    )
                end
            end
            func15()
            v1:Notify({Title = "Map Theme", Content = "Reset done.", Duration = 3})
        end,
    }
)
v8:Section({Title = "Movement"})
v8:Space({Columns = 2})
v8:Slider(
    {
        Title = "Walk Speed", IsTooltip = true, Step = 1,
        Value = {Min = 1, Max = 350, Default = 16},
        Icons = {From = "solar:ghost-bold", To = "solar:running-2-bold"},
        Callback = function(arg1)
            local v1 = func2()
            if v1 then
                v1.WalkSpeed = arg1
            end
        end,
    }
)
v8:Space({Columns = 1})
v8:Slider(
    {
        Title = "Jump Power", IsTooltip = true, Step = 1,
        Value = {Min = 1, Max = 350, Default = 50},
        Icons = {From = "solar:arrow-up-bold", To = "solar:rocket-bold"},
        Callback = function(arg1)
            local v1 = func2()
            if v1 then
                v1.JumpPower = arg1
            end
        end,
    }
)
v8:Section({Title = "Timer"})
tbl.timerFreezeConn = nil
tbl.frozenTimerText = ""
v8:Toggle(
    {
        Title = "Freeze Timer Display", Desc = "Locks the on-screen timer so it stops counting",
        Value = false,
        Callback = function(arg1)
            if tbl.timerFreezeConn then
                tbl.timerFreezeConn:Disconnect()
                tbl.timerFreezeConn = nil
            end
            if arg1 then
                func(
                    function()
                        local Timer = ReplicatedStorage:WaitForChild("GuiTexts", 5):WaitForChild(
                            "Timer", 5
                        )
                        local v1 = tonumber(Timer.Value) or 0
                        tbl.frozenTimerText = string.format("%d:%02d", math.floor(v1 / 60), v1 % 60)
                    end
                )
                tbl.timerFreezeConn = RunService.RenderStepped:Connect(
                    function()
                        func(
                            function()
                                for _, v1 in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
                                    if v1:IsA("TextLabel") and (v1.Name == "Text" or v1.Name == "Timer") and v1.Text:match(
                                        "^%d+:%d%d$"
                                    ) then
                                        v1.Text = tbl.frozenTimerText
                                    end
                                end
                            end
                        )
                    end
                )
                v1:Notify(
                    {Title = "Timer", Content = "Timer display frozen at " .. tbl.frozenTimerText, Duration = 3}
                )
            else
                v1:Notify({Title = "Timer", Content = "Timer display unfrozen.", Duration = 2})
            end
        end,
    }
)
v8:Toggle(
    {
        Title = "Hide Timer", Desc = "Makes the timer GUI invisible", Value = false,
        Callback = function(arg1)
            func(
                function()
                    for _, v2 in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
                        if v2.Name == "Timer" then
                            v2.Enabled = not arg1
                        end
                    end
                    v1:Notify(
                        {Title = "Timer", Content = arg1 and "Timer hidden." or "Timer shown.", Duration = 2}
                    )
                end
            )
        end,
    }
)
v8:Section({Title = "Map"})
v8:Button(
    {
        Title = "Remove Glass Barriers", Desc = "Destroys all glass barrier parts in the map",
        Callback = function()
            for _, v1 in pairs(workspace:GetDescendants()) do
                if v1.Name == "Glass" then
                    func(
                        function()
                            v1:Destroy()
                        end
                    )
                end
            end
        end,
    }
)
v8:Toggle(
    {
        Title = "Walk on Lake", Desc = "Enables lake collision", Value = false,
        Callback = function(arg1)
            func(
                function()
                    workspace.Map["Roblox Drama: Camp"].Map.Lake.Water.CanCollide = arg1
                end
            )
        end,
    }
)
v8:Button(
    {
        Title = "Lake God-Mode", Desc = "Destroys the lake sand touch interest",
        Callback = function()
            func(
                function()
                    workspace.Map["Roblox Drama: Camp"].Sand.TouchInterest:Destroy()
                end
            )
        end,
    }
)
v8:Section({Title = "Target Player"})
local str2 = ""
local v49
local function func16()
    local tbl = {}
    local v1, v2 = func(
        function()
            return ReplicatedStorage:WaitForChild("Season", 5):WaitForChild("Players", 5)
        end
    )
    if not v1 or not v2 then
        return tbl
    end
    for _, v3 in ipairs(v2:GetChildren()) do
        if v3:IsA("ValueBase") and v3.Name ~= LocalPlayer.Name and v3.Value ~= "" then
            table.insert(tbl, v3.Value)
        end
    end
    return tbl
end
local function func17(arg1)
    local v1 = func16()
    if #v1 == 0 then
        v1 = {"(none)"}
    end
    arg1:Refresh(v1)
    str2 = v1[1]
end
local v25 = func16()
local v26 = v8:Dropdown(
    {
        Title = "Choose Player", Desc = "Select a player to target",
        Values = #v25 > 0 and v25 or {"(none)"}, Value = 1,
        Callback = function(arg1)
            str2 = arg1
        end,
    }
)
if #v25 > 0 then
    str2 = v25[1]
end
Players.PlayerAdded:Connect(
    function()
        task.wait(1)
        func17(v26)
    end
)
Players.PlayerRemoving:Connect(
    function()
        task.wait(0.1)
        func17(v26)
    end
)
local v27 = v8:Group()
v27:Button(
    {
        Title = "Teleport To", Justify = "Center", Icon = "solar:map-point-bold",
        IconAlign = "Left", Size = "Small",
        Callback = function()
            func(
                function()
                    local v1 = ReplicatedStorage:FindFirstChild("Season") and ReplicatedStorage.Season:FindFirstChild(
                        "Players"
                    )
                    if not v1 then
                        return
                    end
                    for _, v2 in ipairs(v1:GetChildren()) do
                        if v2.Value == str2 then
                            local v3 = Players:FindFirstChild(v2.Name)
                            if v3 and v3.Character and v3.Character:FindFirstChild(
                                "HumanoidRootPart"
                            ) then
                                local v4 = func1()
                                if v4 then
                                    v4.CFrame = v3.Character.HumanoidRootPart.CFrame
                                end
                            end
                            break
                        end
                    end
                end
            )
        end,
    }
)
v27:Space({Columns = 0.5})
v27:Button(
    {
        Title = "Refresh List", Justify = "Center", Icon = "solar:refresh-bold", IconAlign = "Left",
        Size = "Small",
        Callback = function()
            func17(v26)
            v1:Notify(
                {Title = "Player List", Content = "Refreshed " .. #func16() .. " players.", Duration = 2}
            )
        end,
    }
)
v8:Toggle(
    {
        Title = "Highlight Player", Desc = "Adds a yellow highlight to the selected player",
        Value = false,
        Callback = function(arg1)
            func(
                function()
                    local v1 = ReplicatedStorage:FindFirstChild("Season") and ReplicatedStorage.Season:FindFirstChild(
                        "Players"
                    )
                    if not v1 then
                        return
                    end
                    for _, v2 in ipairs(v1:GetChildren()) do
                        if v2.Value == str2 then
                            local v3 = Players:FindFirstChild(v2.Name)
                            if not v3 or not v3.Character then
                                return
                            end
                            if v49 then
                                v49:Destroy()
                                v49 = nil
                            end
                            if arg1 then
                                v49 = Instance.new("Highlight")
                                v49.FillColor = Color3.fromRGB(255, 221, 0)
                                v49.OutlineColor = Color3.fromRGB(255, 221, 0)
                                v49.FillTransparency = 0.5
                                v49.OutlineTransparency = 0
                                v49.Parent = v3.Character
                            end
                            break
                        end
                    end
                end
            )
        end,
    }
)
v9:Section({Title = "Player Stats"})
local tbl6 = {}
for _, v28 in ipairs(Players:GetPlayers()) do
    table.insert(tbl6, v28.Name)
end
local v29 = tbl6[1] or ""
local v30 = v9:Dropdown(
    {
        Title = "Choose Player", Desc = "Select a player to view their stats",
        Values = #tbl6 > 0 and tbl6 or {"(none)"}, Value = 1,
        Callback = function(arg1)
            v29 = arg1
        end,
    }
)
v9:Button(
    {
        Title = "Refresh List", Desc = "Updates the list with current players",
        Callback = function()
            local tbl = {}
            for _, v1 in ipairs(Players:GetPlayers()) do
                table.insert(tbl, v1.Name)
            end
            v30:Refresh(tbl)
            if #tbl > 0 then
                v29 = tbl[1]
            end
        end,
    }
)
local function func18(arg1)
    local v2 = Players:FindFirstChild(v29)
    if not v2 then
        v1:Notify({Title = "Stats", Content = "Player not found.", Duration = 4})
        return nil
    end
    local DataStore = v2:FindFirstChild("DataStore")
    if not DataStore then
        v1:Notify({Title = "Stats", Content = "No DataStore.", Duration = 4})
        return nil
    end
    local v3 = DataStore:FindFirstChild(arg1)
    if not v3 then
        v1:Notify({Title = "Stats", Content = arg1 .. " not found.", Duration = 4})
        return nil
    end
    return v3
end
local function func19(arg1, arg2, arg3, arg4, arg5)
    v9:Button(
        {
            Title = arg1, Desc = arg4,
            Callback = function()
                local v2 = func18(arg2)
                if v2 then
                    v1:Notify({Title = arg3, Content = arg5(v2), Duration = 5})
                end
            end,
        }
    )
end
func19(
    "Camp Wins", "CampWins", "Camp Wins", "Shows camp win count",
    function(arg1)
        return v29 .. " has " .. arg1.Value .. " camp wins."
    end
)
func19(
    "Movie Wins", "MoviesWins", "Movie Wins", "Shows movie win count",
    function(arg1)
        return v29 .. " has " .. arg1.Value .. " movie wins."
    end
)
func19(
    "Expedition Wins", "ExpeditionWins", "Expedition Wins", "Shows expedition win count",
    function(arg1)
        return v29 .. " has " .. arg1.Value .. " expedition wins."
    end
)
func19(
    "Coins", "Coins", "Coins", "Shows coin balance",
    function(arg1)
        return v29 .. " has " .. arg1.Value .. " coins."
    end
)
func19(
    "Comeback Wins", "ComebackWins", "Comeback Wins", "Shows comeback win count",
    function(arg1)
        return v29 .. " has " .. arg1.Value .. " comeback wins."
    end
)
func19(
    "Games Played", "GamesPlayed", "Games Played", "Shows total games played",
    function(arg1)
        return v29 .. " played " .. arg1.Value .. " games."
    end
)
func19(
    "Idols Found", "IdolsFound", "Idols Found", "Shows idols found",
    function(arg1)
        return v29 .. " found " .. arg1.Value .. " idols."
    end
)
v9:Button(
    {
        Title = "Skins", Desc = "Lists all skins owned by selected player",
        Callback = function()
            local v2 = Players:FindFirstChild(v29)
            if not v2 then
                return
            end
            local v3 = v2:FindFirstChild("DataStore") and v2.DataStore:FindFirstChild("Skins")
            if not v3 then
                v1:Notify({Title = "Skins", Content = v29 .. " has no skins.", Duration = 4})
                return
            end
            local tbl = {}
            for _, v4 in ipairs(v3:GetChildren()) do
                table.insert(tbl, v4.Name)
            end
            v1:Notify(
                {
                    Title = "Skins",
                    Content = #tbl == 0 and v29 .. " has no skins." or table.concat(tbl, ", "),
                    Duration = 6,
                }
            )
        end,
    }
)
v9:Button(
    {
        Title = "Marshmallows", Desc = "Lists all marshmallows owned by selected player",
        Callback = function()
            local v2 = Players:FindFirstChild(v29)
            if not v2 then
                return
            end
            local v3 = v2:FindFirstChild("DataStore") and v2.DataStore:FindFirstChild(
                "Marshmallows"
            )
            if not v3 then
                v1:Notify({Title = "Marshmallows", Content = v29 .. " has none.", Duration = 4})
                return
            end
            local tbl = {}
            for _, v4 in ipairs(v3:GetChildren()) do
                table.insert(tbl, v4.Name)
            end
            v1:Notify(
                {
                    Title = "Marshmallows",
                    Content = #tbl == 0 and v29 .. " has none." or table.concat(tbl, ", "),
                    Duration = 6,
                }
            )
        end,
    }
)
local function func20(arg1, arg2, arg3, arg4, arg5, arg6)
    arg1:Button(
        {
            Title = arg2, Desc = arg6 or "Teleport to " .. arg2,
            Callback = function()
                local v1 = func1()
                if v1 then
                    v1.CFrame = CFrame.new(arg3, arg4, arg5)
                end
            end,
        }
    )
end
v10:Section({Title = "Camp"})
func20(v10, "Spectator Island", 33, -16, 31)
func20(v10, "Main Island", 150, -17, -417)
func20(v10, "Exile Island", -116, -14, -166)
func20(v10, "Voting Area", -23, 95, -514)
func20(v10, "Boat", 47, -20, -297)
func20(v10, "Bathroom", 302, -15, -325)
v10:Section({Title = "Movie"})
func20(v10, "Starter Island", -672, -67, -617)
func20(v10, "Voting Area", 83, 60, -187)
func20(v10, "Cabin 1", -1, 56, -34)
func20(v10, "Cabin 2", -8, 53, 144)
func20(v10, "Dining Room", -1, 53, 168)
func20(v10, "Kitchen", -210, 49, 30)
func20(v10, "Inside Boat", -47, 80, -28)
v10:Section({Title = "Expedition"})
func20(v10, "Ship Voting Area", -154, 101, -31)
func20(v10, "First Class (VIP)", 154, 98, -33)
func20(v10, "2nd Class", 50, 98, -34)
func20(v10, "Ship Bathroom", 5, 98, -23)
func20(v10, "Dining Class", -45, 98, -34)
func20(v10, "Basement", -47, 80, -28)
v11:Section({Title = "Tools"})
v11:Button(
    {
        Title = "VC Unban", Desc = "Rejoins voice chat to bypass a voice ban",
        Callback = function()
            func(
                function()
                    game:GetService("VoiceChatService"):joinVoice()
                end
            )
        end,
    }
)
v11:Button(
    {
        Title = "Apply Shaders", Desc = "Applies custom lighting and sky shaders",
        Callback = function()
            func(
                function()
                    local Lighting = game:GetService("Lighting")
                    local v1 = settings()
                    v1.Rendering.QualityLevel = Enum.QualityLevel.Level21
                    Lighting.Technology = Enum.Technology.ShadowMap
                    Lighting.ShadowSoftness = 0.15
                    Lighting.ClockTime = 9
                    Lighting.Brightness = 5
                    Lighting.Ambient = Color3.fromRGB(70, 70, 70)
                    Lighting.ColorShift_Top = Color3.fromRGB(255, 138, 35)
                    Lighting.OutdoorAmbient = Color3.fromRGB(135, 135, 135)
                    Lighting.GlobalShadows = true
                    Lighting.ExposureCompensation = 0
                    local Terrain = workspace.Terrain
                    Terrain.WaterReflectance = 0.08
                    Terrain.WaterTransparency = 0.85
                    Terrain.WaterDefaultColor = Color3.fromRGB(12, 84, 92)
                    local sky = Instance.new("Sky", Lighting)
                    sky.SkyboxBk = "rbxassetid://271042516"
                    sky.SkyboxDn = "rbxassetid://271077243"
                    sky.SkyboxFt = "rbxassetid://271042556"
                    sky.SkyboxLf = "rbxassetid://271042310"
                    sky.SkyboxRt = "rbxassetid://271042467"
                    sky.SkyboxUp = "rbxassetid://271077958"
                end
            )
        end,
    }
)
v11:Button(
    {
        Title = "Infinite Yield", Desc = "Loads Infinite Yield FE admin commands",
        Callback = function()
            loadstring(
                game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
            )()
        end,
    }
)
v11:Button(
    {
        Title = "Fly GUI", Desc = "Loads a fly script with GUI controls",
        Callback = function()
            loadstring(
                game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
            )()
        end,
    }
)
v11:Button(
    {
        Title = "Wall Hop", Desc = "Loads a wall hop movement script",
        Callback = function()
            loadstring(
                game:HttpGet(
                    "https://rawscripts.net/raw/Universal-Script-Roblox-WallHop-Script-38387"
                )
            )()
        end,
    }
)
v11:Button(
    {
        Title = "Sound Panel", Desc = "Loads a sound control panel",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/w3uzjgEq"))()
        end,
    }
)
v11:Button(
    {
        Title = "Energize Animations", Desc = "Opens the FE animation GUI",
        Callback = function()
            loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/Bruhology/ella-hub/main/Energize.lua"
                )
            )()
        end,
    }
)
v11:Button(
    {
        Title = "Bring Back Old Chat", Desc = "Restores the old Roblox chat UI",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/9AQrDua1"))()
            v1:Notify({Title = "Chat", Content = "Old chat loaded!", Duration = 3})
        end,
    }
)
v11:Section({Title = "Misc"})
local flag3 = false
v11:Toggle(
    {
        Title = "Collision", Desc = "Adds invisible collision to all other players", Value = false,
        Callback = function(arg1)
            flag3 = arg1
            if arg1 then
                task.spawn(
                    function()
                        while flag3 do
                            for _, v1 in pairs(Players:GetPlayers()) do
                                local v2 = LocalPlayer
                                if v1 ~= v2 then
                                    v2 = workspace
                                    local Name = v1.Name
                                    local v3 = v2
                                    v2 = v3.FindFirstChild
                                    v2 = v2(v3, Name)
                                    if v2 and not v2:FindFirstChild("CHECKER") then
                                        func(
                                            function()
                                                Instance.new("BoolValue", v2).Name = "CHECKER"
                                                for _, v1 in pairs(v2:GetDescendants()) do
                                                    if v1:IsA("BasePart") or v1:IsA("MeshPart") then
                                                        local part = Instance.new("Part", v1)
                                                        part.Size = v1.Size
                                                        part.Position = v1.Position
                                                        part.Transparency = 1
                                                        local weld = Instance.new("Weld", v1)
                                                        weld.Part0 = v1
                                                        weld.Part1 = part
                                                    end
                                                end
                                            end
                                        )
                                    end
                                end
                            end
                            task.wait(3)
                        end
                    end
                )
            end
        end,
    }
)
tbl.hackActive = false
tbl.lastNotif = {}
v11:Toggle(
    {
        Title = "Hacker Detector", Desc = "Flags abnormal speed or jump", Value = false,
        Callback = function(arg1)
            tbl.hackActive = arg1
            tbl.lastNotif = {}
            if arg1 then
                task.spawn(
                    function()
                        while tbl.hackActive do
                            for _, v2 in pairs(Players:GetPlayers()) do
                                if v2 ~= LocalPlayer and v2.Character then
                                    local Humanoid = v2.Character:FindFirstChildOfClass("Humanoid")
                                    if Humanoid then
                                        local v3 = tick()
                                        if Humanoid.WalkSpeed > 40 then
                                            local v4 = v2.Name .. "_spd"
                                            if not tbl.lastNotif[v4] or v3 - tbl.lastNotif[v4] > 10 then
                                                v1:Notify(
                                                    {Title = "Hacker!", Content = v2.Name .. " speeding (" .. Humanoid.WalkSpeed .. ")", Duration = 4}
                                                )
                                                tbl.lastNotif[v4] = v3
                                            end
                                        end
                                        if Humanoid.JumpPower > 100 then
                                            local v5 = v2.Name .. "_jmp"
                                            if not tbl.lastNotif[v5] or v3 - tbl.lastNotif[v5] > 10 then
                                                v1:Notify(
                                                    {Title = "Hacker!", Content = v2.Name .. " high jump (" .. Humanoid.JumpPower .. ")", Duration = 4}
                                                )
                                                tbl.lastNotif[v5] = v3
                                            end
                                        end
                                    end
                                end
                            end
                            task.wait(1)
                        end
                    end
                )
            end
        end,
    }
)
v11:Section({Title = "Team Changer"})
tbl.teamChoice = ""
local function func21()
    local tbl = {}
    local v1 = tbl
    for _, v2 in ipairs(game:GetService("Teams"):GetChildren()) do
        table.insert(tbl, v2.Name)
    end
    if #tbl == 0 then
        v1 = {"Spectator", "Jury", "Team1", "Team2", "Team3"}
    end
    return v1
end
tbl.teamList = func21()
tbl.teamChoice = tbl.teamList[1] or ""
local v31 = v11:Dropdown(
    {
        Title = "Team", Values = tbl.teamList, Value = 1,
        Callback = function(arg1)
            tbl.teamChoice = arg1
        end,
    }
)
v11:Button(
    {
        Title = "Refresh Teams",
        Callback = function()
            local v2 = func21()
            tbl.teamList = v2
            v31:Refresh(v2)
            if #v2 > 0 then
                tbl.teamChoice = v2[1]
            end
            v1:Notify({Title = "Teams", Content = #v2 .. " team(s) loaded.", Duration = 2})
        end,
    }
)
v11:Button(
    {
        Title = "Set Team", Desc = "Join the selected team",
        Callback = function()
            if tbl.teamChoice == "" then
                v1:Notify({Title = "Team", Content = "Pick a team first.", Duration = 3})
                return
            end
            local flag = false
            func(
                function()
                    local v1 = game:GetService("Teams"):FindFirstChild(tbl.teamChoice)
                    if v1 then
                        LocalPlayer.Team = v1
                        LocalPlayer.Neutral = false
                        flag = true
                    end
                end
            )
            v1:Notify(
                {
                    Title = "Team",
                    Content = flag and "Joined " .. tbl.teamChoice or "Failed — FE may block this.",
                    Duration = 3,
                }
            )
        end,
    }
)
v11:Button(
    {
        Title = "Spectator", Desc = "Quick-join Spectator team",
        Callback = function()
            local flag = false
            func(
                function()
                    local Spectator = game:GetService("Teams"):FindFirstChild("Spectator")
                    if Spectator then
                        LocalPlayer.Team = Spectator
                        LocalPlayer.Neutral = false
                        flag = true
                    end
                end
            )
            v1:Notify(
                {Title = "Team", Content = flag and "Joined Spectator" or "Not found.", Duration = 3}
            )
        end,
    }
)
v11:Button(
    {
        Title = "Jury", Desc = "Quick-join Jury team",
        Callback = function()
            local flag = false
            func(
                function()
                    local Jury = game:GetService("Teams"):FindFirstChild("Jury")
                    if Jury then
                        LocalPlayer.Team = Jury
                        LocalPlayer.Neutral = false
                        flag = true
                    end
                end
            )
            v1:Notify(
                {Title = "Team", Content = flag and "Joined Jury" or "Not found.", Duration = 3}
            )
        end,
    }
)
v11:Section({Title = "Fonts"})
local function func22()
    func(
        function()
            if not isfile("starborn.ttf") then
                writefile(
                    "starborn.ttf",
                    game:HttpGet(
                        "https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_"
                    )
                )
            end
            writefile(
                "Starborn.json",
                HttpService:JSONEncode(
                    {
                        name = "Starborn",
                        faces = {
                            {style = "normal", assetId = getcustomasset("starborn.ttf"), name = "Regular", weight = 400}
                        },
                    }
                )
            )
            if not isfile("vhsgothic.ttf") then
                writefile(
                    "vhsgothic.ttf",
                    game:HttpGet(
                        "https://drive.google.com/uc?export=download&id=1XRWSIsNj9-v-vnrOCdYiUJIvz6ETAzfE"
                    )
                )
            end
            writefile(
                "VHS.json",
                HttpService:JSONEncode(
                    {
                        name = "VHS",
                        faces = {
                            {style = "normal", assetId = getcustomasset("vhsgothic.ttf"), name = "Regular", weight = 400}
                        },
                    }
                )
            )
            if not isfile("minecrafter.ttf") then
                writefile(
                    "minecrafter.ttf",
                    game:HttpGet(
                        "https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4"
                    )
                )
            end
            writefile(
                "Minecrafter.json",
                HttpService:JSONEncode(
                    {
                        name = "Minecrafter",
                        faces = {
                            {style = "normal", assetId = getcustomasset("minecrafter.ttf"), name = "Regular", weight = 400}
                        },
                    }
                )
            )
            if not isfile("horror.ttf") then
                writefile(
                    "horror.ttf",
                    game:HttpGet(
                        "https://drive.google.com/uc?export=download&id=1dH4Y_ZuoTeMouMQoGZSc1OVLT7-73zmq"
                    )
                )
            end
            writefile(
                "Horror.json",
                HttpService:JSONEncode(
                    {
                        name = "Horror",
                        faces = {
                            {style = "normal", assetId = getcustomasset("horror.ttf"), name = "Regular", weight = 400}
                        },
                    }
                )
            )
        end
    )
end
local function func23(arg1, arg2)
    func(
        function()
            local font = Font.new(getcustomasset(arg1))
            for _, v2 in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                func(
                    function()
                        if v2:IsA("TextLabel") or v2:IsA("TextButton") or v2:IsA("TextBox") then
                            v2.FontFace = font
                        end
                    end
                )
            end
            LocalPlayer.PlayerGui.DescendantAdded:Connect(
                function(arg1)
                    func(
                        function()
                            if arg1:IsA("TextLabel") or arg1:IsA("TextButton") or arg1:IsA(
                                "TextBox"
                            ) then
                                arg1.FontFace = font
                            end
                        end
                    )
                end
            )
            v1:Notify({Title = "Fonts", Content = arg2 .. " applied!", Duration = 3})
        end
    )
end
v11:Button(
    {
        Title = "Load Fonts", Desc = "Download all fonts before applying",
        Callback = function()
            v1:Notify({Title = "Fonts", Content = "Downloading fonts...", Duration = 4})
            task.spawn(
                function()
                    func22()
                    v1:Notify({Title = "Fonts", Content = "Done! Now pick a font.", Duration = 4})
                end
            )
        end,
    }
)
v11:Button(
    {
        Title = "Starborn", Desc = "Apply Starborn font",
        Callback = function()
            func23("Starborn.json", "Starborn")
        end,
    }
)
v11:Button(
    {
        Title = "VHS", Desc = "Apply VHS gothic font",
        Callback = function()
            func23("VHS.json", "VHS")
        end,
    }
)
v11:Button(
    {
        Title = "Minecrafter", Desc = "Apply Minecrafter font",
        Callback = function()
            func23("Minecrafter.json", "Minecrafter")
        end,
    }
)
v11:Button(
    {
        Title = "Horror", Desc = "Apply Horror font",
        Callback = function()
            func23("Horror.json", "Horror")
        end,
    }
)
v12:Section({Title = "Cosmetics"})
local v50
v12:Toggle(
    {
        Title = "Rainbow Name", Desc = "Makes your character name cycle through rainbow colors",
        Value = false,
        Callback = function(arg1)
            if v50 then
                v50:Disconnect()
                v50 = nil
            end
            if arg1 then
                v50 = RunService.RenderStepped:Connect(
                    function()
                        local Character = LocalPlayer.Character
                        if not Character then
                            return
                        end
                        local v1 = tick() * 0.5 % 1
                        for _, v2 in ipairs(Character:GetDescendants()) do
                            if v2:IsA("TextLabel") or v2:IsA("TextButton") then
                                v2.TextColor3 = Color3.fromHSV(v1, 1, 1)
                            end
                        end
                    end
                )
            end
        end,
    }
)
v12:Section({Title = "Skin Changer"})
v12:Button(
    {
        Title = "Skin Changer", Desc = "Opens the skin changer GUI",
        Callback = function()
            loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/Bruhology/ella-hub/main/Skinchanger.lua"
                )
            )()
        end,
    }
)
v12:Section({Title = "Size Changer"})
v12:Button(
    {
        Title = "Size Changer", Desc = "Changes your size",
        Callback = function()
            loadstring(
                game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Size.lua")
            )()
        end,
    }
)
v12:Section({Title = "Admin Panel"})
v12:Button(
    {
        Title = "Gets Admin Panel", Desc = "Forces open the settings/admin GUI",
        Callback = function()
            local v2, v3 = func(
                function()
                    return ReplicatedStorage:WaitForChild("Products", 5):WaitForChild("GUIs", 5):WaitForChild(
                        "Settings", 5
                    ):Clone()
                end
            )
            if not v2 or not v3 then
                v1:Notify(
                    {Title = "Admin Panel", Content = "Could not find the Settings GUI.", Duration = 5}
                )
                return
            end
            v3.Parent = LocalPlayer:WaitForChild("PlayerGui")
            v3.Enabled = true
            for _, v4 in pairs(v3:GetDescendants()) do
                if v4:IsA("Frame") or v4:IsA("TextLabel") or v4:IsA("ImageLabel") then
                    v4.Visible = true
                end
                if v4:IsA("TextButton") or v4:IsA("ImageButton") then
                    v4.Visible = true
                    v4.Active = true
                end
            end
            v1:Notify(
                {Title = "Admin Panel", Content = "Forced open! (May not work)", Duration = 5}
            )
        end,
    }
)
v13:Section({Title = "Auto Farm"})
local flag4 = false
local tbl7 = {}
local flag5 = false
local function func24()
    flag4 = false
    flag5 = false
    for _, v1 in ipairs(tbl7) do
        func(
            function()
                v1:Disconnect()
            end
        )
    end
    tbl7 = {}
end
local function func25(arg1)
    if not flag4 or flag5 then
        return
    end
    flag5 = true
    v1:Notify({Title = "Auto Farm", Content = arg1 .. " — Reanimating!", Duration = 3})
    task.spawn(
        function()
            func(
                function()
                    loadstring(
                        game:HttpGet(
                            "https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua",
                            true
                        )
                    )()
                end
            )
        end
    )
    task.wait(25)
    func(
        function()
            Stop()
        end
    )
    task.wait(0.5)
    local v2 = func2()
    if v2 then
        v2.Health = 0
    end
    LocalPlayer.CharacterAdded:Wait()
    task.wait(1.5)
    flag5 = false
end
local function func26(arg1, arg2)
    local v1 = arg1:FindFirstChild("DataStore") or arg1:WaitForChild("DataStore", 10)
    if not v1 then
        return
    end
    local v2 = v1:FindFirstChild(arg2) or v1:WaitForChild(arg2, 10)
    if not v2 then
        return
    end
    local Value = v2.Value
    table.insert(
        tbl7,
        v2.Changed:Connect(
            function(arg3)
                if not flag4 or arg3 <= Value then
                    Value = arg3
                    return
                end
                Value = arg3
                task.spawn(
                    function()
                        func25((arg1 == LocalPlayer and "Your " or arg1.Name .. "'s ") .. arg2)
                    end
                )
            end
        )
    )
end
local function func27(arg1)
    task.spawn(
        function()
            func26(arg1, "CampWins")
            func26(arg1, "MoviesWins")
            func26(arg1, "ExpeditionWins")
        end
    )
end
v13:Toggle(
    {
        Title = "Auto Farm Coin", Desc = "Reanimates when any player wins + auto-win obby",
        Value = false,
        Callback = function(arg1)
            if arg1 then
                flag4 = true
                flag5 = false
                tbl7 = {}
                task.spawn(
                    function()
                        func27(LocalPlayer)
                        for _, v2 in ipairs(Players:GetPlayers()) do
                            if v2 ~= LocalPlayer then
                                func27(v2)
                            end
                        end
                        table.insert(
                            tbl7,
                            Players.PlayerAdded:Connect(
                                function(arg1)
                                    if flag4 then
                                        func27(arg1)
                                    end
                                end
                            )
                        )
                        task.spawn(
                            function()
                                while flag4 do
                                    func3()
                                    task.wait(0.5)
                                end
                            end
                        )
                        v1:Notify(
                            {Title = "Auto Farm", Content = "Watching " .. #Players:GetPlayers() .. " players.", Duration = 4}
                        )
                    end
                )
            else
                func24()
                v1:Notify({Title = "Auto Farm", Content = "Stopped.", Duration = 3})
            end
        end,
    }
)
v13:Section({Title = "Auto Farm Coins 2"})
tbl.farm2Active = false
tbl.farm2Running = false
tbl.farm2Conn = nil
local function func28()
    tbl.farm2Active = false
    tbl.farm2Running = false
    if tbl.farm2Conn then
        tbl.farm2Conn:Disconnect()
        tbl.farm2Conn = nil
    end
end
local function func29()
    if not tbl.farm2Active or tbl.farm2Running then
        return
    end
    tbl.farm2Running = true
    v1:Notify(
        {Title = "Auto Farm 2", Content = "Coins awarded — loading reanimate...", Duration = 3}
    )
    func(
        function()
            loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua",
                    true
                )
            )()
        end
    )
    task.wait(25)
    func(
        function()
            if type(Stop) == "function" then
                Stop()
            end
        end
    )
    task.wait(0.5)
    local v2 = func2()
    if v2 then
        v2.Health = 0
    end
    tbl.farm2Running = false
end
v13:Toggle(
    {
        Title = "Auto Farm Coins 2", Desc = "Triggers on every coin gain", Value = false,
        Callback = function(arg1)
            if arg1 then
                tbl.farm2Active = true
                tbl.farm2Running = false
                task.spawn(
                    function()
                        local v2, v3 = func(
                            function()
                                return LocalPlayer:WaitForChild("DataStore", 10)
                            end
                        )
                        if not v2 or not v3 then
                            v1:Notify(
                                {Title = "Auto Farm 2", Content = "DataStore not found.", Duration = 4}
                            )
                            tbl.farm2Active = false
                            return
                        end
                        local v4, v5 = func(
                            function()
                                return v3:WaitForChild("Coins", 10)
                            end
                        )
                        if not v4 or not v5 then
                            v1:Notify(
                                {Title = "Auto Farm 2", Content = "Coins value not found.", Duration = 4}
                            )
                            tbl.farm2Active = false
                            return
                        end
                        local Value = v5.Value
                        tbl.farm2Conn = v5.Changed:Connect(
                            function(arg1)
                                if tbl.farm2Active and arg1 > Value then
                                    Value = arg1
                                    task.spawn(func29)
                                else
                                    Value = arg1
                                end
                            end
                        )
                        v1:Notify(
                            {Title = "Auto Farm 2", Content = "Watching for coin gains.", Duration = 3}
                        )
                    end
                )
            else
                func28()
                v1:Notify({Title = "Auto Farm 2", Content = "Stopped.", Duration = 3})
            end
        end,
    }
)
v13:Section({Title = "Auto Restart Day"})
local flag6 = false
local flag7 = false
local function func30(arg1)
    if flag7 then
        return
    end
    flag7 = true
    v1:Notify({Title = "Auto Restart Day", Content = arg1 .. " — reanimating!", Duration = 3})
    func(
        function()
            loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua",
                    true
                )
            )()
        end
    )
    task.wait(25)
    func(
        function()
            Stop()
        end
    )
    task.wait(0.5)
    local v2 = func2()
    if v2 then
        v2.Health = 0
    end
    local connection
    connection = LocalPlayer.CharacterAdded:Connect(
        function()
            connection:Disconnect()
            task.wait(2)
            flag7 = false
        end
    )
end
v13:Toggle(
    {
        Title = "Auto Restart Day", Desc = "Reanimates when the round ends", Value = false,
        Callback = function(arg1)
            flag6 = arg1
            flag7 = false
            if arg1 then
                v1:Notify(
                    {Title = "Auto Restart Day", Content = "Active — watching for round end...", Duration = 3}
                )
                task.spawn(
                    function()
                        local Season = ReplicatedStorage:WaitForChild("Season", 10)
                        if not Season then
                            return
                        end
                        local RoundActive = Season:WaitForChild("RoundActive", 10)
                        if not RoundActive then
                            return
                        end
                        local connection = RoundActive.Changed:Connect(
                            function(arg1)
                                if not arg1 and flag6 then
                                    func30("Round ended")
                                end
                            end
                        )
                        while flag6 do
                            task.wait(1)
                        end
                        connection:Disconnect()
                    end
                )
            else
                v1:Notify({Title = "Auto Restart Day", Content = "Stopped.", Duration = 3})
            end
        end,
    }
)
v13:Section({Title = "Obby Detector"})
tbl.obbyDetectConn = nil
v13:Button(
    {
        Title = "Detect Current Obby", Desc = "Checks workspace.Assets for active challenge",
        Callback = function()
            local Assets = workspace:FindFirstChild("Assets")
            if not Assets then
                v1:Notify(
                    {Title = "Obby Detect", Content = "No Assets folder found.", Duration = 4}
                )
                return
            end
            local tbl = {}
            for _, v2 in ipairs(Assets:GetChildren()) do
                table.insert(tbl, v2.Name)
            end
            if #tbl == 0 then
                v1:Notify(
                    {Title = "Obby Detect", Content = "Assets folder is empty — no active challenge.", Duration = 4}
                )
                return
            end
            v1:Notify({Title = "Active Challenge", Content = table.concat(tbl, ", "), Duration = 6})
        end,
    }
)
v13:Toggle(
    {
        Title = "Auto-Detect Obby", Desc = "Notifies when a new challenge starts", Value = false,
        Callback = function(arg1)
            if tbl.obbyDetectConn then
                tbl.obbyDetectConn:Disconnect()
                tbl.obbyDetectConn = nil
            end
            if arg1 then
                local Assets = workspace:FindFirstChild("Assets")
                if not Assets then
                    v1:Notify(
                        {Title = "Obby Detector", Content = "No Assets folder yet.", Duration = 4}
                    )
                    return
                end
                tbl.obbyDetectConn = Assets.ChildAdded:Connect(
                    function(arg1)
                        v1:Notify({Title = "Challenge Started!", Content = arg1.Name, Duration = 5})
                    end
                )
                v1:Notify(
                    {Title = "Obby Detector", Content = "Watching for new challenges...", Duration = 3}
                )
            end
        end,
    }
)
v13:Section({Title = "Get Items"})
local function func31(arg1)
    func(
        function()
            local v2 = ReplicatedStorage:WaitForChild("Products", 5):WaitForChild("Gear", 5):FindFirstChild(
                arg1
            )
            if not v2 then
                v1:Notify(
                    {Title = "Give Gear", Content = arg1 .. " not found in RS.Products.Gear.", Duration = 4}
                )
                return
            end
            local v3 = v2:Clone()
            local Handle = v3:FindFirstChild("Handle")
            if Handle then
                Handle.CanCollide = false
            end
            v3.Parent = LocalPlayer.Backpack
            v1:Notify(
                {Title = "Give Gear", Content = arg1 .. " added to your backpack!", Duration = 3}
            )
        end
    )
end
v13:Button(
    {
        Title = "Give Dodgeball",
        Callback = function()
            func31("Dodgeball")
        end,
    }
)
v13:Button(
    {
        Title = "Give Paintball Gun",
        Callback = function()
            func31("PaintballGun")
        end,
    }
)
v13:Button(
    {
        Title = "Give Meatball",
        Callback = function()
            func31("Meatball")
        end,
    }
)
v13:Button(
    {
        Title = "Give Raygun (Sheriff)",
        Callback = function()
            func31("Sheriff")
        end,
    }
)
v13:Button(
    {
        Title = "Give Sword",
        Callback = function()
            func31("Sword")
        end,
    }
)
v13:Button(
    {
        Title = "Give Pool Noodle",
        Callback = function()
            func31("Pool Noodle")
        end,
    }
)
v13:Button(
    {
        Title = "Give Snowball",
        Callback = function()
            func31("Snowball")
        end,
    }
)
v13:Section({Title = "Webhooks"})
v13:Input(
    {
        Title = "Webhook URL", Desc = "Paste your Discord webhook URL here",
        Placeholder = "https://discord.com/api/webhooks/...",
        Callback = function(arg1)
            tbl.whUrl = arg1:match("^%s*(.-)%s*$")
        end,
    }
)
v13:Button(
    {
        Title = "Test Webhook", Desc = "Sends a test message to verify your webhook URL",
        Callback = function()
            if not tbl.whUrl or tbl.whUrl == "" then
                v1:Notify(
                    {Title = "Webhook", Content = "Paste your webhook URL first!", Duration = 4}
                )
                return
            end
            sendWH("✅ Ella Hub webhook test — working!")
            v1:Notify(
                {Title = "Webhook", Content = "Test sent! Check your Discord channel.", Duration = 4}
            )
        end,
    }
)
local v51
local v52
local v53
local v54
local v55
local v56
v13:Toggle(
    {
        Title = "Send Jury Votes to Webhook", Value = false,
        Callback = function(arg1)
            if v54 then
                v54:Disconnect()
                v54 = nil
            end
            if arg1 then
                func(
                    function()
                        v54 = ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(
                            function(arg1)
                                local v1, v2 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Value].Value
                                    end
                                )
                                local v3, v4 = func(
                                    function()
                                        return ReplicatedStorage.Season.Players[arg1.Name].Value
                                    end
                                )
                                if v1 and v3 then
                                    sendWH(
                                        "⚖️ **" .. v2 .. "** jury-voted for **" .. v4 .. "**"
                                    )
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
v13:Toggle(
    {
        Title = "Send Votes to Webhook", Value = false,
        Callback = function(arg1)
            if v51 then
                v51:Disconnect()
                v51 = nil
            end
            if arg1 then
                v51 = ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            sendWH("🗳️ **" .. v2 .. "** voted for **" .. v4 .. "**")
                        end
                    end
                )
            end
        end,
    }
)
v13:Toggle(
    {
        Title = "Send Exile Votes to Webhook", Value = false,
        Callback = function(arg1)
            if v52 then
                v52:Disconnect()
                v52 = nil
            end
            if arg1 then
                v52 = ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            sendWH("⚠️ **" .. v2 .. "** voted to exile **" .. v4 .. "**")
                        end
                    end
                )
            end
        end,
    }
)
v13:Toggle(
    {
        Title = "Expose Exile Votes in Chat", Value = false,
        Callback = function(arg1)
            if v53 then
                v53:Disconnect()
                v53 = nil
            end
            if arg1 then
                v53 = ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(
                    function(arg1)
                        local v1, v2 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Value].Value
                            end
                        )
                        local v3, v4 = func(
                            function()
                                return ReplicatedStorage.Season.Players[arg1.Name].Value
                            end
                        )
                        if v1 and v3 then
                            func(
                                function()
                                    game.TextChatService.TextChannels.RBXGeneral:SendAsync(
                                        v2 .. " voted to exile " .. v4
                                    )
                                end
                            )
                        end
                    end
                )
            end
        end,
    }
)
v13:Toggle(
    {
        Title = "Send Statue Holder to Webhook", Value = false,
        Callback = function(arg1)
            if v55 then
                v55:Disconnect()
                v55 = nil
            end
            if arg1 then
                func(
                    function()
                        v55 = ReplicatedStorage.Season.Twists.Idol.Changed:Connect(
                            function(arg1)
                                if arg1 == "" then
                                    sendWH("🗿 Safety Statue: nobody has it now.")
                                else
                                    local v1, v2 = func(
                                        function()
                                            return ReplicatedStorage.Season.Players[arg1].Value
                                        end
                                    )
                                    sendWH(
                                        "🗿 Safety Statue: **" .. (v1 and v2 or arg1) .. "** now has the statue!"
                                    )
                                end
                            end
                        )
                    end
                )
            end
        end,
    }
)
v13:Toggle(
    {
        Title = "Send Round Info to Webhook", Value = false,
        Callback = function(arg1)
            if v56 then
                v56:Disconnect()
                v56 = nil
            end
            if arg1 then
                func(
                    function()
                        v56 = ReplicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(
                            function(arg1)
                                sendWH("🎮 **Round twist:** " .. (tbl4[arg1] or tostring(arg1)))
                            end
                        )
                    end
                )
            end
        end,
    }
)
local function func32()
    local tbl = {}
    func(
        function()
            local DailyShop = ReplicatedStorage.Products.Shop.DailyShop
            for _, v1 in ipairs({"Skins", "Marshmallows", "ElimColors", "Eliminations"}) do
                local v2 = DailyShop:FindFirstChild(v1)
                if v2 then
                    for _, v3 in pairs(v2:GetChildren()) do
                        if not v3.Name:find("price") and not v3.Name:find("Gender") then
                            local price = v3:FindFirstChild("price")
                            table.insert(
                                tbl,
                                {category = v1, name = v3.Name, price = price and price.Value or "?"}
                            )
                        end
                    end
                end
            end
        end
    )
    return tbl
end
v16:Section({Title = "Daily Shop"})
v16:Button(
    {
        Title = "Print Shop to Console", Desc = "Prints all daily shop items to F9 console",
        Callback = function()
            local v2 = func32()
            print("=== Ella Hub — Daily Shop ===")
            for _, v3 in ipairs(v2) do
                print(
                    "[" .. v3.category .. "] " .. v3.name .. " — " .. tostring(v3.price) .. " coins"
                )
            end
            print("============================")
            v1:Notify({Title = "Shop", Content = "Printed to console! Press F9.", Duration = 3})
        end,
    }
)
v16:Button(
    {
        Title = "Send Shop to Webhook", Desc = "Posts all daily shop items to your Discord webhook",
        Callback = function()
            if not tbl.whUrl or tbl.whUrl == "" then
                v1:Notify(
                    {Title = "Webhook", Content = "No URL set! Go to Other > Webhooks first.", Duration = 4}
                )
                return
            end
            local v2 = func32()
            if #v2 == 0 then
                v1:Notify({Title = "Shop", Content = "No items found.", Duration = 3})
                return
            end
            local str = "🛒 **Ella Hub — Daily Shop**\n"
            for _, v3 in ipairs(v2) do
                str = str .. "**[" .. v3.category .. "]** " .. v3.name .. " — " .. tostring(
                    v3.price
                ) .. " coins\n"
            end
            sendWH(str)
            v1:Notify({Title = "Shop", Content = "Shop sent to webhook!", Duration = 3})
        end,
    }
)
v16:Section({Title = "Shop Watcher"})
local v57
local v58
v16:Toggle(
    {
        Title = "Notify When Shop Updates",
        Desc = "Notifies you when a new item appears in the shop", Value = false,
        Callback = function(arg1)
            if v57 then
                v57:Disconnect()
                v57 = nil
            end
            if arg1 then
                func(
                    function()
                        v57 = ReplicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(
                            function(arg1)
                                if not arg1.Name:find("price") and not arg1.Name:find("Gender") then
                                    local price = arg1:FindFirstChild("price")
                                    v1:Notify(
                                        {
                                            Title = "Shop Updated!",
                                            Content = arg1.Name .. (price and " — " .. price.Value .. " coins" or ""),
                                            Duration = 6,
                                        }
                                    )
                                end
                            end
                        )
                        v1:Notify(
                            {Title = "Shop Watcher", Content = "Watching for shop updates...", Duration = 3}
                        )
                    end
                )
            end
        end,
    }
)
v16:Toggle(
    {
        Title = "Auto Send Shop Updates to Webhook",
        Desc = "Posts to webhook when new items appear", Value = false,
        Callback = function(arg1)
            if v58 then
                v58:Disconnect()
                v58 = nil
            end
            if arg1 then
                if not tbl.whUrl or tbl.whUrl == "" then
                    v1:Notify({Title = "Webhook", Content = "No URL set!", Duration = 4})
                    return
                end
                func(
                    function()
                        v58 = ReplicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(
                            function(arg1)
                                if not arg1.Name:find("price") and not arg1.Name:find("Gender") then
                                    local price = arg1:FindFirstChild("price")
                                    sendWH(
                                        "🛒 **Shop Updated!** " .. arg1.Name .. (price and " — " .. price.Value .. " coins" or "")
                                    )
                                end
                            end
                        )
                    end
                )
                v1:Notify({Title = "Shop Watcher", Content = "Auto webhook active!", Duration = 3})
            end
        end,
    }
)
local function func33(arg1, arg2, arg3, arg4, arg5)
    local sound = Instance.new("Sound")
    sound.SoundId = arg5 and arg1 or "rbxassetid://" .. tostring(arg1)
    sound.Volume = arg3 or 1
    sound.Looped = arg4 or false
    sound.Parent = arg2
    return sound
end
v15:Section({Title = "Sound Control"})
v15:Toggle(
    {
        Title = "Mute All Sounds", Desc = "Sets SoundService volume to 0 (local only)",
        Value = false,
        Callback = function(arg1)
            func(
                function()
                    SoundService.Volume = arg1 and 0 or 0.5
                end
            )
            v1:Notify({Title = "Sound", Content = arg1 and "Muted." or "Unmuted.", Duration = 2})
        end,
    }
)
v15:Button(
    {
        Title = "Stop All Playing Sounds", Desc = "Stops all sounds in workspace and PlayerGui",
        Callback = function()
            local num = 0
            for _, v2 in ipairs(workspace:GetDescendants()) do
                if v2:IsA("Sound") and v2.IsPlaying then
                    func(
                        function()
                            v2:Stop()
                        end
                    )
                    num = num + 1
                end
            end
            for _, v3 in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
                if v3:IsA("Sound") and v3.IsPlaying then
                    func(
                        function()
                            v3:Stop()
                        end
                    )
                    num = num + 1
                end
            end
            v1:Notify({Title = "Sound", Content = "Stopped " .. num .. " sound(s).", Duration = 3})
        end,
    }
)
v15:Section({Title = "Spam Sounds"})
tbl.spamClick = false
v15:Toggle(
    {
        Title = "Spam Click Sound", Desc = "Rapidly fires lp.PlayerGui.Click:Play()", Value = false,
        Callback = function(arg1)
            tbl.spamClick = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.spamClick do
                            func(
                                function()
                                    LocalPlayer.PlayerGui.Click:Play()
                                end
                            )
                            task.wait(0.05)
                        end
                    end
                )
            end
        end,
    }
)
tbl.spamOof = false
v15:Toggle(
    {
        Title = "Spam OOF", Desc = "Loops the OOF death sound locally", Value = false,
        Callback = function(arg1)
            tbl.spamOof = arg1
            if arg1 then
                task.spawn(
                    function()
                        while tbl.spamOof do
                            func(
                                function()
                                    local v1 = func33(
                                        "rbxasset://sounds/uuhhh.mp3", LocalPlayer.PlayerGui, 1,
                                        false, true
                                    )
                                    v1:Play()
                                    Debris:AddItem(v1, 2)
                                end
                            )
                            task.wait(0.8)
                        end
                    end
                )
            end
        end,
    }
)
v15:Section({Title = "Trigger Sounds"})
v15:Button(
    {
        Title = "Sword Lunge Sound",
        Callback = function()
            func(
                function()
                    local LungeSound = ReplicatedStorage.Products.Gear.Sword.Handle.LungeSound:Clone(
                    )
                    LungeSound.Parent = workspace
                    LungeSound:Play()
                    Debris:AddItem(LungeSound, 3)
                end
            )
        end,
    }
)
v15:Button(
    {
        Title = "Equip (Sword Unsheath)",
        Callback = function()
            func(
                function()
                    local UnsheathSound = ReplicatedStorage.Products.Gear.Sword.Handle.UnsheathSound:Clone(
                    )
                    UnsheathSound.Parent = workspace
                    UnsheathSound:Play()
                    Debris:AddItem(UnsheathSound, 3)
                end
            )
        end,
    }
)
v15:Button(
    {
        Title = "Toilet Elimination Sound",
        Callback = function()
            func(
                function()
                    local Sound = ReplicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound:Clone(
                    )
                    Sound.Parent = workspace
                    Sound:Play()
                    Debris:AddItem(Sound, 5)
                end
            )
        end,
    }
)
v15:Button(
    {
        Title = "Sleigh Elimination Sound",
        Callback = function()
            func(
                function()
                    local Sound = ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound:Clone(
                    )
                    Sound.Parent = workspace
                    Sound:Play()
                    Debris:AddItem(Sound, 5)
                end
            )
        end,
    }
)
v15:Section({Title = "Trigger Twisted"})
v15:Button(
    {
        Title = "Trigger Twisted", Desc = "Fires PSSettings + OSSettings Start remotes",
        Callback = function()
            local v2 = func(
                function()
                    ReplicatedStorage.Events.PSSettings:FireServer("Start", "Start")
                end
            )
            local v3 = func(
                function()
                    ReplicatedStorage.Events.OSSettings:FireServer("Start")
                end
            )
            v1:Notify(
                {Title = "Trigger Twisted", Content = (v2 or v3) and "Fired!" or "Remote rejected.", Duration = 4}
            )
        end,
    }
)
v15:Section({Title = "Sleigh Elimination Swap"})
tbl.sleighPlaying = false
tbl.sleighCooldown = false
tbl.sleighResetting = false
tbl.boatBackup = nil
local function func34(arg1)
    for _, v2 in pairs(arg1:GetDescendants()) do
        if v2:IsA("BasePart") then
            v2.Anchored = true
        end
        if v2:IsA("ParticleEmitter") then
            v2.Enabled = true
        end
        if v2:IsA("PointLight") then
            v2.Enabled = true
        end
    end
    local TELEPORT = arg1:FindFirstChild("TELEPORT", true)
    local FlySpots = arg1:FindFirstChild("FlySpots", true)
    if not FlySpots then
        tbl.sleighResetting = true
        func(
            function()
                arg1:Destroy()
            end
        )
        if tbl.boatBackup then
            local boatBackup = tbl.boatBackup:Clone()
            boatBackup.Name = "Boat Elimination"
            boatBackup.Parent = workspace.ElimMethod
            func(
                function()
                    ReplicatedStorage.Products.DataStore.Elimination.Value = "Boat Elimination"
                end
            )
        end
        tbl.sleighResetting = false
        tbl.sleighPlaying = false
        return
    end
    local Children = FlySpots:GetChildren()
    table.sort(
        Children,
        function(arg1, arg2)
            return (tonumber(arg1.Name) or 0) > (tonumber(arg2.Name) or 0)
        end
    )
    task.spawn(
        function()
            if TELEPORT then
                func(
                    function()
                        arg1:PivotTo(TELEPORT.CFrame)
                    end
                )
                task.wait(0.1)
            end
            for _, v2 in ipairs(Children) do
                local v3 = arg1
                local v4 = v3
                local v5 = v4
                v3 = v4.GetPivot
                v3 = v3(v5)
                v5 = v2.CFrame
                local Position = v3.Position
                local v6 = Position - v5.Position
                local Magnitude = v6.Magnitude
                Position = 25
                v6 = Magnitude / 25
                Position = 0
                while Position < v6 do
                    local v7 = task.wait(0.03)
                    Position = Position + v7
                    func(
                        function()
                            arg1:PivotTo(v3:Lerp(v5, math.clamp(Position / v6, 0, 1)))
                        end
                    )
                end
            end
            tbl.sleighResetting = true
            func(
                function()
                    arg1:Destroy()
                end
            )
            if tbl.boatBackup then
                local boatBackup = tbl.boatBackup:Clone()
                boatBackup.Name = "Boat Elimination"
                boatBackup.Parent = workspace.ElimMethod
                func(
                    function()
                        ReplicatedStorage.Products.DataStore.Elimination.Value = "Boat Elimination"
                    end
                )
            end
            tbl.sleighResetting = false
            tbl.sleighPlaying = false
            v1:Notify(
                {Title = "Sleigh Swap", Content = "Sleigh flew off — Boat Elimination restored.", Duration = 4}
            )
            task.delay(
                10,
                function()
                    tbl.sleighCooldown = false
                end
            )
        end
    )
end
v15:Button(
    {
        Title = "Swap to Sleigh Elimination", Desc = "Replaces Boat with Sleigh, plays animation",
        Callback = function()
            if tbl.sleighPlaying or tbl.sleighCooldown or tbl.sleighResetting then
                v1:Notify(
                    {
                        Title = "Sleigh Swap",
                        Content = tbl.sleighCooldown and "On cooldown (10s)." or "Already playing.",
                        Duration = 3,
                    }
                )
                return
            end
            local ElimMethod = workspace:FindFirstChild("ElimMethod")
            if not ElimMethod then
                v1:Notify(
                    {Title = "Sleigh Swap", Content = "ElimMethod not found — not elimination phase.", Duration = 4}
                )
                return
            end
            local v2 = ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"]
            if not v2 then
                v1:Notify(
                    {Title = "Sleigh Swap", Content = "Sleigh template missing in RS.", Duration = 4}
                )
                return
            end
            tbl.sleighPlaying = true
            tbl.sleighCooldown = true
            tbl.boatBackup = nil
            func(
                function()
                    local BoatElimination = ElimMethod:FindFirstChild("Boat Elimination")
                    if BoatElimination then
                        tbl.boatBackup = BoatElimination:Clone()
                        tbl.boatBackup.Parent = nil
                    end
                end
            )
            for _, v3 in pairs(ElimMethod:GetChildren()) do
                func(
                    function()
                        v3:Destroy()
                    end
                )
            end
            local v4 = v2:Clone()
            v4.Name = "Sleigh Elimination"
            v4.Parent = ElimMethod
            func(
                function()
                    ReplicatedStorage.Products.DataStore.Elimination.Value = "Sleigh Elimination"
                end
            )
            func(
                function()
                    local Sound = v4:FindFirstChild("Sound", true)
                    if Sound then
                        Sound:Play()
                    end
                end
            )
            v1:Notify(
                {Title = "Sleigh Swap", Content = "Sleigh Elimination active! Fly-out in 18s.", Duration = 4}
            )
            task.delay(
                18,
                function()
                    if tbl.sleighPlaying and not tbl.sleighResetting then
                        func34(v4)
                    end
                end
            )
        end,
    }
)
v15:Button(
    {
        Title = "Force Restore Boat", Desc = "Immediately restores Boat Elimination",
        Callback = function()
            local ElimMethod = workspace:FindFirstChild("ElimMethod")
            if not ElimMethod then
                v1:Notify({Title = "Sleigh Swap", Content = "ElimMethod not found.", Duration = 4})
                return
            end
            for _, v2 in pairs(ElimMethod:GetChildren()) do
                func(
                    function()
                        v2:Destroy()
                    end
                )
            end
            if tbl.boatBackup then
                local boatBackup = tbl.boatBackup:Clone()
                boatBackup.Name = "Boat Elimination"
                boatBackup.Parent = ElimMethod
                func(
                    function()
                        ReplicatedStorage.Products.DataStore.Elimination.Value = "Boat Elimination"
                    end
                )
                v1:Notify(
                    {Title = "Sleigh Swap", Content = "Boat Elimination restored.", Duration = 3}
                )
            else
                v1:Notify({Title = "Sleigh Swap", Content = "No boat backup found.", Duration = 3})
            end
            tbl.sleighPlaying = false
            tbl.sleighCooldown = false
            tbl.sleighResetting = false
        end,
    }
)
v15:Section({Title = "Anti Loser Land"})
tbl.antiLoserActive = false
tbl.antiLoserConns = {}
tbl.antiLoserHB = nil
tbl.lockedCFrame = nil
tbl.activeTeamName = nil
local function func35()
    tbl.antiLoserActive = false
    if tbl.antiLoserHB then
        func(
            function()
                tbl.antiLoserHB:Disconnect()
            end
        )
        tbl.antiLoserHB = nil
    end
    for _, v1 in ipairs(tbl.antiLoserConns) do
        func(
            function()
                v1:Disconnect()
            end
        )
    end
    tbl.antiLoserConns = {}
    tbl.lockedCFrame = nil
end
local function func36()
    for _, v1 in ipairs(game:GetService("Teams"):GetChildren()) do
        local v2 = v1.Name:lower()
        if v2 ~= "spectator" and v2 ~= "jury" and v2 ~= "eliminated" then
            if LocalPlayer.Team and LocalPlayer.Team.Name == v1.Name then
                return v1
            end
        end
    end
    for _, v3 in ipairs(game:GetService("Teams"):GetChildren()) do
        local v4 = v3.Name:lower()
        if v4 ~= "spectator" and v4 ~= "jury" and v4 ~= "eliminated" then
            return v3
        end
    end
    return nil
end
local function func37()
    if not tbl.antiLoserActive then
        return
    end
    v1:Notify(
        {Title = "⚠ Anti Loser Land", Content = "Elimination detected — fighting back!", Duration = 5}
    )
    func(
        function()
            local v1 = func1()
            if v1 then
                tbl.lockedCFrame = v1.CFrame
            end
        end
    )
    if tbl.antiLoserHB then
        func(
            function()
                tbl.antiLoserHB:Disconnect()
            end
        )
    end
    tbl.antiLoserHB = RunService.Heartbeat:Connect(
        function()
            if not tbl.antiLoserActive or not tbl.lockedCFrame then
                return
            end
            func(
                function()
                    local v1 = func1()
                    if not v1 then
                        return
                    end
                    if (v1.CFrame.Position - tbl.lockedCFrame.Position).Magnitude > 30 then
                        v1.CFrame = tbl.lockedCFrame
                    end
                    local v2 = func2()
                    if v2 and v2.Health < v2.MaxHealth then
                        v2.Health = v2.MaxHealth
                    end
                end
            )
        end
    )
    task.spawn(
        function()
            for _ = 1, 30 do
                if not tbl.antiLoserActive then
                    break
                end
                func(
                    function()
                        local v1 = func36()
                        if LocalPlayer.Team and (LocalPlayer.Team.Name:lower() == "spectator" or LocalPlayer.Team.Name:lower(
                        ) == "jury") then
                            if v1 then
                                LocalPlayer.Team = v1
                                LocalPlayer.Neutral = false
                            end
                        end
                    end
                )
                task.wait(0.2)
            end
        end
    )
    task.delay(
        20,
        function()
            if tbl.antiLoserHB then
                func(
                    function()
                        tbl.antiLoserHB:Disconnect()
                    end
                )
                tbl.antiLoserHB = nil
                tbl.lockedCFrame = nil
            end
        end
    )
end
v15:Toggle(
    {
        Title = "Anti Loser Land", Desc = "Blocks elimination sending you to spectator",
        Value = false,
        Callback = function(arg1)
            func35()
            if not arg1 then
                v1:Notify({Title = "Anti Loser Land", Content = "Off.", Duration = 2})
                return
            end
            tbl.antiLoserActive = true
            func(
                function()
                    if LocalPlayer.Team then
                        tbl.activeTeamName = LocalPlayer.Team.Name
                    end
                end
            )
            table.insert(
                tbl.antiLoserConns,
                LocalPlayer:GetPropertyChangedSignal("Team"):Connect(
                    function()
                        func(
                            function()
                                if LocalPlayer.Team then
                                    local v1 = LocalPlayer.Team.Name:lower()
                                    if v1 ~= "spectator" and v1 ~= "jury" then
                                        tbl.activeTeamName = LocalPlayer.Team.Name
                                    end
                                end
                            end
                        )
                    end
                )
            )
            func(
                function()
                    local ChildAdded = ReplicatedStorage:WaitForChild("Season", 5):WaitForChild(
                        "Eliminated", 5
                    ).ChildAdded
                    table.insert(
                        tbl.antiLoserConns,
                        ChildAdded:Connect(
                            function(arg1)
                                if tbl.antiLoserActive and arg1.Name == LocalPlayer.Name then
                                    func37()
                                end
                            end
                        )
                    )
                end
            )
            func(
                function()
                    local ChildRemoved = ReplicatedStorage:WaitForChild("Season", 5):WaitForChild(
                        "Players", 5
                    ).ChildRemoved
                    table.insert(
                        tbl.antiLoserConns,
                        ChildRemoved:Connect(
                            function(arg1)
                                if tbl.antiLoserActive and arg1.Name == LocalPlayer.Name then
                                    func37()
                                end
                            end
                        )
                    )
                end
            )
            v1:Notify(
                {Title = "Anti Loser Land", Content = "Active — watching for elimination.", Duration = 3}
            )
        end,
    }
)
v15:Button(
    {
        Title = "Force Fight Elim (Test)", Desc = "Manually triggers the anti-elim routine",
        Callback = function()
            if not tbl.antiLoserActive then
                v1:Notify(
                    {Title = "Anti Loser Land", Content = "Toggle it on first.", Duration = 3}
                )
                return
            end
            func37()
        end,
    }
)
local flag8 = false
local v59
local v60
local flag9 = false
local num = 0
local v61
local num1 = 0
local str3 = "Cave Chaos"
local str4 = "Unstable Savannah"
local tbl8 = {
    ["Bootcamp Team 1"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Bootcamp%20Team%201.json",
    },
    ["Bootcamp Team 2"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Bootcamp%20Team%202.json",
    },
    ["Bootcamp Team 3"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Bootcamp%20Team%203.json",
    },
    ["Cave Chaos Clip"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/callienew/tas-skid-skid-skid/refs/heads/main/Cave%20Chaos%20Clip.json",
    },
    ["Cave Chaos"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Cave%20Chaos%20Clip.json",
    },
    ["Colosseum Climb"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Colosseum.json"
    },
    ["Construct Course"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Construct%20Course.json",
    },
    ["Hill Hike"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Hill%20HIke.json",
    },
    ["Lava Dash"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Lava%20Dash.json",
    },
    ["Obstacle Course"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/callienew/tas-skid-skid-skid/refs/heads/main/Obstacle%20Course.json",
    },
    ["Pond Pier"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Pond%20Pier.json",
    },
    ["Rickety Rails"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rickety%20Rails.json",
    },
    ["Rock Wall Team 1"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rock%20Wall%20Team%201.json",
    },
    ["Rock Wall Team 2"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rock%20Wall%20Team%202.json",
    },
    ["Rock Wall Team 3"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Rock%20Wall%20Team%203.json",
    },
    Spinner = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Spinner.json"
    },
    Sweeper = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Sweeper.json"
    },
    Tightrope = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Tightrope%20Obby.json",
    },
    ["Unstable Savannah Clip"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Unstable%20Savannah%20Clip.json",
    },
    ["Unstable Savannah"] = {
        type = "url",
        source = "https://raw.githubusercontent.com/krohbe/skidknickys/main/Unstable%20Savannah.json",
    },
}
local function func38(arg1)
    local v1, v2 = func(
        function()
            return game:HttpGet(arg1, true)
        end
    )
    if not v1 then
        return nil
    end
    local v3, v4 = func(
        function()
            return HttpService:JSONDecode(v2)
        end
    )
    return v3 and type(v4) == "table" and v4 or nil
end
local function func39(arg1)
    if type(arg1) == "table" and arg1.type == "url" then
        return (func38(arg1.source))
    end
end
local function func40(arg1)
    if arg1 == (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter) then
        return
    end
    keypress(160)
    task.wait()
    keyrelease(160)
end
local function func41()
    if v59 then
        v59:Disconnect()
        v59 = nil
    end
    if v60 then
        v60:Disconnect()
        v60 = nil
    end
    flag8 = false
    local v1 = func1()
    if v1 then
        v1.Anchored = false
    end
    if not flag9 then
        task.spawn(func40, false)
    end
end
local function func42(arg1)
    return Vector3.new(arg1.CCFrame[1], arg1.CCFrame[2], arg1.CCFrame[3])
end
local function func43(arg1, arg2)
    if arg1.Status ~= Enum.PathStatus.Success then
        return math.huge
    end
    local Waypoints = arg1:GetWaypoints()
    if #Waypoints == 0 then
        return math.huge
    end
    local num = 0
    for _, v1 in ipairs(Waypoints) do
        num = num + (v1.Position - arg2).Magnitude
        arg2 = v1.Position
    end
    return num / 16
end
local function func44(arg1, arg2)
    if #arg1 == 0 then
        return 1
    end
    local v1 = math.min(120, #arg1)
    local num = 1
    local v2 = -math.huge
    local num1 = 1
    local huge = math.huge
    for i = 1, v1 do
        local v3 = arg1[i]
        local Magnitude = (func42(v3) - arg2).Magnitude
        local v4 = v3.time - Magnitude / 16
        if Magnitude < huge then
            huge = Magnitude
            num1 = i
        end
        if v4 > v2 and v3.time >= Magnitude / 16 then
            v2 = v4
            num = i
        end
    end
    if v2 == -math.huge then
        return num1
    end
    for i1 = math.max(1, num - 10), math.min(v1, num + 10) do
        local v5 = func42(arg1[i1])
        local v6 = PathfindingService:CreatePath(
            {AgentRadius = 0.5, AgentHeight = 2, AgentCanJump = true}
        )
        local v7 = func(
            function()
                v6:ComputeAsync(arg2, v5)
            end
        ) and v6.Status == Enum.PathStatus.Success and func43(v6, arg2) or (v5 - arg2).Magnitude / 16
        local v8 = arg1[i1].time - v7
        if v8 > v2 and arg1[i1].time >= v7 then
            v2 = v8
            num = i1
        end
    end
    return num
end
local function func45(arg1, arg2)
    local v1 = arg2 or 1
    if flag8 or #arg1 == 0 then
        return
    end
    flag8 = true
    local v2 = arg1[v1]
    local v3 = tick() - v2.time
    local v4 = v1
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        flag8 = false
        return
    end
    local HumanoidRootPart = Character.HumanoidRootPart
    HumanoidRootPart.Anchored = false
    local Assets = workspace:FindFirstChild("Assets")
    local v5 = Assets and Assets:FindFirstChild("Finish", true)
    if v5 then
        v60 = v5.Touched:Connect(
            function(arg1)
                if arg1 and arg1.Parent == Character then
                    func41()
                end
            end
        )
    end
    v59 = RunService.Heartbeat:Connect(
        function()
            if not HumanoidRootPart or not HumanoidRootPart.Parent then
                func41()
                return
            end
            if not flag8 then
                return
            end
            local v1 = tick() - v3
            local v2
            while v4 <= #arg1 and arg1[v4].time <= v1 do
                v2 = arg1[v4]
                v4 = v4 + 1
            end
            if v2 then
                local CCFrame = v2.CCFrame
                local CCameraCFrame = v2.CCameraCFrame
                HumanoidRootPart.CFrame = CFrame.new(
                    CCFrame[1], CCFrame[2], CCFrame[3], CCFrame[4], CCFrame[5], CCFrame[6],
                    CCFrame[7], CCFrame[8], CCFrame[9], CCFrame[10], CCFrame[11], CCFrame[12]
                )
                HumanoidRootPart.Velocity = Vector3.new(
                    v2.VVelocity[1], v2.VVelocity[2], v2.VVelocity[3]
                )
                if not flag9 then
                    workspace.CurrentCamera.CFrame = CFrame.new(
                        CCameraCFrame[1], CCameraCFrame[2], CCameraCFrame[3], CCameraCFrame[4],
                        CCameraCFrame[5], CCameraCFrame[6], CCameraCFrame[7], CCameraCFrame[8],
                        CCameraCFrame[9], CCameraCFrame[10], CCameraCFrame[11], CCameraCFrame[12]
                    )
                end
                if not flag9 and v2.ShiftLock ~= nil then
                    task.spawn(func40, v2.ShiftLock)
                end
            end
            if v4 > #arg1 then
                func41()
            end
        end
    )
end
local function func46(arg1)
    local v1 = arg1
    if type(arg1) == "table" then
        v1 = arg1[1] or ""
    end
    return tostring(v1):gsub("[^%w]", ""):lower()
end
local function func47(arg1)
    if not arg1 then
        return nil
    end
    local SpawnLocation = arg1:FindFirstChildOfClass("SpawnLocation")
    if SpawnLocation then
        return SpawnLocation.Position
    end
    for _, v1 in ipairs(arg1:GetDescendants()) do
        if v1:IsA("BasePart") then
            return v1.Position
        end
    end
end
local function func48(arg1, arg2)
    if arg2 == arg1 then
        return 100
    end
    if arg2:find(arg1, 1, true) or arg1:find(arg2, 1, true) then
        return 50
    end
    local num = 0
    for i = 3, math.min(#arg1, 8) do
        if arg2:find(arg1:sub(1, i), 1, true) then
            num = math.max(num, i)
        end
    end
    return num
end
local function func49()
    local Assets = workspace:FindFirstChild("Assets")
    if not Assets then
        return nil
    end
    local tbl = {}
    local v7
    local num = 0
    local v8
    for k, v1 in pairs(tbl8) do
        table.insert(tbl, {name = k, info = v1})
    end
    for _, v2 in ipairs(Assets:GetChildren()) do
        if v2:IsA("Folder") or v2:IsA("Model") then
            local v3 = func46(v2.Name)
            local num2 = 0
            local tbl1
            for _, v4 in ipairs(tbl) do
                local v5 = func46(v4.name)
                local v6 = func48(v3, v5)
                if v6 > num2 then
                    num2 = v6
                    tbl1 = {path = v4.info, name = v4.name, norm = v5, team = v5:match("team(%d)")}
                end
            end
            if num2 > num then
                num = num2
                v7 = v2
                v8 = tbl1
            end
        end
    end
    if not v7 or num < 5 then
        return nil
    end
    local Name = v7.Name
    if v61 ~= Name then
        v61 = Name
        num1 = tick()
        return nil
    end
    if tick() - num1 < 1 then
        return nil
    end
    local v14
    local tbl2 = {}
    for _, v9 in ipairs(v7:GetChildren()) do
        local v10 = v9.Name:match("^Team(%d+)$")
        if v10 then
            table.insert(tbl2, {folder = v9, num = tonumber(v10)})
        end
    end
    if #tbl2 > 1 then
        local v11 = func1()
        if v11 then
            local num3
            local huge = math.huge
            for _, v12 in ipairs(tbl2) do
                local v13 = func47(v12.folder)
                if v13 then
                    local Magnitude = (v13 - v11.Position).Magnitude
                    if Magnitude < huge then
                        huge = Magnitude
                        num3 = v12.num
                    end
                end
            end
            if num3 then
                v14 = num3
            end
        end
    end
    local v15 = v8.norm:gsub("team%d+", "")
    local tbl3 = {}
    for _, v16 in ipairs(tbl) do
        local v17 = func46(v16.name)
        if v17:gsub("team%d+", "") == v15 or v17:sub(1, #v15) == v15 then
            table.insert(
                tbl3, {path = v16.info, name = v16.name, norm = v17, team = v17:match("team(%d)")}
            )
        end
    end
    if v14 then
        for _, v18 in ipairs(tbl3) do
            if v18.team and tonumber(v18.team) == v14 then
                return v18.path
            end
        end
    end
    for _, v19 in ipairs(tbl3) do
        if v19.norm:find("team1") then
            return v19.path
        end
    end
    local v20 = Name:lower()
    if v20:find("cave") and v20:find("chaos") then
        for _, v21 in ipairs(tbl) do
            if v21.name:lower() == str3:lower() then
                return v21.info
            end
        end
    end
    if v20:find("unstable") and v20:find("savannah") then
        for _, v22 in ipairs(tbl) do
            if v22.name:lower() == str4:lower() then
                return v22.info
            end
        end
    end
    return v8.path
end
local function func50()
    local ChallengePlayers = workspace:FindFirstChild("ChallengePlayers")
    if not ChallengePlayers then
        return false
    end
    return ChallengePlayers:FindFirstChild(LocalPlayer.Name) ~= nil
end
local function func51(arg1)
    if #arg1 == 0 then
        return
    end
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
        func45(arg1, 1)
        return
    end
    local Position = Character.HumanoidRootPart.Position
    local v1 = func44(arg1, Position) or 1
    local v2 = func42(arg1[v1])
    if (v2 - Position).Magnitude < 5 then
        func45(arg1, v1)
        return
    end
    local v3 = PathfindingService:CreatePath(
        {AgentRadius = 1.5, AgentHeight = 4, AgentCanJump = true}
    )
    if not func(
        function()
            v3:ComputeAsync(Position, v2)
        end
    ) or v3.Status ~= Enum.PathStatus.Success then
        Character.HumanoidRootPart.CFrame = CFrame.new(v2)
        func45(arg1, v1)
        return
    end
    num = num + 1
    local v4 = num
    local HumanoidRootPart = Character.HumanoidRootPart
    local Humanoid = Character.Humanoid
    if not Humanoid then
        HumanoidRootPart.CFrame = CFrame.new(v2)
        func45(arg1, v1)
        return
    end
    HumanoidRootPart.Anchored = false
    func(
        function()
            Humanoid.Sit = false
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    )
    task.spawn(
        function()
            for _, v5 in ipairs(v3:GetWaypoints()) do
                if num ~= v4 then
                    return
                end
                if v5.Action == Enum.PathWaypointAction.Jump then
                    Humanoid.Jump = true
                    HumanoidRootPart.Velocity = Vector3.new(
                        HumanoidRootPart.Velocity.X, math.max(HumanoidRootPart.Velocity.Y, 40),
                        HumanoidRootPart.Velocity.Z
                    )
                    task.wait(0.15)
                end
                Humanoid:MoveTo(v5.Position)
                local flag = false
                local connection = Humanoid.MoveToFinished:Connect(
                    function(arg1)
                        flag = arg1
                    end
                )
                local v6 = tick()
                while not flag and tick() - v6 < 6 do
                    if num ~= v4 then
                        connection:Disconnect()
                        return
                    end
                    if v5.Action == Enum.PathWaypointAction.Jump then
                        Humanoid.Jump = true
                    end
                    task.wait(0.05)
                end
                connection:Disconnect()
                if not flag then
                    HumanoidRootPart.CFrame = CFrame.new(v2)
                    break
                end
            end
            if num ~= v4 then
                return
            end
            if (v2 - HumanoidRootPart.Position).Magnitude > 10 then
                HumanoidRootPart.CFrame = CFrame.new(v2)
            end
            func45(arg1, v1)
        end
    )
end
local function func52()
    if not func50() then
        return
    end
    local v1 = func49()
    if not v1 then
        for _ = 1, 10 do
            task.wait(0.2)
            if not func50() then
                return
            end
            local v2 = func49()
            v1 = v2
            if v2 then
                break
            end
        end
    end
    if not v1 then
        return
    end
    local v3 = func39(v1)
    if not v3 then
        return
    end
    num = num + 1
    func41()
    local v4 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if v4 and v4.WalkSpeed == 0 then
        while func50() do
            local v5 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(
                "Humanoid"
            )
            if v5 and v5.WalkSpeed >= 16 then
                func51(v3)
                return
            end
            task.wait(0.05)
        end
        return
    end
    func51(v3)
end
v14:Section({Title = "TAS Autoplay"})
local flag10 = false
v14:Toggle(
    {
        Title = "Autoplay", Desc = "Automatically plays the TAS when a challenge starts",
        Value = false,
        Callback = function(arg1)
            flag10 = arg1
            if arg1 then
                task.spawn(
                    function()
                        while flag10 do
                            if func50() then
                                local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass(
                                    "Humanoid"
                                )
                                if v1 and v1.WalkSpeed == 0 then
                                    func52()
                                end
                            end
                            task.wait(0.5)
                        end
                    end
                )
            end
        end,
    }
)
v14:Toggle(
    {
        Title = "Disable Shiftlock / Camera", Desc = "Keeps your camera free during TAS playback",
        Value = false,
        Callback = function(arg1)
            flag9 = arg1
        end,
    }
)
v14:Button(
    {
        Title = "Play This Round", Desc = "Manually triggers autoplay for the current map",
        Callback = function()
            func52()
        end,
    }
)
v14:Button(
    {
        Title = "Stop Playback", Desc = "Stops the current TAS playback",
        Callback = function()
            func41()
            v1:Notify({Title = "Autoplay", Content = "Playback stopped.", Duration = 3})
        end,
    }
)
v14:Section({Title = "Map Options"})
v14:Dropdown(
    {
        Title = "Cave Chaos Route", Values = {"Cave Chaos", "Cave Chaos Clip"}, Value = 1,
        Callback = function(arg1)
            str3 = arg1
        end,
    }
)
v14:Dropdown(
    {
        Title = "Unstable Savannah Route", Values = {"Unstable Savannah", "Unstable Savannah Clip"},
        Value = 1,
        Callback = function(arg1)
            str4 = arg1
        end,
    }
)
v17:Section({Title = "Update Notice"})
v17:Paragraph(
    {
        Title = "What's New",
        Content = "View the latest changelog anytime, even if you dismissed it permanently.",
    }
)
v17:Button(
    {
        Title = "Show Update Notice", Desc = "Re-opens the changelog dialog",
        Callback = function()
            if tbl.showUpdateNoticeManually then
                tbl.showUpdateNoticeManually()
            end
        end,
    }
)
v17:Section({Title = "UI Library"})
v17:Paragraph(
    {
        Title = "Switch UI",
        Content = "Switching will reload the entire script with Rayfield. All current toggles will reset.",
    }
)
v17:Button(
    {
        Title = "Switch to Rayfield", Desc = "Destroys WindUI and loads the Rayfield version",
        Callback = function()
            v1:Notify({Title = "Switching", Content = "Reloading with Rayfield...", Duration = 2})
            task.wait(1.5)
            if getgenv then
                getgenv().EllaHubUI = "Rayfield"
            end
            func(
                function()
                    v2:Destroy()
                end
            )
            local tbl = {LocalPlayer:FindFirstChild("PlayerGui")}
            func(
                function()
                    if gethui then
                        table.insert(tbl, gethui())
                    end
                end
            )
            func(
                function()
                    table.insert(tbl, game:GetService("CoreGui"))
                end
            )
            for _, v3 in ipairs(tbl) do
                if v3 then
                    for _, v4 in ipairs(v3:GetChildren()) do
                        if v4:IsA("ScreenGui") then
                            if v4.Name:lower():find("wind") then
                                func(
                                    function()
                                        v4:Destroy()
                                    end
                                )
                            end
                        end
                    end
                end
            end
            task.wait(0.2)
            func(
                function()
                    loadstring(
                        game:HttpGet(
                            "https://raw.githubusercontent.com/Bruhology/ella-hub/main/main.lua",
                            true
                        )
                    )()
                end
            )
        end,
    }
)
v17:Section({Title = "Toggle Key"})
v17:Paragraph({Title = "Current Key", Content = "Default is K. Change it here if needed."})
local tbl9 = {
    K = Enum.KeyCode.K, RightShift = Enum.KeyCode.RightShift, RightCtrl = Enum.KeyCode.RightControl,
    Insert = Enum.KeyCode.Insert, Home = Enum.KeyCode.Home, Delete = Enum.KeyCode.Delete,
    F4 = Enum.KeyCode.F4, F5 = Enum.KeyCode.F5, F6 = Enum.KeyCode.F6,
}
v17:Dropdown(
    {
        Title = "Toggle Key", Desc = "Key to show/hide the UI (default: K)",
        Values = {"K", "RightShift", "RightCtrl", "Insert", "Home", "Delete", "F4", "F5", "F6"},
        Value = 1,
        Callback = function(arg1)
            local v3 = tbl9[arg1]
            if v3 then
                func(
                    function()
                        v2:ChangeToggleKey(v3)
                    end
                )
                v1:Notify({Title = "Toggle Key", Content = "Changed to " .. arg1, Duration = 3})
            end
        end,
    }
)
v17:Section({Title = "WindUI Theme"})
v17:Paragraph(
    {
        Title = "Theme",
        Content = "Change the colour theme of the WindUI window. Takes effect immediately.",
    }
)
v17:Dropdown(
    {
        Title = "Theme", Desc = "Pick a WindUI colour theme",
        Values = {"Dark", "Light", "Aqua", "Bloom", "Rose"}, Value = 1,
        Callback = function(arg1)
            func(
                function()
                    v1:SetTheme(arg1)
                end
            )
            v1:Notify({Title = "Theme", Content = "Switched to " .. arg1, Duration = 3})
        end,
    }
)
v2:Init()
v1:Notify({Title = "Ella Hub V2", Content = "Loaded! Press K to toggle.", Duration = 5})

-- https://discord.gg/hkQAMzyGum

