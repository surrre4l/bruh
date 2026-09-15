--[[
    Ella Hub V2 — readable/executable cleanup
    Based directly on the uploaded deobfuscated source.

    Cleanup performed:
      • renamed the main services, UI tabs, and groups
      • renamed UI callbacks using their visible control titles
      • converted anonymous f.f### callbacks into local functions
      • preserved remaining temporary deobfuscated state as state[n]
      • preserved the original execution order, URLs, and callback wiring
]]
-- callback functions are declared below
local state = {}
autoWinObby=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[45]=workspace.Assets:FindFirstChild("Finish",true)
state[46]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[45].CanCollide=false
state[45].Transparency=1
state[45].Position=state[46].Position
end
autoWinObby2=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
end
internal_3=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_217)
end
eatFinishPancake=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
end
clearParts=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[47]=workspace.Assets:FindFirstChild("Spleef")
state[48]=state[47]:FindFirstChild("Part")
state[49]=state[48]:FindFirstChild("TouchInterest")
state[49]:Destroy()
end
coinsGems=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
end
autoCollectCoinsGems=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_218)
end
autoWinMathMania=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_219)
end
winBlockPush=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace:GetDescendants()
end
killAllInSwordFight=function(a1,a2,a3,a4,a5,a6,a7,a8)
RunService.RenderStepped:Connect(internal_220)
end
bringDodgeballGiver=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_221)
end
keepDodgeballAfterRound=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Backpack.ChildRemoved:Connect(internal_222)
end
autoThrowDodgeball=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_223)
end
killAllDodgeball=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_224)
end
autoFirePaintball=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_225)
end
killAllPaintball=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_226)
end
dodgeballPaintballProtection=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_227)
end
autoWinAllChallenges=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_228)
task.spawn(internal_229)
task.spawn(internal_230)
task.spawn(internal_231)
RunService.RenderStepped:Connect(internal_220)
UI:Notify({["Duration"]=3,["Content"]="ENABLED!",["Title"]="Auto-Win All"})
end
internal_19=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_232)
end
collectKeysOpenChests=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[50]=workspace.Assets:FindFirstChild("Pirate")
state[50]:GetDescendants()
end
killEveryoneInBeachFight=function(a1,a2,a3,a4,a5,a6,a7,a8)
RunService.RenderStepped:Connect(internal_220)
end
monsterGodmode=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[51]=workspace.Assets:FindFirstChild("Monster")
state[52]=state[51]:FindFirstChild("MonsterNPC")
state[52]:Destroy()
end
collectEgg=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[53]=workspace.Assets:WaitForChild("Alien")
ReplicatedStorage.Season.Players:FindFirstChild(Players.LocalPlayer.Name)
state[53]:GetDescendants()
end
autoCollectAncientArtifacts=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[54]=workspace.Assets:WaitForChild("Pre-Historic")
state[55]=state[54]:WaitForChild("Coins")
state[55].ChildAdded:Connect(internal_233)
end
autoWinMathMania2=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_234)
end
autoCollectGuitars=function(a1,a2,a3,a4,a5,a6,a7,a8)
RunService.Heartbeat:Connect(internal_235)
end
instantlyEatPoisonBowl=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
UI:Notify({["Duration"]=3,["Content"]="Fired 0 bowl(s)!",["Title"]="Prison"})
end
autoShootRaygunSheriff=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_236)
end
killAllSheriffRaygun=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_237)
end
raygunSheriffProtection=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_238)
end
internal_31=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_239)
end
autoCollectClovers=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_240)
end
autoCollectRings=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_241)
end
autoWinMathMania3=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_242)
end
killEveryoneInGreece=function(a1,a2,a3,a4,a5,a6,a7,a8)
RunService.RenderStepped:Connect(internal_220)
end
breakAmazonSpleef=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
end
pushCheese2=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Cheese1",true)
workspace:GetDescendants()
UI:Notify({["Duration"]=3,["Content"]="Not found.",["Title"]="France"})
end
autoPushCheese=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Cheese2",true)
workspace:GetDescendants()
UI:Notify({["Duration"]=3,["Content"]="Not found.",["Title"]="France"})
end
internal_39=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_243)
end
giveMeatball=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[56]=ReplicatedStorage.Products.Gear.Meatball:Clone()
state[56]:FindFirstChild("Handle")
state[56].Handle.CanCollide=false
state[56].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Meatball given!",["Title"]="Meatball"})
end
keepMeatballAfterRound=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Backpack.ChildRemoved:Connect(internal_244)
end
autoThrowMeatball=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_245)
end
killAllMeatball=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_246)
end
bringMeatballGiver=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_247)
end
whoHasIt=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("Torso")
workspace.Idols:GetDescendants()
end
safetyBagEsp=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players:FindFirstChild(ReplicatedStorage.Season.Twists.Idol.Value)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[ReplicatedStorage.Season.Twists.Idol.Value].Value.." has the statue."),["Title"]="Statue Status"})
end
internal_47=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Idols:GetDescendants()
end
safetyStatueEsp=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Idols:GetDescendants()
end
idolHolderEsp=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
workspace:GetDescendants()
ReplicatedStorage:FindFirstChild("Season")
ReplicatedStorage.Season:FindFirstChild("Twists")
state[57]=ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
state[58]=Players:FindFirstChild(state[57].Value)
state[59]=Instance.new("Highlight",nil)
state[59].Name="IdolHolderHL"
state[60]=Color3.fromRGB(255,215,0)
state[59].FillColor=state[60]
state[61]=Color3.fromRGB(255,215,0)
state[59].OutlineColor=state[61]
state[59].FillTransparency=0.4
state[59].OutlineTransparency=0
state[59].Parent=state[58].Character
state[62]=ReplicatedStorage.Season.Twists.Idol.Changed:Connect(internal_248)
end
playAsIdolSpam=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_249)
end
playAsIdolOnce=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Idol:FireServer()
UI:Notify({["Duration"]=4,["Content"]="Fired! Only works if you are the idol holder.",["Title"]="Play as Idol"})
end
notifyVotes=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_250)
end
printVotesToConsole=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_251)
end
exposeVotesInChat=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_252)
end
notifyExposeExileVotes=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(internal_253)
end
notifyJuryVotes=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(internal_254)
end
exposeJuryVotesInChat=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(internal_255)
end
whoHasIt2=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("Torso")
workspace.Idols:GetDescendants()
end
safetyBagEsp2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players:FindFirstChild(ReplicatedStorage.Season.Twists.Idol.Value)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[ReplicatedStorage.Season.Twists.Idol.Value].Value.." has the statue."),["Title"]="Statue Status"})
end
internal_60=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Idols:GetDescendants()
end
safetyStatueEsp2=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Idols:GetDescendants()
end
idolHolderEsp2=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[62]:Disconnect()
workspace:GetDescendants()
workspace:GetDescendants()
ReplicatedStorage:FindFirstChild("Season")
ReplicatedStorage.Season:FindFirstChild("Twists")
state[63]=ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
state[64]=Players:FindFirstChild(state[63].Value)
state[65]=Instance.new("Highlight",nil)
state[65].Name="IdolHolderHL"
state[66]=Color3.fromRGB(255,215,0)
state[65].FillColor=state[66]
state[67]=Color3.fromRGB(255,215,0)
state[65].OutlineColor=state[67]
state[65].FillTransparency=0.4
state[65].OutlineTransparency=0
state[65].Parent=state[64].Character
ReplicatedStorage.Season.Twists.Idol.Changed:Connect(internal_256)
end
playAsIdolSpam2=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_257)
end
playAsIdolOnce2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Idol:FireServer()
UI:Notify({["Duration"]=4,["Content"]="Fired! Only works if you are the idol holder.",["Title"]="Play as Idol"})
end
notifyVotes2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_258)
end
printVotesToConsole2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_259)
end
exposeVotesInChat2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_260)
end
notifyExposeExileVotes2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(internal_261)
end
notifyJuryVotes2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(internal_262)
end
exposeJuryVotesInChat2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(internal_263)
end
voteLogGui=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer:FindFirstChild("PlayerGui")
state[68]=gethui()
state[69]=Instance.new("ScreenGui",nil)
state[69].Name="VoteLogGui"
state[69].ResetOnSpawn=false
state[69].DisplayOrder=999
state[69].ZIndexBehavior=Enum.ZIndexBehavior.Sibling
state[69].IgnoreGuiInset=true
state[69].Parent=state[68]
state[70]=Instance.new("Frame",nil)
state[70].Name="VL"
state[71]=UDim2.fromOffset(340,270)
state[70].Size=state[71]
state[72]=UDim2.fromOffset(24,130)
state[70].Position=state[72]
state[73]=Color3.fromRGB(10,10,14)
state[70].BackgroundColor3=state[73]
state[70].BorderSizePixel=0
state[70].ClipsDescendants=true
state[70].Parent=state[69]
state[74]=Instance.new("UICorner",state[70])
state[75]=UDim.new(0,8)
state[74].CornerRadius=state[75]
state[76]=Instance.new("Frame",nil)
state[76].Name="TB"
state[77]=UDim2.new(1,0,0,30)
state[76].Size=state[77]
state[78]=Color3.fromRGB(16,16,22)
state[76].BackgroundColor3=state[78]
state[76].BorderSizePixel=0
state[76].Parent=state[70]
state[79]=Instance.new("UICorner",state[76])
state[80]=UDim.new(0,8)
state[79].CornerRadius=state[80]
state[81]=Instance.new("Frame",nil)
state[82]=UDim2.new(1,0,0,8)
state[81].Size=state[82]
state[83]=UDim2.new(0,0,1,-8)
state[81].Position=state[83]
state[84]=Color3.fromRGB(16,16,22)
state[81].BackgroundColor3=state[84]
state[81].BorderSizePixel=0
state[81].Parent=state[76]
state[85]=Instance.new("TextLabel",nil)
state[86]=UDim2.fromOffset(30,30)
state[85].Size=state[86]
state[85].BackgroundTransparency=1
state[85].Text="🗑"
state[85].TextSize=13
state[85].Font=Enum.Font.Gotham
state[87]=Color3.fromRGB(160,160,160)
state[85].TextColor3=state[87]
state[85].Parent=state[76]
state[88]=Instance.new("TextLabel",nil)
state[89]=UDim2.new(0,80,1,0)
state[88].Size=state[89]
state[90]=UDim2.fromOffset(32,0)
state[88].Position=state[90]
state[88].BackgroundTransparency=1
state[88].Text="Vote Log"
state[88].TextSize=12
state[88].Font=Enum.Font.GothamBold
state[91]=Color3.fromRGB(210,210,210)
state[88].TextColor3=state[91]
state[88].TextXAlignment=Enum.TextXAlignment.Left
state[88].Parent=state[76]
state[92]=Instance.new("TextButton",nil)
state[93]=UDim2.fromOffset(30,30)
state[92].Size=state[93]
state[94]=UDim2.new(1,-30,0,0)
state[92].Position=state[94]
state[92].BackgroundTransparency=1
state[92].Text="×"
state[92].TextSize=16
state[92].Font=Enum.Font.GothamBold
state[95]=Color3.fromRGB(190,190,190)
state[92].TextColor3=state[95]
state[92].Parent=state[76]
state[96]=Instance.new("TextButton",nil)
state[97]=UDim2.fromOffset(30,30)
state[96].Size=state[97]
state[98]=UDim2.new(1,-60,0,0)
state[96].Position=state[98]
state[96].BackgroundTransparency=1
state[96].Text="–"
state[96].TextSize=15
state[96].Font=Enum.Font.GothamBold
state[99]=Color3.fromRGB(190,190,190)
state[96].TextColor3=state[99]
state[96].Parent=state[76]
state[100]=Instance.new("TextButton",nil)
state[101]=UDim2.fromOffset(30,30)
state[100].Size=state[101]
state[102]=UDim2.new(1,-90,0,0)
state[100].Position=state[102]
state[100].BackgroundTransparency=1
state[100].Text="↓"
state[100].TextSize=13
state[100].Font=Enum.Font.GothamBold
state[103]=Color3.fromRGB(190,190,190)
state[100].TextColor3=state[103]
state[100].Parent=state[76]
state[104]=Color3.fromRGB(100,180,255)
state[105]=Color3.fromRGB(255,200,80)
state[106]=Color3.fromRGB(255,120,120)
state[107]=Instance.new("TextButton",nil)
state[108]=UDim2.fromOffset(36,16)
state[107].Size=state[108]
state[109]=UDim2.fromOffset(90,7)
state[107].Position=state[109]
state[107].BackgroundColor3=state[104]
state[107].BackgroundTransparency=0.3
state[107].Text="Votes"
state[107].TextSize=9
state[107].Font=Enum.Font.GothamBold
state[110]=Color3.fromRGB(220,220,220)
state[107].TextColor3=state[110]
state[107].Parent=state[76]
state[111]=Instance.new("UICorner",state[107])
state[112]=UDim.new(1,0)
state[111].CornerRadius=state[112]
state[107].MouseButton1Click:Connect(internal_264)
state[113]=Instance.new("TextButton",nil)
state[114]=UDim2.fromOffset(36,16)
state[113].Size=state[114]
state[115]=UDim2.fromOffset(128,7)
state[113].Position=state[115]
state[113].BackgroundColor3=state[105]
state[113].BackgroundTransparency=0.3
state[113].Text="Jury"
state[113].TextSize=9
state[113].Font=Enum.Font.GothamBold
state[116]=Color3.fromRGB(220,220,220)
state[113].TextColor3=state[116]
state[113].Parent=state[76]
state[117]=Instance.new("UICorner",state[113])
state[118]=UDim.new(1,0)
state[117].CornerRadius=state[118]
state[113].MouseButton1Click:Connect(internal_265)
state[119]=Instance.new("TextButton",nil)
state[120]=UDim2.fromOffset(36,16)
state[119].Size=state[120]
state[121]=UDim2.fromOffset(166,7)
state[119].Position=state[121]
state[119].BackgroundColor3=state[106]
state[119].BackgroundTransparency=0.3
state[119].Text="Exile"
state[119].TextSize=9
state[119].Font=Enum.Font.GothamBold
state[122]=Color3.fromRGB(220,220,220)
state[119].TextColor3=state[122]
state[119].Parent=state[76]
state[123]=Instance.new("UICorner",state[119])
state[124]=UDim.new(1,0)
state[123].CornerRadius=state[124]
state[119].MouseButton1Click:Connect(internal_266)
state[125]=Instance.new("ScrollingFrame",nil)
state[125].Name="SC"
state[126]=UDim2.new(1,-4,1,-33)
state[125].Size=state[126]
state[127]=UDim2.new(0,2,0,31)
state[125].Position=state[127]
state[125].BackgroundTransparency=1
state[125].BorderSizePixel=0
state[125].ScrollBarThickness=3
state[128]=Color3.fromRGB(70,70,100)
state[125].ScrollBarImageColor3=state[128]
state[125].ScrollingDirection=Enum.ScrollingDirection.Y
state[129]=UDim2.fromOffset(0,0)
state[125].CanvasSize=state[129]
state[125].ElasticBehavior=Enum.ElasticBehavior.Never
state[125].Parent=state[70]
state[130]=Instance.new("UIListLayout",nil)
state[130].SortOrder=Enum.SortOrder.LayoutOrder
state[131]=UDim.new(0,1)
state[130].Padding=state[131]
state[130].Parent=state[125]
state[132]=state[130]:GetPropertyChangedSignal("AbsoluteContentSize")
state[132]:Connect(internal_267)
state[125].InputBegan:Connect(internal_268)
state[133]=Instance.new("TextLabel",nil)
state[133].Name="Empty"
state[134]=UDim2.new(1,-6,0,22)
state[133].Size=state[134]
state[133].BackgroundTransparency=1
state[133].Text="Waiting for votes..."
state[133].TextSize=12
state[133].Font=Enum.Font.Gotham
state[135]=Color3.fromRGB(80,80,100)
state[133].TextColor3=state[135]
state[133].TextXAlignment=Enum.TextXAlignment.Left
state[133].LayoutOrder=0
state[133].Parent=state[125]
Color3.fromRGB(140,200,255)
state[136]=ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_269)
Color3.fromRGB(255,200,80)
state[137]=ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(internal_270)
Color3.fromRGB(255,120,120)
state[138]=ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(internal_271)
state[100].MouseButton1Click:Connect(internal_272)
state[96].MouseButton1Click:Connect(internal_273)
state[92].MouseButton1Click:Connect(internal_274)
state[76].InputBegan:Connect(internal_275)
state[139]=UserInputService.InputEnded:Connect(internal_276)
state[140]=UserInputService.InputChanged:Connect(internal_277)
state[69].Destroying:Connect(internal_278)
UI:Notify({["Duration"]=3,["Content"]="Opened! Waiting for votes...",["Title"]="Vote Log"})
end
tiebreakerDetector=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[141]=ReplicatedStorage:WaitForChild("Season",5)
state[142]=state[141]:WaitForChild("Voting",5)
state[143]=state[142]:WaitForChild("Votes",5)
state[143]:GetChildren()
state[143].ChildAdded:Connect(internal_279)
state[143].ChildRemoved:Connect(internal_280)
UI:Notify({["Duration"]=3,["Content"]="Watching votes.",["Title"]="Tiebreaker"})
end
checkVoteTally=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes:GetChildren()
UI:Notify({["Duration"]=4,["Content"]="No votes cast yet.",["Title"]="Vote Tally"})
end
teamers=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[144]=ReplicatedStorage.Season.Twists:FindFirstChild("CurrentTwist")
UI:Notify({["Duration"]=5,["Content"]=state[144].Value,["Title"]="Round Type"})
end
roundDetector=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage:FindFirstChild("Season")
ReplicatedStorage.Season:FindFirstChild("Players")
Players:GetPlayers()
UI:Notify({["Duration"]=5,["Content"]="No teamers detected.",["Title"]="Teamers"})
end
internal_76=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_281)
UI:Notify({["Duration"]=3,["Content"]="Watching for twists and merges.",["Title"]="Round Detector"})
end
serverHopOnMerge=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[145]=ReplicatedStorage:WaitForChild("Season",5)
state[146]=state[145]:WaitForChild("Values",5)
state[147]=state[146]:WaitForChild("Merge",5)
state[147].Changed:Connect(internal_282)
UI:Notify({["Duration"]=3,["Content"]="Watching for merge.",["Title"]="Server Hop"})
end
serverHopNow=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=3,["Content"]="Hopping to a new server...",["Title"]="Server Hop"})
task.wait()
state[148]=game:GetService("TeleportService")
state[148]:Teleport(game.PlaceId,Players.LocalPlayer)
end
autoRejoinWhenVotedOut=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_283)
UI:Notify({["Duration"]=3,["Content"]="Active — watching your team status.",["Title"]="Auto Rejoin"})
end
tpAboveMap=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[149]=Instance.new("Part",workspace)
state[149].Anchored=true
state[150]=Vector3.new(300,10,300)
state[149].Size=state[150]
state[151]=CFrame.new(0,2900,0)
state[149].CFrame=state[151]
state[149].Transparency=1
state[149].CanCollide=true
state[149].Name="EllaHubPlatform"
task.spawn(internal_284)
UI:Notify({["Duration"]=3,["Content"]="Floating at Y=3000.",["Title"]="Above Map"})
end
autoJoinCampFromLobby=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_285)
UI:Notify({["Duration"]=3,["Content"]="Firing Teleport:Camp every 5s...",["Title"]="Auto Join"})
end
checkElimReason=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
UI:Notify({["Duration"]=4,["Content"]="None set yet.",["Title"]="Elim Reason"})
end
notifyElimReason=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
ReplicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(internal_286)
end
exposeElimInChat=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
ReplicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(internal_287)
end
sendElimToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Products.CharacterSelection.Characters:GetChildren()
ReplicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(internal_288)
end
removeIntroCutscene=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[152]=ReplicatedStorage:FindFirstChild("Events")
state[153]=state[152]:FindFirstChild("Camera")
state[153]:Destroy()
state[154]=Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
workspace.CurrentCamera.CameraType=Enum.CameraType.Custom
workspace.CurrentCamera.CameraSubject=state[154]
end
flingReanimate=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[155]=game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua")
state[156]=loadstring(state[155])
state[156]()
end
openConsole=function(a1,a2,a3,a4,a5,a6,a7,a8)
StarterGui:SetCore("DevConsoleVisible",true)
end
autoBlockLongUsernames=function(a1,a2,a3,a4,a5,a6,a7,a8)
RunService.RenderStepped:Connect(internal_289)
end
gearKeeper=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Backpack:GetChildren()
Players.LocalPlayer.Character:GetChildren()
Players.LocalPlayer.Backpack.ChildAdded:Connect(internal_290)
Players.LocalPlayer.Backpack.ChildRemoved:Connect(internal_291)
Players.LocalPlayer.CharacterAdded:Connect(internal_292)
UI:Notify({["Duration"]=3,["Content"]="Active — saved 0 tool(s).",["Title"]="Gear Keeper"})
end
snapshotGearNow=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Backpack:GetChildren()
Players.LocalPlayer.Character:GetChildren()
UI:Notify({["Duration"]=3,["Content"]="Saved 0 tool(s).",["Title"]="Gear Keeper"})
end
restoreGearNow=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=3,["Content"]="Restored 0 tool(s).",["Title"]="Gear Keeper"})
end
antiGearRemoval=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[157]=newcclosure(internal_293)
state[158]=hookmetamethod(game,"__namecall",state[157])
UI:Notify({["Duration"]=3,["Content"]="Active — Gear Remove calls blocked.",["Title"]="Anti Gear"})
end
setFemale=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Buy:FireServer("Gender","Male")
end
buyCharacter=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Buy:FireServer("Gender","Female")
end
characterName=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_97=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
buyCharacter60Coins=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Buy:FireServer("Character",nil)
end
christmasMap=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
BrickColor.new("White")
workspace:GetDescendants()
state[159]=Color3.fromRGB(127,127,127)
Lighting.Ambient=state[159]
state[160]=Color3.fromRGB(127,127,127)
Lighting.OutdoorAmbient=state[160]
Lighting.FogEnd=100000
Lighting.ClockTime=14
UI:Notify({["Duration"]=3,["Content"]="Christmas applied!",["Title"]="Map Theme"})
end
halloweenMap=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
workspace:GetDescendants()
state[161]=Color3.fromRGB(80,80,80)
Lighting.Ambient=state[161]
state[162]=Color3.fromRGB(80,80,80)
Lighting.OutdoorAmbient=state[162]
state[163]=Color3.fromRGB(70,70,70)
Lighting.FogColor=state[163]
Lighting.FogEnd=300
Lighting.ClockTime=16
UI:Notify({["Duration"]=3,["Content"]="Halloween applied!",["Title"]="Map Theme"})
end
valentinesMap=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
Color3.fromRGB(255,152,220)
workspace:GetDescendants()
state[164]=Color3.fromRGB(127,127,127)
Lighting.Ambient=state[164]
state[165]=Color3.fromRGB(127,127,127)
Lighting.OutdoorAmbient=state[165]
Lighting.FogEnd=100000
Lighting.ClockTime=14
UI:Notify({["Duration"]=3,["Content"]="Valentines applied!",["Title"]="Map Theme"})
end
resetMap=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
state[166]=Color3.fromRGB(127,127,127)
Lighting.Ambient=state[166]
state[167]=Color3.fromRGB(127,127,127)
Lighting.OutdoorAmbient=state[167]
Lighting.FogEnd=100000
Lighting.ClockTime=14
UI:Notify({["Duration"]=3,["Content"]="Reset done.",["Title"]="Map Theme"})
end
jumpPower=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[168]=Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
state[168].WalkSpeed=a1
end
timer=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[169]=Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
state[169].JumpPower=a1
end
freezeTimerDisplay=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[170]=ReplicatedStorage:WaitForChild("GuiTexts",5)
state[170]:WaitForChild("Timer",5)
RunService.RenderStepped:Connect(internal_294)
UI:Notify({["Duration"]=3,["Content"]="Timer display frozen at 0:00",["Title"]="Timer"})
end
hideTimer=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.PlayerGui:GetChildren()
UI:Notify({["Duration"]=2,["Content"]="Timer hidden.",["Title"]="Timer"})
end
removeGlassBarriers=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
end
walkOnLake=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
lakeGodMode=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
teleportTo=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_111=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
state[171]=ReplicatedStorage:WaitForChild("Season",5)
state[172]=state[171]:WaitForChild("Players",5)
state[172]:GetChildren()
TargetPlayerDropdown:Refresh({[1]="(none)"})
end
internal_112=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
state[173]=ReplicatedStorage:WaitForChild("Season",5)
state[174]=state[173]:WaitForChild("Players",5)
state[174]:GetChildren()
TargetPlayerDropdown:Refresh({[1]="(none)"})
end
refreshList=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage:FindFirstChild("Season")
state[175]=ReplicatedStorage.Season:FindFirstChild("Players")
state[175]:GetChildren()
end
highlightPlayer=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[176]=ReplicatedStorage:WaitForChild("Season",5)
state[177]=state[176]:WaitForChild("Players",5)
state[177]:GetChildren()
TargetPlayerDropdown:Refresh({[1]="(none)"})
state[178]=ReplicatedStorage:WaitForChild("Season",5)
state[179]=state[178]:WaitForChild("Players",5)
state[179]:GetChildren()
UI:Notify({["Duration"]=2,["Content"]="Refreshed 0 players.",["Title"]="Player List"})
end
internal_115=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage:FindFirstChild("Season")
state[180]=ReplicatedStorage.Season:FindFirstChild("Players")
state[180]:GetChildren()
end
refreshList2=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_117=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players:GetPlayers()
StatsPlayerDropdown:Refresh({})
end
campWins=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[181]=Players:FindFirstChild(a1)
state[182]=state[181]:FindFirstChild("DataStore")
state[183]=state[182]:FindFirstChild("CampWins")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" has "..(state[183].Value.." camp wins."))),["Title"]="Camp Wins"})
end
movieWins=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[184]=Players:FindFirstChild(a1)
state[185]=state[184]:FindFirstChild("DataStore")
state[186]=state[185]:FindFirstChild("MoviesWins")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" has "..(state[186].Value.." movie wins."))),["Title"]="Movie Wins"})
end
expeditionWins=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[187]=Players:FindFirstChild(a1)
state[188]=state[187]:FindFirstChild("DataStore")
state[189]=state[188]:FindFirstChild("ExpeditionWins")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" has "..(state[189].Value.." expedition wins."))),["Title"]="Expedition Wins"})
end
coins=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[190]=Players:FindFirstChild(a1)
state[191]=state[190]:FindFirstChild("DataStore")
state[192]=state[191]:FindFirstChild("Coins")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" has "..(state[192].Value.." coins."))),["Title"]="Coins"})
end
comebackWins=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[193]=Players:FindFirstChild(a1)
state[194]=state[193]:FindFirstChild("DataStore")
state[195]=state[194]:FindFirstChild("ComebackWins")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" has "..(state[195].Value.." comeback wins."))),["Title"]="Comeback Wins"})
end
gamesPlayed=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[196]=Players:FindFirstChild(a1)
state[197]=state[196]:FindFirstChild("DataStore")
state[198]=state[197]:FindFirstChild("GamesPlayed")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" played "..(state[198].Value.." games."))),["Title"]="Games Played"})
end
idolsFound=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[199]=Players:FindFirstChild(a1)
state[200]=state[199]:FindFirstChild("DataStore")
state[201]=state[200]:FindFirstChild("IdolsFound")
UI:Notify({["Duration"]=5,["Content"]=(a1..(" found "..(state[201].Value.." idols."))),["Title"]="Idols Found"})
end
skins=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[202]=Players:FindFirstChild(a1)
state[202]:FindFirstChild("DataStore")
state[203]=state[202].DataStore:FindFirstChild("Skins")
state[203]:GetChildren()
UI:Notify({["Duration"]=6,["Content"]=nil,["Title"]="Skins"})
end
marshmallows=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[204]=Players:FindFirstChild(a1)
state[204]:FindFirstChild("DataStore")
state[205]=state[204].DataStore:FindFirstChild("Marshmallows")
state[205]:GetChildren()
UI:Notify({["Duration"]=6,["Content"]=nil,["Title"]="Marshmallows"})
end
spectatorIsland=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[206]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[207]=CFrame.new(33,-16,31)
state[206].CFrame=state[207]
end
mainIsland=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[208]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[209]=CFrame.new(150,-17,-417)
state[208].CFrame=state[209]
end
exileIsland=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[210]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[211]=CFrame.new(-116,-14,-166)
state[210].CFrame=state[211]
end
votingArea=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[212]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[213]=CFrame.new(-23,95,-514)
state[212].CFrame=state[213]
end
boat=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[214]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[215]=CFrame.new(47,-20,-297)
state[214].CFrame=state[215]
end
bathroom=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[216]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[217]=CFrame.new(302,-15,-325)
state[216].CFrame=state[217]
end
starterIsland=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[218]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[219]=CFrame.new(-672,-67,-617)
state[218].CFrame=state[219]
end
votingArea2=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[220]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[221]=CFrame.new(83,60,-187)
state[220].CFrame=state[221]
end
cabin1=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[222]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[223]=CFrame.new(-1,56,-34)
state[222].CFrame=state[223]
end
cabin2=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[224]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[225]=CFrame.new(-8,53,144)
state[224].CFrame=state[225]
end
diningRoom=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[226]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[227]=CFrame.new(-1,53,168)
state[226].CFrame=state[227]
end
kitchen=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[228]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[229]=CFrame.new(-210,49,30)
state[228].CFrame=state[229]
end
insideBoat=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[230]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[231]=CFrame.new(-47,80,-28)
state[230].CFrame=state[231]
end
shipVotingArea=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[232]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[233]=CFrame.new(-154,101,-31)
state[232].CFrame=state[233]
end
firstClassVip=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[234]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[235]=CFrame.new(154,98,-33)
state[234].CFrame=state[235]
end
callback2ndClass=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[236]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[237]=CFrame.new(50,98,-34)
state[236].CFrame=state[237]
end
shipBathroom=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[238]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[239]=CFrame.new(5,98,-23)
state[238].CFrame=state[239]
end
diningClass=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[240]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[241]=CFrame.new(-45,98,-34)
state[240].CFrame=state[241]
end
basement=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[242]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[243]=CFrame.new(-47,80,-28)
state[242].CFrame=state[243]
end
vcUnban=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[244]=game:GetService("VoiceChatService")
state[244]:joinVoice()
end
applyShaders=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[245]=game:GetService("Lighting")
state[246]=settings()
state[246].Rendering.QualityLevel=Enum.QualityLevel.Level21
state[245].Technology=Enum.Technology.ShadowMap
state[245].ShadowSoftness=0.15
state[245].ClockTime=9
state[245].Brightness=5
state[247]=Color3.fromRGB(70,70,70)
state[245].Ambient=state[247]
state[248]=Color3.fromRGB(255,138,35)
state[245].ColorShift_Top=state[248]
state[249]=Color3.fromRGB(135,135,135)
state[245].OutdoorAmbient=state[249]
state[245].GlobalShadows=true
state[245].ExposureCompensation=0
workspace.Terrain.WaterReflectance=0.08
workspace.Terrain.WaterTransparency=0.85
state[250]=Color3.fromRGB(12,84,92)
workspace.Terrain.WaterDefaultColor=state[250]
state[251]=Instance.new("Sky",state[245])
state[251].SkyboxBk="rbxassetid://271042516"
state[251].SkyboxDn="rbxassetid://271077243"
state[251].SkyboxFt="rbxassetid://271042556"
state[251].SkyboxLf="rbxassetid://271042310"
state[251].SkyboxRt="rbxassetid://271042467"
state[251].SkyboxUp="rbxassetid://271077958"
end
infiniteYield=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[252]=game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
state[253]=loadstring(state[252])
state[253]()
end
flyGui=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[254]=game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
state[255]=loadstring(state[254])
state[255]()
end
wallHop=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[256]=game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-WallHop-Script-38387")
state[257]=loadstring(state[256])
state[257]()
end
soundPanel=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[258]=game:HttpGet("https://pastebin.com/raw/w3uzjgEq")
state[259]=loadstring(state[258])
state[259]()
end
energizeAnimations=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[260]=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Energize.lua")
state[261]=loadstring(state[260])
state[261]()
end
bringBackOldChat=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[262]=game:HttpGet("https://pastebin.com/raw/9AQrDua1")
state[263]=loadstring(state[262])
state[263]()
UI:Notify({["Duration"]=3,["Content"]="Old chat loaded!",["Title"]="Chat"})
end
collision=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_295)
end
hackerDetector=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_296)
end
team=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
setTeam=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[264]=game:GetService("Teams")
state[264]:GetChildren()
TeamDropdown:Refresh({[1]="Spectator",[2]="Jury",[3]="Team1",[4]="Team2",[5]="Team3"})
UI:Notify({["Duration"]=2,["Content"]="5 team(s) loaded.",["Title"]="Teams"})
end
internal_158=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[265]=game:GetService("Teams")
state[266]=state[265]:FindFirstChild("Spectator")
Players.LocalPlayer.Team=state[266]
Players.LocalPlayer.Neutral=false
UI:Notify({["Duration"]=3,["Content"]="Joined Spectator",["Title"]="Team"})
end
spectator=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[267]=game:GetService("Teams")
state[268]=state[267]:FindFirstChild("Spectator")
Players.LocalPlayer.Team=state[268]
Players.LocalPlayer.Neutral=false
UI:Notify({["Duration"]=3,["Content"]="Joined Spectator",["Title"]="Team"})
end
jury=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[269]=game:GetService("Teams")
state[270]=state[269]:FindFirstChild("Jury")
Players.LocalPlayer.Team=state[270]
Players.LocalPlayer.Neutral=false
UI:Notify({["Duration"]=3,["Content"]="Joined Jury",["Title"]="Team"})
end
loadFonts=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=4,["Content"]="Downloading fonts...",["Title"]="Fonts"})
task.spawn(internal_297)
end
starborn=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[271]=getcustomasset("Starborn.json")
state[272]=Font.new(state[271])
Players.LocalPlayer.PlayerGui:GetDescendants()
Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(internal_298)
UI:Notify({["Duration"]=3,["Content"]="Starborn applied!",["Title"]="Fonts"})
end
vhs=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[273]=getcustomasset("VHS.json")
state[274]=Font.new(state[273])
Players.LocalPlayer.PlayerGui:GetDescendants()
Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(internal_299)
UI:Notify({["Duration"]=3,["Content"]="VHS applied!",["Title"]="Fonts"})
end
minecrafter=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[275]=getcustomasset("Minecrafter.json")
state[276]=Font.new(state[275])
Players.LocalPlayer.PlayerGui:GetDescendants()
Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(internal_300)
UI:Notify({["Duration"]=3,["Content"]="Minecrafter applied!",["Title"]="Fonts"})
end
horror=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[277]=getcustomasset("Horror.json")
Font.new(state[277])
Players.LocalPlayer.PlayerGui:GetDescendants()
Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(internal_301)
UI:Notify({["Duration"]=3,["Content"]="Horror applied!",["Title"]="Fonts"})
end
rainbowName=function(a1,a2,a3,a4,a5,a6,a7,a8)
RunService.RenderStepped:Connect(internal_302)
end
skinChanger=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[278]=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Skinchanger.lua")
state[279]=loadstring(state[278])
state[279]()
end
sizeChanger=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[280]=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Size.lua")
state[281]=loadstring(state[280])
state[281]()
end
getsAdminPanel=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[282]=ReplicatedStorage:WaitForChild("Products",5)
state[283]=state[282]:WaitForChild("GUIs",5)
state[284]=state[283]:WaitForChild("Settings",5)
state[285]=state[284]:Clone()
state[286]=Players.LocalPlayer:WaitForChild("PlayerGui")
state[285].Parent=state[286]
state[285].Enabled=true
state[285]:GetDescendants()
UI:Notify({["Duration"]=5,["Content"]="Forced open! (May not work)",["Title"]="Admin Panel"})
end
autoFarmCoin=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_303)
end
autoFarmCoins2=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_304)
end
autoRestartDay=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=3,["Content"]="Active — watching for round end...",["Title"]="Auto Restart Day"})
task.spawn(internal_305)
end
detectCurrentObby=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[287]=workspace:FindFirstChild("Assets")
state[287]:GetChildren()
UI:Notify({["Duration"]=4,["Content"]="Assets folder is empty — no active challenge.",["Title"]="Obby Detect"})
end
autoDetectObby=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[288]=workspace:FindFirstChild("Assets")
state[288].ChildAdded:Connect(internal_306)
UI:Notify({["Duration"]=3,["Content"]="Watching for new challenges...",["Title"]="Obby Detector"})
end
givePaintballGun=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[289]=ReplicatedStorage:WaitForChild("Products",5)
state[290]=state[289]:WaitForChild("Gear",5)
state[291]=state[290]:FindFirstChild("Dodgeball")
state[292]=state[291]:Clone()
state[293]=state[292]:FindFirstChild("Handle")
state[293].CanCollide=false
state[292].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Dodgeball added to your backpack!",["Title"]="Give Gear"})
end
giveMeatball2=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[294]=ReplicatedStorage:WaitForChild("Products",5)
state[295]=state[294]:WaitForChild("Gear",5)
state[296]=state[295]:FindFirstChild("PaintballGun")
state[297]=state[296]:Clone()
state[298]=state[297]:FindFirstChild("Handle")
state[298].CanCollide=false
state[297].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="PaintballGun added to your backpack!",["Title"]="Give Gear"})
end
giveRaygunSheriff=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[299]=ReplicatedStorage:WaitForChild("Products",5)
state[300]=state[299]:WaitForChild("Gear",5)
state[301]=state[300]:FindFirstChild("Meatball")
state[302]=state[301]:Clone()
state[303]=state[302]:FindFirstChild("Handle")
state[303].CanCollide=false
state[302].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Meatball added to your backpack!",["Title"]="Give Gear"})
end
giveSword=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[304]=ReplicatedStorage:WaitForChild("Products",5)
state[305]=state[304]:WaitForChild("Gear",5)
state[306]=state[305]:FindFirstChild("Sheriff")
state[307]=state[306]:Clone()
state[308]=state[307]:FindFirstChild("Handle")
state[308].CanCollide=false
state[307].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Sheriff added to your backpack!",["Title"]="Give Gear"})
end
givePoolNoodle=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[309]=ReplicatedStorage:WaitForChild("Products",5)
state[310]=state[309]:WaitForChild("Gear",5)
state[311]=state[310]:FindFirstChild("Sword")
state[312]=state[311]:Clone()
state[313]=state[312]:FindFirstChild("Handle")
state[313].CanCollide=false
state[312].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Sword added to your backpack!",["Title"]="Give Gear"})
end
giveSnowball=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[314]=ReplicatedStorage:WaitForChild("Products",5)
state[315]=state[314]:WaitForChild("Gear",5)
state[316]=state[315]:FindFirstChild("Pool Noodle")
state[317]=state[316]:Clone()
state[318]=state[317]:FindFirstChild("Handle")
state[318].CanCollide=false
state[317].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Pool Noodle added to your backpack!",["Title"]="Give Gear"})
end
webhooks=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[319]=ReplicatedStorage:WaitForChild("Products",5)
state[320]=state[319]:WaitForChild("Gear",5)
state[321]=state[320]:FindFirstChild("Snowball")
state[322]=state[321]:Clone()
state[323]=state[322]:FindFirstChild("Handle")
state[323].CanCollide=false
state[322].Parent=Players.LocalPlayer.Backpack
UI:Notify({["Duration"]=3,["Content"]="Snowball added to your backpack!",["Title"]="Give Gear"})
end
webhookUrl=function(a1,a2,a3,a4,a5,a6,a7,a8)
a1:match("^%s*(.-)%s*$")
end
testWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
sendWH("✅ Ella Hub webhook test — working!")
UI:Notify({["Duration"]=4,["Content"]="Test sent! Check your Discord channel.",["Title"]="Webhook"})
end
sendVotesToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(internal_307)
end
sendExileVotesToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(internal_308)
end
exposeExileVotesInChat=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(internal_309)
end
sendStatueHolderToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(internal_310)
end
sendRoundInfoToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Twists.Idol.Changed:Connect(internal_311)
end
dailyShop=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(internal_312)
end
printShopToConsole=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[324]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Skins")
state[324]:GetChildren()
state[325]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Marshmallows")
state[325]:GetChildren()
state[326]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("ElimColors")
state[326]:GetChildren()
state[327]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Eliminations")
state[327]:GetChildren()
print("=== Ella Hub — Daily Shop ===")
print("============================")
UI:Notify({["Duration"]=3,["Content"]="Printed to console! Press F9.",["Title"]="Shop"})
end
sendShopToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[328]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Skins")
state[328]:GetChildren()
state[329]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Marshmallows")
state[329]:GetChildren()
state[330]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("ElimColors")
state[330]:GetChildren()
state[331]=ReplicatedStorage.Products.Shop.DailyShop:FindFirstChild("Eliminations")
state[331]:GetChildren()
UI:Notify({["Duration"]=3,["Content"]="No items found.",["Title"]="Shop"})
end
notifyWhenShopUpdates=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(internal_313)
UI:Notify({["Duration"]=3,["Content"]="Watching for shop updates...",["Title"]="Shop Watcher"})
end
autoSendShopUpdatesToWebhook=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(internal_314)
UI:Notify({["Duration"]=3,["Content"]="Auto webhook active!",["Title"]="Shop Watcher"})
end
muteAllSounds=function(a1,a2,a3,a4,a5,a6,a7,a8)
SoundService.Volume=0
UI:Notify({["Duration"]=2,["Content"]="Muted.",["Title"]="Sound"})
end
stopAllPlayingSounds=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
Players.LocalPlayer.PlayerGui:GetDescendants()
UI:Notify({["Duration"]=3,["Content"]="Stopped 0 sound(s).",["Title"]="Sound"})
end
spamClickSound=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_315)
end
spamOof=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_316)
end
equipSwordUnsheath=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[332]=ReplicatedStorage.Products.Gear.Sword.Handle.LungeSound:Clone()
state[332].Parent=workspace
state[332]:Play()
Debris:AddItem(state[332],3)
end
toiletEliminationSound=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[333]=ReplicatedStorage.Products.Gear.Sword.Handle.UnsheathSound:Clone()
state[333].Parent=workspace
state[333]:Play()
Debris:AddItem(state[333],3)
end
sleighEliminationSound=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[334]=ReplicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound.Clone(ReplicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound)
state[334].Parent=workspace
state[334]:Play()
Debris:AddItem(state[334],5)
end
triggerTwisted=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[335]=ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound.Clone(ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound)
state[335].Parent=workspace
state[335]:Play()
Debris:AddItem(state[335],5)
end
triggerTwisted2=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.PSSettings:FireServer("Start","Start")
ReplicatedStorage.Events.OSSettings:FireServer("Start")
UI:Notify({["Duration"]=4,["Content"]="Fired!",["Title"]="Trigger Twisted"})
end
swapToSleighElimination=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[336]=workspace:FindFirstChild("ElimMethod")
state[337]=state[336]:FindFirstChild("Boat Elimination")
state[338]=state[337]:Clone()
state[338].Parent=nil
state[336]:GetChildren()
state[339]=ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Clone(ReplicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"])
state[339].Name="Sleigh Elimination"
state[339].Parent=state[336]
ReplicatedStorage.Products.DataStore.Elimination.Value="Sleigh Elimination"
state[340]=state[339]:FindFirstChild("Sound",true)
state[340]:Play()
UI:Notify({["Duration"]=4,["Content"]="Sleigh Elimination active! Fly-out in 18s.",["Title"]="Sleigh Swap"})
task.delay(18,internal_317)
end
forceRestoreBoat=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[341]=workspace:FindFirstChild("ElimMethod")
state[341]:GetChildren()
state[342]=state[338]:Clone()
state[342].Name="Boat Elimination"
state[342].Parent=state[341]
ReplicatedStorage.Products.DataStore.Elimination.Value="Boat Elimination"
UI:Notify({["Duration"]=3,["Content"]="Boat Elimination restored.",["Title"]="Sleigh Swap"})
end
antiLoserLand=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[343]=Players.LocalPlayer:GetPropertyChangedSignal("Team")
state[343]:Connect(internal_318)
state[344]=ReplicatedStorage:WaitForChild("Season",5)
state[345]=state[344]:WaitForChild("Eliminated",5)
state[345].ChildAdded:Connect(internal_319)
state[346]=ReplicatedStorage:WaitForChild("Season",5)
state[347]=state[346]:WaitForChild("Players",5)
state[347].ChildRemoved:Connect(internal_320)
UI:Notify({["Duration"]=3,["Content"]="Active — watching for elimination.",["Title"]="Anti Loser Land"})
end
forceFightElimTest=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]="Elimination detected — fighting back!",["Title"]="⚠ Anti Loser Land"})
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
RunService.Heartbeat:Connect(internal_321)
task.spawn(internal_322)
task.delay(20,internal_323)
end
autoplay=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_324)
end
disableShiftlockCamera=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
playThisRound=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[348]=workspace:FindFirstChild("ChallengePlayers")
state[348]:FindFirstChild(Players.LocalPlayer.Name)
state[349]=workspace:FindFirstChild("Assets")
state[349]:GetChildren()
task.wait()
state[350]=workspace:FindFirstChild("ChallengePlayers")
state[350]:FindFirstChild(Players.LocalPlayer.Name)
state[351]=workspace:FindFirstChild("Assets")
state[351]:GetChildren()
task.wait()
state[352]=workspace:FindFirstChild("ChallengePlayers")
state[352]:FindFirstChild(Players.LocalPlayer.Name)
state[353]=workspace:FindFirstChild("Assets")
state[353]:GetChildren()
task.wait()
state[354]=workspace:FindFirstChild("ChallengePlayers")
state[354]:FindFirstChild(Players.LocalPlayer.Name)
state[355]=workspace:FindFirstChild("Assets")
state[355]:GetChildren()
task.wait()
state[356]=workspace:FindFirstChild("ChallengePlayers")
state[356]:FindFirstChild(Players.LocalPlayer.Name)
state[357]=workspace:FindFirstChild("Assets")
state[357]:GetChildren()
task.wait()
state[358]=workspace:FindFirstChild("ChallengePlayers")
state[358]:FindFirstChild(Players.LocalPlayer.Name)
state[359]=workspace:FindFirstChild("Assets")
state[359]:GetChildren()
task.wait()
state[360]=workspace:FindFirstChild("ChallengePlayers")
state[360]:FindFirstChild(Players.LocalPlayer.Name)
state[361]=workspace:FindFirstChild("Assets")
state[361]:GetChildren()
task.wait()
state[362]=workspace:FindFirstChild("ChallengePlayers")
state[362]:FindFirstChild(Players.LocalPlayer.Name)
state[363]=workspace:FindFirstChild("Assets")
state[363]:GetChildren()
task.wait()
state[364]=workspace:FindFirstChild("ChallengePlayers")
state[364]:FindFirstChild(Players.LocalPlayer.Name)
state[365]=workspace:FindFirstChild("Assets")
state[365]:GetChildren()
task.wait()
end
stopPlayback=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[366]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[366].Anchored=false
UI:Notify({["Duration"]=3,["Content"]="Playback stopped.",["Title"]="Autoplay"})
end
caveChaosRoute=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
unstableSavannahRoute=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
showUpdateNotice=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
switchToRayfield=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=2,["Content"]="Reloading with Rayfield...",["Title"]="Switching"})
task.wait()
Window:Destroy()
state[367]=Players.LocalPlayer:FindFirstChild("PlayerGui")
state[368]=gethui()
state[369]=game:GetService("CoreGui")
state[367]:GetChildren()
state[368]:GetChildren()
state[369]:GetChildren()
task.wait()
state[370]=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/main.lua",true)
state[371]=loadstring(state[370])
state[371]()
end
winduiTheme=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
ellaHubV2=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:SetTheme(a1)
UI:Notify({["Duration"]=3,["Content"]=nil,["Title"]="Theme"})
end
internal_217=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[372]=workspace.Assets:FindFirstChild("Finish",true)
state[373]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[372].CanCollide=false
state[372].Transparency=1
state[372].Position=state[373].Position
task.wait()
state[374]=workspace.Assets:FindFirstChild("Finish",true)
state[375]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[374].CanCollide=false
state[374].Transparency=1
state[374].Position=state[375].Position
task.wait()
state[376]=workspace.Assets:FindFirstChild("Finish",true)
state[377]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[376].CanCollide=false
state[376].Transparency=1
state[376].Position=state[377].Position
task.wait()
state[378]=workspace.Assets:FindFirstChild("Finish",true)
state[379]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[378].CanCollide=false
state[378].Transparency=1
state[378].Position=state[379].Position
task.wait()
state[380]=workspace.Assets:FindFirstChild("Finish",true)
state[381]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[380].CanCollide=false
state[380].Transparency=1
state[380].Position=state[381].Position
task.wait()
state[382]=workspace.Assets:FindFirstChild("Finish",true)
state[383]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[382].CanCollide=false
state[382].Transparency=1
state[382].Position=state[383].Position
task.wait()
state[384]=workspace.Assets:FindFirstChild("Finish",true)
state[385]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[384].CanCollide=false
state[384].Transparency=1
state[384].Position=state[385].Position
task.wait()
state[386]=workspace.Assets:FindFirstChild("Finish",true)
state[387]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[386].CanCollide=false
state[386].Transparency=1
state[386].Position=state[387].Position
task.wait()
state[388]=workspace.Assets:FindFirstChild("Finish",true)
state[389]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[388].CanCollide=false
state[388].Transparency=1
state[388].Position=state[389].Position
task.wait()
end
internal_218=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
task.wait()
end
internal_219=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[390]=Players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
state[391]=state[390]:FindFirstChild("1")
state[392]=state[391]:FindFirstChild("MainText")
state[393]=state[391]:FindFirstChild("Box")
state[394]=state[391]:FindFirstChild("Enter")
state[395]=state[392].Text:gsub("[=?%s]","")
state[396]=loadstring(("return "..state[395]))
state[397]=state[396]()
state[393].Text="state[397]"
task.wait()
getconnections(state[394].MouseButton1Click)
getconnections(state[394].MouseButton1Down)
getconnections(state[394].Activated)
task.wait()
state[398]=state[390]:FindFirstChild("2")
state[399]=state[398]:FindFirstChild("MainText")
state[400]=state[398]:FindFirstChild("Box")
state[401]=state[398]:FindFirstChild("Enter")
state[402]=state[399].Text:gsub("[=?%s]","")
state[403]=loadstring(("return "..state[402]))
state[404]=state[403]()
state[400].Text="state[404]"
task.wait()
getconnections(state[401].MouseButton1Click)
getconnections(state[401].MouseButton1Down)
getconnections(state[401].Activated)
task.wait()
state[405]=state[390]:FindFirstChild("3")
state[406]=state[405]:FindFirstChild("MainText")
state[407]=state[405]:FindFirstChild("Box")
state[408]=state[405]:FindFirstChild("Enter")
state[409]=state[406].Text:gsub("[=?%s]","")
state[410]=loadstring(("return "..state[409]))
state[411]=state[410]()
state[407].Text="state[411]"
task.wait()
getconnections(state[408].MouseButton1Click)
getconnections(state[408].MouseButton1Down)
getconnections(state[408].Activated)
task.wait()
state[412]=state[390]:FindFirstChild("4")
state[413]=state[412]:FindFirstChild("MainText")
state[414]=state[412]:FindFirstChild("Box")
state[415]=state[412]:FindFirstChild("Enter")
state[416]=state[413].Text:gsub("[=?%s]","")
state[417]=loadstring(("return "..state[416]))
state[418]=state[417]()
state[414].Text="state[418]"
task.wait()
getconnections(state[415].MouseButton1Click)
getconnections(state[415].MouseButton1Down)
getconnections(state[415].Activated)
task.wait()
state[419]=state[390]:FindFirstChild("5")
state[420]=state[419]:FindFirstChild("MainText")
state[421]=state[419]:FindFirstChild("Box")
state[419]:FindFirstChild("Enter")
state[422]=state[420].Text:gsub("[=?%s]","")
state[423]=loadstring(("return "..state[422]))
state[424]=state[423]()
state[421].Text="state[424]"
task.wait()
end
internal_220=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[425]=Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
state[425]:FindFirstChild("Handle")
Players:GetPlayers()
end
internal_221=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[426]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[427]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[426]:GetDescendants()
state[428]=state[426]:FindFirstChildWhichIsA("BasePart")
state[428].CFrame=state[427].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[429]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[430]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[429]:GetDescendants()
state[431]=state[429]:FindFirstChildWhichIsA("BasePart")
state[431].CFrame=state[430].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[432]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[433]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[432]:GetDescendants()
state[434]=state[432]:FindFirstChildWhichIsA("BasePart")
state[434].CFrame=state[433].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[435]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[436]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[435]:GetDescendants()
state[437]=state[435]:FindFirstChildWhichIsA("BasePart")
state[437].CFrame=state[436].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[438]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[439]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[438]:GetDescendants()
state[440]=state[438]:FindFirstChildWhichIsA("BasePart")
state[440].CFrame=state[439].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[441]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[442]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[441]:GetDescendants()
state[443]=state[441]:FindFirstChildWhichIsA("BasePart")
state[443].CFrame=state[442].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[444]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[445]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[444]:GetDescendants()
state[446]=state[444]:FindFirstChildWhichIsA("BasePart")
state[446].CFrame=state[445].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[447]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[448]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[447]:GetDescendants()
state[449]=state[447]:FindFirstChildWhichIsA("BasePart")
state[449].CFrame=state[448].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
state[450]=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
state[451]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[450]:GetDescendants()
state[452]=state[450]:FindFirstChildWhichIsA("BasePart")
state[452].CFrame=state[451].CFrame
task.wait()
end
internal_222=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_223=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
task.wait()
end
internal_224=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_225=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
task.wait()
end
internal_226=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_227=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_228=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[453]=workspace.Assets:FindFirstChild("Finish",true)
state[454]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[453].CanCollide=false
state[453].Transparency=1
state[453].Position=state[454].Position
task.wait()
state[455]=workspace.Assets:FindFirstChild("Finish",true)
state[456]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[455].CanCollide=false
state[455].Transparency=1
state[455].Position=state[456].Position
task.wait()
state[457]=workspace.Assets:FindFirstChild("Finish",true)
state[458]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[457].CanCollide=false
state[457].Transparency=1
state[457].Position=state[458].Position
task.wait()
state[459]=workspace.Assets:FindFirstChild("Finish",true)
state[460]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[459].CanCollide=false
state[459].Transparency=1
state[459].Position=state[460].Position
task.wait()
state[461]=workspace.Assets:FindFirstChild("Finish",true)
state[462]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[461].CanCollide=false
state[461].Transparency=1
state[461].Position=state[462].Position
task.wait()
state[463]=workspace.Assets:FindFirstChild("Finish",true)
state[464]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[463].CanCollide=false
state[463].Transparency=1
state[463].Position=state[464].Position
task.wait()
state[465]=workspace.Assets:FindFirstChild("Finish",true)
state[466]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[465].CanCollide=false
state[465].Transparency=1
state[465].Position=state[466].Position
task.wait()
state[467]=workspace.Assets:FindFirstChild("Finish",true)
state[468]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[467].CanCollide=false
state[467].Transparency=1
state[467].Position=state[468].Position
task.wait()
state[469]=workspace.Assets:FindFirstChild("Finish",true)
state[470]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[469].CanCollide=false
state[469].Transparency=1
state[469].Position=state[470].Position
task.wait()
end
internal_229=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
task.wait()
end
internal_230=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
workspace.Assets:GetDescendants()
task.wait()
end
internal_231=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
task.wait()
end
internal_232=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[471]=workspace.Assets:FindFirstChild("Finish",true)
state[472]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[471].CanCollide=false
state[471].Transparency=1
state[471].Position=state[472].Position
task.wait()
state[473]=workspace.Assets:FindFirstChild("Finish",true)
state[474]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[473].CanCollide=false
state[473].Transparency=1
state[473].Position=state[474].Position
task.wait()
state[475]=workspace.Assets:FindFirstChild("Finish",true)
state[476]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[475].CanCollide=false
state[475].Transparency=1
state[475].Position=state[476].Position
task.wait()
state[477]=workspace.Assets:FindFirstChild("Finish",true)
state[478]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[477].CanCollide=false
state[477].Transparency=1
state[477].Position=state[478].Position
task.wait()
state[479]=workspace.Assets:FindFirstChild("Finish",true)
state[480]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[479].CanCollide=false
state[479].Transparency=1
state[479].Position=state[480].Position
task.wait()
state[481]=workspace.Assets:FindFirstChild("Finish",true)
state[482]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[481].CanCollide=false
state[481].Transparency=1
state[481].Position=state[482].Position
task.wait()
state[483]=workspace.Assets:FindFirstChild("Finish",true)
state[484]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[483].CanCollide=false
state[483].Transparency=1
state[483].Position=state[484].Position
task.wait()
state[485]=workspace.Assets:FindFirstChild("Finish",true)
state[486]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[485].CanCollide=false
state[485].Transparency=1
state[485].Position=state[486].Position
task.wait()
state[487]=workspace.Assets:FindFirstChild("Finish",true)
state[488]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[487].CanCollide=false
state[487].Transparency=1
state[487].Position=state[488].Position
task.wait()
end
internal_233=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[489]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
a1.Position=state[489].Position
a1.Transparency=0
a1.CanCollide=false
end
internal_234=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[490]=Players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
state[491]=state[490]:FindFirstChild("1")
state[492]=state[491]:FindFirstChild("MainText")
state[493]=state[491]:FindFirstChild("Box")
state[494]=state[491]:FindFirstChild("Enter")
state[495]=state[492].Text:gsub("[=?%s]","")
state[496]=loadstring(("return "..state[495]))
state[497]=state[496]()
state[493].Text="state[497]"
task.wait()
getconnections(state[494].MouseButton1Click)
getconnections(state[494].MouseButton1Down)
getconnections(state[494].Activated)
task.wait()
state[498]=state[490]:FindFirstChild("2")
state[499]=state[498]:FindFirstChild("MainText")
state[500]=state[498]:FindFirstChild("Box")
state[501]=state[498]:FindFirstChild("Enter")
state[502]=state[499].Text:gsub("[=?%s]","")
state[503]=loadstring(("return "..state[502]))
state[504]=state[503]()
state[500].Text="state[504]"
task.wait()
getconnections(state[501].MouseButton1Click)
getconnections(state[501].MouseButton1Down)
getconnections(state[501].Activated)
task.wait()
state[505]=state[490]:FindFirstChild("3")
state[506]=state[505]:FindFirstChild("MainText")
state[507]=state[505]:FindFirstChild("Box")
state[508]=state[505]:FindFirstChild("Enter")
state[509]=state[506].Text:gsub("[=?%s]","")
state[510]=loadstring(("return "..state[509]))
state[511]=state[510]()
state[507].Text="state[511]"
task.wait()
getconnections(state[508].MouseButton1Click)
getconnections(state[508].MouseButton1Down)
getconnections(state[508].Activated)
task.wait()
state[512]=state[490]:FindFirstChild("4")
state[513]=state[512]:FindFirstChild("MainText")
state[514]=state[512]:FindFirstChild("Box")
state[515]=state[512]:FindFirstChild("Enter")
state[516]=state[513].Text:gsub("[=?%s]","")
state[517]=loadstring(("return "..state[516]))
state[518]=state[517]()
state[514].Text="state[518]"
task.wait()
getconnections(state[515].MouseButton1Click)
getconnections(state[515].MouseButton1Down)
getconnections(state[515].Activated)
task.wait()
state[519]=state[490]:FindFirstChild("5")
state[520]=state[519]:FindFirstChild("MainText")
state[521]=state[519]:FindFirstChild("Box")
state[519]:FindFirstChild("Enter")
state[522]=state[520].Text:gsub("[=?%s]","")
state[523]=loadstring(("return "..state[522]))
state[524]=state[523]()
state[521].Text="state[524]"
task.wait()
end
internal_235=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[525]=workspace:FindFirstChild("Assets")
state[525]:GetDescendants()
end
internal_236=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[526]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[526]:FindFirstChild("ServerControl")
state[526]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[527]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[527]:FindFirstChild("ServerControl")
state[527]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[528]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[528]:FindFirstChild("ServerControl")
state[528]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[529]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[529]:FindFirstChild("ServerControl")
state[529]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[530]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[530]:FindFirstChild("ServerControl")
state[530]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[531]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[531]:FindFirstChild("ServerControl")
state[531]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[532]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[532]:FindFirstChild("ServerControl")
state[532]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[533]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[533]:FindFirstChild("ServerControl")
state[533]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
state[534]=Players.LocalPlayer.Character:FindFirstChild("Sheriff")
state[534]:FindFirstChild("ServerControl")
state[534]:FindFirstChild("ClientControl")
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Players:GetPlayers()
task.wait()
end
internal_237=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_238=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_239=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[535]=workspace.Assets:FindFirstChild("Finish",true)
state[536]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[535].CanCollide=false
state[535].Transparency=1
state[535].Position=state[536].Position
task.wait()
state[537]=workspace.Assets:FindFirstChild("Finish",true)
state[538]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[537].CanCollide=false
state[537].Transparency=1
state[537].Position=state[538].Position
task.wait()
state[539]=workspace.Assets:FindFirstChild("Finish",true)
state[540]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[539].CanCollide=false
state[539].Transparency=1
state[539].Position=state[540].Position
task.wait()
state[541]=workspace.Assets:FindFirstChild("Finish",true)
state[542]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[541].CanCollide=false
state[541].Transparency=1
state[541].Position=state[542].Position
task.wait()
state[543]=workspace.Assets:FindFirstChild("Finish",true)
state[544]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[543].CanCollide=false
state[543].Transparency=1
state[543].Position=state[544].Position
task.wait()
state[545]=workspace.Assets:FindFirstChild("Finish",true)
state[546]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[545].CanCollide=false
state[545].Transparency=1
state[545].Position=state[546].Position
task.wait()
state[547]=workspace.Assets:FindFirstChild("Finish",true)
state[548]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[547].CanCollide=false
state[547].Transparency=1
state[547].Position=state[548].Position
task.wait()
state[549]=workspace.Assets:FindFirstChild("Finish",true)
state[550]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[549].CanCollide=false
state[549].Transparency=1
state[549].Position=state[550].Position
task.wait()
state[551]=workspace.Assets:FindFirstChild("Finish",true)
state[552]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[551].CanCollide=false
state[551].Transparency=1
state[551].Position=state[552].Position
task.wait()
end
internal_240=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace:GetDescendants()
task.wait()
end
internal_241=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace:GetDescendants()
task.wait()
end
internal_242=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[553]=Players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
state[554]=state[553]:FindFirstChild("1")
state[555]=state[554]:FindFirstChild("MainText")
state[556]=state[554]:FindFirstChild("Box")
state[557]=state[554]:FindFirstChild("Enter")
state[558]=state[555].Text:gsub("[=?%s]","")
state[559]=loadstring(("return "..state[558]))
state[560]=state[559]()
state[556].Text="state[560]"
task.wait()
getconnections(state[557].MouseButton1Click)
getconnections(state[557].MouseButton1Down)
getconnections(state[557].Activated)
task.wait()
state[561]=state[553]:FindFirstChild("2")
state[562]=state[561]:FindFirstChild("MainText")
state[563]=state[561]:FindFirstChild("Box")
state[564]=state[561]:FindFirstChild("Enter")
state[565]=state[562].Text:gsub("[=?%s]","")
state[566]=loadstring(("return "..state[565]))
state[567]=state[566]()
state[563].Text="state[567]"
task.wait()
getconnections(state[564].MouseButton1Click)
getconnections(state[564].MouseButton1Down)
getconnections(state[564].Activated)
task.wait()
state[568]=state[553]:FindFirstChild("3")
state[569]=state[568]:FindFirstChild("MainText")
state[570]=state[568]:FindFirstChild("Box")
state[571]=state[568]:FindFirstChild("Enter")
state[572]=state[569].Text:gsub("[=?%s]","")
state[573]=loadstring(("return "..state[572]))
state[574]=state[573]()
state[570].Text="state[574]"
task.wait()
getconnections(state[571].MouseButton1Click)
getconnections(state[571].MouseButton1Down)
getconnections(state[571].Activated)
task.wait()
state[575]=state[553]:FindFirstChild("4")
state[576]=state[575]:FindFirstChild("MainText")
state[577]=state[575]:FindFirstChild("Box")
state[578]=state[575]:FindFirstChild("Enter")
state[579]=state[576].Text:gsub("[=?%s]","")
state[580]=loadstring(("return "..state[579]))
state[581]=state[580]()
state[577].Text="state[581]"
task.wait()
getconnections(state[578].MouseButton1Click)
getconnections(state[578].MouseButton1Down)
getconnections(state[578].Activated)
task.wait()
state[582]=state[553]:FindFirstChild("5")
state[583]=state[582]:FindFirstChild("MainText")
state[584]=state[582]:FindFirstChild("Box")
state[582]:FindFirstChild("Enter")
state[585]=state[583].Text:gsub("[=?%s]","")
state[586]=loadstring(("return "..state[585]))
state[587]=state[586]()
state[584].Text="state[587]"
task.wait()
end
internal_243=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_244=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_245=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[588]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[588]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[589]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[589]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[590]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[590]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[591]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[591]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[592]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[592]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[593]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[593]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[594]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[594]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[595]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[595]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
state[596]=Players.LocalPlayer.Character:FindFirstChild("Meatball")
state[596]:FindFirstChild("Bounce")
Players:GetPlayers()
task.wait()
end
internal_246=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
internal_247=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[597]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[598]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[597]:GetDescendants()
state[599]=state[597]:FindFirstChildWhichIsA("BasePart")
state[599].CFrame=state[598].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[600]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[601]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[600]:GetDescendants()
state[602]=state[600]:FindFirstChildWhichIsA("BasePart")
state[602].CFrame=state[601].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[603]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[604]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[603]:GetDescendants()
state[605]=state[603]:FindFirstChildWhichIsA("BasePart")
state[605].CFrame=state[604].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[606]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[607]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[606]:GetDescendants()
state[608]=state[606]:FindFirstChildWhichIsA("BasePart")
state[608].CFrame=state[607].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[609]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[610]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[609]:GetDescendants()
state[611]=state[609]:FindFirstChildWhichIsA("BasePart")
state[611].CFrame=state[610].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[612]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[613]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[612]:GetDescendants()
state[614]=state[612]:FindFirstChildWhichIsA("BasePart")
state[614].CFrame=state[613].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[615]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[616]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[615]:GetDescendants()
state[617]=state[615]:FindFirstChildWhichIsA("BasePart")
state[617].CFrame=state[616].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[618]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[619]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[618]:GetDescendants()
state[620]=state[618]:FindFirstChildWhichIsA("BasePart")
state[620].CFrame=state[619].CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
state[621]=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
state[622]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[621]:GetDescendants()
state[623]=state[621]:FindFirstChildWhichIsA("BasePart")
state[623].CFrame=state[622].CFrame
task.wait()
end
internal_248=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
ReplicatedStorage:FindFirstChild("Season")
ReplicatedStorage.Season:FindFirstChild("Twists")
state[624]=ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
state[625]=Players:FindFirstChild(state[624].Value)
state[626]=Instance.new("Highlight",nil)
state[626].Name="IdolHolderHL"
state[627]=Color3.fromRGB(255,215,0)
state[626].FillColor=state[627]
state[628]=Color3.fromRGB(255,215,0)
state[626].OutlineColor=state[628]
state[626].FillTransparency=0.4
state[626].OutlineTransparency=0
state[626].Parent=state[625].Character
end
internal_249=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Idol:FireServer()
task.wait()
end
internal_250=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..ReplicatedStorage.Season.Players[a1.Name].Value)),["Title"]="Vote Cast"})
end
internal_251=function(a1,a2,a3,a4,a5,a6,a7,a8)
print(("[Ella Hub] Vote: "..(ReplicatedStorage.Season.Players[a1.Value].Value..(" → "..ReplicatedStorage.Season.Players[a1.Name].Value))))
end
internal_252=function(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync((ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..ReplicatedStorage.Season.Players[a1.Name].Value)))
end
internal_253=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..ReplicatedStorage.Season.Players[a1.Name].Value)),["Title"]="Exile Vote"})
game.TextChatService.TextChannels.RBXGeneral:SendAsync((ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..ReplicatedStorage.Season.Players[a1.Name].Value)))
end
internal_254=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..ReplicatedStorage.Season.Players[a1.Name].Value)),["Title"]="Jury Vote"})
end
internal_255=function(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync(("[JURY] "..(ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..ReplicatedStorage.Season.Players[a1.Name].Value))))
end
internal_256=function(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
ReplicatedStorage:FindFirstChild("Season")
ReplicatedStorage.Season:FindFirstChild("Twists")
state[629]=ReplicatedStorage.Season.Twists:FindFirstChild("Idol")
state[630]=Players:FindFirstChild(state[629].Value)
state[631]=Instance.new("Highlight",nil)
state[631].Name="IdolHolderHL"
state[632]=Color3.fromRGB(255,215,0)
state[631].FillColor=state[632]
state[633]=Color3.fromRGB(255,215,0)
state[631].OutlineColor=state[633]
state[631].FillTransparency=0.4
state[631].OutlineTransparency=0
state[631].Parent=state[630].Character
end
internal_257=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Idol:FireServer()
task.wait()
end
internal_258=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..ReplicatedStorage.Season.Players[a1.Name].Value)),["Title"]="Vote Cast"})
end
internal_259=function(a1,a2,a3,a4,a5,a6,a7,a8)
print(("[Ella Hub] Vote: "..(ReplicatedStorage.Season.Players[a1.Value].Value..(" → "..ReplicatedStorage.Season.Players[a1.Name].Value))))
end
internal_260=function(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync((ReplicatedStorage.Season.Players[a1.Value].Value..(" voted for "..ReplicatedStorage.Season.Players[a1.Name].Value)))
end
internal_261=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..ReplicatedStorage.Season.Players[a1.Name].Value)),["Title"]="Exile Vote"})
game.TextChatService.TextChannels.RBXGeneral:SendAsync((ReplicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..ReplicatedStorage.Season.Players[a1.Name].Value)))
end
internal_262=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..ReplicatedStorage.Season.Players[a1.Name].Value)),["Title"]="Jury Vote"})
end
internal_263=function(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync(("[JURY] "..(ReplicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..ReplicatedStorage.Season.Players[a1.Name].Value))))
end
internal_264=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[634]=Color3.fromRGB(40,40,50)
state[107].BackgroundColor3=state[634]
end
internal_265=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[635]=Color3.fromRGB(40,40,50)
state[113].BackgroundColor3=state[635]
end
internal_266=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[636]=Color3.fromRGB(40,40,50)
state[119].BackgroundColor3=state[636]
end
internal_267=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[637]=UDim2.fromOffset(0,(state[130].AbsoluteContentSize.Y+4))
state[125].CanvasSize=state[637]
state[638]=Vector2.new(0,inf)
state[125].CanvasPosition=state[638]
end
internal_268=function(a1,a2,a3,a4,a5,a6,a7,a8)
if a1.UserInputType==Enum.UserInputType.MouseWheel then
state[100].Text="↑"
state[639]=Color3.fromRGB(160,160,160)
state[100].TextColor3=state[639]
else
if a1.UserInputType==Enum.UserInputType.Touch then
state[100].Text="↑"
state[639]=Color3.fromRGB(160,160,160)
state[100].TextColor3=state[639]
else
end
end
end
internal_269=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_270=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_271=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_272=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[100].Text="↑"
state[639]=Color3.fromRGB(160,160,160)
state[100].TextColor3=state[639]
end
internal_273=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[640]=UDim2.fromOffset(340,30)
state[70].Size=state[640]
state[125].Visible=false
state[96].Text="+"
end
internal_274=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[136]:Disconnect()
state[137]:Disconnect()
state[138]:Disconnect()
state[69]:Destroy()
end
internal_275=function(a1,a2,a3,a4,a5,a6,a7,a8)
if a1.UserInputType==Enum.UserInputType.MouseButton1 then
Vector2.new(a1.Position.X,a1.Position.Y)
Vector2.new(state[70].AbsolutePosition.X,state[70].AbsolutePosition.Y)
else
if a1.UserInputType==Enum.UserInputType.Touch then
Vector2.new(a1.Position.X,a1.Position.Y)
Vector2.new(state[70].AbsolutePosition.X,state[70].AbsolutePosition.Y)
else
end
end
end
internal_276=function(a1,a2,a3,a4,a5,a6,a7,a8)
if a1.UserInputType==Enum.UserInputType.MouseButton1 then
else
if a1.UserInputType==Enum.UserInputType.Touch then
else
end
end
end
internal_277=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_278=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[139]:Disconnect()
state[140]:Disconnect()
end
internal_279=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=5,["Content"]=(ReplicatedStorage.Season.Players[a1.Value].Value..(" → "..(ReplicatedStorage.Season.Players[a1.Name].Value.."  (1 total)"))),["Title"]=("Vote — "..ReplicatedStorage.Season.Players[a1.Value].Value)})
end
internal_280=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_281=function(a1,a2,a3,a4,a5,a6,a7,a8)
UI:Notify({["Duration"]=6,["Content"]=ReplicatedStorage.Season.Twists.CurrentTwist.Value,["Title"]="Current Twist"})
ReplicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(internal_325)
task.wait()
end
internal_282=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_283=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
end
internal_284=function(a1,a2,a3,a4,a5,a6,a7,a8)
state[641]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[642]=CFrame.new(0,3000,0)
state[641].CFrame=state[642]
task.wait()
state[643]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[644]=CFrame.new(0,3000,0)
state[643].CFrame=state[644]
task.wait()
state[645]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[646]=CFrame.new(0,3000,0)
state[645].CFrame=state[646]
task.wait()
state[647]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[648]=CFrame.new(0,3000,0)
state[647].CFrame=state[648]
task.wait()
state[649]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[650]=CFrame.new(0,3000,0)
state[649].CFrame=state[650]
task.wait()
state[651]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[652]=CFrame.new(0,3000,0)
state[651].CFrame=state[652]
task.wait()
state[653]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[654]=CFrame.new(0,3000,0)
state[653].CFrame=state[654]
task.wait()
state[655]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[656]=CFrame.new(0,3000,0)
state[655].CFrame=state[656]
task.wait()
state[657]=Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
state[658]=CFrame.new(0,3000,0)
state[657].CFrame=state[658]
task.wait()
end
internal_285=function(a1,a2,a3,a4,a5,a6,a7,a8)
ReplicatedStorage.Events.Teleport:FireServer("Camp")
task.wait()
end
internal_286=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_326)
end
internal_287=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_327)
end
internal_288=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(internal_328)
end
internal_289=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players:GetPlayers()
end
internal_290=function(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("Tool")
task.wait()
state[659]=a1:Clone()
state[659].Parent=nil
end
internal_291=function(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("Tool")
end
internal_292=function(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
state[660]=state[659]:Clone()
state[660].Parent=Players.LocalPlayer.Backpack
end
internal_293=function(a1,a2,a3,a4,a5,a6,a7,a8)
getnamecallmethod()
state[158](a1,a2,a3,a4,a5,a6,a7,a8)
if a1==game:GetService("ReplicatedStorage").Events.Gear then
else
end
end
internal_294=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players.LocalPlayer.PlayerGui:GetDescendants()
end
internal_295=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players:GetPlayers()
task.wait()
end
internal_296=function(a1,a2,a3,a4,a5,a6,a7,a8)
Players:GetPlayers()
task.wait()
end
internal_297=function(a1,a2,a3,a4,a5,a6,a7,a8)
isfile("starborn.ttf")
state[661]=game:HttpGet("https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_")
writefile("starborn.ttf",state[661])
state[662]=getcustomasset("starborn.ttf")
state[663]=HttpService:JSONEncode({["name"]="Starborn",["faces"]={[1]={["name"]="Regular",["assetId"]=state[662],["style"]="normal",["weight"]=400}}})
writefile("Starborn.json",state[663])
isfile("vhsgothic.ttf")
state[664]=game:HttpGet("https://drive.google.com/uc?export=download&id=1XRWSIsNj9-v-vnrOCdYiUJIvz6ETAzfE")
writefile("vhsgothic.ttf",state[664])
state[665]=getcustomasset("vhsgothic.ttf")
state[666]=HttpService:JSONEncode({["name"]="VHS",["faces"]={[1]={["name"]="Regular",["assetId"]=state[665],["style"]="normal",["weight"]=400}}})
writefile("VHS.json",state[666])
isfile("minecrafter.ttf")
state[667]=game:HttpGet("https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4")
writefile("minecrafter.ttf",state[667])
state[668]=getcustomasset("minecrafter.ttf")
state[669]=HttpService:JSONEncode({["name"]="Minecrafter",["faces"]={[1]={["name"]="Regular",["assetId"]=state[668],["style"]="normal",["weight"]=400}}})
writefile("Minecrafter.json",state[669])
isfile("horror.ttf")
state[670]=game:HttpGet("https://drive.google.com/uc?export=download&id=1dH4Y_ZuoTeMouMQoGZSc1OVLT7-73zmq")
writefile("horror.ttf",state[670])
state[671]=getcustomasset("horror.ttf")
state[672]=HttpService:JSONEncode({["name"]="Horror",["faces"]={[1]={["name"]="Regular",["assetId"]=state[671],["style"]="normal",["weight"]=400}}})
writefile("Horror.json",state[672])
UI:Notify({["Duration"]=4,["Content"]="Done! Now pick a font.",["Title"]="Fonts"})
end
internal_298=function(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("TextLabel")
a1.FontFace=state[272]
end
internal_299=function(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("TextLabel")
a1.FontFace=state[274]
end
internal_300=function(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("TextLabel")
a1.FontFace=state[276]
end
internal_301=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_302=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_303=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_304=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_305=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_306=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_307=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_308=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_309=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_310=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_311=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_312=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_313=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_314=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_315=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_316=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_317=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_318=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_319=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_320=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_321=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_322=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_323=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_324=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_325=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_326=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_327=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
internal_328=function(a1,a2,a3,a4,a5,a6,a7,a8)
end
WindUILibrary=game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
LoadWindUI=loadstring(WindUILibrary)
UI=LoadWindUI()
Players=game:GetService("Players")
RunService=game:GetService("RunService")
ReplicatedStorage=game:GetService("ReplicatedStorage")
UserInputService=game:GetService("UserInputService")
game:GetService("TweenService")
HttpService=game:GetService("HttpService")
StarterGui=game:GetService("StarterGui")
game:GetService("PathfindingService")
Lighting=game:GetService("Lighting")
Debris=game:GetService("Debris")
SoundService=game:GetService("SoundService")
Window=UI:CreateWindow({["NewElements"]=true,["ScrollBarEnabled"]=true,["Author"]="by Ella",["Resizable"]=true,["ToggleKey"]=Enum.KeyCode.K,["Folder"]="EllaHub",["HideSearchBar"]=false,["Title"]="Ella Hub V2",["Transparent"]=true,["SideBarWidth"]=200,["Theme"]="Dark",["Icon"]="solar:home-2-bold",["Acrylic"]=true})
Window:Tag({["Title"]="TRD Script",["Color"]="Text"})
Window:Divider()
CampTab=Window:Tab({["Title"]="Camp",["Icon"]="solar:shield-bold"})
MovieTab=Window:Tab({["Title"]="Movie",["Icon"]="solar:camera-bold"})
ExpeditionTab=Window:Tab({["Title"]="Expedition",["Icon"]="solar:map-bold"})
Window:Divider()
MainTab=Window:Tab({["Title"]="Main",["Icon"]="solar:home-2-bold"})
CharactersTab=Window:Tab({["Title"]="Characters",["Icon"]="solar:user-bold"})
PlayerTab=Window:Tab({["Title"]="Player",["Icon"]="solar:running-2-bold"})
Window:Divider()
StatsTab=Window:Tab({["Title"]="Stats",["Icon"]="solar:chart-square-bold"})
TeleportsTab=Window:Tab({["Title"]="Teleports",["Icon"]="solar:map-point-bold"})
UniversalTab=Window:Tab({["Title"]="Universal",["Icon"]="solar:global-bold"})
ClientTab=Window:Tab({["Title"]="Client",["Icon"]="solar:cpu-bolt-bold"})
Window:Divider()
OtherTab=Window:Tab({["Title"]="Other",["Icon"]="solar:settings-bold"})
AutoplayTab=Window:Tab({["Title"]="Autoplay",["Icon"]="solar:play-bold"})
TrollTab=Window:Tab({["Title"]="Troll",["Icon"]="solar:ghost-bold"})
ShopTab=Window:Tab({["Title"]="Shop",["Icon"]="solar:shop-bold"})
Window:Divider()
SettingsTab=Window:Tab({["Title"]="Settings",["Icon"]="solar:settings-minimalistic-bold"})
Window:Divider()
CampTab:Select()
CampTab:Section({["Title"]="Obby"})
CampGroup=CampTab:Group()
CampGroup:Button({["Title"]="Win Obby",["Callback"]=autoWinObby,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:flag-bold",["Size"]="Small"})
CampGroup:Space({["Columns"]=0.5})
CampGroup:Button({["Title"]="Godmode",["Callback"]=autoWinObby2,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:shield-bold",["Size"]="Small"})
CampTab:Toggle({["Value"]=false,["Callback"]=internal_3,["Title"]="Auto-Win Obby",["Desc"]="Finish line loops to your position"})
CampTab:Section({["Title"]="Food"})
CampTab:Button({["Callback"]=eatFinishPancake,["Title"]="Eat / Finish Pancake",["Desc"]="Rapidly clicks your food item"})
CampTab:Section({["Title"]="Spleef"})
CampGroup2=CampTab:Group()
CampGroup2:Button({["Title"]="Godmode",["Callback"]=clearParts,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:shield-bold",["Size"]="Small"})
CampGroup2:Space({["Columns"]=0.5})
CampGroup2:Button({["Title"]="Clear Parts",["Callback"]=coinsGems,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:trash-bin-bold",["Size"]="Small"})
CampTab:Section({["Title"]="Coins & Gems"})
CampTab:Toggle({["Value"]=false,["Callback"]=autoCollectCoinsGems,["Title"]="Auto Collect Coins & Gems",["Desc"]="Moves all coins and gems to your character"})
CampTab:Section({["Title"]="Math Mania"})
CampTab:Toggle({["Value"]=false,["Callback"]=autoWinMathMania,["Title"]="Auto-Win Math Mania",["Desc"]="Auto-solves and submits all math questions"})
CampTab:Section({["Title"]="Block Push"})
CampTab:Button({["Callback"]=winBlockPush,["Title"]="Win Block Push",["Desc"]="Pushes your box onto the gold target"})
CampTab:Section({["Title"]="Sword Fight"})
CampTab:Toggle({["Value"]=false,["Callback"]=killAllInSwordFight,["Title"]="Kill All In Sword Fight",["Desc"]="Fires sword touch on all players every frame"})
CampTab:Section({["Title"]="Dodgeball & Paintball"})
CampTab:Toggle({["Value"]=false,["Callback"]=bringDodgeballGiver,["Title"]="Bring Dodgeball Giver",["Desc"]="Moves giver to you"})
CampTab:Toggle({["Value"]=false,["Callback"]=keepDodgeballAfterRound,["Title"]="Keep Dodgeball After Round",["Desc"]="Re-equips the dodgeball if it gets taken away"})
CampTab:Toggle({["Value"]=false,["Callback"]=autoThrowDodgeball,["Title"]="Auto Throw Dodgeball",["Desc"]="Automatically fires the dodgeball remote"})
CampTab:Toggle({["Value"]=false,["Callback"]=killAllDodgeball,["Title"]="Kill All (Dodgeball)",["Desc"]="Slams ball into each player"})
CampTab:Toggle({["Value"]=false,["Callback"]=autoFirePaintball,["Title"]="Auto Fire Paintball",["Desc"]="Automatically fires paintball at all players"})
CampTab:Toggle({["Value"]=false,["Callback"]=killAllPaintball,["Title"]="Kill All (Paintball)",["Desc"]="Moves pellets into each player"})
CampTab:Toggle({["Value"]=false,["Callback"]=dodgeballPaintballProtection,["Title"]="Dodgeball & Paintball Protection",["Desc"]="Destroys incoming balls"})
CampTab:Section({["Title"]="Auto-Win All"})
CampTab:Toggle({["Value"]=false,["Callback"]=autoWinAllChallenges,["Title"]="Auto-Win All Challenges",["Desc"]="Enables all loops at once"})
MovieTab:Section({["Title"]="Obby"})
MovieGroup=MovieTab:Group()
MovieGroup:Button({["Title"]="Win Obby",["Callback"]=autoWinObby,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:flag-bold",["Size"]="Small"})
MovieTab:Toggle({["Value"]=false,["Callback"]=internal_19,["Title"]="Auto-Win Obby",["Desc"]="Finish line loops to your position"})
MovieTab:Section({["Title"]="Pirate"})
MovieTab:Button({["Callback"]=collectKeysOpenChests,["Title"]="Collect Keys & Open Chests",["Desc"]="Collects all pirate keys and opens matching chests"})
MovieTab:Section({["Title"]="Beach Fight"})
MovieTab:Toggle({["Value"]=false,["Callback"]=killEveryoneInBeachFight,["Title"]="Kill Everyone In Beach Fight",["Desc"]="Fires sword touch on all players every frame"})
MovieTab:Section({["Title"]="Monster"})
MovieTab:Button({["Callback"]=monsterGodmode,["Title"]="Monster Godmode",["Desc"]="Destroys the monster NPC to prevent damage"})
MovieTab:Section({["Title"]="Alien"})
MovieTab:Button({["Callback"]=collectEgg,["Title"]="Collect Egg",["Desc"]="Moves your egg to your character position"})
MovieTab:Section({["Title"]="Pre-Historic"})
MovieTab:Toggle({["Value"]=false,["Callback"]=autoCollectAncientArtifacts,["Title"]="Auto Collect Ancient Artifacts",["Desc"]="Teleports artifact coins to you as they spawn"})
MovieTab:Section({["Title"]="Math Mania"})
MovieTab:Toggle({["Value"]=false,["Callback"]=autoWinMathMania2,["Title"]="Auto-Win Math Mania",["Desc"]="Auto-solves and submits all math questions"})
MovieTab:Section({["Title"]="Rock & Roll"})
MovieTab:Toggle({["Value"]=false,["Callback"]=autoCollectGuitars,["Title"]="Auto Collect Guitars",["Desc"]="Heartbeat collects all coins/gems in Rock & Roll"})
MovieTab:Section({["Title"]="Prison"})
MovieTab:Button({["Callback"]=instantlyEatPoisonBowl,["Title"]="Instantly Eat Poison Bowl",["Desc"]="Fires clickdetector on every bowl in the prison"})
MovieTab:Toggle({["Value"]=false,["Callback"]=autoShootRaygunSheriff,["Title"]="Auto Shoot Raygun (Sheriff)",["Desc"]="Fires ServerControl at nearest enemy"})
MovieTab:Toggle({["Value"]=false,["Callback"]=killAllSheriffRaygun,["Title"]="Kill All (Sheriff / Raygun)",["Desc"]="Moves lasers onto each player"})
MovieTab:Toggle({["Value"]=false,["Callback"]=raygunSheriffProtection,["Title"]="Raygun / Sheriff Protection",["Desc"]="Deletes incoming laser blasts"})
ExpeditionTab:Section({["Title"]="Obby"})
ExpeditionGroup=ExpeditionTab:Group()
ExpeditionGroup:Button({["Title"]="Win Obby",["Callback"]=autoWinObby,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:flag-bold",["Size"]="Small"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=internal_31,["Title"]="Auto-Win Obby",["Desc"]="Finish line loops to your position"})
ExpeditionTab:Section({["Title"]="Collectibles"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=autoCollectClovers,["Title"]="Auto-Collect Clovers",["Desc"]="Moves all gems and coins to your character"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=autoCollectRings,["Title"]="Auto-Collect Rings",["Desc"]="Moves all ring hitboxes to your character"})
ExpeditionTab:Section({["Title"]="Math Mania"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=autoWinMathMania3,["Title"]="Auto-Win Math Mania",["Desc"]="Auto-solves and submits all math questions"})
ExpeditionTab:Section({["Title"]="Greece"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=killEveryoneInGreece,["Title"]="Kill Everyone in Greece",["Desc"]="Fires sword touch on all players every frame"})
ExpeditionTab:Section({["Title"]="Amazon"})
ExpeditionTab:Button({["Callback"]=breakAmazonSpleef,["Title"]="Break Amazon (Spleef)",["Desc"]="Fires touchinterest on all Amazon spleef parts"})
ExpeditionTab:Section({["Title"]="France (Cheese Push)"})
ExpeditionGroup2=ExpeditionTab:Group()
ExpeditionGroup2:Button({["Title"]="Push Cheese 1",["Callback"]=pushCheese2,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:map-point-bold",["Size"]="Small"})
ExpeditionGroup2:Space({["Columns"]=0.5})
ExpeditionGroup2:Button({["Title"]="Push Cheese 2",["Callback"]=autoPushCheese,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:map-point-bold",["Size"]="Small"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=internal_39,["Title"]="Auto Push Cheese",["Desc"]="Continuously pushes both cheeses to the finish"})
ExpeditionTab:Section({["Title"]="Italy"})
ExpeditionTab:Button({["Callback"]=giveMeatball,["Title"]="Give Meatball",["Desc"]="Clones meatball into your backpack"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=keepMeatballAfterRound,["Title"]="Keep Meatball After Round",["Desc"]="Re-equips the meatball if it gets taken away"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=autoThrowMeatball,["Title"]="Auto Throw Meatball",["Desc"]="Throws meatball at all players"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=killAllMeatball,["Title"]="Kill All (Meatball)",["Desc"]="Slams meatball into each player"})
ExpeditionTab:Toggle({["Value"]=false,["Callback"]=bringMeatballGiver,["Title"]="Bring Meatball Giver",["Desc"]="Moves MeatballGiver to you"})
MainTab:Section({["Title"]="Safety Statue"})
MainGroup=MainTab:Group()
MainGroup:Button({["Title"]="Get Statue/Bag",["Callback"]=whoHasIt,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:diploma-bold",["Size"]="Small"})
MainGroup:Space({["Columns"]=0.5})
MainGroup:Button({["Title"]="Who Has It",["Callback"]=safetyBagEsp,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:eye-bold",["Size"]="Small"})
MainTab:Toggle({["Value"]=false,["Callback"]=internal_47,["Title"]="Safety Bag ESP",["Desc"]="Shows white highlight and label on all safety bags"})
MainTab:Toggle({["Value"]=false,["Callback"]=safetyStatueEsp,["Title"]="Safety Statue ESP",["Desc"]="Shows white highlight and label on all safety statues"})
MainTab:Toggle({["Value"]=false,["Callback"]=idolHolderEsp,["Title"]="Idol Holder ESP",["Desc"]="Highlights whoever currently holds the statue"})
MainTab:Toggle({["Value"]=false,["Callback"]=playAsIdolSpam,["Title"]="Play as Idol (Spam)",["Desc"]="Fires Idol remote rapidly — only works if you hold it"})
MainTab:Button({["Callback"]=playAsIdolOnce,["Title"]="Play as Idol (Once)",["Desc"]="Fires Idol remote once"})
MainTab:Section({["Title"]="Votes"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyVotes,["Title"]="Notify Votes",["Desc"]="Shows a notification each time a vote is cast"})
MainTab:Toggle({["Value"]=false,["Callback"]=printVotesToConsole,["Title"]="Print Votes to Console",["Desc"]="Prints each vote to the F9 developer console"})
MainTab:Toggle({["Value"]=false,["Callback"]=exposeVotesInChat,["Title"]="Expose Votes in Chat",["Desc"]="Sends each vote publicly in the game chat"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyExposeExileVotes,["Title"]="Notify & Expose Exile Votes",["Desc"]="Notifies and exposes exile votes in chat"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyJuryVotes,["Title"]="Notify Jury Votes",["Desc"]="Shows a notification each time a jury vote is cast"})
MainTab:Toggle({["Value"]=false,["Callback"]=exposeJuryVotesInChat,["Title"]="Expose Jury Votes in Chat",["Desc"]="Sends jury votes publicly in game chat"})
MainTab:Section({["Title"]="Safety Statue"})
MainGroup2=MainTab:Group()
MainGroup2:Button({["Title"]="Get Statue/Bag",["Callback"]=whoHasIt2,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:diploma-bold",["Size"]="Small"})
MainGroup2:Space({["Columns"]=0.5})
MainGroup2:Button({["Title"]="Who Has It",["Callback"]=safetyBagEsp2,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:eye-bold",["Size"]="Small"})
MainTab:Toggle({["Value"]=false,["Callback"]=internal_60,["Title"]="Safety Bag ESP",["Desc"]="Shows white highlight and label on all safety bags"})
MainTab:Toggle({["Value"]=false,["Callback"]=safetyStatueEsp2,["Title"]="Safety Statue ESP",["Desc"]="Shows white highlight and label on all safety statues"})
MainTab:Toggle({["Value"]=false,["Callback"]=idolHolderEsp2,["Title"]="Idol Holder ESP",["Desc"]="Highlights whoever currently holds the statue"})
MainTab:Toggle({["Value"]=false,["Callback"]=playAsIdolSpam2,["Title"]="Play as Idol (Spam)",["Desc"]="Fires Idol remote rapidly — only works if you hold it"})
MainTab:Button({["Callback"]=playAsIdolOnce2,["Title"]="Play as Idol (Once)",["Desc"]="Fires Idol remote once"})
MainTab:Section({["Title"]="Votes"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyVotes2,["Title"]="Notify Votes",["Desc"]="Shows a notification each time a vote is cast"})
MainTab:Toggle({["Value"]=false,["Callback"]=printVotesToConsole2,["Title"]="Print Votes to Console",["Desc"]="Prints each vote to the F9 developer console"})
MainTab:Toggle({["Value"]=false,["Callback"]=exposeVotesInChat2,["Title"]="Expose Votes in Chat",["Desc"]="Sends each vote publicly in the game chat"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyExposeExileVotes2,["Title"]="Notify & Expose Exile Votes",["Desc"]="Notifies and exposes exile votes in chat"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyJuryVotes2,["Title"]="Notify Jury Votes",["Desc"]="Shows a notification each time a jury vote is cast"})
MainTab:Toggle({["Value"]=false,["Callback"]=exposeJuryVotesInChat2,["Title"]="Expose Jury Votes in Chat",["Desc"]="Sends jury votes publicly in game chat"})
MainTab:Button({["Callback"]=voteLogGui,["Title"]="Vote Log GUI",["Desc"]="Opens a movable dark GUI logging all votes live"})
MainTab:Toggle({["Value"]=false,["Callback"]=tiebreakerDetector,["Title"]="Tiebreaker Detector",["Desc"]="Watches votes live, alerts on tie and shows tally"})
MainTab:Button({["Callback"]=checkVoteTally,["Title"]="Check Vote Tally",["Desc"]="Shows current vote counts"})
MainTab:Section({["Title"]="Round Info"})
MainGroup3=MainTab:Group()
MainGroup3:Button({["Title"]="Round Type",["Callback"]=teamers,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:bolt-circle-bold",["Size"]="Small"})
MainGroup3:Space({["Columns"]=0.5})
MainGroup3:Button({["Title"]="Teamers",["Callback"]=roundDetector,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:users-group-two-rounded-bold",["Size"]="Small"})
MainTab:Toggle({["Value"]=false,["Callback"]=internal_76,["Title"]="Round Detector",["Desc"]="Notifies on twists BEFORE the round starts + merges"})
MainTab:Section({["Title"]="Server Hop"})
MainTab:Toggle({["Value"]=false,["Callback"]=serverHopOnMerge,["Title"]="Server Hop on Merge",["Desc"]="Teleports to a new server when merge triggers"})
MainTab:Button({["Callback"]=serverHopNow,["Title"]="Server Hop Now",["Desc"]="Immediately teleports to a new server"})
MainTab:Section({["Title"]="Auto Farm & Rejoin"})
MainTab:Toggle({["Value"]=false,["Callback"]=autoRejoinWhenVotedOut,["Title"]="Auto Rejoin When Voted Out",["Desc"]="Rejoins Camp when voted out"})
MainTab:Toggle({["Value"]=false,["Callback"]=tpAboveMap,["Title"]="TP Above Map",["Desc"]="Creates invisible platform and keeps you there"})
MainTab:Toggle({["Value"]=false,["Callback"]=autoJoinCampFromLobby,["Title"]="Auto Join Camp From Lobby",["Desc"]="Fires Teleport:Camp remote every 5s"})
MainTab:Section({["Title"]="Elimination Reason"})
MainTab:Button({["Callback"]=checkElimReason,["Title"]="Check Elim Reason",["Desc"]="Shows current elimination reasons"})
MainTab:Toggle({["Value"]=false,["Callback"]=notifyElimReason,["Title"]="Notify Elim Reason",["Desc"]="Shows notification when players are eliminated"})
MainTab:Toggle({["Value"]=false,["Callback"]=exposeElimInChat,["Title"]="Expose Elim in Chat",["Desc"]="Sends eliminations publicly in game chat"})
MainTab:Toggle({["Value"]=false,["Callback"]=sendElimToWebhook,["Title"]="Send Elim to Webhook",["Desc"]="Posts eliminations to your Discord webhook"})
MainTab:Section({["Title"]="Utilities"})
MainTab:Button({["Callback"]=removeIntroCutscene,["Title"]="Remove Intro Cutscene",["Desc"]="Destroys the intro camera cutscene"})
MainTab:Button({["Callback"]=flingReanimate,["Title"]="Fling / Reanimate",["Desc"]="Executes the reanimate script"})
MainTab:Button({["Callback"]=openConsole,["Title"]="Open Console",["Desc"]="Opens the developer console"})
MainTab:Toggle({["Value"]=false,["Callback"]=autoBlockLongUsernames,["Title"]="Auto-Block Long Usernames",["Desc"]="Truncates very long display names to prevent lag"})
MainTab:Section({["Title"]="Gear Keeper"})
MainTab:Toggle({["Value"]=false,["Callback"]=gearKeeper,["Title"]="Gear Keeper",["Desc"]="Restores tools after round ends"})
MainTab:Button({["Callback"]=snapshotGearNow,["Title"]="Snapshot Gear Now",["Desc"]="Manually saves current tools"})
MainTab:Button({["Callback"]=restoreGearNow,["Title"]="Restore Gear Now",["Desc"]="Immediately returns saved tools"})
MainTab:Section({["Title"]="Anti Gear Removal"})
MainTab:Toggle({["Value"]=false,["Callback"]=antiGearRemoval,["Title"]="Anti Gear Removal",["Desc"]="Blocks Gear:FireServer Remove + ClearBackpack"})
CharactersTab:Section({["Title"]="Free"})
CharacterGroup=CharactersTab:Group()
CharacterGroup:Button({["Title"]="Set Male",["Callback"]=setFemale,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:user-bold",["Size"]="Small"})
CharacterGroup:Space({["Columns"]=0.5})
CharacterGroup:Button({["Title"]="Set Female",["Callback"]=buyCharacter,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:user-bold",["Size"]="Small"})
CharactersTab:Section({["Title"]="Buy Character"})
CharactersTab:Dropdown({["Title"]="Symbol",["Value"]=1,["Values"]={[1]="None",[2]="Verified",[3]="Premium",[4]="Robux"},["Callback"]=characterName,["Desc"]="Choose a symbol to append to the character name"})
CharactersTab:Input({["Callback"]=internal_97,["Placeholder"]="Enter name...",["Title"]="Character Name",["Desc"]="Type the exact character name to purchase"})
CharactersTab:Button({["Callback"]=buyCharacter60Coins,["Title"]="Buy Character (60 coins)",["Desc"]="Fires the buy remote with your entered name"})
CharactersTab:Section({["Title"]="Map Themes"})
CharactersTab:Button({["Callback"]=christmasMap,["Title"]="Christmas Map",["Desc"]="Snow + white trees"})
CharactersTab:Button({["Callback"]=halloweenMap,["Title"]="Halloween Map",["Desc"]="Rust leaves + dark foggy lighting"})
CharactersTab:Button({["Callback"]=valentinesMap,["Title"]="Valentines Map",["Desc"]="Pink leaves + rose water"})
CharactersTab:Button({["Callback"]=resetMap,["Title"]="Reset Map",["Desc"]="Removes snow + restores lighting"})
PlayerTab:Section({["Title"]="Movement"})
PlayerTab:Space({["Columns"]=2})
PlayerTab:Slider({["IsTooltip"]=true,["Title"]="Walk Speed",["Value"]={["Max"]=350,["Default"]=16,["Min"]=1},["Callback"]=jumpPower,["Step"]=1,["Icons"]={["To"]="solar:running-2-bold",["From"]="solar:ghost-bold"}})
PlayerTab:Space({["Columns"]=1})
PlayerTab:Slider({["IsTooltip"]=true,["Title"]="Jump Power",["Value"]={["Max"]=350,["Default"]=50,["Min"]=1},["Callback"]=timer,["Step"]=1,["Icons"]={["To"]="solar:rocket-bold",["From"]="solar:arrow-up-bold"}})
PlayerTab:Section({["Title"]="Timer"})
PlayerTab:Toggle({["Value"]=false,["Callback"]=freezeTimerDisplay,["Title"]="Freeze Timer Display",["Desc"]="Locks the on-screen timer so it stops counting"})
PlayerTab:Toggle({["Value"]=false,["Callback"]=hideTimer,["Title"]="Hide Timer",["Desc"]="Makes the timer GUI invisible"})
PlayerTab:Section({["Title"]="Map"})
PlayerTab:Button({["Callback"]=removeGlassBarriers,["Title"]="Remove Glass Barriers",["Desc"]="Destroys all glass barrier parts in the map"})
PlayerTab:Toggle({["Value"]=false,["Callback"]=walkOnLake,["Title"]="Walk on Lake",["Desc"]="Enables lake collision"})
PlayerTab:Button({["Callback"]=lakeGodMode,["Title"]="Lake God-Mode",["Desc"]="Destroys the lake sand touch interest"})
PlayerTab:Section({["Title"]="Target Player"})
Season=ReplicatedStorage:WaitForChild("Season",5)
SeasonPlayers=Season:WaitForChild("Players",5)
SeasonPlayers:GetChildren()
TargetPlayerDropdown=PlayerTab:Dropdown({["Title"]="Choose Player",["Value"]=1,["Values"]={[1]="(none)"},["Callback"]=teleportTo,["Desc"]="Select a player to target"})
Players.PlayerAdded:Connect(internal_111)
Players.PlayerRemoving:Connect(internal_112)
TargetGroup=PlayerTab:Group()
TargetGroup:Button({["Title"]="Teleport To",["Callback"]=refreshList,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:map-point-bold",["Size"]="Small"})
TargetGroup:Space({["Columns"]=0.5})
TargetGroup:Button({["Title"]="Refresh List",["Callback"]=highlightPlayer,["IconAlign"]="Left",["Justify"]="Center",["Icon"]="solar:refresh-bold",["Size"]="Small"})
PlayerTab:Toggle({["Value"]=false,["Callback"]=internal_115,["Title"]="Highlight Player",["Desc"]="Adds a yellow highlight to the selected player"})
StatsTab:Section({["Title"]="Player Stats"})
Players:GetPlayers()
StatsPlayerDropdown=StatsTab:Dropdown({["Title"]="Choose Player",["Value"]=1,["Values"]={[1]="(none)"},["Callback"]=refreshList2,["Desc"]="Select a player to view their stats"})
StatsTab:Button({["Callback"]=internal_117,["Title"]="Refresh List",["Desc"]="Updates the list with current players"})
StatsTab:Button({["Callback"]=campWins,["Title"]="Camp Wins",["Desc"]="Shows camp win count"})
StatsTab:Button({["Callback"]=movieWins,["Title"]="Movie Wins",["Desc"]="Shows movie win count"})
StatsTab:Button({["Callback"]=expeditionWins,["Title"]="Expedition Wins",["Desc"]="Shows expedition win count"})
StatsTab:Button({["Callback"]=coins,["Title"]="Coins",["Desc"]="Shows coin balance"})
StatsTab:Button({["Callback"]=comebackWins,["Title"]="Comeback Wins",["Desc"]="Shows comeback win count"})
StatsTab:Button({["Callback"]=gamesPlayed,["Title"]="Games Played",["Desc"]="Shows total games played"})
StatsTab:Button({["Callback"]=idolsFound,["Title"]="Idols Found",["Desc"]="Shows idols found"})
StatsTab:Button({["Callback"]=skins,["Title"]="Skins",["Desc"]="Lists all skins owned by selected player"})
StatsTab:Button({["Callback"]=marshmallows,["Title"]="Marshmallows",["Desc"]="Lists all marshmallows owned by selected player"})
TeleportsTab:Section({["Title"]="Camp"})
TeleportsTab:Button({["Callback"]=spectatorIsland,["Title"]="Spectator Island",["Desc"]="Teleport to Spectator Island"})
TeleportsTab:Button({["Callback"]=mainIsland,["Title"]="Main Island",["Desc"]="Teleport to Main Island"})
TeleportsTab:Button({["Callback"]=exileIsland,["Title"]="Exile Island",["Desc"]="Teleport to Exile Island"})
TeleportsTab:Button({["Callback"]=votingArea,["Title"]="Voting Area",["Desc"]="Teleport to Voting Area"})
TeleportsTab:Button({["Callback"]=boat,["Title"]="Boat",["Desc"]="Teleport to Boat"})
TeleportsTab:Button({["Callback"]=bathroom,["Title"]="Bathroom",["Desc"]="Teleport to Bathroom"})
TeleportsTab:Section({["Title"]="Movie"})
TeleportsTab:Button({["Callback"]=starterIsland,["Title"]="Starter Island",["Desc"]="Teleport to Starter Island"})
TeleportsTab:Button({["Callback"]=votingArea2,["Title"]="Voting Area",["Desc"]="Teleport to Voting Area"})
TeleportsTab:Button({["Callback"]=cabin1,["Title"]="Cabin 1",["Desc"]="Teleport to Cabin 1"})
TeleportsTab:Button({["Callback"]=cabin2,["Title"]="Cabin 2",["Desc"]="Teleport to Cabin 2"})
TeleportsTab:Button({["Callback"]=diningRoom,["Title"]="Dining Room",["Desc"]="Teleport to Dining Room"})
TeleportsTab:Button({["Callback"]=kitchen,["Title"]="Kitchen",["Desc"]="Teleport to Kitchen"})
TeleportsTab:Button({["Callback"]=insideBoat,["Title"]="Inside Boat",["Desc"]="Teleport to Inside Boat"})
TeleportsTab:Section({["Title"]="Expedition"})
TeleportsTab:Button({["Callback"]=shipVotingArea,["Title"]="Ship Voting Area",["Desc"]="Teleport to Ship Voting Area"})
TeleportsTab:Button({["Callback"]=firstClassVip,["Title"]="First Class (VIP)",["Desc"]="Teleport to First Class (VIP)"})
TeleportsTab:Button({["Callback"]=callback2ndClass,["Title"]="2nd Class",["Desc"]="Teleport to 2nd Class"})
TeleportsTab:Button({["Callback"]=shipBathroom,["Title"]="Ship Bathroom",["Desc"]="Teleport to Ship Bathroom"})
TeleportsTab:Button({["Callback"]=diningClass,["Title"]="Dining Class",["Desc"]="Teleport to Dining Class"})
TeleportsTab:Button({["Callback"]=basement,["Title"]="Basement",["Desc"]="Teleport to Basement"})
UniversalTab:Section({["Title"]="Tools"})
UniversalTab:Button({["Callback"]=vcUnban,["Title"]="VC Unban",["Desc"]="Rejoins voice chat to bypass a voice ban"})
UniversalTab:Button({["Callback"]=applyShaders,["Title"]="Apply Shaders",["Desc"]="Applies custom lighting and sky shaders"})
UniversalTab:Button({["Callback"]=infiniteYield,["Title"]="Infinite Yield",["Desc"]="Loads Infinite Yield FE admin commands"})
UniversalTab:Button({["Callback"]=flyGui,["Title"]="Fly GUI",["Desc"]="Loads a fly script with GUI controls"})
UniversalTab:Button({["Callback"]=wallHop,["Title"]="Wall Hop",["Desc"]="Loads a wall hop movement script"})
UniversalTab:Button({["Callback"]=soundPanel,["Title"]="Sound Panel",["Desc"]="Loads a sound control panel"})
UniversalTab:Button({["Callback"]=energizeAnimations,["Title"]="Energize Animations",["Desc"]="Opens the FE animation GUI"})
UniversalTab:Button({["Callback"]=bringBackOldChat,["Title"]="Bring Back Old Chat",["Desc"]="Restores the old Roblox chat UI"})
UniversalTab:Section({["Title"]="Misc"})
UniversalTab:Toggle({["Value"]=false,["Callback"]=collision,["Title"]="Collision",["Desc"]="Adds invisible collision to all other players"})
UniversalTab:Toggle({["Value"]=false,["Callback"]=hackerDetector,["Title"]="Hacker Detector",["Desc"]="Flags abnormal speed or jump"})
UniversalTab:Section({["Title"]="Team Changer"})
Teams=game:GetService("Teams")
Teams:GetChildren()
TeamDropdown=UniversalTab:Dropdown({["Value"]=1,["Callback"]=team,["Values"]={[1]="Spectator",[2]="Jury",[3]="Team1",[4]="Team2",[5]="Team3"},["Title"]="Team"})
UniversalTab:Button({["Title"]="Refresh Teams",["Callback"]=setTeam})
UniversalTab:Button({["Callback"]=internal_158,["Title"]="Set Team",["Desc"]="Join the selected team"})
UniversalTab:Button({["Callback"]=spectator,["Title"]="Spectator",["Desc"]="Quick-join Spectator team"})
UniversalTab:Button({["Callback"]=jury,["Title"]="Jury",["Desc"]="Quick-join Jury team"})
UniversalTab:Section({["Title"]="Fonts"})
UniversalTab:Button({["Callback"]=loadFonts,["Title"]="Load Fonts",["Desc"]="Download all fonts before applying"})
UniversalTab:Button({["Callback"]=starborn,["Title"]="Starborn",["Desc"]="Apply Starborn font"})
UniversalTab:Button({["Callback"]=vhs,["Title"]="VHS",["Desc"]="Apply VHS gothic font"})
UniversalTab:Button({["Callback"]=minecrafter,["Title"]="Minecrafter",["Desc"]="Apply Minecrafter font"})
UniversalTab:Button({["Callback"]=horror,["Title"]="Horror",["Desc"]="Apply Horror font"})
ClientTab:Section({["Title"]="Cosmetics"})
ClientTab:Toggle({["Value"]=false,["Callback"]=rainbowName,["Title"]="Rainbow Name",["Desc"]="Makes your character name cycle through rainbow colors"})
ClientTab:Section({["Title"]="Skin Changer"})
ClientTab:Button({["Callback"]=skinChanger,["Title"]="Skin Changer",["Desc"]="Opens the skin changer GUI"})
ClientTab:Section({["Title"]="Size Changer"})
ClientTab:Button({["Callback"]=sizeChanger,["Title"]="Size Changer",["Desc"]="Changes your size"})
ClientTab:Section({["Title"]="Admin Panel"})
ClientTab:Button({["Callback"]=getsAdminPanel,["Title"]="Gets Admin Panel",["Desc"]="Forces open the settings/admin GUI"})
OtherTab:Section({["Title"]="Auto Farm"})
OtherTab:Toggle({["Value"]=false,["Callback"]=autoFarmCoin,["Title"]="Auto Farm Coin",["Desc"]="Reanimates when any player wins + auto-win obby"})
OtherTab:Section({["Title"]="Auto Farm Coins 2"})
OtherTab:Toggle({["Value"]=false,["Callback"]=autoFarmCoins2,["Title"]="Auto Farm Coins 2",["Desc"]="Triggers on every coin gain"})
OtherTab:Section({["Title"]="Auto Restart Day"})
OtherTab:Toggle({["Value"]=false,["Callback"]=autoRestartDay,["Title"]="Auto Restart Day",["Desc"]="Reanimates when the round ends"})
OtherTab:Section({["Title"]="Obby Detector"})
OtherTab:Button({["Callback"]=detectCurrentObby,["Title"]="Detect Current Obby",["Desc"]="Checks workspace.Assets for active challenge"})
OtherTab:Toggle({["Value"]=false,["Callback"]=autoDetectObby,["Title"]="Auto-Detect Obby",["Desc"]="Notifies when a new challenge starts"})
OtherTab:Section({["Title"]="Get Items"})
OtherTab:Button({["Title"]="Give Dodgeball",["Callback"]=givePaintballGun})
OtherTab:Button({["Title"]="Give Paintball Gun",["Callback"]=giveMeatball2})
OtherTab:Button({["Title"]="Give Meatball",["Callback"]=giveRaygunSheriff})
OtherTab:Button({["Title"]="Give Raygun (Sheriff)",["Callback"]=giveSword})
OtherTab:Button({["Title"]="Give Sword",["Callback"]=givePoolNoodle})
OtherTab:Button({["Title"]="Give Pool Noodle",["Callback"]=giveSnowball})
OtherTab:Button({["Title"]="Give Snowball",["Callback"]=webhooks})
OtherTab:Section({["Title"]="Webhooks"})
OtherTab:Input({["Callback"]=webhookUrl,["Placeholder"]="https://discord.com/api/webhooks/...",["Title"]="Webhook URL",["Desc"]="Paste your Discord webhook URL here"})
OtherTab:Button({["Callback"]=testWebhook,["Title"]="Test Webhook",["Desc"]="Sends a test message to verify your webhook URL"})
OtherTab:Toggle({["Value"]=false,["Title"]="Send Jury Votes to Webhook",["Callback"]=sendVotesToWebhook})
OtherTab:Toggle({["Value"]=false,["Title"]="Send Votes to Webhook",["Callback"]=sendExileVotesToWebhook})
OtherTab:Toggle({["Value"]=false,["Title"]="Send Exile Votes to Webhook",["Callback"]=exposeExileVotesInChat})
OtherTab:Toggle({["Value"]=false,["Title"]="Expose Exile Votes in Chat",["Callback"]=sendStatueHolderToWebhook})
OtherTab:Toggle({["Value"]=false,["Title"]="Send Statue Holder to Webhook",["Callback"]=sendRoundInfoToWebhook})
OtherTab:Toggle({["Value"]=false,["Title"]="Send Round Info to Webhook",["Callback"]=dailyShop})
ShopTab:Section({["Title"]="Daily Shop"})
ShopTab:Button({["Callback"]=printShopToConsole,["Title"]="Print Shop to Console",["Desc"]="Prints all daily shop items to F9 console"})
ShopTab:Button({["Callback"]=sendShopToWebhook,["Title"]="Send Shop to Webhook",["Desc"]="Posts all daily shop items to your Discord webhook"})
ShopTab:Section({["Title"]="Shop Watcher"})
ShopTab:Toggle({["Value"]=false,["Callback"]=notifyWhenShopUpdates,["Title"]="Notify When Shop Updates",["Desc"]="Notifies you when a new item appears in the shop"})
ShopTab:Toggle({["Value"]=false,["Callback"]=autoSendShopUpdatesToWebhook,["Title"]="Auto Send Shop Updates to Webhook",["Desc"]="Posts to webhook when new items appear"})
TrollTab:Section({["Title"]="Sound Control"})
TrollTab:Toggle({["Value"]=false,["Callback"]=muteAllSounds,["Title"]="Mute All Sounds",["Desc"]="Sets SoundService volume to 0 (local only)"})
TrollTab:Button({["Callback"]=stopAllPlayingSounds,["Title"]="Stop All Playing Sounds",["Desc"]="Stops all sounds in workspace and PlayerGui"})
TrollTab:Section({["Title"]="Spam Sounds"})
TrollTab:Toggle({["Value"]=false,["Callback"]=spamClickSound,["Title"]="Spam Click Sound",["Desc"]="Rapidly fires lp.PlayerGui.Click:Play()"})
TrollTab:Toggle({["Value"]=false,["Callback"]=spamOof,["Title"]="Spam OOF",["Desc"]="Loops the OOF death sound locally"})
TrollTab:Section({["Title"]="Trigger Sounds"})
TrollTab:Button({["Title"]="Sword Lunge Sound",["Callback"]=equipSwordUnsheath})
TrollTab:Button({["Title"]="Equip (Sword Unsheath)",["Callback"]=toiletEliminationSound})
TrollTab:Button({["Title"]="Toilet Elimination Sound",["Callback"]=sleighEliminationSound})
TrollTab:Button({["Title"]="Sleigh Elimination Sound",["Callback"]=triggerTwisted})
TrollTab:Section({["Title"]="Trigger Twisted"})
TrollTab:Button({["Callback"]=triggerTwisted2,["Title"]="Trigger Twisted",["Desc"]="Fires PSSettings + OSSettings Start remotes"})
TrollTab:Section({["Title"]="Sleigh Elimination Swap"})
TrollTab:Button({["Callback"]=swapToSleighElimination,["Title"]="Swap to Sleigh Elimination",["Desc"]="Replaces Boat with Sleigh, plays animation"})
TrollTab:Button({["Callback"]=forceRestoreBoat,["Title"]="Force Restore Boat",["Desc"]="Immediately restores Boat Elimination"})
TrollTab:Section({["Title"]="Anti Loser Land"})
TrollTab:Toggle({["Value"]=false,["Callback"]=antiLoserLand,["Title"]="Anti Loser Land",["Desc"]="Blocks elimination sending you to spectator"})
TrollTab:Button({["Callback"]=forceFightElimTest,["Title"]="Force Fight Elim (Test)",["Desc"]="Manually triggers the anti-elim routine"})
AutoplayTab:Section({["Title"]="TAS Autoplay"})
AutoplayTab:Toggle({["Value"]=false,["Callback"]=autoplay,["Title"]="Autoplay",["Desc"]="Automatically plays the TAS when a challenge starts"})
AutoplayTab:Toggle({["Value"]=false,["Callback"]=disableShiftlockCamera,["Title"]="Disable Shiftlock / Camera",["Desc"]="Keeps your camera free during TAS playback"})
AutoplayTab:Button({["Callback"]=playThisRound,["Title"]="Play This Round",["Desc"]="Manually triggers autoplay for the current map"})
AutoplayTab:Button({["Callback"]=stopPlayback,["Title"]="Stop Playback",["Desc"]="Stops the current TAS playback"})
AutoplayTab:Section({["Title"]="Map Options"})
AutoplayTab:Dropdown({["Value"]=1,["Callback"]=caveChaosRoute,["Values"]={[1]="Cave Chaos",[2]="Cave Chaos Clip"},["Title"]="Cave Chaos Route"})
AutoplayTab:Dropdown({["Value"]=1,["Callback"]=unstableSavannahRoute,["Values"]={[1]="Unstable Savannah",[2]="Unstable Savannah Clip"},["Title"]="Unstable Savannah Route"})
SettingsTab:Section({["Title"]="Update Notice"})
SettingsTab:Paragraph({["Title"]="What's New",["Content"]="View the latest changelog anytime, even if you dismissed it permanently."})
SettingsTab:Button({["Callback"]=showUpdateNotice,["Title"]="Show Update Notice",["Desc"]="Re-opens the changelog dialog"})
SettingsTab:Section({["Title"]="UI Library"})
SettingsTab:Paragraph({["Title"]="Switch UI",["Content"]="Switching will reload the entire script with Rayfield. All current toggles will reset."})
SettingsTab:Button({["Callback"]=switchToRayfield,["Title"]="Switch to Rayfield",["Desc"]="Destroys WindUI and loads the Rayfield version"})
SettingsTab:Section({["Title"]="Toggle Key"})
SettingsTab:Paragraph({["Title"]="Current Key",["Content"]="Default is K. Change it here if needed."})
SettingsTab:Dropdown({["Title"]="Toggle Key",["Value"]=1,["Values"]={[1]="K",[2]="RightShift",[3]="RightCtrl",[4]="Insert",[5]="Home",[6]="Delete",[7]="F4",[8]="F5",[9]="F6"},["Callback"]=winduiTheme,["Desc"]="Key to show/hide the UI (default: K)"})
SettingsTab:Section({["Title"]="WindUI Theme"})
SettingsTab:Paragraph({["Title"]="Theme",["Content"]="Change the colour theme of the WindUI window. Takes effect immediately."})
SettingsTab:Dropdown({["Title"]="Theme",["Value"]=1,["Values"]={[1]="Dark",[2]="Light",[3]="Aqua",[4]="Bloom",[5]="Rose"},["Callback"]=ellaHubV2,["Desc"]="Pick a WindUI colour theme"})
Window:Init()
UI:Notify({["Duration"]=5,["Content"]="Loaded! Press K to toggle.",["Title"]="Ella Hub V2"})
