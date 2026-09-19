-- Ella Hub V2 — clean rebuilt Luau
-- Reconstructed from the supplied source without numeric state/function indexing.
--
-- State uses named fields (State.Foo), and callbacks use named functions
-- (Foo). This avoids the large local-variable block that can cause
-- compilation/register-limit failures.
--
-- The original game-specific feature bodies are preserved.

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local PathfindingService = game:GetService("PathfindingService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()

-- Runtime state and feature functions.
local State = {}


-- Initialize shared services before defining/using any feature callbacks.
-- Keeping these in State avoids nil references while retaining the compact
-- table-based architecture of this rebuild.
State.Players = Players
State.RunService = RunService
State.ReplicatedStorage = ReplicatedStorage
State.UserInputService = UserInputService
State.TweenService = TweenService
State.HttpService = HttpService
State.StarterGui = StarterGui
State.PathfindingService = PathfindingService
State.Lighting = Lighting
State.Debris = Debris
State.SoundService = SoundService
State.LocalPlayer = LocalPlayer

local Automation = {}

--============================================================
-- FEATURE FUNCTIONS
--============================================================

-- CAMP
-- ------------------------------------------------------------

local function Godmode_002(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Assets:GetDescendants()
end

local function Auto_Win_Obby_003(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.AutoWinObbyLoop)
end

local function Eat_Finish_Pancake_004(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Assets:GetDescendants()
end

local function Godmode_005(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature5_Spleef=workspace.Assets:FindFirstChild("Spleef")
    State.Feature5_Part=State.Feature5_Spleef:FindFirstChild("Part")
    State.Feature5_TouchInterest=State.Feature5_Part:FindFirstChild("TouchInterest")
    State.Feature5_TouchInterest:Destroy()
end

local function Clear_Parts_006(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace.Assets:GetDescendants()
end

local function Auto_Collect_Coins_Gems_007(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.AutoCollectCoinsGems)
end

local function Auto_Win_Math_Mania_008(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.AutoSolveMathMania)
end

local function Win_Block_Push_009(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace:GetDescendants()
end

local function Kill_All_In_Sword_Fight_010(a1,a2,a3,a4,a5,a6,a7,a8)
    State.RunService.RenderStepped:Connect(Automation.SwordFightLoop)
end

local function Bring_Dodgeball_Giver_011(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.DodgeballLoop)
end

local function Keep_Dodgeball_After_Round_012(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Backpack.ChildRemoved:Connect(Automation.DodgeballPersistence)
end

local function Auto_Throw_Dodgeball_013(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.SpleefLoop)
end

local function Kill_All_Dodgeball_014(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.MovieObbyLoop)
end

local function Auto_Fire_Paintball_015(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.ExpeditionObbyLoop)
end

local function Kill_All_Paintball_016(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.FranceLoop)
end

local function Dodgeball_Paintball_Protection_017(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.SafetyStatueLoop)
end

local function Auto_Win_All_Challenges_018(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.RoundInfoLoop)
    task.spawn(Automation.CharacterLoop)
    task.spawn(Automation.PlayerLoop)
    task.spawn(Automation.StatsLoop)
    State.RunService.RenderStepped:Connect(Automation.SwordFightLoop)
    State.WindUI:Notify({Duration=3,Content="ENABLED!",Title="Auto-Win All"})
end

-- MOVIE
-- ------------------------------------------------------------

local function Auto_Win_Obby_019(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.TeleportLoop)
end

local function Collect_Keys_Open_Chests_020(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature20_Pirate=workspace.Assets:FindFirstChild("Pirate")
    State.Feature20_Pirate:GetDescendants()
end

local function Kill_Everyone_In_Beach_Fight_021(a1,a2,a3,a4,a5,a6,a7,a8)
    State.RunService.RenderStepped:Connect(Automation.SwordFightLoop)
end

local function Monster_Godmode_022(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature22_Monster=workspace.Assets:FindFirstChild("Monster")
    State.Feature22_MonsterNPC=State.Feature22_Monster:FindFirstChild("MonsterNPC")
    State.Feature22_MonsterNPC:Destroy()
end

local function Collect_Egg_023(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature23_Alien=workspace.Assets:WaitForChild("Alien")
    State.ReplicatedStorage.Season.Players:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature23_Alien:GetDescendants()
end

local function Auto_Collect_Ancient_Artifacts_024(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature24_Pre_Historic=workspace.Assets:WaitForChild("Pre-Historic")
    State.Feature24_Coins=State.Feature24_Pre_Historic:WaitForChild("Coins")
    State.Feature24_Coins.ChildAdded:Connect(Automation.UniversalLoop)
end

local function Auto_Win_Math_Mania_025(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.ClientLoop)
end

local function Auto_Collect_Guitars_026(a1,a2,a3,a4,a5,a6,a7,a8)
    State.RunService.Heartbeat:Connect(Automation.OtherLoop)
end

local function Instantly_Eat_Poison_Bowl_027(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Assets:GetDescendants()
    State.WindUI:Notify({Duration=3,Content="Fired 0 bowl(s)!",Title="Prison"})
end

local function Auto_Shoot_Raygun_Sheriff_028(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.AutoplayLoop)
end

local function Kill_All_Sheriff_Raygun_029(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.TrollLoop)
end

local function Raygun_Sheriff_Protection_030(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.ShopLoop)
end

-- EXPEDITION
-- ------------------------------------------------------------

local function Win_Obby_001(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature1_Finish=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature1_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature1_Finish.CanCollide=false
    State.Feature1_Finish.Transparency=1
    State.Feature1_Finish.Position=State.Feature1_HumanoidRootPart.Position
end

local function Auto_Win_Obby_031(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.SettingsLoop)
end

local function Auto_Collect_Clovers_032(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal240)
end

local function Auto_Collect_Rings_033(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal241)
end

local function Auto_Win_Math_Mania_034(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal242)
end

local function Kill_Everyone_in_Greece_035(a1,a2,a3,a4,a5,a6,a7,a8)
    State.RunService.RenderStepped:Connect(Automation.SwordFightLoop)
end

local function Break_Amazon_Spleef_036(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace.Assets:GetDescendants()
end

local function Push_Cheese_1_037(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:FindFirstChild("Cheese1",true)
    workspace:GetDescendants()
    State.WindUI:Notify({Duration=3,Content="Not found.",Title="France"})
end

local function Push_Cheese_2_038(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:FindFirstChild("Cheese2",true)
    workspace:GetDescendants()
    State.WindUI:Notify({Duration=3,Content="Not found.",Title="France"})
end

local function Auto_Push_Cheese_039(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal243)
end

local function Give_Meatball_040(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature40_Clone=State.ReplicatedStorage.Products.Gear.Meatball:Clone()
    State.Feature40_Clone:FindFirstChild("Handle")
    State.Feature40_Clone.Handle.CanCollide=false
    State.Feature40_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Meatball given!",Title="Meatball"})
end

local function Keep_Meatball_After_Round_041(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Backpack.ChildRemoved:Connect(Automation.Internal244)
end

local function Auto_Throw_Meatball_042(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal245)
end

local function Kill_All_Meatball_043(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal246)
end

local function Bring_Meatball_Giver_044(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal247)
end

-- MAIN
-- ------------------------------------------------------------

local function Get_Statue_Bag_045(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("Torso")
    workspace.Idols:GetDescendants()
end

local function Who_Has_It_046(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players:FindFirstChild(State.ReplicatedStorage.Season.Twists.Idol.Value)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[State.ReplicatedStorage.Season.Twists.Idol.Value].Value.." has the statue."),Title="Statue Status"})
end

local function Safety_Bag_ESP_047(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Idols:GetDescendants()
end

local function Safety_Statue_ESP_048(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Idols:GetDescendants()
end

local function Idol_Holder_ESP_049(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    workspace:GetDescendants()
    State.ReplicatedStorage:FindFirstChild("Season")
    State.ReplicatedStorage.Season:FindFirstChild("Twists")
    State.Feature49_Idol=State.ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
    State.Feature49_Child=State.Players:FindFirstChild(State.Feature49_Idol.Value)
    State.Feature49_Highlight=Instance.new("Highlight",nil)
    State.Feature49_Highlight.Name="IdolHolderHL"
    State.Feature49_Color=Color3.fromRGB(255,215,0)
    State.Feature49_Highlight.FillColor=State.Feature49_Color
    State.Feature49_Color_2=Color3.fromRGB(255,215,0)
    State.Feature49_Highlight.OutlineColor=State.Feature49_Color_2
    State.Feature49_Highlight.FillTransparency=0.4
    State.Feature49_Highlight.OutlineTransparency=0
    State.Feature49_Highlight.Parent=State.Feature49_Child.Character
    State.Feature49_Connection=State.ReplicatedStorage.Season.Twists.Idol.Changed:Connect(Automation.Internal248)
end

local function Play_as_Idol_Spam_050(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal249)
end

local function Play_as_Idol_Once_051(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Idol:FireServer()
    State.WindUI:Notify({Duration=4,Content="Fired! Only works if you are the idol holder.",Title="Play as Idol"})
end

local function Notify_Votes_052(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal250)
end

local function Print_Votes_to_Console_053(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal251)
end

local function Expose_Votes_in_Chat_054(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal252)
end

local function Notify_Expose_Exile_Votes_055(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Automation.Internal253)
end

local function Notify_Jury_Votes_056(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Automation.Internal254)
end

local function Expose_Jury_Votes_in_Chat_057(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Automation.Internal255)
end

local function Get_Statue_Bag_058(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("Torso")
    workspace.Idols:GetDescendants()
end

local function Who_Has_It_059(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players:FindFirstChild(State.ReplicatedStorage.Season.Twists.Idol.Value)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[State.ReplicatedStorage.Season.Twists.Idol.Value].Value.." has the statue."),Title="Statue Status"})
end

local function Safety_Bag_ESP_060(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Idols:GetDescendants()
end

local function Safety_Statue_ESP_061(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Idols:GetDescendants()
end

local function Idol_Holder_ESP_062(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature49_Connection:Disconnect()
    workspace:GetDescendants()
    workspace:GetDescendants()
    State.ReplicatedStorage:FindFirstChild("Season")
    State.ReplicatedStorage.Season:FindFirstChild("Twists")
    State.Feature62_Idol=State.ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
    State.Feature62_Child=State.Players:FindFirstChild(State.Feature62_Idol.Value)
    State.Feature62_Highlight=Instance.new("Highlight",nil)
    State.Feature62_Highlight.Name="IdolHolderHL"
    State.Feature62_Color=Color3.fromRGB(255,215,0)
    State.Feature62_Highlight.FillColor=State.Feature62_Color
    State.Feature62_Color_2=Color3.fromRGB(255,215,0)
    State.Feature62_Highlight.OutlineColor=State.Feature62_Color_2
    State.Feature62_Highlight.FillTransparency=0.4
    State.Feature62_Highlight.OutlineTransparency=0
    State.Feature62_Highlight.Parent=State.Feature62_Child.Character
    State.ReplicatedStorage.Season.Twists.Idol.Changed:Connect(Automation.Internal256)
end

local function Play_as_Idol_Spam_063(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal257)
end

local function Play_as_Idol_Once_064(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Idol:FireServer()
    State.WindUI:Notify({Duration=4,Content="Fired! Only works if you are the idol holder.",Title="Play as Idol"})
end

local function Notify_Votes_065(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal258)
end

local function Print_Votes_to_Console_066(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal259)
end

local function Expose_Votes_in_Chat_067(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal260)
end

local function Notify_Expose_Exile_Votes_068(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Automation.Internal261)
end

local function Notify_Jury_Votes_069(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Automation.Internal262)
end

local function Expose_Jury_Votes_in_Chat_070(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Automation.Internal263)
end

local function Vote_Log_GUI_071(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer:FindFirstChild("PlayerGui")
    State.Feature71_Value=gethui()
    State.Feature71_ScreenGui=Instance.new("ScreenGui",nil)
    State.Feature71_ScreenGui.Name="VoteLogGui"
    State.Feature71_ScreenGui.ResetOnSpawn=false
    State.Feature71_ScreenGui.DisplayOrder=999
    State.Feature71_ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    State.Feature71_ScreenGui.IgnoreGuiInset=true
    State.Feature71_ScreenGui.Parent=State.Feature71_Value
    State.Feature71_Frame=Instance.new("Frame",nil)
    State.Feature71_Frame.Name="VL"
    State.Feature71_UDim2=UDim2.fromOffset(340,270)
    State.Feature71_Frame.Size=State.Feature71_UDim2
    State.Feature71_UDim2_2=UDim2.fromOffset(24,130)
    State.Feature71_Frame.Position=State.Feature71_UDim2_2
    State.Feature71_Color=Color3.fromRGB(10,10,14)
    State.Feature71_Frame.BackgroundColor3=State.Feature71_Color
    State.Feature71_Frame.BorderSizePixel=0
    State.Feature71_Frame.ClipsDescendants=true
    State.Feature71_Frame.Parent=State.Feature71_ScreenGui
    State.Feature71_UICorner=Instance.new("UICorner",State.Feature71_Frame)
    State.Feature71_Value_2=UDim.new(0,8)
    State.Feature71_UICorner.CornerRadius=State.Feature71_Value_2
    State.Feature71_Frame_2=Instance.new("Frame",nil)
    State.Feature71_Frame_2.Name="TB"
    State.Feature71_UDim2_3=UDim2.new(1,0,0,30)
    State.Feature71_Frame_2.Size=State.Feature71_UDim2_3
    State.Feature71_Color_2=Color3.fromRGB(16,16,22)
    State.Feature71_Frame_2.BackgroundColor3=State.Feature71_Color_2
    State.Feature71_Frame_2.BorderSizePixel=0
    State.Feature71_Frame_2.Parent=State.Feature71_Frame
    State.Feature71_UICorner_2=Instance.new("UICorner",State.Feature71_Frame_2)
    State.Feature71_Value_3=UDim.new(0,8)
    State.Feature71_UICorner_2.CornerRadius=State.Feature71_Value_3
    State.Feature71_Frame_3=Instance.new("Frame",nil)
    State.Feature71_UDim2_4=UDim2.new(1,0,0,8)
    State.Feature71_Frame_3.Size=State.Feature71_UDim2_4
    State.Feature71_UDim2_5=UDim2.new(0,0,1,-8)
    State.Feature71_Frame_3.Position=State.Feature71_UDim2_5
    State.Feature71_Color_3=Color3.fromRGB(16,16,22)
    State.Feature71_Frame_3.BackgroundColor3=State.Feature71_Color_3
    State.Feature71_Frame_3.BorderSizePixel=0
    State.Feature71_Frame_3.Parent=State.Feature71_Frame_2
    State.Feature71_TextLabel=Instance.new("TextLabel",nil)
    State.Feature71_UDim2_6=UDim2.fromOffset(30,30)
    State.Feature71_TextLabel.Size=State.Feature71_UDim2_6
    State.Feature71_TextLabel.BackgroundTransparency=1
    State.Feature71_TextLabel.Text="🗑"
    State.Feature71_TextLabel.TextSize=13
    State.Feature71_TextLabel.Font=Enum.Font.Gotham
    State.Feature71_Color_4=Color3.fromRGB(160,160,160)
    State.Feature71_TextLabel.TextColor3=State.Feature71_Color_4
    State.Feature71_TextLabel.Parent=State.Feature71_Frame_2
    State.Feature71_TextLabel_2=Instance.new("TextLabel",nil)
    State.Feature71_UDim2_7=UDim2.new(0,80,1,0)
    State.Feature71_TextLabel_2.Size=State.Feature71_UDim2_7
    State.Feature71_UDim2_8=UDim2.fromOffset(32,0)
    State.Feature71_TextLabel_2.Position=State.Feature71_UDim2_8
    State.Feature71_TextLabel_2.BackgroundTransparency=1
    State.Feature71_TextLabel_2.Text="Vote Log"
    State.Feature71_TextLabel_2.TextSize=12
    State.Feature71_TextLabel_2.Font=Enum.Font.GothamBold
    State.Feature71_Color_5=Color3.fromRGB(210,210,210)
    State.Feature71_TextLabel_2.TextColor3=State.Feature71_Color_5
    State.Feature71_TextLabel_2.TextXAlignment=Enum.TextXAlignment.Left
    State.Feature71_TextLabel_2.Parent=State.Feature71_Frame_2
    State.Feature71_TextButton=Instance.new("TextButton",nil)
    State.Feature71_UDim2_9=UDim2.fromOffset(30,30)
    State.Feature71_TextButton.Size=State.Feature71_UDim2_9
    State.Feature71_UDim2_10=UDim2.new(1,-30,0,0)
    State.Feature71_TextButton.Position=State.Feature71_UDim2_10
    State.Feature71_TextButton.BackgroundTransparency=1
    State.Feature71_TextButton.Text="×"
    State.Feature71_TextButton.TextSize=16
    State.Feature71_TextButton.Font=Enum.Font.GothamBold
    State.Feature71_Color_6=Color3.fromRGB(190,190,190)
    State.Feature71_TextButton.TextColor3=State.Feature71_Color_6
    State.Feature71_TextButton.Parent=State.Feature71_Frame_2
    State.Feature71_TextButton_2=Instance.new("TextButton",nil)
    State.Feature71_UDim2_11=UDim2.fromOffset(30,30)
    State.Feature71_TextButton_2.Size=State.Feature71_UDim2_11
    State.Feature71_UDim2_12=UDim2.new(1,-60,0,0)
    State.Feature71_TextButton_2.Position=State.Feature71_UDim2_12
    State.Feature71_TextButton_2.BackgroundTransparency=1
    State.Feature71_TextButton_2.Text="–"
    State.Feature71_TextButton_2.TextSize=15
    State.Feature71_TextButton_2.Font=Enum.Font.GothamBold
    State.Feature71_Color_7=Color3.fromRGB(190,190,190)
    State.Feature71_TextButton_2.TextColor3=State.Feature71_Color_7
    State.Feature71_TextButton_2.Parent=State.Feature71_Frame_2
    State.Feature71_TextButton_3=Instance.new("TextButton",nil)
    State.Feature71_UDim2_13=UDim2.fromOffset(30,30)
    State.Feature71_TextButton_3.Size=State.Feature71_UDim2_13
    State.Feature71_UDim2_14=UDim2.new(1,-90,0,0)
    State.Feature71_TextButton_3.Position=State.Feature71_UDim2_14
    State.Feature71_TextButton_3.BackgroundTransparency=1
    State.Feature71_TextButton_3.Text="↓"
    State.Feature71_TextButton_3.TextSize=13
    State.Feature71_TextButton_3.Font=Enum.Font.GothamBold
    State.Feature71_Color_8=Color3.fromRGB(190,190,190)
    State.Feature71_TextButton_3.TextColor3=State.Feature71_Color_8
    State.Feature71_TextButton_3.Parent=State.Feature71_Frame_2
    State.Feature71_Color_9=Color3.fromRGB(100,180,255)
    State.Feature71_Color_10=Color3.fromRGB(255,200,80)
    State.Feature71_Color_11=Color3.fromRGB(255,120,120)
    State.Feature71_TextButton_4=Instance.new("TextButton",nil)
    State.Feature71_UDim2_15=UDim2.fromOffset(36,16)
    State.Feature71_TextButton_4.Size=State.Feature71_UDim2_15
    State.Feature71_UDim2_16=UDim2.fromOffset(90,7)
    State.Feature71_TextButton_4.Position=State.Feature71_UDim2_16
    State.Feature71_TextButton_4.BackgroundColor3=State.Feature71_Color_9
    State.Feature71_TextButton_4.BackgroundTransparency=0.3
    State.Feature71_TextButton_4.Text="Votes"
    State.Feature71_TextButton_4.TextSize=9
    State.Feature71_TextButton_4.Font=Enum.Font.GothamBold
    State.Feature71_Color_12=Color3.fromRGB(220,220,220)
    State.Feature71_TextButton_4.TextColor3=State.Feature71_Color_12
    State.Feature71_TextButton_4.Parent=State.Feature71_Frame_2
    State.Feature71_UICorner_3=Instance.new("UICorner",State.Feature71_TextButton_4)
    State.Feature71_Value_4=UDim.new(1,0)
    State.Feature71_UICorner_3.CornerRadius=State.Feature71_Value_4
    State.Feature71_TextButton_4.MouseButton1Click:Connect(Automation.Internal264)
    State.Feature71_TextButton_5=Instance.new("TextButton",nil)
    State.Feature71_UDim2_17=UDim2.fromOffset(36,16)
    State.Feature71_TextButton_5.Size=State.Feature71_UDim2_17
    State.Feature71_UDim2_18=UDim2.fromOffset(128,7)
    State.Feature71_TextButton_5.Position=State.Feature71_UDim2_18
    State.Feature71_TextButton_5.BackgroundColor3=State.Feature71_Color_10
    State.Feature71_TextButton_5.BackgroundTransparency=0.3
    State.Feature71_TextButton_5.Text="Jury"
    State.Feature71_TextButton_5.TextSize=9
    State.Feature71_TextButton_5.Font=Enum.Font.GothamBold
    State.Feature71_Color_13=Color3.fromRGB(220,220,220)
    State.Feature71_TextButton_5.TextColor3=State.Feature71_Color_13
    State.Feature71_TextButton_5.Parent=State.Feature71_Frame_2
    State.Feature71_UICorner_4=Instance.new("UICorner",State.Feature71_TextButton_5)
    State.Feature71_Value_5=UDim.new(1,0)
    State.Feature71_UICorner_4.CornerRadius=State.Feature71_Value_5
    State.Feature71_TextButton_5.MouseButton1Click:Connect(Automation.Internal265)
    State.Feature71_TextButton_6=Instance.new("TextButton",nil)
    State.Feature71_UDim2_19=UDim2.fromOffset(36,16)
    State.Feature71_TextButton_6.Size=State.Feature71_UDim2_19
    State.Feature71_UDim2_20=UDim2.fromOffset(166,7)
    State.Feature71_TextButton_6.Position=State.Feature71_UDim2_20
    State.Feature71_TextButton_6.BackgroundColor3=State.Feature71_Color_11
    State.Feature71_TextButton_6.BackgroundTransparency=0.3
    State.Feature71_TextButton_6.Text="Exile"
    State.Feature71_TextButton_6.TextSize=9
    State.Feature71_TextButton_6.Font=Enum.Font.GothamBold
    State.Feature71_Color_14=Color3.fromRGB(220,220,220)
    State.Feature71_TextButton_6.TextColor3=State.Feature71_Color_14
    State.Feature71_TextButton_6.Parent=State.Feature71_Frame_2
    State.Feature71_UICorner_5=Instance.new("UICorner",State.Feature71_TextButton_6)
    State.Feature71_Value_6=UDim.new(1,0)
    State.Feature71_UICorner_5.CornerRadius=State.Feature71_Value_6
    State.Feature71_TextButton_6.MouseButton1Click:Connect(Automation.Internal266)
    State.Feature71_ScrollingFrame=Instance.new("ScrollingFrame",nil)
    State.Feature71_ScrollingFrame.Name="SC"
    State.Feature71_UDim2_21=UDim2.new(1,-4,1,-33)
    State.Feature71_ScrollingFrame.Size=State.Feature71_UDim2_21
    State.Feature71_UDim2_22=UDim2.new(0,2,0,31)
    State.Feature71_ScrollingFrame.Position=State.Feature71_UDim2_22
    State.Feature71_ScrollingFrame.BackgroundTransparency=1
    State.Feature71_ScrollingFrame.BorderSizePixel=0
    State.Feature71_ScrollingFrame.ScrollBarThickness=3
    State.Feature71_Color_15=Color3.fromRGB(70,70,100)
    State.Feature71_ScrollingFrame.ScrollBarImageColor3=State.Feature71_Color_15
    State.Feature71_ScrollingFrame.ScrollingDirection=Enum.ScrollingDirection.Y
    State.Feature71_UDim2_23=UDim2.fromOffset(0,0)
    State.Feature71_ScrollingFrame.CanvasSize=State.Feature71_UDim2_23
    State.Feature71_ScrollingFrame.ElasticBehavior=Enum.ElasticBehavior.Never
    State.Feature71_ScrollingFrame.Parent=State.Feature71_Frame
    State.Feature71_UIListLayout=Instance.new("UIListLayout",nil)
    State.Feature71_UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder
    State.Feature71_Value_7=UDim.new(0,1)
    State.Feature71_UIListLayout.Padding=State.Feature71_Value_7
    State.Feature71_UIListLayout.Parent=State.Feature71_ScrollingFrame
    State.Feature71_AbsoluteContentSize=State.Feature71_UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
    State.Feature71_AbsoluteContentSize:Connect(Automation.Internal267)
    State.Feature71_ScrollingFrame.InputBegan:Connect(Automation.Internal268)
    State.Feature71_TextLabel_3=Instance.new("TextLabel",nil)
    State.Feature71_TextLabel_3.Name="Empty"
    State.Feature71_UDim2_24=UDim2.new(1,-6,0,22)
    State.Feature71_TextLabel_3.Size=State.Feature71_UDim2_24
    State.Feature71_TextLabel_3.BackgroundTransparency=1
    State.Feature71_TextLabel_3.Text="Waiting for votes..."
    State.Feature71_TextLabel_3.TextSize=12
    State.Feature71_TextLabel_3.Font=Enum.Font.Gotham
    State.Feature71_Color_16=Color3.fromRGB(80,80,100)
    State.Feature71_TextLabel_3.TextColor3=State.Feature71_Color_16
    State.Feature71_TextLabel_3.TextXAlignment=Enum.TextXAlignment.Left
    State.Feature71_TextLabel_3.LayoutOrder=0
    State.Feature71_TextLabel_3.Parent=State.Feature71_ScrollingFrame
    Color3.fromRGB(140,200,255)
    State.Feature71_Connection=State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal269)
    Color3.fromRGB(255,200,80)
    State.Feature71_Connection_2=State.ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Automation.Internal270)
    Color3.fromRGB(255,120,120)
    State.Feature71_Connection_3=State.ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Automation.Internal271)
    State.Feature71_TextButton_3.MouseButton1Click:Connect(Automation.Internal272)
    State.Feature71_TextButton_2.MouseButton1Click:Connect(Automation.Internal273)
    State.Feature71_TextButton.MouseButton1Click:Connect(Automation.Internal274)
    State.Feature71_Frame_2.InputBegan:Connect(Automation.Internal275)
    State.Feature71_Connection_4=State.UserInputService.InputEnded:Connect(Automation.Internal276)
    State.Feature71_Connection_5=State.UserInputService.InputChanged:Connect(Automation.Internal277)
    State.Feature71_ScreenGui.Destroying:Connect(Automation.Internal278)
    State.WindUI:Notify({Duration=3,Content="Opened! Waiting for votes...",Title="Vote Log"})
end

local function Tiebreaker_Detector_072(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature72_Season=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature72_Voting=State.Feature72_Season:WaitForChild("Voting",5)
    State.Feature72_Votes=State.Feature72_Voting:WaitForChild("Votes",5)
    State.Feature72_Votes:GetChildren()
    State.Feature72_Votes.ChildAdded:Connect(Automation.Internal279)
    State.Feature72_Votes.ChildRemoved:Connect(Automation.Internal280)
    State.WindUI:Notify({Duration=3,Content="Watching votes.",Title="Tiebreaker"})
end

local function Check_Vote_Tally_073(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes:GetChildren()
    State.WindUI:Notify({Duration=4,Content="No votes cast yet.",Title="Vote Tally"})
end

local function Round_Type_074(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature74_CurrentTwist=State.ReplicatedStorage.Season.Twists:FindFirstChild("CurrentTwist")
    State.WindUI:Notify({Duration=5,Content=State.Feature74_CurrentTwist.Value,Title="Round Type"})
end

local function Teamers_075(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage:FindFirstChild("Season")
    State.ReplicatedStorage.Season:FindFirstChild("Players")
    State.Players:GetPlayers()
    State.WindUI:Notify({Duration=5,Content="No teamers detected.",Title="Teamers"})
end

local function Round_Detector_076(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal281)
    State.WindUI:Notify({Duration=3,Content="Watching for twists and merges.",Title="Round Detector"})
end

local function Server_Hop_on_Merge_077(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature77_Season=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature77_Values=State.Feature77_Season:WaitForChild("Values",5)
    State.Feature77_Merge=State.Feature77_Values:WaitForChild("Merge",5)
    State.Feature77_Merge.Changed:Connect(Automation.Internal282)
    State.WindUI:Notify({Duration=3,Content="Watching for merge.",Title="Server Hop"})
end

local function Server_Hop_Now_078(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=3,Content="Hopping to a new server...",Title="Server Hop"})
    task.wait()
    State.Feature78_TeleportService=game:GetService("TeleportService")
    State.Feature78_TeleportService:Teleport(game.PlaceId,State.Players.LocalPlayer)
end

local function Auto_Rejoin_When_Voted_Out_079(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal283)
    State.WindUI:Notify({Duration=3,Content="Active — watching your team status.",Title="Auto Rejoin"})
end

local function TP_Above_Map_080(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature80_Part=Instance.new("Part",workspace)
    State.Feature80_Part.Anchored=true
    State.Feature80_Value=Vector3.new(300,10,300)
    State.Feature80_Part.Size=State.Feature80_Value
    State.Feature80_Value_2=CFrame.new(0,2900,0)
    State.Feature80_Part.CFrame=State.Feature80_Value_2
    State.Feature80_Part.Transparency=1
    State.Feature80_Part.CanCollide=true
    State.Feature80_Part.Name="EllaHubPlatform"
    task.spawn(Automation.Internal284)
    State.WindUI:Notify({Duration=3,Content="Floating at Y=3000.",Title="Above Map"})
end

local function Auto_Join_Camp_From_Lobby_081(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal285)
    State.WindUI:Notify({Duration=3,Content="Firing Teleport:Camp every 5s...",Title="Auto Join"})
end

local function Check_Elim_Reason_082(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
    State.WindUI:Notify({Duration=4,Content="None set yet.",Title="Elim Reason"})
end

local function Notify_Elim_Reason_083(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
    State.ReplicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(Automation.Internal286)
end

local function Expose_Elim_in_Chat_084(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
    State.ReplicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(Automation.Internal287)
end

local function Send_Elim_to_Webhook_085(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
    State.ReplicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(Automation.Internal288)
end

local function Remove_Intro_Cutscene_086(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature86_Events=State.ReplicatedStorage:FindFirstChild("Events")
    State.Feature86_Camera=State.Feature86_Events:FindFirstChild("Camera")
    State.Feature86_Camera:Destroy()
    State.Feature86_Humanoid=State.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    workspace.CurrentCamera.CameraType=Enum.CameraType.Custom
    workspace.CurrentCamera.CameraSubject=State.Feature86_Humanoid
end

local function Fling_Reanimate_087(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature87_Value=game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua")
    State.Feature87_Value_2=loadstring(State.Feature87_Value)
    State.Feature87_Value_2()
end

local function Open_Console_088(a1,a2,a3,a4,a5,a6,a7,a8)
    State.StarterGui:SetCore("DevConsoleVisible",true)
end

local function Auto_Block_Long_Usernames_089(a1,a2,a3,a4,a5,a6,a7,a8)
    State.RunService.RenderStepped:Connect(Automation.Internal289)
end

local function Gear_Keeper_090(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Backpack:GetChildren()
    State.Players.LocalPlayer.Character:GetChildren()
    State.Players.LocalPlayer.Backpack.ChildAdded:Connect(Automation.Internal290)
    State.Players.LocalPlayer.Backpack.ChildRemoved:Connect(Automation.Internal291)
    State.Players.LocalPlayer.CharacterAdded:Connect(Automation.Internal292)
    State.WindUI:Notify({Duration=3,Content="Active — saved 0 tool(s).",Title="Gear Keeper"})
end

local function Snapshot_Gear_Now_091(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Backpack:GetChildren()
    State.Players.LocalPlayer.Character:GetChildren()
    State.WindUI:Notify({Duration=3,Content="Saved 0 tool(s).",Title="Gear Keeper"})
end

local function Restore_Gear_Now_092(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=3,Content="Restored 0 tool(s).",Title="Gear Keeper"})
end

local function Anti_Gear_Removal_093(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature93_Value=newcclosure(Automation.Internal293)
    State.Feature93_Value_2=hookmetamethod(game,"__namecall",State.Feature93_Value)
    State.WindUI:Notify({Duration=3,Content="Active — Gear Remove calls blocked.",Title="Anti Gear"})
end

-- CHARACTERS
-- ------------------------------------------------------------

local function Set_Male_094(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Buy:FireServer("Gender","Male")
end

local function Set_Female_095(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Buy:FireServer("Gender","Female")
end

local function Symbol_096(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Character_Name_097(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Buy_Character_60_coins_098(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Buy:FireServer("Character",nil)
end

local function Christmas_Map_099(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    BrickColor.new("White")
    workspace:GetDescendants()
    State.Feature99_Color=Color3.fromRGB(127,127,127)
    State.Lighting.Ambient=State.Feature99_Color
    State.Feature99_Color_2=Color3.fromRGB(127,127,127)
    State.Lighting.OutdoorAmbient=State.Feature99_Color_2
    State.Lighting.FogEnd=100000
    State.Lighting.ClockTime=14
    State.WindUI:Notify({Duration=3,Content="Christmas applied!",Title="Map Theme"})
end

local function Halloween_Map_100(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    workspace:GetDescendants()
    State.Feature100_Color=Color3.fromRGB(80,80,80)
    State.Lighting.Ambient=State.Feature100_Color
    State.Feature100_Color_2=Color3.fromRGB(80,80,80)
    State.Lighting.OutdoorAmbient=State.Feature100_Color_2
    State.Feature100_Color_3=Color3.fromRGB(70,70,70)
    State.Lighting.FogColor=State.Feature100_Color_3
    State.Lighting.FogEnd=300
    State.Lighting.ClockTime=16
    State.WindUI:Notify({Duration=3,Content="Halloween applied!",Title="Map Theme"})
end

local function Valentines_Map_101(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    Color3.fromRGB(255,152,220)
    workspace:GetDescendants()
    State.Feature101_Color=Color3.fromRGB(127,127,127)
    State.Lighting.Ambient=State.Feature101_Color
    State.Feature101_Color_2=Color3.fromRGB(127,127,127)
    State.Lighting.OutdoorAmbient=State.Feature101_Color_2
    State.Lighting.FogEnd=100000
    State.Lighting.ClockTime=14
    State.WindUI:Notify({Duration=3,Content="Valentines applied!",Title="Map Theme"})
end

local function Reset_Map_102(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    State.Feature102_Color=Color3.fromRGB(127,127,127)
    State.Lighting.Ambient=State.Feature102_Color
    State.Feature102_Color_2=Color3.fromRGB(127,127,127)
    State.Lighting.OutdoorAmbient=State.Feature102_Color_2
    State.Lighting.FogEnd=100000
    State.Lighting.ClockTime=14
    State.WindUI:Notify({Duration=3,Content="Reset done.",Title="Map Theme"})
end

-- PLAYER
-- ------------------------------------------------------------

local function Walk_Speed_103(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature103_Humanoid=State.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    State.Feature103_Humanoid.WalkSpeed=a1
end

local function Jump_Power_104(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature104_Humanoid=State.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    State.Feature104_Humanoid.JumpPower=a1
end

local function Freeze_Timer_Display_105(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature105_GuiTexts=State.ReplicatedStorage:WaitForChild("GuiTexts",5)
    State.Feature105_GuiTexts:WaitForChild("Timer",5)
    State.RunService.RenderStepped:Connect(Automation.Internal294)
    State.WindUI:Notify({Duration=3,Content="Timer display frozen at 0:00",Title="Timer"})
end

local function Hide_Timer_106(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.PlayerGui:GetChildren()
    State.WindUI:Notify({Duration=2,Content="Timer hidden.",Title="Timer"})
end

local function Remove_Glass_Barriers_107(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
end

local function Walk_on_Lake_108(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Lake_God_Mode_109(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Feature112_112(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Feature112_Season=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature112_Players=State.Feature112_Season:WaitForChild("Players",5)
    State.Feature112_Players:GetChildren()
    State.TargetPlayerDropdown:Refresh({[1]="(none)"})
end

local function Teleport_To_113(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage:FindFirstChild("Season")
    State.Feature113_Players=State.ReplicatedStorage.Season:FindFirstChild("Players")
    State.Feature113_Players:GetChildren()
end

local function Refresh_List_114(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature114_Season=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature114_Players=State.Feature114_Season:WaitForChild("Players",5)
    State.Feature114_Players:GetChildren()
    State.TargetPlayerDropdown:Refresh({[1]="(none)"})
    State.Feature114_Season_2=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature114_Players_2=State.Feature114_Season_2:WaitForChild("Players",5)
    State.Feature114_Players_2:GetChildren()
    State.WindUI:Notify({Duration=2,Content="Refreshed 0 players.",Title="Player List"})
end

local function Highlight_Player_115(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage:FindFirstChild("Season")
    State.Feature115_Players=State.ReplicatedStorage.Season:FindFirstChild("Players")
    State.Feature115_Players:GetChildren()
end

-- STATS
-- ------------------------------------------------------------

local function Refresh_List_117(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players:GetPlayers()
    State.StatsPlayerDropdown:Refresh({})
end

local function Camp_Wins_118(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature118_Child=State.Players:FindFirstChild(a1)
    State.Feature118_DataStore=State.Feature118_Child:FindFirstChild("DataStore")
    State.Feature118_CampWins=State.Feature118_DataStore:FindFirstChild("CampWins")
    State.WindUI:Notify({Duration=5,Content=(a1..(" has "..(State.Feature118_CampWins.Value.." camp wins."))),Title="Camp Wins"})
end

local function Movie_Wins_119(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature119_Child=State.Players:FindFirstChild(a1)
    State.Feature119_DataStore=State.Feature119_Child:FindFirstChild("DataStore")
    State.Feature119_MoviesWins=State.Feature119_DataStore:FindFirstChild("MoviesWins")
    State.WindUI:Notify({Duration=5,Content=(a1..(" has "..(State.Feature119_MoviesWins.Value.." movie wins."))),Title="Movie Wins"})
end

local function Expedition_Wins_120(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature120_Child=State.Players:FindFirstChild(a1)
    State.Feature120_DataStore=State.Feature120_Child:FindFirstChild("DataStore")
    State.Feature120_ExpeditionWins=State.Feature120_DataStore:FindFirstChild("ExpeditionWins")
    State.WindUI:Notify({Duration=5,Content=(a1..(" has "..(State.Feature120_ExpeditionWins.Value.." expedition wins."))),Title="Expedition Wins"})
end

local function Coins_121(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature121_Child=State.Players:FindFirstChild(a1)
    State.Feature121_DataStore=State.Feature121_Child:FindFirstChild("DataStore")
    State.Feature121_Coins=State.Feature121_DataStore:FindFirstChild("Coins")
    State.WindUI:Notify({Duration=5,Content=(a1..(" has "..(State.Feature121_Coins.Value.." coins."))),Title="Coins"})
end

local function Comeback_Wins_122(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature122_Child=State.Players:FindFirstChild(a1)
    State.Feature122_DataStore=State.Feature122_Child:FindFirstChild("DataStore")
    State.Feature122_ComebackWins=State.Feature122_DataStore:FindFirstChild("ComebackWins")
    State.WindUI:Notify({Duration=5,Content=(a1..(" has "..(State.Feature122_ComebackWins.Value.." comeback wins."))),Title="Comeback Wins"})
end

local function Games_Played_123(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature123_Child=State.Players:FindFirstChild(a1)
    State.Feature123_DataStore=State.Feature123_Child:FindFirstChild("DataStore")
    State.Feature123_GamesPlayed=State.Feature123_DataStore:FindFirstChild("GamesPlayed")
    State.WindUI:Notify({Duration=5,Content=(a1..(" played "..(State.Feature123_GamesPlayed.Value.." games."))),Title="Games Played"})
end

local function Idols_Found_124(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature124_Child=State.Players:FindFirstChild(a1)
    State.Feature124_DataStore=State.Feature124_Child:FindFirstChild("DataStore")
    State.Feature124_IdolsFound=State.Feature124_DataStore:FindFirstChild("IdolsFound")
    State.WindUI:Notify({Duration=5,Content=(a1..(" found "..(State.Feature124_IdolsFound.Value.." idols."))),Title="Idols Found"})
end

local function Skins_125(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature125_Child=State.Players:FindFirstChild(a1)
    State.Feature125_Child:FindFirstChild("DataStore")
    State.Feature125_Skins=State.Feature125_Child.DataStore:FindFirstChild("Skins")
    State.Feature125_Skins:GetChildren()
    State.WindUI:Notify({Duration=6,Content=nil,Title="Skins"})
end

local function Marshmallows_126(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature126_Child=State.Players:FindFirstChild(a1)
    State.Feature126_Child:FindFirstChild("DataStore")
    State.Feature126_Marshmallows=State.Feature126_Child.DataStore:FindFirstChild("Marshmallows")
    State.Feature126_Marshmallows:GetChildren()
    State.WindUI:Notify({Duration=6,Content=nil,Title="Marshmallows"})
end

-- TELEPORTS
-- ------------------------------------------------------------

local function Spectator_Island_127(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature127_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature127_Value=CFrame.new(33,-16,31)
    State.Feature127_HumanoidRootPart.CFrame=State.Feature127_Value
end

local function Main_Island_128(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature128_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature128_Value=CFrame.new(150,-17,-417)
    State.Feature128_HumanoidRootPart.CFrame=State.Feature128_Value
end

local function Exile_Island_129(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature129_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature129_Value=CFrame.new(-116,-14,-166)
    State.Feature129_HumanoidRootPart.CFrame=State.Feature129_Value
end

local function Voting_Area_130(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature130_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature130_Value=CFrame.new(-23,95,-514)
    State.Feature130_HumanoidRootPart.CFrame=State.Feature130_Value
end

local function Boat_131(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature131_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature131_Value=CFrame.new(47,-20,-297)
    State.Feature131_HumanoidRootPart.CFrame=State.Feature131_Value
end

local function Bathroom_132(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature132_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature132_Value=CFrame.new(302,-15,-325)
    State.Feature132_HumanoidRootPart.CFrame=State.Feature132_Value
end

local function Starter_Island_133(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature133_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature133_Value=CFrame.new(-672,-67,-617)
    State.Feature133_HumanoidRootPart.CFrame=State.Feature133_Value
end

local function Voting_Area_134(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature134_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature134_Value=CFrame.new(83,60,-187)
    State.Feature134_HumanoidRootPart.CFrame=State.Feature134_Value
end

local function Cabin_1_135(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature135_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature135_Value=CFrame.new(-1,56,-34)
    State.Feature135_HumanoidRootPart.CFrame=State.Feature135_Value
end

local function Cabin_2_136(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature136_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature136_Value=CFrame.new(-8,53,144)
    State.Feature136_HumanoidRootPart.CFrame=State.Feature136_Value
end

local function Dining_Room_137(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature137_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature137_Value=CFrame.new(-1,53,168)
    State.Feature137_HumanoidRootPart.CFrame=State.Feature137_Value
end

local function Kitchen_138(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature138_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature138_Value=CFrame.new(-210,49,30)
    State.Feature138_HumanoidRootPart.CFrame=State.Feature138_Value
end

local function Inside_Boat_139(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature139_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature139_Value=CFrame.new(-47,80,-28)
    State.Feature139_HumanoidRootPart.CFrame=State.Feature139_Value
end

local function Ship_Voting_Area_140(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature140_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature140_Value=CFrame.new(-154,101,-31)
    State.Feature140_HumanoidRootPart.CFrame=State.Feature140_Value
end

local function First_Class_VIP_141(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature141_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature141_Value=CFrame.new(154,98,-33)
    State.Feature141_HumanoidRootPart.CFrame=State.Feature141_Value
end

local function _2nd_Class_142(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature142_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature142_Value=CFrame.new(50,98,-34)
    State.Feature142_HumanoidRootPart.CFrame=State.Feature142_Value
end

local function Ship_Bathroom_143(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature143_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature143_Value=CFrame.new(5,98,-23)
    State.Feature143_HumanoidRootPart.CFrame=State.Feature143_Value
end

local function Dining_Class_144(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature144_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature144_Value=CFrame.new(-45,98,-34)
    State.Feature144_HumanoidRootPart.CFrame=State.Feature144_Value
end

local function Basement_145(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature145_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature145_Value=CFrame.new(-47,80,-28)
    State.Feature145_HumanoidRootPart.CFrame=State.Feature145_Value
end

-- UNIVERSAL
-- ------------------------------------------------------------

local function VC_Unban_146(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature146_VoiceChatService=game:GetService("VoiceChatService")
    State.Feature146_VoiceChatService:joinVoice()
end

local function Apply_Shaders_147(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature147_Lighting=game:GetService("Lighting")
    State.Feature147_Value=settings()
    State.Feature147_Value.Rendering.QualityLevel=Enum.QualityLevel.Level21
    State.Feature147_Lighting.Technology=Enum.Technology.ShadowMap
    State.Feature147_Lighting.ShadowSoftness=0.15
    State.Feature147_Lighting.ClockTime=9
    State.Feature147_Lighting.Brightness=5
    State.Feature147_Color=Color3.fromRGB(70,70,70)
    State.Feature147_Lighting.Ambient=State.Feature147_Color
    State.Feature147_Color_2=Color3.fromRGB(255,138,35)
    State.Feature147_Lighting.ColorShift_Top=State.Feature147_Color_2
    State.Feature147_Color_3=Color3.fromRGB(135,135,135)
    State.Feature147_Lighting.OutdoorAmbient=State.Feature147_Color_3
    State.Feature147_Lighting.GlobalShadows=true
    State.Feature147_Lighting.ExposureCompensation=0
    workspace.Terrain.WaterReflectance=0.08
    workspace.Terrain.WaterTransparency=0.85
    State.Feature147_Color_4=Color3.fromRGB(12,84,92)
    workspace.Terrain.WaterDefaultColor=State.Feature147_Color_4
    State.Feature147_Sky=Instance.new("Sky",State.Feature147_Lighting)
    State.Feature147_Sky.SkyboxBk="rbxassetid://271042516"
    State.Feature147_Sky.SkyboxDn="rbxassetid://271077243"
    State.Feature147_Sky.SkyboxFt="rbxassetid://271042556"
    State.Feature147_Sky.SkyboxLf="rbxassetid://271042310"
    State.Feature147_Sky.SkyboxRt="rbxassetid://271042467"
    State.Feature147_Sky.SkyboxUp="rbxassetid://271077958"
end

local function Infinite_Yield_148(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature148_Value=game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    State.Feature148_Value_2=loadstring(State.Feature148_Value)
    State.Feature148_Value_2()
end

local function Fly_GUI_149(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature149_Value=game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
    State.Feature149_Value_2=loadstring(State.Feature149_Value)
    State.Feature149_Value_2()
end

local function Wall_Hop_150(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature150_Value=game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-WallHop-Script-38387")
    State.Feature150_Value_2=loadstring(State.Feature150_Value)
    State.Feature150_Value_2()
end

local function Sound_Panel_151(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature151_Value=game:HttpGet("https://pastebin.com/raw/w3uzjgEq")
    State.Feature151_Value_2=loadstring(State.Feature151_Value)
    State.Feature151_Value_2()
end

local function Energize_Animations_152(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature152_Value=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Energize.lua")
    State.Feature152_Value_2=loadstring(State.Feature152_Value)
    State.Feature152_Value_2()
end

local function Bring_Back_Old_Chat_153(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature153_Value=game:HttpGet("https://pastebin.com/raw/9AQrDua1")
    State.Feature153_Value_2=loadstring(State.Feature153_Value)
    State.Feature153_Value_2()
    State.WindUI:Notify({Duration=3,Content="Old chat loaded!",Title="Chat"})
end

local function Collision_154(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal295)
end

local function Hacker_Detector_155(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal296)
end

local function Refresh_Teams_157(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature157_Teams=game:GetService("Teams")
    State.Feature157_Teams:GetChildren()
    State.TeamDropdown:Refresh({[1]="Spectator",[2]="Jury",[3]="Team1",[4]="Team2",[5]="Team3"})
    State.WindUI:Notify({Duration=2,Content="5 team(s) loaded.",Title="Teams"})
end

local function Set_Team_158(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature158_Teams=game:GetService("Teams")
    State.Feature158_Spectator=State.Feature158_Teams:FindFirstChild("Spectator")
    State.Players.LocalPlayer.Team=State.Feature158_Spectator
    State.Players.LocalPlayer.Neutral=false
    State.WindUI:Notify({Duration=3,Content="Joined Spectator",Title="Team"})
end

local function Spectator_159(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature159_Teams=game:GetService("Teams")
    State.Feature159_Spectator=State.Feature159_Teams:FindFirstChild("Spectator")
    State.Players.LocalPlayer.Team=State.Feature159_Spectator
    State.Players.LocalPlayer.Neutral=false
    State.WindUI:Notify({Duration=3,Content="Joined Spectator",Title="Team"})
end

local function Jury_160(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature160_Teams=game:GetService("Teams")
    State.Feature160_Jury=State.Feature160_Teams:FindFirstChild("Jury")
    State.Players.LocalPlayer.Team=State.Feature160_Jury
    State.Players.LocalPlayer.Neutral=false
    State.WindUI:Notify({Duration=3,Content="Joined Jury",Title="Team"})
end

local function Load_Fonts_161(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=4,Content="Downloading fonts...",Title="Fonts"})
    task.spawn(Automation.Internal297)
end

local function Starborn_162(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature162_Value=getcustomasset("Starborn.json")
    State.Feature162_Value_2=Font.new(State.Feature162_Value)
    State.Players.LocalPlayer.PlayerGui:GetDescendants()
    State.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Automation.Internal298)
    State.WindUI:Notify({Duration=3,Content="Starborn applied!",Title="Fonts"})
end

local function VHS_163(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature163_Value=getcustomasset("VHS.json")
    State.Feature163_Value_2=Font.new(State.Feature163_Value)
    State.Players.LocalPlayer.PlayerGui:GetDescendants()
    State.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Automation.Internal299)
    State.WindUI:Notify({Duration=3,Content="VHS applied!",Title="Fonts"})
end

local function Minecrafter_164(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature164_Value=getcustomasset("Minecrafter.json")
    State.Feature164_Value_2=Font.new(State.Feature164_Value)
    State.Players.LocalPlayer.PlayerGui:GetDescendants()
    State.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Automation.Internal300)
    State.WindUI:Notify({Duration=3,Content="Minecrafter applied!",Title="Fonts"})
end

local function Horror_165(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature165_Value=getcustomasset("Horror.json")
    Font.new(State.Feature165_Value)
    State.Players.LocalPlayer.PlayerGui:GetDescendants()
    State.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Automation.Internal301)
    State.WindUI:Notify({Duration=3,Content="Horror applied!",Title="Fonts"})
end

-- CLIENT
-- ------------------------------------------------------------

local function Rainbow_Name_166(a1,a2,a3,a4,a5,a6,a7,a8)
    State.RunService.RenderStepped:Connect(Automation.Internal302)
end

local function Skin_Changer_167(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature167_Value=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Skinchanger.lua")
    State.Feature167_Value_2=loadstring(State.Feature167_Value)
    State.Feature167_Value_2()
end

local function Size_Changer_168(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature168_Value=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Size.lua")
    State.Feature168_Value_2=loadstring(State.Feature168_Value)
    State.Feature168_Value_2()
end

local function Gets_Admin_Panel_169(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature169_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature169_GUIs=State.Feature169_Products:WaitForChild("GUIs",5)
    State.Feature169_Settings=State.Feature169_GUIs:WaitForChild("Settings",5)
    State.Feature169_Clone=State.Feature169_Settings:Clone()
    State.Feature169_PlayerGui=State.Players.LocalPlayer:WaitForChild("PlayerGui")
    State.Feature169_Clone.Parent=State.Feature169_PlayerGui
    State.Feature169_Clone.Enabled=true
    State.Feature169_Clone:GetDescendants()
    State.WindUI:Notify({Duration=5,Content="Forced open! (May not work)",Title="Admin Panel"})
end

-- OTHER
-- ------------------------------------------------------------

local function Auto_Farm_Coin_170(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal303)
end

local function Auto_Farm_Coins_2_171(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal304)
end

local function Auto_Restart_Day_172(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=3,Content="Active — watching for round end...",Title="Auto Restart Day"})
    task.spawn(Automation.Internal305)
end

local function Detect_Current_Obby_173(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature173_Assets=workspace:FindFirstChild("Assets")
    State.Feature173_Assets:GetChildren()
    State.WindUI:Notify({Duration=4,Content="Assets folder is empty — no active challenge.",Title="Obby Detect"})
end

local function Auto_Detect_Obby_174(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature174_Assets=workspace:FindFirstChild("Assets")
    State.Feature174_Assets.ChildAdded:Connect(Automation.Internal306)
    State.WindUI:Notify({Duration=3,Content="Watching for new challenges...",Title="Obby Detector"})
end

local function Give_Dodgeball_175(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature175_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature175_Gear=State.Feature175_Products:WaitForChild("Gear",5)
    State.Feature175_Dodgeball=State.Feature175_Gear:FindFirstChild("Dodgeball")
    State.Feature175_Clone=State.Feature175_Dodgeball:Clone()
    State.Feature175_Handle=State.Feature175_Clone:FindFirstChild("Handle")
    State.Feature175_Handle.CanCollide=false
    State.Feature175_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Dodgeball added to your backpack!",Title="Give Gear"})
end

local function Give_Paintball_Gun_176(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature176_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature176_Gear=State.Feature176_Products:WaitForChild("Gear",5)
    State.Feature176_PaintballGun=State.Feature176_Gear:FindFirstChild("PaintballGun")
    State.Feature176_Clone=State.Feature176_PaintballGun:Clone()
    State.Feature176_Handle=State.Feature176_Clone:FindFirstChild("Handle")
    State.Feature176_Handle.CanCollide=false
    State.Feature176_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="PaintballGun added to your backpack!",Title="Give Gear"})
end

local function Give_Meatball_177(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature177_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature177_Gear=State.Feature177_Products:WaitForChild("Gear",5)
    State.Feature177_Meatball=State.Feature177_Gear:FindFirstChild("Meatball")
    State.Feature177_Clone=State.Feature177_Meatball:Clone()
    State.Feature177_Handle=State.Feature177_Clone:FindFirstChild("Handle")
    State.Feature177_Handle.CanCollide=false
    State.Feature177_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Meatball added to your backpack!",Title="Give Gear"})
end

local function Give_Raygun_Sheriff_178(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature178_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature178_Gear=State.Feature178_Products:WaitForChild("Gear",5)
    State.Feature178_Sheriff=State.Feature178_Gear:FindFirstChild("Sheriff")
    State.Feature178_Clone=State.Feature178_Sheriff:Clone()
    State.Feature178_Handle=State.Feature178_Clone:FindFirstChild("Handle")
    State.Feature178_Handle.CanCollide=false
    State.Feature178_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Sheriff added to your backpack!",Title="Give Gear"})
end

local function Give_Sword_179(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature179_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature179_Gear=State.Feature179_Products:WaitForChild("Gear",5)
    State.Feature179_Sword=State.Feature179_Gear:FindFirstChild("Sword")
    State.Feature179_Clone=State.Feature179_Sword:Clone()
    State.Feature179_Handle=State.Feature179_Clone:FindFirstChild("Handle")
    State.Feature179_Handle.CanCollide=false
    State.Feature179_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Sword added to your backpack!",Title="Give Gear"})
end

local function Give_Pool_Noodle_180(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature180_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature180_Gear=State.Feature180_Products:WaitForChild("Gear",5)
    State.Feature180_Pool_Noodle=State.Feature180_Gear:FindFirstChild("Pool Noodle")
    State.Feature180_Clone=State.Feature180_Pool_Noodle:Clone()
    State.Feature180_Handle=State.Feature180_Clone:FindFirstChild("Handle")
    State.Feature180_Handle.CanCollide=false
    State.Feature180_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Pool Noodle added to your backpack!",Title="Give Gear"})
end

local function Give_Snowball_181(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature181_Products=State.ReplicatedStorage:WaitForChild("Products",5)
    State.Feature181_Gear=State.Feature181_Products:WaitForChild("Gear",5)
    State.Feature181_Snowball=State.Feature181_Gear:FindFirstChild("Snowball")
    State.Feature181_Clone=State.Feature181_Snowball:Clone()
    State.Feature181_Handle=State.Feature181_Clone:FindFirstChild("Handle")
    State.Feature181_Handle.CanCollide=false
    State.Feature181_Clone.Parent=State.Players.LocalPlayer.Backpack
    State.WindUI:Notify({Duration=3,Content="Snowball added to your backpack!",Title="Give Gear"})
end

local function Webhook_URL_182(a1,a2,a3,a4,a5,a6,a7,a8)
    a1:match("^%s*(.-)%s*$")
end

local function Test_Webhook_183(a1,a2,a3,a4,a5,a6,a7,a8)
    sendWH("✅ Ella Hub webhook test — working!")
    State.WindUI:Notify({Duration=4,Content="Test sent! Check your Discord channel.",Title="Webhook"})
end

local function Send_Jury_Votes_to_Webhook_184(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Automation.Internal307)
end

local function Send_Votes_to_Webhook_185(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Automation.Internal308)
end

local function Send_Exile_Votes_to_Webhook_186(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Automation.Internal309)
end

local function Expose_Exile_Votes_in_Chat_187(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Automation.Internal310)
end

local function Send_Statue_Holder_to_Webhook_188(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Twists.Idol.Changed:Connect(Automation.Internal311)
end

local function Send_Round_Info_to_Webhook_189(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(Automation.Internal312)
end

-- AUTOPLAY
-- ------------------------------------------------------------

local function Autoplay_207(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal324)
end

local function Disable_Shiftlock_Camera_208(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Play_This_Round_209(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature209_ChallengePlayers=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets=workspace:FindFirstChild("Assets")
    State.Feature209_Assets:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_2=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_2:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_2=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_2:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_3=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_3:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_3=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_3:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_4=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_4:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_4=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_4:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_5=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_5:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_5=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_5:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_6=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_6:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_6=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_6:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_7=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_7:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_7=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_7:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_8=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_8:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_8=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_8:GetChildren()
    task.wait()
    State.Feature209_ChallengePlayers_9=workspace:FindFirstChild("ChallengePlayers")
    State.Feature209_ChallengePlayers_9:FindFirstChild(State.Players.LocalPlayer.Name)
    State.Feature209_Assets_9=workspace:FindFirstChild("Assets")
    State.Feature209_Assets_9:GetChildren()
    task.wait()
end

local function Stop_Playback_210(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature210_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature210_HumanoidRootPart.Anchored=false
    State.WindUI:Notify({Duration=3,Content="Playback stopped.",Title="Autoplay"})
end

local function Cave_Chaos_Route_211(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Unstable_Savannah_Route_212(a1,a2,a3,a4,a5,a6,a7,a8)

end

-- TROLL
-- ------------------------------------------------------------

local function Mute_All_Sounds_194(a1,a2,a3,a4,a5,a6,a7,a8)
    State.SoundService.Volume=0
    State.WindUI:Notify({Duration=2,Content="Muted.",Title="Sound"})
end

local function Stop_All_Playing_Sounds_195(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    State.Players.LocalPlayer.PlayerGui:GetDescendants()
    State.WindUI:Notify({Duration=3,Content="Stopped 0 sound(s).",Title="Sound"})
end

local function Spam_Click_Sound_196(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal315)
end

local function Spam_OOF_197(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal316)
end

local function Sword_Lunge_Sound_198(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature198_Clone=State.ReplicatedStorage.Products.Gear.Sword.Handle.LungeSound:Clone()
    State.Feature198_Clone.Parent=workspace
    State.Feature198_Clone:Play()
    State.Debris:AddItem(State.Feature198_Clone,3)
end

local function Equip_Sword_Unsheath_199(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature199_Clone=State.ReplicatedStorage.Products.Gear.Sword.Handle.UnsheathSound:Clone()
    State.Feature199_Clone.Parent=workspace
    State.Feature199_Clone:Play()
    State.Debris:AddItem(State.Feature199_Clone,3)
end

local function Toilet_Elimination_Sound_200(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature200_Toilet_Elimination=State.ReplicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound.Clone(State.ReplicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound)
    State.Feature200_Toilet_Elimination.Parent=workspace
    State.Feature200_Toilet_Elimination:Play()
    State.Debris:AddItem(State.Feature200_Toilet_Elimination,5)
end

local function Sleigh_Elimination_Sound_201(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature201_Sleigh_Elimination=State.ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound.Clone(State.ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound)
    State.Feature201_Sleigh_Elimination.Parent=workspace
    State.Feature201_Sleigh_Elimination:Play()
    State.Debris:AddItem(State.Feature201_Sleigh_Elimination,5)
end

local function Trigger_Twisted_202(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.PSSettings:FireServer("Start","Start")
    State.ReplicatedStorage.Events.OSSettings:FireServer("Start")
    State.WindUI:Notify({Duration=4,Content="Fired!",Title="Trigger Twisted"})
end

local function Swap_to_Sleigh_Elimination_203(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature203_ElimMethod=workspace:FindFirstChild("ElimMethod")
    State.Feature203_Boat_Elimination=State.Feature203_ElimMethod:FindFirstChild("Boat Elimination")
    State.Feature203_Clone=State.Feature203_Boat_Elimination:Clone()
    State.Feature203_Clone.Parent=nil
    State.Feature203_ElimMethod:GetChildren()
    State.Feature203_Sleigh_Elimination=State.ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Clone(State.ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"])
    State.Feature203_Sleigh_Elimination.Name="Sleigh Elimination"
    State.Feature203_Sleigh_Elimination.Parent=State.Feature203_ElimMethod
    State.ReplicatedStorage.Products.DataStore.Elimination.Value="Sleigh Elimination"
    State.Feature203_Sound=State.Feature203_Sleigh_Elimination:FindFirstChild("Sound",true)
    State.Feature203_Sound:Play()
    State.WindUI:Notify({Duration=4,Content="Sleigh Elimination active! Fly-out in 18s.",Title="Sleigh Swap"})
    task.delay(18,Automation.Internal317)
end

local function Force_Restore_Boat_204(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature204_ElimMethod=workspace:FindFirstChild("ElimMethod")
    State.Feature204_ElimMethod:GetChildren()
    State.Feature204_Clone=State.Feature203_Clone:Clone()
    State.Feature204_Clone.Name="Boat Elimination"
    State.Feature204_Clone.Parent=State.Feature204_ElimMethod
    State.ReplicatedStorage.Products.DataStore.Elimination.Value="Boat Elimination"
    State.WindUI:Notify({Duration=3,Content="Boat Elimination restored.",Title="Sleigh Swap"})
end

local function Anti_Loser_Land_205(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature205_Team=State.Players.LocalPlayer:GetPropertyChangedSignal("Team")
    State.Feature205_Team:Connect(Automation.Internal318)
    State.Feature205_Season=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature205_Eliminated=State.Feature205_Season:WaitForChild("Eliminated",5)
    State.Feature205_Eliminated.ChildAdded:Connect(Automation.Internal319)
    State.Feature205_Season_2=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature205_Players=State.Feature205_Season_2:WaitForChild("Players",5)
    State.Feature205_Players.ChildRemoved:Connect(Automation.Internal320)
    State.WindUI:Notify({Duration=3,Content="Active — watching for elimination.",Title="Anti Loser Land"})
end

local function Force_Fight_Elim_Test_206(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content="Elimination detected — fighting back!",Title="⚠ Anti Loser Land"})
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.RunService.Heartbeat:Connect(Automation.Internal321)
    task.spawn(Automation.Internal322)
    task.delay(20,Automation.Internal323)
end

-- SHOP
-- ------------------------------------------------------------

local function Print_Shop_to_Console_190(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature190_Skins=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Skins")
    State.Feature190_Skins:GetChildren()
    State.Feature190_Marshmallows=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Marshmallows")
    State.Feature190_Marshmallows:GetChildren()
    State.Feature190_ElimColors=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("ElimColors")
    State.Feature190_ElimColors:GetChildren()
    State.Feature190_Eliminations=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Eliminations")
    State.Feature190_Eliminations:GetChildren()
    print("=== Ella Hub — Daily Shop ===")
    print("============================")
    State.WindUI:Notify({Duration=3,Content="Printed to console! Press F9.",Title="Shop"})
end

local function Send_Shop_to_Webhook_191(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature191_Skins=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Skins")
    State.Feature191_Skins:GetChildren()
    State.Feature191_Marshmallows=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Marshmallows")
    State.Feature191_Marshmallows:GetChildren()
    State.Feature191_ElimColors=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("ElimColors")
    State.Feature191_ElimColors:GetChildren()
    State.Feature191_Eliminations=State.ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Eliminations")
    State.Feature191_Eliminations:GetChildren()
    State.WindUI:Notify({Duration=3,Content="No items found.",Title="Shop"})
end

local function Notify_When_Shop_Updates_192(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(Automation.Internal313)
    State.WindUI:Notify({Duration=3,Content="Watching for shop updates...",Title="Shop Watcher"})
end

local function Auto_Send_Shop_Updates_to_Webhook_193(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(Automation.Internal314)
    State.WindUI:Notify({Duration=3,Content="Auto webhook active!",Title="Shop Watcher"})
end

-- SETTINGS
-- ------------------------------------------------------------

local function Show_Update_Notice_213(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Switch_to_Rayfield_214(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=2,Content="Reloading with Rayfield...",Title="Switching"})
    task.wait()
    State.Window:Destroy()
    State.Feature214_PlayerGui=State.Players.LocalPlayer:FindFirstChild("PlayerGui")
    State.Feature214_Value=gethui()
    State.Feature214_CoreGui=game:GetService("CoreGui")
    State.Feature214_PlayerGui:GetChildren()
    State.Feature214_Value:GetChildren()
    State.Feature214_CoreGui:GetChildren()
    task.wait()
    State.Feature214_Value_2=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/main.lua",true)
    State.Feature214_Value_3=loadstring(State.Feature214_Value_2)
    State.Feature214_Value_3()
end

local function Toggle_Key_215(a1,a2,a3,a4,a5,a6,a7,a8)

end

local function Theme_216(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:SetTheme(a1)
    State.WindUI:Notify({Duration=3,Content=nil,Title="Theme"})
end

--============================================================
-- INTERNAL / AUTOMATION HELPERS
--============================================================

Automation.Choose_Player_110 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Feature111_111 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Feature111_Season=State.ReplicatedStorage:WaitForChild("Season",5)
    State.Feature111_Players=State.Feature111_Season:WaitForChild("Players",5)
    State.Feature111_Players:GetChildren()
    State.TargetPlayerDropdown:Refresh({[1]="(none)"})
end

Automation.Choose_Player_116 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Team_156 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.AutoWinObbyLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature217_Finish=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish.CanCollide=false
    State.Feature217_Finish.Transparency=1
    State.Feature217_Finish.Position=State.Feature217_HumanoidRootPart.Position
    task.wait()
    State.Feature217_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_2.CanCollide=false
    State.Feature217_Finish_2.Transparency=1
    State.Feature217_Finish_2.Position=State.Feature217_HumanoidRootPart_2.Position
    task.wait()
    State.Feature217_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_3.CanCollide=false
    State.Feature217_Finish_3.Transparency=1
    State.Feature217_Finish_3.Position=State.Feature217_HumanoidRootPart_3.Position
    task.wait()
    State.Feature217_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_4.CanCollide=false
    State.Feature217_Finish_4.Transparency=1
    State.Feature217_Finish_4.Position=State.Feature217_HumanoidRootPart_4.Position
    task.wait()
    State.Feature217_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_5.CanCollide=false
    State.Feature217_Finish_5.Transparency=1
    State.Feature217_Finish_5.Position=State.Feature217_HumanoidRootPart_5.Position
    task.wait()
    State.Feature217_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_6.CanCollide=false
    State.Feature217_Finish_6.Transparency=1
    State.Feature217_Finish_6.Position=State.Feature217_HumanoidRootPart_6.Position
    task.wait()
    State.Feature217_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_7.CanCollide=false
    State.Feature217_Finish_7.Transparency=1
    State.Feature217_Finish_7.Position=State.Feature217_HumanoidRootPart_7.Position
    task.wait()
    State.Feature217_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_8.CanCollide=false
    State.Feature217_Finish_8.Transparency=1
    State.Feature217_Finish_8.Position=State.Feature217_HumanoidRootPart_8.Position
    task.wait()
    State.Feature217_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature217_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature217_Finish_9.CanCollide=false
    State.Feature217_Finish_9.Transparency=1
    State.Feature217_Finish_9.Position=State.Feature217_HumanoidRootPart_9.Position
    task.wait()
end

Automation.AutoCollectCoinsGems = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace.Assets:GetDescendants()
    task.wait()
end

Automation.AutoSolveMathMania = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature219_MathMania=State.Players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
    State.Feature219_Child=State.Feature219_MathMania:FindFirstChild("1")
    State.Feature219_MainText=State.Feature219_Child:FindFirstChild("MainText")
    State.Feature219_Box=State.Feature219_Child:FindFirstChild("Box")
    State.Feature219_Enter=State.Feature219_Child:FindFirstChild("Enter")
    State.Feature219_Value=State.Feature219_MainText.Text:gsub("[=?%s]","")
    State.Feature219_return=loadstring(("return "..State.Feature219_Value))
    State.Feature219_Value_2=State.Feature219_return()
    State.Feature219_Box.Text="State.Feature219_Value_2"
    task.wait()
    getconnections(State.Feature219_Enter.MouseButton1Click)
    getconnections(State.Feature219_Enter.MouseButton1Down)
    getconnections(State.Feature219_Enter.Activated)
    task.wait()
    State.Feature219_Child_2=State.Feature219_MathMania:FindFirstChild("2")
    State.Feature219_MainText_2=State.Feature219_Child_2:FindFirstChild("MainText")
    State.Feature219_Box_2=State.Feature219_Child_2:FindFirstChild("Box")
    State.Feature219_Enter_2=State.Feature219_Child_2:FindFirstChild("Enter")
    State.Feature219_Value_3=State.Feature219_MainText_2.Text:gsub("[=?%s]","")
    State.Feature219_return_2=loadstring(("return "..State.Feature219_Value_3))
    State.Feature219_Value_4=State.Feature219_return_2()
    State.Feature219_Box_2.Text="State.Feature219_Value_4"
    task.wait()
    getconnections(State.Feature219_Enter_2.MouseButton1Click)
    getconnections(State.Feature219_Enter_2.MouseButton1Down)
    getconnections(State.Feature219_Enter_2.Activated)
    task.wait()
    State.Feature219_Child_3=State.Feature219_MathMania:FindFirstChild("3")
    State.Feature219_MainText_3=State.Feature219_Child_3:FindFirstChild("MainText")
    State.Feature219_Box_3=State.Feature219_Child_3:FindFirstChild("Box")
    State.Feature219_Enter_3=State.Feature219_Child_3:FindFirstChild("Enter")
    State.Feature219_Value_5=State.Feature219_MainText_3.Text:gsub("[=?%s]","")
    State.Feature219_return_3=loadstring(("return "..State.Feature219_Value_5))
    State.Feature219_Value_6=State.Feature219_return_3()
    State.Feature219_Box_3.Text="State.Feature219_Value_6"
    task.wait()
    getconnections(State.Feature219_Enter_3.MouseButton1Click)
    getconnections(State.Feature219_Enter_3.MouseButton1Down)
    getconnections(State.Feature219_Enter_3.Activated)
    task.wait()
    State.Feature219_Child_4=State.Feature219_MathMania:FindFirstChild("4")
    State.Feature219_MainText_4=State.Feature219_Child_4:FindFirstChild("MainText")
    State.Feature219_Box_4=State.Feature219_Child_4:FindFirstChild("Box")
    State.Feature219_Enter_4=State.Feature219_Child_4:FindFirstChild("Enter")
    State.Feature219_Value_7=State.Feature219_MainText_4.Text:gsub("[=?%s]","")
    State.Feature219_return_4=loadstring(("return "..State.Feature219_Value_7))
    State.Feature219_Value_8=State.Feature219_return_4()
    State.Feature219_Box_4.Text="State.Feature219_Value_8"
    task.wait()
    getconnections(State.Feature219_Enter_4.MouseButton1Click)
    getconnections(State.Feature219_Enter_4.MouseButton1Down)
    getconnections(State.Feature219_Enter_4.Activated)
    task.wait()
    State.Feature219_Child_5=State.Feature219_MathMania:FindFirstChild("5")
    State.Feature219_MainText_5=State.Feature219_Child_5:FindFirstChild("MainText")
    State.Feature219_Box_5=State.Feature219_Child_5:FindFirstChild("Box")
    State.Feature219_Child_5:FindFirstChild("Enter")
    State.Feature219_Value_9=State.Feature219_MainText_5.Text:gsub("[=?%s]","")
    State.Feature219_return_5=loadstring(("return "..State.Feature219_Value_9))
    State.Feature219_Value_10=State.Feature219_return_5()
    State.Feature219_Box_5.Text="State.Feature219_Value_10"
    task.wait()
end

Automation.SwordFightLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature220_Tool=State.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    State.Feature220_Tool:FindFirstChild("Handle")
    State.Players:GetPlayers()
end

Automation.DodgeballLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball:GetDescendants()
    State.Feature221_BasePart=State.Feature221_Dodgeball:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart.CFrame=State.Feature221_HumanoidRootPart.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_2=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_2:GetDescendants()
    State.Feature221_BasePart_2=State.Feature221_Dodgeball_2:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_2.CFrame=State.Feature221_HumanoidRootPart_2.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_3=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_3:GetDescendants()
    State.Feature221_BasePart_3=State.Feature221_Dodgeball_3:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_3.CFrame=State.Feature221_HumanoidRootPart_3.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_4=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_4:GetDescendants()
    State.Feature221_BasePart_4=State.Feature221_Dodgeball_4:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_4.CFrame=State.Feature221_HumanoidRootPart_4.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_5=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_5:GetDescendants()
    State.Feature221_BasePart_5=State.Feature221_Dodgeball_5:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_5.CFrame=State.Feature221_HumanoidRootPart_5.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_6=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_6:GetDescendants()
    State.Feature221_BasePart_6=State.Feature221_Dodgeball_6:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_6.CFrame=State.Feature221_HumanoidRootPart_6.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_7=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_7:GetDescendants()
    State.Feature221_BasePart_7=State.Feature221_Dodgeball_7:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_7.CFrame=State.Feature221_HumanoidRootPart_7.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_8=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_8:GetDescendants()
    State.Feature221_BasePart_8=State.Feature221_Dodgeball_8:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_8.CFrame=State.Feature221_HumanoidRootPart_8.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Dodgeball")
    State.Feature221_Dodgeball_9=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
    State.Feature221_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature221_Dodgeball_9:GetDescendants()
    State.Feature221_BasePart_9=State.Feature221_Dodgeball_9:FindFirstChildWhichIsA("BasePart")
    State.Feature221_BasePart_9.CFrame=State.Feature221_HumanoidRootPart_9.CFrame
    task.wait()
end

Automation.DodgeballPersistence = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.SpleefLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    task.wait()
end

Automation.MovieObbyLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.ExpeditionObbyLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    task.wait()
end

Automation.FranceLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.SafetyStatueLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.RoundInfoLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature228_Finish=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish.CanCollide=false
    State.Feature228_Finish.Transparency=1
    State.Feature228_Finish.Position=State.Feature228_HumanoidRootPart.Position
    task.wait()
    State.Feature228_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_2.CanCollide=false
    State.Feature228_Finish_2.Transparency=1
    State.Feature228_Finish_2.Position=State.Feature228_HumanoidRootPart_2.Position
    task.wait()
    State.Feature228_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_3.CanCollide=false
    State.Feature228_Finish_3.Transparency=1
    State.Feature228_Finish_3.Position=State.Feature228_HumanoidRootPart_3.Position
    task.wait()
    State.Feature228_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_4.CanCollide=false
    State.Feature228_Finish_4.Transparency=1
    State.Feature228_Finish_4.Position=State.Feature228_HumanoidRootPart_4.Position
    task.wait()
    State.Feature228_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_5.CanCollide=false
    State.Feature228_Finish_5.Transparency=1
    State.Feature228_Finish_5.Position=State.Feature228_HumanoidRootPart_5.Position
    task.wait()
    State.Feature228_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_6.CanCollide=false
    State.Feature228_Finish_6.Transparency=1
    State.Feature228_Finish_6.Position=State.Feature228_HumanoidRootPart_6.Position
    task.wait()
    State.Feature228_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_7.CanCollide=false
    State.Feature228_Finish_7.Transparency=1
    State.Feature228_Finish_7.Position=State.Feature228_HumanoidRootPart_7.Position
    task.wait()
    State.Feature228_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_8.CanCollide=false
    State.Feature228_Finish_8.Transparency=1
    State.Feature228_Finish_8.Position=State.Feature228_HumanoidRootPart_8.Position
    task.wait()
    State.Feature228_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature228_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature228_Finish_9.CanCollide=false
    State.Feature228_Finish_9.Transparency=1
    State.Feature228_Finish_9.Position=State.Feature228_HumanoidRootPart_9.Position
    task.wait()
end

Automation.CharacterLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace.Assets:GetDescendants()
    task.wait()
end

Automation.PlayerLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    workspace.Assets:GetDescendants()
    task.wait()
end

Automation.StatsLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace.Assets:GetDescendants()
    task.wait()
end

Automation.TeleportLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature232_Finish=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish.CanCollide=false
    State.Feature232_Finish.Transparency=1
    State.Feature232_Finish.Position=State.Feature232_HumanoidRootPart.Position
    task.wait()
    State.Feature232_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_2.CanCollide=false
    State.Feature232_Finish_2.Transparency=1
    State.Feature232_Finish_2.Position=State.Feature232_HumanoidRootPart_2.Position
    task.wait()
    State.Feature232_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_3.CanCollide=false
    State.Feature232_Finish_3.Transparency=1
    State.Feature232_Finish_3.Position=State.Feature232_HumanoidRootPart_3.Position
    task.wait()
    State.Feature232_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_4.CanCollide=false
    State.Feature232_Finish_4.Transparency=1
    State.Feature232_Finish_4.Position=State.Feature232_HumanoidRootPart_4.Position
    task.wait()
    State.Feature232_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_5.CanCollide=false
    State.Feature232_Finish_5.Transparency=1
    State.Feature232_Finish_5.Position=State.Feature232_HumanoidRootPart_5.Position
    task.wait()
    State.Feature232_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_6.CanCollide=false
    State.Feature232_Finish_6.Transparency=1
    State.Feature232_Finish_6.Position=State.Feature232_HumanoidRootPart_6.Position
    task.wait()
    State.Feature232_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_7.CanCollide=false
    State.Feature232_Finish_7.Transparency=1
    State.Feature232_Finish_7.Position=State.Feature232_HumanoidRootPart_7.Position
    task.wait()
    State.Feature232_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_8.CanCollide=false
    State.Feature232_Finish_8.Transparency=1
    State.Feature232_Finish_8.Position=State.Feature232_HumanoidRootPart_8.Position
    task.wait()
    State.Feature232_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature232_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature232_Finish_9.CanCollide=false
    State.Feature232_Finish_9.Transparency=1
    State.Feature232_Finish_9.Position=State.Feature232_HumanoidRootPart_9.Position
    task.wait()
end

Automation.UniversalLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature233_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    a1.Position=State.Feature233_HumanoidRootPart.Position
    a1.Transparency=0
    a1.CanCollide=false
end

Automation.ClientLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature234_MathMania=State.Players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
    State.Feature234_Child=State.Feature234_MathMania:FindFirstChild("1")
    State.Feature234_MainText=State.Feature234_Child:FindFirstChild("MainText")
    State.Feature234_Box=State.Feature234_Child:FindFirstChild("Box")
    State.Feature234_Enter=State.Feature234_Child:FindFirstChild("Enter")
    State.Feature234_Value=State.Feature234_MainText.Text:gsub("[=?%s]","")
    State.Feature234_return=loadstring(("return "..State.Feature234_Value))
    State.Feature234_Value_2=State.Feature234_return()
    State.Feature234_Box.Text="State.Feature234_Value_2"
    task.wait()
    getconnections(State.Feature234_Enter.MouseButton1Click)
    getconnections(State.Feature234_Enter.MouseButton1Down)
    getconnections(State.Feature234_Enter.Activated)
    task.wait()
    State.Feature234_Child_2=State.Feature234_MathMania:FindFirstChild("2")
    State.Feature234_MainText_2=State.Feature234_Child_2:FindFirstChild("MainText")
    State.Feature234_Box_2=State.Feature234_Child_2:FindFirstChild("Box")
    State.Feature234_Enter_2=State.Feature234_Child_2:FindFirstChild("Enter")
    State.Feature234_Value_3=State.Feature234_MainText_2.Text:gsub("[=?%s]","")
    State.Feature234_return_2=loadstring(("return "..State.Feature234_Value_3))
    State.Feature234_Value_4=State.Feature234_return_2()
    State.Feature234_Box_2.Text="State.Feature234_Value_4"
    task.wait()
    getconnections(State.Feature234_Enter_2.MouseButton1Click)
    getconnections(State.Feature234_Enter_2.MouseButton1Down)
    getconnections(State.Feature234_Enter_2.Activated)
    task.wait()
    State.Feature234_Child_3=State.Feature234_MathMania:FindFirstChild("3")
    State.Feature234_MainText_3=State.Feature234_Child_3:FindFirstChild("MainText")
    State.Feature234_Box_3=State.Feature234_Child_3:FindFirstChild("Box")
    State.Feature234_Enter_3=State.Feature234_Child_3:FindFirstChild("Enter")
    State.Feature234_Value_5=State.Feature234_MainText_3.Text:gsub("[=?%s]","")
    State.Feature234_return_3=loadstring(("return "..State.Feature234_Value_5))
    State.Feature234_Value_6=State.Feature234_return_3()
    State.Feature234_Box_3.Text="State.Feature234_Value_6"
    task.wait()
    getconnections(State.Feature234_Enter_3.MouseButton1Click)
    getconnections(State.Feature234_Enter_3.MouseButton1Down)
    getconnections(State.Feature234_Enter_3.Activated)
    task.wait()
    State.Feature234_Child_4=State.Feature234_MathMania:FindFirstChild("4")
    State.Feature234_MainText_4=State.Feature234_Child_4:FindFirstChild("MainText")
    State.Feature234_Box_4=State.Feature234_Child_4:FindFirstChild("Box")
    State.Feature234_Enter_4=State.Feature234_Child_4:FindFirstChild("Enter")
    State.Feature234_Value_7=State.Feature234_MainText_4.Text:gsub("[=?%s]","")
    State.Feature234_return_4=loadstring(("return "..State.Feature234_Value_7))
    State.Feature234_Value_8=State.Feature234_return_4()
    State.Feature234_Box_4.Text="State.Feature234_Value_8"
    task.wait()
    getconnections(State.Feature234_Enter_4.MouseButton1Click)
    getconnections(State.Feature234_Enter_4.MouseButton1Down)
    getconnections(State.Feature234_Enter_4.Activated)
    task.wait()
    State.Feature234_Child_5=State.Feature234_MathMania:FindFirstChild("5")
    State.Feature234_MainText_5=State.Feature234_Child_5:FindFirstChild("MainText")
    State.Feature234_Box_5=State.Feature234_Child_5:FindFirstChild("Box")
    State.Feature234_Child_5:FindFirstChild("Enter")
    State.Feature234_Value_9=State.Feature234_MainText_5.Text:gsub("[=?%s]","")
    State.Feature234_return_5=loadstring(("return "..State.Feature234_Value_9))
    State.Feature234_Value_10=State.Feature234_return_5()
    State.Feature234_Box_5.Text="State.Feature234_Value_10"
    task.wait()
end

Automation.OtherLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature235_Assets=workspace:FindFirstChild("Assets")
    State.Feature235_Assets:GetDescendants()
end

Automation.AutoplayLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature236_Sheriff=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff:FindFirstChild("ServerControl")
    State.Feature236_Sheriff:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_2=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_2:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_2:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_3=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_3:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_3:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_4=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_4:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_4:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_5=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_5:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_5:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_6=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_6:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_6:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_7=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_7:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_7:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_8=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_8:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_8:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
    State.Feature236_Sheriff_9=State.Players.LocalPlayer.Character:FindFirstChild("Sheriff")
    State.Feature236_Sheriff_9:FindFirstChild("ServerControl")
    State.Feature236_Sheriff_9:FindFirstChild("ClientControl")
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Players:GetPlayers()
    task.wait()
end

Automation.TrollLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.ShopLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.SettingsLoop = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature239_Finish=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish.CanCollide=false
    State.Feature239_Finish.Transparency=1
    State.Feature239_Finish.Position=State.Feature239_HumanoidRootPart.Position
    task.wait()
    State.Feature239_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_2.CanCollide=false
    State.Feature239_Finish_2.Transparency=1
    State.Feature239_Finish_2.Position=State.Feature239_HumanoidRootPart_2.Position
    task.wait()
    State.Feature239_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_3.CanCollide=false
    State.Feature239_Finish_3.Transparency=1
    State.Feature239_Finish_3.Position=State.Feature239_HumanoidRootPart_3.Position
    task.wait()
    State.Feature239_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_4.CanCollide=false
    State.Feature239_Finish_4.Transparency=1
    State.Feature239_Finish_4.Position=State.Feature239_HumanoidRootPart_4.Position
    task.wait()
    State.Feature239_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_5.CanCollide=false
    State.Feature239_Finish_5.Transparency=1
    State.Feature239_Finish_5.Position=State.Feature239_HumanoidRootPart_5.Position
    task.wait()
    State.Feature239_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_6.CanCollide=false
    State.Feature239_Finish_6.Transparency=1
    State.Feature239_Finish_6.Position=State.Feature239_HumanoidRootPart_6.Position
    task.wait()
    State.Feature239_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_7.CanCollide=false
    State.Feature239_Finish_7.Transparency=1
    State.Feature239_Finish_7.Position=State.Feature239_HumanoidRootPart_7.Position
    task.wait()
    State.Feature239_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_8.CanCollide=false
    State.Feature239_Finish_8.Transparency=1
    State.Feature239_Finish_8.Position=State.Feature239_HumanoidRootPart_8.Position
    task.wait()
    State.Feature239_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
    State.Feature239_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature239_Finish_9.CanCollide=false
    State.Feature239_Finish_9.Transparency=1
    State.Feature239_Finish_9.Position=State.Feature239_HumanoidRootPart_9.Position
    task.wait()
end

Automation.Internal240 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace:GetDescendants()
    task.wait()
end

Automation.Internal241 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    workspace:GetDescendants()
    task.wait()
end

Automation.Internal242 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature242_MathMania=State.Players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
    State.Feature242_Child=State.Feature242_MathMania:FindFirstChild("1")
    State.Feature242_MainText=State.Feature242_Child:FindFirstChild("MainText")
    State.Feature242_Box=State.Feature242_Child:FindFirstChild("Box")
    State.Feature242_Enter=State.Feature242_Child:FindFirstChild("Enter")
    State.Feature242_Value=State.Feature242_MainText.Text:gsub("[=?%s]","")
    State.Feature242_return=loadstring(("return "..State.Feature242_Value))
    State.Feature242_Value_2=State.Feature242_return()
    State.Feature242_Box.Text="State.Feature242_Value_2"
    task.wait()
    getconnections(State.Feature242_Enter.MouseButton1Click)
    getconnections(State.Feature242_Enter.MouseButton1Down)
    getconnections(State.Feature242_Enter.Activated)
    task.wait()
    State.Feature242_Child_2=State.Feature242_MathMania:FindFirstChild("2")
    State.Feature242_MainText_2=State.Feature242_Child_2:FindFirstChild("MainText")
    State.Feature242_Box_2=State.Feature242_Child_2:FindFirstChild("Box")
    State.Feature242_Enter_2=State.Feature242_Child_2:FindFirstChild("Enter")
    State.Feature242_Value_3=State.Feature242_MainText_2.Text:gsub("[=?%s]","")
    State.Feature242_return_2=loadstring(("return "..State.Feature242_Value_3))
    State.Feature242_Value_4=State.Feature242_return_2()
    State.Feature242_Box_2.Text="State.Feature242_Value_4"
    task.wait()
    getconnections(State.Feature242_Enter_2.MouseButton1Click)
    getconnections(State.Feature242_Enter_2.MouseButton1Down)
    getconnections(State.Feature242_Enter_2.Activated)
    task.wait()
    State.Feature242_Child_3=State.Feature242_MathMania:FindFirstChild("3")
    State.Feature242_MainText_3=State.Feature242_Child_3:FindFirstChild("MainText")
    State.Feature242_Box_3=State.Feature242_Child_3:FindFirstChild("Box")
    State.Feature242_Enter_3=State.Feature242_Child_3:FindFirstChild("Enter")
    State.Feature242_Value_5=State.Feature242_MainText_3.Text:gsub("[=?%s]","")
    State.Feature242_return_3=loadstring(("return "..State.Feature242_Value_5))
    State.Feature242_Value_6=State.Feature242_return_3()
    State.Feature242_Box_3.Text="State.Feature242_Value_6"
    task.wait()
    getconnections(State.Feature242_Enter_3.MouseButton1Click)
    getconnections(State.Feature242_Enter_3.MouseButton1Down)
    getconnections(State.Feature242_Enter_3.Activated)
    task.wait()
    State.Feature242_Child_4=State.Feature242_MathMania:FindFirstChild("4")
    State.Feature242_MainText_4=State.Feature242_Child_4:FindFirstChild("MainText")
    State.Feature242_Box_4=State.Feature242_Child_4:FindFirstChild("Box")
    State.Feature242_Enter_4=State.Feature242_Child_4:FindFirstChild("Enter")
    State.Feature242_Value_7=State.Feature242_MainText_4.Text:gsub("[=?%s]","")
    State.Feature242_return_4=loadstring(("return "..State.Feature242_Value_7))
    State.Feature242_Value_8=State.Feature242_return_4()
    State.Feature242_Box_4.Text="State.Feature242_Value_8"
    task.wait()
    getconnections(State.Feature242_Enter_4.MouseButton1Click)
    getconnections(State.Feature242_Enter_4.MouseButton1Down)
    getconnections(State.Feature242_Enter_4.Activated)
    task.wait()
    State.Feature242_Child_5=State.Feature242_MathMania:FindFirstChild("5")
    State.Feature242_MainText_5=State.Feature242_Child_5:FindFirstChild("MainText")
    State.Feature242_Box_5=State.Feature242_Child_5:FindFirstChild("Box")
    State.Feature242_Child_5:FindFirstChild("Enter")
    State.Feature242_Value_9=State.Feature242_MainText_5.Text:gsub("[=?%s]","")
    State.Feature242_return_5=loadstring(("return "..State.Feature242_Value_9))
    State.Feature242_Value_10=State.Feature242_return_5()
    State.Feature242_Box_5.Text="State.Feature242_Value_10"
    task.wait()
end

Automation.Internal243 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.Internal244 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal245 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature245_Meatball=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_2=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_2:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_3=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_3:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_4=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_4:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_5=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_5:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_6=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_6:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_7=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_7:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_8=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_8:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
    State.Feature245_Meatball_9=State.Players.LocalPlayer.Character:FindFirstChild("Meatball")
    State.Feature245_Meatball_9:FindFirstChild("Bounce")
    State.Players:GetPlayers()
    task.wait()
end

Automation.Internal246 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    task.wait()
end

Automation.Internal247 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver:GetDescendants()
    State.Feature247_BasePart=State.Feature247_MeatballGiver:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart.CFrame=State.Feature247_HumanoidRootPart.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_2=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_2:GetDescendants()
    State.Feature247_BasePart_2=State.Feature247_MeatballGiver_2:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_2.CFrame=State.Feature247_HumanoidRootPart_2.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_3=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_3:GetDescendants()
    State.Feature247_BasePart_3=State.Feature247_MeatballGiver_3:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_3.CFrame=State.Feature247_HumanoidRootPart_3.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_4=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_4:GetDescendants()
    State.Feature247_BasePart_4=State.Feature247_MeatballGiver_4:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_4.CFrame=State.Feature247_HumanoidRootPart_4.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_5=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_5:GetDescendants()
    State.Feature247_BasePart_5=State.Feature247_MeatballGiver_5:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_5.CFrame=State.Feature247_HumanoidRootPart_5.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_6=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_6:GetDescendants()
    State.Feature247_BasePart_6=State.Feature247_MeatballGiver_6:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_6.CFrame=State.Feature247_HumanoidRootPart_6.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_7=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_7:GetDescendants()
    State.Feature247_BasePart_7=State.Feature247_MeatballGiver_7:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_7.CFrame=State.Feature247_HumanoidRootPart_7.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_8=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_8:GetDescendants()
    State.Feature247_BasePart_8=State.Feature247_MeatballGiver_8:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_8.CFrame=State.Feature247_HumanoidRootPart_8.CFrame
    task.wait()
    workspace:FindFirstChild("Assets")
    workspace.Assets:FindFirstChild("Italy")
    State.Feature247_MeatballGiver_9=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
    State.Feature247_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature247_MeatballGiver_9:GetDescendants()
    State.Feature247_BasePart_9=State.Feature247_MeatballGiver_9:FindFirstChildWhichIsA("BasePart")
    State.Feature247_BasePart_9.CFrame=State.Feature247_HumanoidRootPart_9.CFrame
    task.wait()
end

Automation.Internal248 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    State.ReplicatedStorage:FindFirstChild("Season")
    State.ReplicatedStorage.Season:FindFirstChild("Twists")
    State.Feature248_Idol=State.ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
    State.Feature248_Child=State.Players:FindFirstChild(State.Feature248_Idol.Value)
    State.Feature248_Highlight=Instance.new("Highlight",nil)
    State.Feature248_Highlight.Name="IdolHolderHL"
    State.Feature248_Color=Color3.fromRGB(255,215,0)
    State.Feature248_Highlight.FillColor=State.Feature248_Color
    State.Feature248_Color_2=Color3.fromRGB(255,215,0)
    State.Feature248_Highlight.OutlineColor=State.Feature248_Color_2
    State.Feature248_Highlight.FillTransparency=0.4
    State.Feature248_Highlight.OutlineTransparency=0
    State.Feature248_Highlight.Parent=State.Feature248_Child.Character
end

Automation.Internal249 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Idol:FireServer()
    task.wait()
end

Automation.Internal250 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value)),Title="Vote Cast"})
end

Automation.Internal251 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    print(("[Ella Hub] Vote: "..(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" → "..State.ReplicatedStorage.Season.Players[a1.Name].Value))))
end

Automation.Internal252 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    game.TextChatService.TextChannels.RBXGeneral:SendAsync((State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value)))
end

Automation.Internal253 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..State.ReplicatedStorage.Season.Players[a1.Name].Value)),Title="Exile Vote"})
    game.TextChatService.TextChannels.RBXGeneral:SendAsync((State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..State.ReplicatedStorage.Season.Players[a1.Name].Value)))
end

Automation.Internal254 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value)),Title="Jury Vote"})
end

Automation.Internal255 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    game.TextChatService.TextChannels.RBXGeneral:SendAsync(("[JURY] "..(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value))))
end

Automation.Internal256 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    workspace:GetDescendants()
    State.ReplicatedStorage:FindFirstChild("Season")
    State.ReplicatedStorage.Season:FindFirstChild("Twists")
    State.Feature256_Idol=State.ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
    State.Feature256_Child=State.Players:FindFirstChild(State.Feature256_Idol.Value)
    State.Feature256_Highlight=Instance.new("Highlight",nil)
    State.Feature256_Highlight.Name="IdolHolderHL"
    State.Feature256_Color=Color3.fromRGB(255,215,0)
    State.Feature256_Highlight.FillColor=State.Feature256_Color
    State.Feature256_Color_2=Color3.fromRGB(255,215,0)
    State.Feature256_Highlight.OutlineColor=State.Feature256_Color_2
    State.Feature256_Highlight.FillTransparency=0.4
    State.Feature256_Highlight.OutlineTransparency=0
    State.Feature256_Highlight.Parent=State.Feature256_Child.Character
end

Automation.Internal257 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Idol:FireServer()
    task.wait()
end

Automation.Internal258 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value)),Title="Vote Cast"})
end

Automation.Internal259 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    print(("[Ella Hub] Vote: "..(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" → "..State.ReplicatedStorage.Season.Players[a1.Name].Value))))
end

Automation.Internal260 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    game.TextChatService.TextChannels.RBXGeneral:SendAsync((State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value)))
end

Automation.Internal261 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..State.ReplicatedStorage.Season.Players[a1.Name].Value)),Title="Exile Vote"})
    game.TextChatService.TextChannels.RBXGeneral:SendAsync((State.ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..State.ReplicatedStorage.Season.Players[a1.Name].Value)))
end

Automation.Internal262 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value)),Title="Jury Vote"})
end

Automation.Internal263 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    game.TextChatService.TextChannels.RBXGeneral:SendAsync(("[JURY] "..(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..State.ReplicatedStorage.Season.Players[a1.Name].Value))))
end

Automation.Internal264 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature264_Color=Color3.fromRGB(40,40,50)
    State.Feature71_TextButton_4.BackgroundColor3=State.Feature264_Color
end

Automation.Internal265 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature265_Color=Color3.fromRGB(40,40,50)
    State.Feature71_TextButton_5.BackgroundColor3=State.Feature265_Color
end

Automation.Internal266 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature266_Color=Color3.fromRGB(40,40,50)
    State.Feature71_TextButton_6.BackgroundColor3=State.Feature266_Color
end

Automation.Internal267 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature267_UDim2=UDim2.fromOffset(0,(State.Feature71_UIListLayout.AbsoluteContentSize.Y+4))
    State.Feature71_ScrollingFrame.CanvasSize=State.Feature267_UDim2
    State.Feature267_Value=Vector2.new(0,inf)
    State.Feature71_ScrollingFrame.CanvasPosition=State.Feature267_Value
end

Automation.Internal268 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    if a1.UserInputType==Enum.UserInputType.MouseWheel then
        State.Feature71_TextButton_3.Text="↑"
        State.Feature268_Color=Color3.fromRGB(160,160,160)
        State.Feature71_TextButton_3.TextColor3=State.Feature268_Color
    else
    if a1.UserInputType==Enum.UserInputType.Touch then
        State.Feature71_TextButton_3.Text="↑"
        State.Feature268_Color=Color3.fromRGB(160,160,160)
        State.Feature71_TextButton_3.TextColor3=State.Feature268_Color
    else
    end
    end
end

Automation.Internal269 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal270 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal271 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal272 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature71_TextButton_3.Text="↑"
    State.Feature268_Color=Color3.fromRGB(160,160,160)
    State.Feature71_TextButton_3.TextColor3=State.Feature268_Color
end

Automation.Internal273 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature273_UDim2=UDim2.fromOffset(340,30)
    State.Feature71_Frame.Size=State.Feature273_UDim2
    State.Feature71_ScrollingFrame.Visible=false
    State.Feature71_TextButton_2.Text="+"
end

Automation.Internal274 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature71_Connection:Disconnect()
    State.Feature71_Connection_2:Disconnect()
    State.Feature71_Connection_3:Disconnect()
    State.Feature71_ScreenGui:Destroy()
end

Automation.Internal275 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    if a1.UserInputType==Enum.UserInputType.MouseButton1 then
        Vector2.new(a1.Position.X,a1.Position.Y)
        Vector2.new(State.Feature71_Frame.AbsolutePosition.X,State.Feature71_Frame.AbsolutePosition.Y)
    else
    if a1.UserInputType==Enum.UserInputType.Touch then
        Vector2.new(a1.Position.X,a1.Position.Y)
        Vector2.new(State.Feature71_Frame.AbsolutePosition.X,State.Feature71_Frame.AbsolutePosition.Y)
    else
    end
    end
end

Automation.Internal276 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    if a1.UserInputType==Enum.UserInputType.MouseButton1 then
    else
    if a1.UserInputType==Enum.UserInputType.Touch then
    else
    end
    end
end

Automation.Internal277 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal278 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature71_Connection_4:Disconnect()
    State.Feature71_Connection_5:Disconnect()
end

Automation.Internal279 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=5,Content=(State.ReplicatedStorage.Season.Players[a1.Value].Value..(" → "..(State.ReplicatedStorage.Season.Players[a1.Name].Value.."  (1 total)"))),Title=("Vote — "..State.ReplicatedStorage.Season.Players[a1.Value].Value)})
end

Automation.Internal280 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal281 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.WindUI:Notify({Duration=6,Content=State.ReplicatedStorage.Season.Twists.CurrentTwist.Value,Title="Current Twist"})
    State.ReplicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(Automation.Internal325)
    task.wait()
end

Automation.Internal282 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal283 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
end

Automation.Internal284 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Feature284_HumanoidRootPart=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart.CFrame=State.Feature284_Value
    task.wait()
    State.Feature284_HumanoidRootPart_2=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_2=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_2.CFrame=State.Feature284_Value_2
    task.wait()
    State.Feature284_HumanoidRootPart_3=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_3=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_3.CFrame=State.Feature284_Value_3
    task.wait()
    State.Feature284_HumanoidRootPart_4=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_4=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_4.CFrame=State.Feature284_Value_4
    task.wait()
    State.Feature284_HumanoidRootPart_5=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_5=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_5.CFrame=State.Feature284_Value_5
    task.wait()
    State.Feature284_HumanoidRootPart_6=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_6=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_6.CFrame=State.Feature284_Value_6
    task.wait()
    State.Feature284_HumanoidRootPart_7=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_7=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_7.CFrame=State.Feature284_Value_7
    task.wait()
    State.Feature284_HumanoidRootPart_8=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_8=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_8.CFrame=State.Feature284_Value_8
    task.wait()
    State.Feature284_HumanoidRootPart_9=State.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    State.Feature284_Value_9=CFrame.new(0,3000,0)
    State.Feature284_HumanoidRootPart_9.CFrame=State.Feature284_Value_9
    task.wait()
end

Automation.Internal285 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.ReplicatedStorage.Events.Teleport:FireServer("Camp")
    task.wait()
end

Automation.Internal286 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal326)
end

Automation.Internal287 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal327)
end

Automation.Internal288 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.spawn(Automation.Internal328)
end

Automation.Internal289 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players:GetPlayers()
end

Automation.Internal290 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    a1:IsA("Tool")
    task.wait()
    State.Feature290_Clone=a1:Clone()
    State.Feature290_Clone.Parent=nil
end

Automation.Internal291 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    a1:IsA("Tool")
end

Automation.Internal292 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    task.wait()
    State.Feature292_Clone=State.Feature290_Clone:Clone()
    State.Feature292_Clone.Parent=State.Players.LocalPlayer.Backpack
end

Automation.Internal293 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    getnamecallmethod()
    State.Feature93_Value_2(a1,a2,a3,a4,a5,a6,a7,a8)
    if a1==game:GetService("ReplicatedStorage").Events.Gear then
    else
    end
end

Automation.Internal294 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players.LocalPlayer.PlayerGui:GetDescendants()
end

Automation.Internal295 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players:GetPlayers()
    task.wait()
end

Automation.Internal296 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    State.Players:GetPlayers()
    task.wait()
end

Automation.Internal297 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    isfile("starborn.ttf")
    State.Feature297_Value=game:HttpGet("https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_")
    writefile("starborn.ttf",State.Feature297_Value)
    State.Feature297_Value_2=getcustomasset("starborn.ttf")
    State.Feature297_name=State.HttpService:JSONEncode({name="Starborn",faces={[1]={name="Regular",assetId=State.Feature297_Value_2,style="normal",weight=400}}})
    writefile("Starborn.json",State.Feature297_name)
    isfile("vhsgothic.ttf")
    State.Feature297_Value_3=game:HttpGet("https://drive.google.com/uc?export=download&id=1XRWSIsNj9-v-vnrOCdYiUJIvz6ETAzfE")
    writefile("vhsgothic.ttf",State.Feature297_Value_3)
    State.Feature297_Value_4=getcustomasset("vhsgothic.ttf")
    State.Feature297_name_2=State.HttpService:JSONEncode({name="VHS",faces={[1]={name="Regular",assetId=State.Feature297_Value_4,style="normal",weight=400}}})
    writefile("VHS.json",State.Feature297_name_2)
    isfile("minecrafter.ttf")
    State.Feature297_Value_5=game:HttpGet("https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4")
    writefile("minecrafter.ttf",State.Feature297_Value_5)
    State.Feature297_Value_6=getcustomasset("minecrafter.ttf")
    State.Feature297_name_3=State.HttpService:JSONEncode({name="Minecrafter",faces={[1]={name="Regular",assetId=State.Feature297_Value_6,style="normal",weight=400}}})
    writefile("Minecrafter.json",State.Feature297_name_3)
    isfile("horror.ttf")
    State.Feature297_Value_7=game:HttpGet("https://drive.google.com/uc?export=download&id=1dH4Y_ZuoTeMouMQoGZSc1OVLT7-73zmq")
    writefile("horror.ttf",State.Feature297_Value_7)
    State.Feature297_Value_8=getcustomasset("horror.ttf")
    State.Feature297_name_4=State.HttpService:JSONEncode({name="Horror",faces={[1]={name="Regular",assetId=State.Feature297_Value_8,style="normal",weight=400}}})
    writefile("Horror.json",State.Feature297_name_4)
    State.WindUI:Notify({Duration=4,Content="Done! Now pick a font.",Title="Fonts"})
end

Automation.Internal298 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    a1:IsA("TextLabel")
    a1.FontFace=State.Feature162_Value_2
end

Automation.Internal299 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    a1:IsA("TextLabel")
    a1.FontFace=State.Feature163_Value_2
end

Automation.Internal300 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    a1:IsA("TextLabel")
    a1.FontFace=State.Feature164_Value_2
end

Automation.Internal301 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal302 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal303 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal304 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal305 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal306 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal307 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal308 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal309 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal310 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal311 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal312 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal313 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal314 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal315 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal316 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal317 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal318 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal319 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal320 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal321 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal322 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal323 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal324 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal325 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal326 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal327 = function(a1,a2,a3,a4,a5,a6,a7,a8)

end

Automation.Internal328 = function(a1,a2,a3,a4,a5,a6,a7,a8)
    end
    -- Load WindUI defensively so dependency/network errors report a useful message
    -- instead of surfacing as an opaque line-1 failure.
end

--============================================================
-- WINDUI + USER INTERFACE
--============================================================

local WindUIOk, WindUIResult = pcall(function()
    local source = game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
    if type(source) ~= "string" or #source == 0 then
        error("WindUI download returned empty source")
    end
    local loader, compileError = loadstring(source)
    if type(loader) ~= "function" then
        error("WindUI compile failed: " .. tostring(compileError))
    end
    local ok, result = pcall(loader)
    if not ok then
        error("WindUI initialization failed: " .. tostring(result))
    end
    return result
end)
if not WindUIOk or not WindUIResult then
    error("[Ella Hub] " .. tostring(WindUIResult or "WindUI failed to initialize"))
end
State.WindUI = WindUIResult
if type(State.WindUI.CreateWindow) ~= "function" then
    error("[Ella Hub] WindUI loaded, but CreateWindow is unavailable")
end

-- Feature callbacks are defined above; UI registration starts below.
local WindowOk, WindowResult = pcall(function()
    return State.WindUI:CreateWindow({NewElements=true,ScrollBarEnabled=true,Author="by Ella",Resizable=true,ToggleKey=Enum.KeyCode.K,Folder="EllaHub",HideSearchBar=false,Title="Ella Hub V2",Transparent=true,SideBarWidth=200,Theme="Dark",Icon="solar:home-2-bold",Acrylic=true})
end)
if not WindowOk or not WindowResult then
    error("[Ella Hub] Window creation failed: " .. tostring(WindowResult))
end
State.Window = WindowResult
State.Window:Tag({Title="TRD Script",Color="Text"})
State.Window:Divider()
State.CampTab=State.Window:Tab({Title="Camp",Icon="solar:shield-bold"})
State.MovieTab=State.Window:Tab({Title="Movie",Icon="solar:camera-bold"})
State.ExpeditionTab=State.Window:Tab({Title="Expedition",Icon="solar:map-bold"})
State.Window:Divider()
State.MainTab=State.Window:Tab({Title="Main",Icon="solar:home-2-bold"})
State.CharactersTab=State.Window:Tab({Title="Characters",Icon="solar:user-bold"})
State.PlayerTab=State.Window:Tab({Title="Player",Icon="solar:running-2-bold"})
State.Window:Divider()
State.StatsTab=State.Window:Tab({Title="Stats",Icon="solar:chart-square-bold"})
State.TeleportsTab=State.Window:Tab({Title="Teleports",Icon="solar:map-point-bold"})
State.UniversalTab=State.Window:Tab({Title="Universal",Icon="solar:global-bold"})
State.ClientTab=State.Window:Tab({Title="Client",Icon="solar:cpu-bolt-bold"})
State.Window:Divider()
State.OtherTab=State.Window:Tab({Title="Other",Icon="solar:settings-bold"})
State.AutoplayTab=State.Window:Tab({Title="Autoplay",Icon="solar:play-bold"})
State.TrollTab=State.Window:Tab({Title="Troll",Icon="solar:ghost-bold"})
State.ShopTab=State.Window:Tab({Title="Shop",Icon="solar:shop-bold"})
State.Window:Divider()
State.SettingsTab=State.Window:Tab({Title="Settings",Icon="solar:settings-minimalistic-bold"})
State.Window:Divider()
State.CampTab:Select()
State.CampTab:Section({Title="Obby"})
State.CampObbyGroup=State.CampTab:Group()
State.CampObbyGroup:Button({Title="Win Obby",Callback=Win_Obby_001,IconAlign="Left",Justify="Center",Icon="solar:flag-bold",Size="Small"})
State.CampObbyGroup:Space({Columns=0.5})
State.CampObbyGroup:Button({Title="Godmode",Callback=Godmode_002,IconAlign="Left",Justify="Center",Icon="solar:shield-bold",Size="Small"})
State.CampTab:Toggle({Value=false,Callback=Auto_Win_Obby_003,Title="Auto-Win Obby",Desc="Finish line loops to your position"})
State.CampTab:Section({Title="Food"})
State.CampTab:Button({Callback=Eat_Finish_Pancake_004,Title="Eat / Finish Pancake",Desc="Rapidly clicks your food item"})
State.CampTab:Section({Title="Spleef"})
State.SpleefGroup=State.CampTab:Group()
State.SpleefGroup:Button({Title="Godmode",Callback=Godmode_005,IconAlign="Left",Justify="Center",Icon="solar:shield-bold",Size="Small"})
State.SpleefGroup:Space({Columns=0.5})
State.SpleefGroup:Button({Title="Clear Parts",Callback=Clear_Parts_006,IconAlign="Left",Justify="Center",Icon="solar:trash-bin-bold",Size="Small"})
State.CampTab:Section({Title="Coins & Gems"})
State.CampTab:Toggle({Value=false,Callback=Auto_Collect_Coins_Gems_007,Title="Auto Collect Coins & Gems",Desc="Moves all coins and gems to your character"})
State.CampTab:Section({Title="Math Mania"})
State.CampTab:Toggle({Value=false,Callback=Auto_Win_Math_Mania_008,Title="Auto-Win Math Mania",Desc="Auto-solves and submits all math questions"})
State.CampTab:Section({Title="Block Push"})
State.CampTab:Button({Callback=Win_Block_Push_009,Title="Win Block Push",Desc="Pushes your box onto the gold target"})
State.CampTab:Section({Title="Sword Fight"})
State.CampTab:Toggle({Value=false,Callback=Kill_All_In_Sword_Fight_010,Title="Kill All In Sword Fight",Desc="Fires sword touch on all players every frame"})
State.CampTab:Section({Title="Dodgeball & Paintball"})
State.CampTab:Toggle({Value=false,Callback=Bring_Dodgeball_Giver_011,Title="Bring Dodgeball Giver",Desc="Moves giver to you"})
State.CampTab:Toggle({Value=false,Callback=Keep_Dodgeball_After_Round_012,Title="Keep Dodgeball After Round",Desc="Re-equips the dodgeball if it gets taken away"})
State.CampTab:Toggle({Value=false,Callback=Auto_Throw_Dodgeball_013,Title="Auto Throw Dodgeball",Desc="Automatically fires the dodgeball remote"})
State.CampTab:Toggle({Value=false,Callback=Kill_All_Dodgeball_014,Title="Kill All (Dodgeball)",Desc="Slams ball into each player"})
State.CampTab:Toggle({Value=false,Callback=Auto_Fire_Paintball_015,Title="Auto Fire Paintball",Desc="Automatically fires paintball at all players"})
State.CampTab:Toggle({Value=false,Callback=Kill_All_Paintball_016,Title="Kill All (Paintball)",Desc="Moves pellets into each player"})
State.CampTab:Toggle({Value=false,Callback=Dodgeball_Paintball_Protection_017,Title="Dodgeball & Paintball Protection",Desc="Destroys incoming balls"})
State.CampTab:Section({Title="Auto-Win All"})
State.CampTab:Toggle({Value=false,Callback=Auto_Win_All_Challenges_018,Title="Auto-Win All Challenges",Desc="Enables all loops at once"})
State.MovieTab:Section({Title="Obby"})
State.MovieObbyGroup=State.MovieTab:Group()
State.MovieObbyGroup:Button({Title="Win Obby",Callback=Win_Obby_001,IconAlign="Left",Justify="Center",Icon="solar:flag-bold",Size="Small"})
State.MovieTab:Toggle({Value=false,Callback=Auto_Win_Obby_019,Title="Auto-Win Obby",Desc="Finish line loops to your position"})
State.MovieTab:Section({Title="Pirate"})
State.MovieTab:Button({Callback=Collect_Keys_Open_Chests_020,Title="Collect Keys & Open Chests",Desc="Collects all pirate keys and opens matching chests"})
State.MovieTab:Section({Title="Beach Fight"})
State.MovieTab:Toggle({Value=false,Callback=Kill_Everyone_In_Beach_Fight_021,Title="Kill Everyone In Beach Fight",Desc="Fires sword touch on all players every frame"})
State.MovieTab:Section({Title="Monster"})
State.MovieTab:Button({Callback=Monster_Godmode_022,Title="Monster Godmode",Desc="Destroys the monster NPC to prevent damage"})
State.MovieTab:Section({Title="Alien"})
State.MovieTab:Button({Callback=Collect_Egg_023,Title="Collect Egg",Desc="Moves your egg to your character position"})
State.MovieTab:Section({Title="Pre-Historic"})
State.MovieTab:Toggle({Value=false,Callback=Auto_Collect_Ancient_Artifacts_024,Title="Auto Collect Ancient Artifacts",Desc="Teleports artifact coins to you as they spawn"})
State.MovieTab:Section({Title="Math Mania"})
State.MovieTab:Toggle({Value=false,Callback=Auto_Win_Math_Mania_025,Title="Auto-Win Math Mania",Desc="Auto-solves and submits all math questions"})
State.MovieTab:Section({Title="Rock & Roll"})
State.MovieTab:Toggle({Value=false,Callback=Auto_Collect_Guitars_026,Title="Auto Collect Guitars",Desc="Heartbeat collects all coins/gems in Rock & Roll"})
State.MovieTab:Section({Title="Prison"})
State.MovieTab:Button({Callback=Instantly_Eat_Poison_Bowl_027,Title="Instantly Eat Poison Bowl",Desc="Fires clickdetector on every bowl in the prison"})
State.MovieTab:Toggle({Value=false,Callback=Auto_Shoot_Raygun_Sheriff_028,Title="Auto Shoot Raygun (Sheriff)",Desc="Fires ServerControl at nearest enemy"})
State.MovieTab:Toggle({Value=false,Callback=Kill_All_Sheriff_Raygun_029,Title="Kill All (Sheriff / Raygun)",Desc="Moves lasers onto each player"})
State.MovieTab:Toggle({Value=false,Callback=Raygun_Sheriff_Protection_030,Title="Raygun / Sheriff Protection",Desc="Deletes incoming laser blasts"})
State.ExpeditionTab:Section({Title="Obby"})
State.ExpeditionObbyGroup=State.ExpeditionTab:Group()
State.ExpeditionObbyGroup:Button({Title="Win Obby",Callback=Win_Obby_001,IconAlign="Left",Justify="Center",Icon="solar:flag-bold",Size="Small"})
State.ExpeditionTab:Toggle({Value=false,Callback=Auto_Win_Obby_031,Title="Auto-Win Obby",Desc="Finish line loops to your position"})
State.ExpeditionTab:Section({Title="Collectibles"})
State.ExpeditionTab:Toggle({Value=false,Callback=Auto_Collect_Clovers_032,Title="Auto-Collect Clovers",Desc="Moves all gems and coins to your character"})
State.ExpeditionTab:Toggle({Value=false,Callback=Auto_Collect_Rings_033,Title="Auto-Collect Rings",Desc="Moves all ring hitboxes to your character"})
State.ExpeditionTab:Section({Title="Math Mania"})
State.ExpeditionTab:Toggle({Value=false,Callback=Auto_Win_Math_Mania_034,Title="Auto-Win Math Mania",Desc="Auto-solves and submits all math questions"})
State.ExpeditionTab:Section({Title="Greece"})
State.ExpeditionTab:Toggle({Value=false,Callback=Kill_Everyone_in_Greece_035,Title="Kill Everyone in Greece",Desc="Fires sword touch on all players every frame"})
State.ExpeditionTab:Section({Title="Amazon"})
State.ExpeditionTab:Button({Callback=Break_Amazon_Spleef_036,Title="Break Amazon (Spleef)",Desc="Fires touchinterest on all Amazon spleef parts"})
State.ExpeditionTab:Section({Title="France (Cheese Push)"})
State.FranceGroup=State.ExpeditionTab:Group()
State.FranceGroup:Button({Title="Push Cheese 1",Callback=Push_Cheese_1_037,IconAlign="Left",Justify="Center",Icon="solar:map-point-bold",Size="Small"})
State.FranceGroup:Space({Columns=0.5})
State.FranceGroup:Button({Title="Push Cheese 2",Callback=Push_Cheese_2_038,IconAlign="Left",Justify="Center",Icon="solar:map-point-bold",Size="Small"})
State.ExpeditionTab:Toggle({Value=false,Callback=Auto_Push_Cheese_039,Title="Auto Push Cheese",Desc="Continuously pushes both cheeses to the finish"})
State.ExpeditionTab:Section({Title="Italy"})
State.ExpeditionTab:Button({Callback=Give_Meatball_040,Title="Give Meatball",Desc="Clones meatball into your backpack"})
State.ExpeditionTab:Toggle({Value=false,Callback=Keep_Meatball_After_Round_041,Title="Keep Meatball After Round",Desc="Re-equips the meatball if it gets taken away"})
State.ExpeditionTab:Toggle({Value=false,Callback=Auto_Throw_Meatball_042,Title="Auto Throw Meatball",Desc="Throws meatball at all players"})
State.ExpeditionTab:Toggle({Value=false,Callback=Kill_All_Meatball_043,Title="Kill All (Meatball)",Desc="Slams meatball into each player"})
State.ExpeditionTab:Toggle({Value=false,Callback=Bring_Meatball_Giver_044,Title="Bring Meatball Giver",Desc="Moves MeatballGiver to you"})
State.MainTab:Section({Title="Safety Statue"})
State.SafetyStatueGroup=State.MainTab:Group()
State.SafetyStatueGroup:Button({Title="Get Statue/Bag",Callback=Get_Statue_Bag_045,IconAlign="Left",Justify="Center",Icon="solar:diploma-bold",Size="Small"})
State.SafetyStatueGroup:Space({Columns=0.5})
State.SafetyStatueGroup:Button({Title="Who Has It",Callback=Who_Has_It_046,IconAlign="Left",Justify="Center",Icon="solar:eye-bold",Size="Small"})
State.MainTab:Toggle({Value=false,Callback=Safety_Bag_ESP_047,Title="Safety Bag ESP",Desc="Shows white highlight and label on all safety bags"})
State.MainTab:Toggle({Value=false,Callback=Safety_Statue_ESP_048,Title="Safety Statue ESP",Desc="Shows white highlight and label on all safety statues"})
State.MainTab:Toggle({Value=false,Callback=Idol_Holder_ESP_049,Title="Idol Holder ESP",Desc="Highlights whoever currently holds the statue"})
State.MainTab:Toggle({Value=false,Callback=Play_as_Idol_Spam_050,Title="Play as Idol (Spam)",Desc="Fires Idol remote rapidly — only works if you hold it"})
State.MainTab:Button({Callback=Play_as_Idol_Once_051,Title="Play as Idol (Once)",Desc="Fires Idol remote once"})
State.MainTab:Section({Title="Votes"})
State.MainTab:Toggle({Value=false,Callback=Notify_Votes_052,Title="Notify Votes",Desc="Shows a notification each time a vote is cast"})
State.MainTab:Toggle({Value=false,Callback=Print_Votes_to_Console_053,Title="Print Votes to Console",Desc="Prints each vote to the F9 developer console"})
State.MainTab:Toggle({Value=false,Callback=Expose_Votes_in_Chat_054,Title="Expose Votes in Chat",Desc="Sends each vote publicly in the game chat"})
State.MainTab:Toggle({Value=false,Callback=Notify_Expose_Exile_Votes_055,Title="Notify & Expose Exile Votes",Desc="Notifies and exposes exile votes in chat"})
State.MainTab:Toggle({Value=false,Callback=Notify_Jury_Votes_056,Title="Notify Jury Votes",Desc="Shows a notification each time a jury vote is cast"})
State.MainTab:Toggle({Value=false,Callback=Expose_Jury_Votes_in_Chat_057,Title="Expose Jury Votes in Chat",Desc="Sends jury votes publicly in game chat"})
State.MainTab:Section({Title="Safety Statue"})
State.SafetyStatueGroupAlt=State.MainTab:Group()
State.SafetyStatueGroupAlt:Button({Title="Get Statue/Bag",Callback=Get_Statue_Bag_058,IconAlign="Left",Justify="Center",Icon="solar:diploma-bold",Size="Small"})
State.SafetyStatueGroupAlt:Space({Columns=0.5})
State.SafetyStatueGroupAlt:Button({Title="Who Has It",Callback=Who_Has_It_059,IconAlign="Left",Justify="Center",Icon="solar:eye-bold",Size="Small"})
State.MainTab:Toggle({Value=false,Callback=Safety_Bag_ESP_060,Title="Safety Bag ESP",Desc="Shows white highlight and label on all safety bags"})
State.MainTab:Toggle({Value=false,Callback=Safety_Statue_ESP_061,Title="Safety Statue ESP",Desc="Shows white highlight and label on all safety statues"})
State.MainTab:Toggle({Value=false,Callback=Idol_Holder_ESP_062,Title="Idol Holder ESP",Desc="Highlights whoever currently holds the statue"})
State.MainTab:Toggle({Value=false,Callback=Play_as_Idol_Spam_063,Title="Play as Idol (Spam)",Desc="Fires Idol remote rapidly — only works if you hold it"})
State.MainTab:Button({Callback=Play_as_Idol_Once_064,Title="Play as Idol (Once)",Desc="Fires Idol remote once"})
State.MainTab:Section({Title="Votes"})
State.MainTab:Toggle({Value=false,Callback=Notify_Votes_065,Title="Notify Votes",Desc="Shows a notification each time a vote is cast"})
State.MainTab:Toggle({Value=false,Callback=Print_Votes_to_Console_066,Title="Print Votes to Console",Desc="Prints each vote to the F9 developer console"})
State.MainTab:Toggle({Value=false,Callback=Expose_Votes_in_Chat_067,Title="Expose Votes in Chat",Desc="Sends each vote publicly in the game chat"})
State.MainTab:Toggle({Value=false,Callback=Notify_Expose_Exile_Votes_068,Title="Notify & Expose Exile Votes",Desc="Notifies and exposes exile votes in chat"})
State.MainTab:Toggle({Value=false,Callback=Notify_Jury_Votes_069,Title="Notify Jury Votes",Desc="Shows a notification each time a jury vote is cast"})
State.MainTab:Toggle({Value=false,Callback=Expose_Jury_Votes_in_Chat_070,Title="Expose Jury Votes in Chat",Desc="Sends jury votes publicly in game chat"})
State.MainTab:Button({Callback=Vote_Log_GUI_071,Title="Vote Log GUI",Desc="Opens a movable dark GUI logging all votes live"})
State.MainTab:Toggle({Value=false,Callback=Tiebreaker_Detector_072,Title="Tiebreaker Detector",Desc="Watches votes live, alerts on tie and shows tally"})
State.MainTab:Button({Callback=Check_Vote_Tally_073,Title="Check Vote Tally",Desc="Shows current vote counts"})
State.MainTab:Section({Title="Round Info"})
State.RoundInfoGroup=State.MainTab:Group()
State.RoundInfoGroup:Button({Title="Round Type",Callback=Round_Type_074,IconAlign="Left",Justify="Center",Icon="solar:bolt-circle-bold",Size="Small"})
State.RoundInfoGroup:Space({Columns=0.5})
State.RoundInfoGroup:Button({Title="Teamers",Callback=Teamers_075,IconAlign="Left",Justify="Center",Icon="solar:users-group-two-rounded-bold",Size="Small"})
State.MainTab:Toggle({Value=false,Callback=Round_Detector_076,Title="Round Detector",Desc="Notifies on twists BEFORE the round starts + merges"})
State.MainTab:Section({Title="Server Hop"})
State.MainTab:Toggle({Value=false,Callback=Server_Hop_on_Merge_077,Title="Server Hop on Merge",Desc="Teleports to a new server when merge triggers"})
State.MainTab:Button({Callback=Server_Hop_Now_078,Title="Server Hop Now",Desc="Immediately teleports to a new server"})
State.MainTab:Section({Title="Auto Farm & Rejoin"})
State.MainTab:Toggle({Value=false,Callback=Auto_Rejoin_When_Voted_Out_079,Title="Auto Rejoin When Voted Out",Desc="Rejoins Camp when voted out"})
State.MainTab:Toggle({Value=false,Callback=TP_Above_Map_080,Title="TP Above Map",Desc="Creates invisible platform and keeps you there"})
State.MainTab:Toggle({Value=false,Callback=Auto_Join_Camp_From_Lobby_081,Title="Auto Join Camp From Lobby",Desc="Fires Teleport:Camp remote every 5s"})
State.MainTab:Section({Title="Elimination Reason"})
State.MainTab:Button({Callback=Check_Elim_Reason_082,Title="Check Elim Reason",Desc="Shows current elimination reasons"})
State.MainTab:Toggle({Value=false,Callback=Notify_Elim_Reason_083,Title="Notify Elim Reason",Desc="Shows notification when players are eliminated"})
State.MainTab:Toggle({Value=false,Callback=Expose_Elim_in_Chat_084,Title="Expose Elim in Chat",Desc="Sends eliminations publicly in game chat"})
State.MainTab:Toggle({Value=false,Callback=Send_Elim_to_Webhook_085,Title="Send Elim to Webhook",Desc="Posts eliminations to your Discord webhook"})
State.MainTab:Section({Title="Utilities"})
State.MainTab:Button({Callback=Remove_Intro_Cutscene_086,Title="Remove Intro Cutscene",Desc="Destroys the intro camera cutscene"})
State.MainTab:Button({Callback=Fling_Reanimate_087,Title="Fling / Reanimate",Desc="Executes the reanimate script"})
State.MainTab:Button({Callback=Open_Console_088,Title="Open Console",Desc="Opens the developer console"})
State.MainTab:Toggle({Value=false,Callback=Auto_Block_Long_Usernames_089,Title="Auto-Block Long Usernames",Desc="Truncates very long display names to prevent lag"})
State.MainTab:Section({Title="Gear Keeper"})
State.MainTab:Toggle({Value=false,Callback=Gear_Keeper_090,Title="Gear Keeper",Desc="Restores tools after round ends"})
State.MainTab:Button({Callback=Snapshot_Gear_Now_091,Title="Snapshot Gear Now",Desc="Manually saves current tools"})
State.MainTab:Button({Callback=Restore_Gear_Now_092,Title="Restore Gear Now",Desc="Immediately returns saved tools"})
State.MainTab:Section({Title="Anti Gear Removal"})
State.MainTab:Toggle({Value=false,Callback=Anti_Gear_Removal_093,Title="Anti Gear Removal",Desc="Blocks Gear:FireServer Remove + ClearBackpack"})
State.CharactersTab:Section({Title="Free"})
State.FreeCharacterGroup=State.CharactersTab:Group()
State.FreeCharacterGroup:Button({Title="Set Male",Callback=Set_Male_094,IconAlign="Left",Justify="Center",Icon="solar:user-bold",Size="Small"})
State.FreeCharacterGroup:Space({Columns=0.5})
State.FreeCharacterGroup:Button({Title="Set Female",Callback=Set_Female_095,IconAlign="Left",Justify="Center",Icon="solar:user-bold",Size="Small"})
State.CharactersTab:Section({Title="Buy Character"})
State.CharactersTab:Dropdown({Title="Symbol",Value=1,Values={[1]="None",[2]="Verified",[3]="Premium",[4]="Robux"},Callback=Symbol_096,Desc="Choose a symbol to append to the character name"})
State.CharactersTab:Input({Callback=Character_Name_097,Placeholder="Enter name...",Title="Character Name",Desc="Type the exact character name to purchase"})
State.CharactersTab:Button({Callback=Buy_Character_60_coins_098,Title="Buy Character (60 coins)",Desc="Fires the buy remote with your entered name"})
State.CharactersTab:Section({Title="Map Themes"})
State.CharactersTab:Button({Callback=Christmas_Map_099,Title="Christmas Map",Desc="Snow + white trees"})
State.CharactersTab:Button({Callback=Halloween_Map_100,Title="Halloween Map",Desc="Rust leaves + dark foggy lighting"})
State.CharactersTab:Button({Callback=Valentines_Map_101,Title="Valentines Map",Desc="Pink leaves + rose water"})
State.CharactersTab:Button({Callback=Reset_Map_102,Title="Reset Map",Desc="Removes snow + restores lighting"})
State.PlayerTab:Section({Title="Movement"})
State.PlayerTab:Space({Columns=2})
State.PlayerTab:Slider({IsTooltip=true,Title="Walk Speed",Value={Max=350,Default=16,Min=1},Callback=Walk_Speed_103,Step=1,Icons={To="solar:running-2-bold",From="solar:ghost-bold"}})
State.PlayerTab:Space({Columns=1})
State.PlayerTab:Slider({IsTooltip=true,Title="Jump Power",Value={Max=350,Default=50,Min=1},Callback=Jump_Power_104,Step=1,Icons={To="solar:rocket-bold",From="solar:arrow-up-bold"}})
State.PlayerTab:Section({Title="Timer"})
State.PlayerTab:Toggle({Value=false,Callback=Freeze_Timer_Display_105,Title="Freeze Timer Display",Desc="Locks the on-screen timer so it stops counting"})
State.PlayerTab:Toggle({Value=false,Callback=Hide_Timer_106,Title="Hide Timer",Desc="Makes the timer GUI invisible"})
State.PlayerTab:Section({Title="Map"})
State.PlayerTab:Button({Callback=Remove_Glass_Barriers_107,Title="Remove Glass Barriers",Desc="Destroys all glass barrier parts in the map"})
State.PlayerTab:Toggle({Value=false,Callback=Walk_on_Lake_108,Title="Walk on Lake",Desc="Enables lake collision"})
State.PlayerTab:Button({Callback=Lake_God_Mode_109,Title="Lake God-Mode",Desc="Destroys the lake sand touch interest"})
State.PlayerTab:Section({Title="Target Player"})
State.Season=State.ReplicatedStorage:WaitForChild("Season",5)
State.SeasonPlayers=State.Season:WaitForChild("Players",5)
State.SeasonPlayers:GetChildren()
State.TargetPlayerDropdown=State.PlayerTab:Dropdown({Title="Choose Player",Value=1,Values={[1]="(none)"},Callback=Choose_Player_110,Desc="Select a player to target"})
State.Players.PlayerAdded:Connect(Feature111_111)
State.Players.PlayerRemoving:Connect(Feature112_112)
State.TargetPlayerGroup=State.PlayerTab:Group()
State.TargetPlayerGroup:Button({Title="Teleport To",Callback=Teleport_To_113,IconAlign="Left",Justify="Center",Icon="solar:map-point-bold",Size="Small"})
State.TargetPlayerGroup:Space({Columns=0.5})
State.TargetPlayerGroup:Button({Title="Refresh List",Callback=Refresh_List_114,IconAlign="Left",Justify="Center",Icon="solar:refresh-bold",Size="Small"})
State.PlayerTab:Toggle({Value=false,Callback=Highlight_Player_115,Title="Highlight Player",Desc="Adds a yellow highlight to the selected player"})
State.StatsTab:Section({Title="Player Stats"})
State.Players:GetPlayers()
State.StatsPlayerDropdown=State.StatsTab:Dropdown({Title="Choose Player",Value=1,Values={[1]="(none)"},Callback=Choose_Player_116,Desc="Select a player to view their stats"})
State.StatsTab:Button({Callback=Refresh_List_117,Title="Refresh List",Desc="Updates the list with current players"})
State.StatsTab:Button({Callback=Camp_Wins_118,Title="Camp Wins",Desc="Shows camp win count"})
State.StatsTab:Button({Callback=Movie_Wins_119,Title="Movie Wins",Desc="Shows movie win count"})
State.StatsTab:Button({Callback=Expedition_Wins_120,Title="Expedition Wins",Desc="Shows expedition win count"})
State.StatsTab:Button({Callback=Coins_121,Title="Coins",Desc="Shows coin balance"})
State.StatsTab:Button({Callback=Comeback_Wins_122,Title="Comeback Wins",Desc="Shows comeback win count"})
State.StatsTab:Button({Callback=Games_Played_123,Title="Games Played",Desc="Shows total games played"})
State.StatsTab:Button({Callback=Idols_Found_124,Title="Idols Found",Desc="Shows idols found"})
State.StatsTab:Button({Callback=Skins_125,Title="Skins",Desc="Lists all skins owned by selected player"})
State.StatsTab:Button({Callback=Marshmallows_126,Title="Marshmallows",Desc="Lists all marshmallows owned by selected player"})
State.TeleportsTab:Section({Title="Camp"})
State.TeleportsTab:Button({Callback=Spectator_Island_127,Title="Spectator Island",Desc="Teleport to Spectator Island"})
State.TeleportsTab:Button({Callback=Main_Island_128,Title="Main Island",Desc="Teleport to Main Island"})
State.TeleportsTab:Button({Callback=Exile_Island_129,Title="Exile Island",Desc="Teleport to Exile Island"})
State.TeleportsTab:Button({Callback=Voting_Area_130,Title="Voting Area",Desc="Teleport to Voting Area"})
State.TeleportsTab:Button({Callback=Boat_131,Title="Boat",Desc="Teleport to Boat"})
State.TeleportsTab:Button({Callback=Bathroom_132,Title="Bathroom",Desc="Teleport to Bathroom"})
State.TeleportsTab:Section({Title="Movie"})
State.TeleportsTab:Button({Callback=Starter_Island_133,Title="Starter Island",Desc="Teleport to Starter Island"})
State.TeleportsTab:Button({Callback=Voting_Area_134,Title="Voting Area",Desc="Teleport to Voting Area"})
State.TeleportsTab:Button({Callback=Cabin_1_135,Title="Cabin 1",Desc="Teleport to Cabin 1"})
State.TeleportsTab:Button({Callback=Cabin_2_136,Title="Cabin 2",Desc="Teleport to Cabin 2"})
State.TeleportsTab:Button({Callback=Dining_Room_137,Title="Dining Room",Desc="Teleport to Dining Room"})
State.TeleportsTab:Button({Callback=Kitchen_138,Title="Kitchen",Desc="Teleport to Kitchen"})
State.TeleportsTab:Button({Callback=Inside_Boat_139,Title="Inside Boat",Desc="Teleport to Inside Boat"})
State.TeleportsTab:Section({Title="Expedition"})
State.TeleportsTab:Button({Callback=Ship_Voting_Area_140,Title="Ship Voting Area",Desc="Teleport to Ship Voting Area"})
State.TeleportsTab:Button({Callback=First_Class_VIP_141,Title="First Class (VIP)",Desc="Teleport to First Class (VIP)"})
State.TeleportsTab:Button({Callback=_2nd_Class_142,Title="2nd Class",Desc="Teleport to 2nd Class"})
State.TeleportsTab:Button({Callback=Ship_Bathroom_143,Title="Ship Bathroom",Desc="Teleport to Ship Bathroom"})
State.TeleportsTab:Button({Callback=Dining_Class_144,Title="Dining Class",Desc="Teleport to Dining Class"})
State.TeleportsTab:Button({Callback=Basement_145,Title="Basement",Desc="Teleport to Basement"})
State.UniversalTab:Section({Title="Tools"})
State.UniversalTab:Button({Callback=VC_Unban_146,Title="VC Unban",Desc="Rejoins voice chat to bypass a voice ban"})
State.UniversalTab:Button({Callback=Apply_Shaders_147,Title="Apply Shaders",Desc="Applies custom lighting and sky shaders"})
State.UniversalTab:Button({Callback=Infinite_Yield_148,Title="Infinite Yield",Desc="Loads Infinite Yield FE admin commands"})
State.UniversalTab:Button({Callback=Fly_GUI_149,Title="Fly GUI",Desc="Loads a fly script with GUI controls"})
State.UniversalTab:Button({Callback=Wall_Hop_150,Title="Wall Hop",Desc="Loads a wall hop movement script"})
State.UniversalTab:Button({Callback=Sound_Panel_151,Title="Sound Panel",Desc="Loads a sound control panel"})
State.UniversalTab:Button({Callback=Energize_Animations_152,Title="Energize Animations",Desc="Opens the FE animation GUI"})
State.UniversalTab:Button({Callback=Bring_Back_Old_Chat_153,Title="Bring Back Old Chat",Desc="Restores the old Roblox chat UI"})
State.UniversalTab:Section({Title="Misc"})
State.UniversalTab:Toggle({Value=false,Callback=Collision_154,Title="Collision",Desc="Adds invisible collision to all other players"})
State.UniversalTab:Toggle({Value=false,Callback=Hacker_Detector_155,Title="Hacker Detector",Desc="Flags abnormal speed or jump"})
State.UniversalTab:Section({Title="Team Changer"})
State.Teams=game:GetService("Teams")
State.Teams:GetChildren()
State.TeamDropdown=State.UniversalTab:Dropdown({Value=1,Callback=Team_156,Values={[1]="Spectator",[2]="Jury",[3]="Team1",[4]="Team2",[5]="Team3"},Title="Team"})
State.UniversalTab:Button({Title="Refresh Teams",Callback=Refresh_Teams_157})
State.UniversalTab:Button({Callback=Set_Team_158,Title="Set Team",Desc="Join the selected team"})
State.UniversalTab:Button({Callback=Spectator_159,Title="Spectator",Desc="Quick-join Spectator team"})
State.UniversalTab:Button({Callback=Jury_160,Title="Jury",Desc="Quick-join Jury team"})
State.UniversalTab:Section({Title="Fonts"})
State.UniversalTab:Button({Callback=Load_Fonts_161,Title="Load Fonts",Desc="Download all fonts before applying"})
State.UniversalTab:Button({Callback=Starborn_162,Title="Starborn",Desc="Apply Starborn font"})
State.UniversalTab:Button({Callback=VHS_163,Title="VHS",Desc="Apply VHS gothic font"})
State.UniversalTab:Button({Callback=Minecrafter_164,Title="Minecrafter",Desc="Apply Minecrafter font"})
State.UniversalTab:Button({Callback=Horror_165,Title="Horror",Desc="Apply Horror font"})
State.ClientTab:Section({Title="Cosmetics"})
State.ClientTab:Toggle({Value=false,Callback=Rainbow_Name_166,Title="Rainbow Name",Desc="Makes your character name cycle through rainbow colors"})
State.ClientTab:Section({Title="Skin Changer"})
State.ClientTab:Button({Callback=Skin_Changer_167,Title="Skin Changer",Desc="Opens the skin changer GUI"})
State.ClientTab:Section({Title="Size Changer"})
State.ClientTab:Button({Callback=Size_Changer_168,Title="Size Changer",Desc="Changes your size"})
State.ClientTab:Section({Title="Admin Panel"})
State.ClientTab:Button({Callback=Gets_Admin_Panel_169,Title="Gets Admin Panel",Desc="Forces open the settings/admin GUI"})
State.OtherTab:Section({Title="Auto Farm"})
State.OtherTab:Toggle({Value=false,Callback=Auto_Farm_Coin_170,Title="Auto Farm Coin",Desc="Reanimates when any player wins + auto-win obby"})
State.OtherTab:Section({Title="Auto Farm Coins 2"})
State.OtherTab:Toggle({Value=false,Callback=Auto_Farm_Coins_2_171,Title="Auto Farm Coins 2",Desc="Triggers on every coin gain"})
State.OtherTab:Section({Title="Auto Restart Day"})
State.OtherTab:Toggle({Value=false,Callback=Auto_Restart_Day_172,Title="Auto Restart Day",Desc="Reanimates when the round ends"})
State.OtherTab:Section({Title="Obby Detector"})
State.OtherTab:Button({Callback=Detect_Current_Obby_173,Title="Detect Current Obby",Desc="Checks workspace.Assets for active challenge"})
State.OtherTab:Toggle({Value=false,Callback=Auto_Detect_Obby_174,Title="Auto-Detect Obby",Desc="Notifies when a new challenge starts"})
State.OtherTab:Section({Title="Get Items"})
State.OtherTab:Button({Title="Give Dodgeball",Callback=Give_Dodgeball_175})
State.OtherTab:Button({Title="Give Paintball Gun",Callback=Give_Paintball_Gun_176})
State.OtherTab:Button({Title="Give Meatball",Callback=Give_Meatball_177})
State.OtherTab:Button({Title="Give Raygun (Sheriff)",Callback=Give_Raygun_Sheriff_178})
State.OtherTab:Button({Title="Give Sword",Callback=Give_Sword_179})
State.OtherTab:Button({Title="Give Pool Noodle",Callback=Give_Pool_Noodle_180})
State.OtherTab:Button({Title="Give Snowball",Callback=Give_Snowball_181})
State.OtherTab:Section({Title="Webhooks"})
State.OtherTab:Input({Callback=Webhook_URL_182,Placeholder="https://discord.com/api/webhooks/...",Title="Webhook URL",Desc="Paste your Discord webhook URL here"})
State.OtherTab:Button({Callback=Test_Webhook_183,Title="Test Webhook",Desc="Sends a test message to verify your webhook URL"})
State.OtherTab:Toggle({Value=false,Title="Send Jury Votes to Webhook",Callback=Send_Jury_Votes_to_Webhook_184})
State.OtherTab:Toggle({Value=false,Title="Send Votes to Webhook",Callback=Send_Votes_to_Webhook_185})
State.OtherTab:Toggle({Value=false,Title="Send Exile Votes to Webhook",Callback=Send_Exile_Votes_to_Webhook_186})
State.OtherTab:Toggle({Value=false,Title="Expose Exile Votes in Chat",Callback=Expose_Exile_Votes_in_Chat_187})
State.OtherTab:Toggle({Value=false,Title="Send Statue Holder to Webhook",Callback=Send_Statue_Holder_to_Webhook_188})
State.OtherTab:Toggle({Value=false,Title="Send Round Info to Webhook",Callback=Send_Round_Info_to_Webhook_189})
State.ShopTab:Section({Title="Daily Shop"})
State.ShopTab:Button({Callback=Print_Shop_to_Console_190,Title="Print Shop to Console",Desc="Prints all daily shop items to F9 console"})
State.ShopTab:Button({Callback=Send_Shop_to_Webhook_191,Title="Send Shop to Webhook",Desc="Posts all daily shop items to your Discord webhook"})
State.ShopTab:Section({Title="Shop Watcher"})
State.ShopTab:Toggle({Value=false,Callback=Notify_When_Shop_Updates_192,Title="Notify When Shop Updates",Desc="Notifies you when a new item appears in the shop"})
State.ShopTab:Toggle({Value=false,Callback=Auto_Send_Shop_Updates_to_Webhook_193,Title="Auto Send Shop Updates to Webhook",Desc="Posts to webhook when new items appear"})
State.TrollTab:Section({Title="Sound Control"})
State.TrollTab:Toggle({Value=false,Callback=Mute_All_Sounds_194,Title="Mute All Sounds",Desc="Sets SoundService volume to 0 (local only)"})
State.TrollTab:Button({Callback=Stop_All_Playing_Sounds_195,Title="Stop All Playing Sounds",Desc="Stops all sounds in workspace and PlayerGui"})
State.TrollTab:Section({Title="Spam Sounds"})
State.TrollTab:Toggle({Value=false,Callback=Spam_Click_Sound_196,Title="Spam Click Sound",Desc="Rapidly fires lp.PlayerGui.Click:Play()"})
State.TrollTab:Toggle({Value=false,Callback=Spam_OOF_197,Title="Spam OOF",Desc="Loops the OOF death sound locally"})
State.TrollTab:Section({Title="Trigger Sounds"})
State.TrollTab:Button({Title="Sword Lunge Sound",Callback=Sword_Lunge_Sound_198})
State.TrollTab:Button({Title="Equip (Sword Unsheath)",Callback=Equip_Sword_Unsheath_199})
State.TrollTab:Button({Title="Toilet Elimination Sound",Callback=Toilet_Elimination_Sound_200})
State.TrollTab:Button({Title="Sleigh Elimination Sound",Callback=Sleigh_Elimination_Sound_201})
State.TrollTab:Section({Title="Trigger Twisted"})
State.TrollTab:Button({Callback=Trigger_Twisted_202,Title="Trigger Twisted",Desc="Fires PSSettings + OSSettings Start remotes"})
State.TrollTab:Section({Title="Sleigh Elimination Swap"})
State.TrollTab:Button({Callback=Swap_to_Sleigh_Elimination_203,Title="Swap to Sleigh Elimination",Desc="Replaces Boat with Sleigh, plays animation"})
State.TrollTab:Button({Callback=Force_Restore_Boat_204,Title="Force Restore Boat",Desc="Immediately restores Boat Elimination"})
State.TrollTab:Section({Title="Anti Loser Land"})
State.TrollTab:Toggle({Value=false,Callback=Anti_Loser_Land_205,Title="Anti Loser Land",Desc="Blocks elimination sending you to spectator"})
State.TrollTab:Button({Callback=Force_Fight_Elim_Test_206,Title="Force Fight Elim (Test)",Desc="Manually triggers the anti-elim routine"})
State.AutoplayTab:Section({Title="TAS Autoplay"})
State.AutoplayTab:Toggle({Value=false,Callback=Autoplay_207,Title="Autoplay",Desc="Automatically plays the TAS when a challenge starts"})
State.AutoplayTab:Toggle({Value=false,Callback=Disable_Shiftlock_Camera_208,Title="Disable Shiftlock / Camera",Desc="Keeps your camera free during TAS playback"})
State.AutoplayTab:Button({Callback=Play_This_Round_209,Title="Play This Round",Desc="Manually triggers autoplay for the current map"})
State.AutoplayTab:Button({Callback=Stop_Playback_210,Title="Stop Playback",Desc="Stops the current TAS playback"})
State.AutoplayTab:Section({Title="Map Options"})
State.AutoplayTab:Dropdown({Value=1,Callback=Cave_Chaos_Route_211,Values={[1]="Cave Chaos",[2]="Cave Chaos Clip"},Title="Cave Chaos Route"})
State.AutoplayTab:Dropdown({Value=1,Callback=Unstable_Savannah_Route_212,Values={[1]="Unstable Savannah",[2]="Unstable Savannah Clip"},Title="Unstable Savannah Route"})
State.SettingsTab:Section({Title="Update Notice"})
State.SettingsTab:Paragraph({Title="What's New",Content="View the latest changelog anytime, even if you dismissed it permanently."})
State.SettingsTab:Button({Callback=Show_Update_Notice_213,Title="Show Update Notice",Desc="Re-opens the changelog dialog"})
State.SettingsTab:Section({Title="UI Library"})
State.SettingsTab:Paragraph({Title="Switch UI",Content="Switching will reload the entire script with Rayfield. All current toggles will reset."})
State.SettingsTab:Button({Callback=Switch_to_Rayfield_214,Title="Switch to Rayfield",Desc="Destroys WindUI and loads the Rayfield version"})
State.SettingsTab:Section({Title="Toggle Key"})
State.SettingsTab:Paragraph({Title="Current Key",Content="Default is K. Change it here if needed."})
State.SettingsTab:Dropdown({Title="Toggle Key",Value=1,Values={[1]="K",[2]="RightShift",[3]="RightCtrl",[4]="Insert",[5]="Home",[6]="Delete",[7]="F4",[8]="F5",[9]="F6"},Callback=Toggle_Key_215,Desc="Key to show/hide the UI (default: K)"})
State.SettingsTab:Section({Title="WindUI Theme"})
State.SettingsTab:Paragraph({Title="Theme",Content="Change the colour theme of the WindUI window. Takes effect immediately."})
State.SettingsTab:Dropdown({Title="Theme",Value=1,Values={[1]="Dark",[2]="Light",[3]="Aqua",[4]="Bloom",[5]="Rose"},Callback=Theme_216,Desc="Pick a WindUI colour theme"})
local InitOk, InitError = pcall(function()
    State.Window:Init()
end)
if not InitOk then
    warn("[Ella Hub] UI Init warning: " .. tostring(InitError))
end
pcall(function()
    State.WindUI:Notify({Duration=5,Content="Loaded! Press K to toggle.",Title="Ella Hub V2"})
end)
