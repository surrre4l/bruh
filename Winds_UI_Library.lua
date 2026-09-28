--[[
  Winds Recovered (Paid script btw, but dw u got u lol)
  Full executable source — reconstruction junk removed.
]]

local cloneref = cloneref or function(value) return value end
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")

											do
												loadstring([[    function LPH_NO_VIRTUALIZE(f) return f end;
    function LPH_JIT(f) return f end;
    function LPH_NO_UPVALUES(f) return f end;
    function LPH_JIT_MAX(f) return f end;
    function LPH_ENCSTR(s) return s end;
    function LPH_ENCFUNC(f) return f end;
]])()

												do
													local gg = {
														Language = {
															CheckboxEnabled = "Enabled",
															CheckboxDisabled = "Disabled",
															SliderValue = "Value",
															DropdownSelect = "Select",
															DropdownNone = "None",
															DropdownSelected = "Selected",
															ButtonClick = "Click",
															TextboxEnter = "Enter",
															ModuleEnabled = "Enabled",
															ModuleDisabled = "Disabled",
															TabGeneral = "General",
															TabSettings = "Settings",
															Loading = "Loading...",
															Error = "Error",
															Success = "Success",
														},
													}

													getgenv().GG = gg
												end
											end

											language = GG.Language

											convertStringToTable = function(arg)
												local tbl23 = {}

												for match in string.gmatch(arg, "([^,]+)") do
													local match2 = match:match("^%s*(.-)%s*$")
													table.insert(tbl23, match2)
												end

												return tbl23
											end

											convertTableToString = function(arg)
												return table.concat(arg, ", ")
											end

											if not isfolder then
												isfolder = function()
													return false
												end
											end

											if not makefolder then
												makefolder = function()
												end
											end

											if not writefile then
												writefile = function()
												end
											end

											if not readfile then
												readfile = function()
													return nil
												end
											end

											UserInputService = cloneref(game:GetService("UserInputService"))
											ContentProvider = cloneref(game:GetService("ContentProvider"))
											TweenService = cloneref(game:GetService("TweenService"))
											HttpService = cloneref(game:GetService("HttpService"))
											TextService = cloneref(game:GetService("TextService"))
											RunService = cloneref(game:GetService("RunService"))
											Lighting = cloneref(game:GetService("Lighting"))
											Players = cloneref(game:GetService("Players"))
											CoreGui = cloneref(game:GetService("CoreGui"))
											Debris = cloneref(game:GetService("Debris"))
											mouse = Players.LocalPlayer:GetMouse()

											do
												local v101 = CoreGui:FindFirstChild("Winds")

												if v101 then
													Debris:AddItem(v101, 0)
												end
											end

										do
											local obj2, index2, instance

											do
												do
													if not isfolder("WindsRecovered") then
														makefolder("WindsRecovered")
													end

													getgenv()._WindsLoaded = true

													obj2 = setmetatable({
														disconnect = function(arg, arg2)
															if not arg[arg2] then
																return
															end
															arg[arg2]:Disconnect()
															arg[arg2] = nil
														end,
														disconnect_all = function(arg)
															for _, v101 in pairs(arg) do
																local v102 = "function"

																if typeof(v101) ~= v102 then
																	v101:Disconnect()
																end
															end
														end,
													}, Connections)

													do
														local obj3 = setmetatable({
															map = function(arg, arg2, arg3, arg4, arg5, arg6)
																return (arg2 - arg3) * (arg6 - arg5) / (arg4 - arg3) + arg5
															end,
															viewport_point_to_world = function(arg, arg2, arg3)
																local v101 = workspace.CurrentCamera:ScreenPointToRay(arg2.X, arg2.Y)
																return v101.Origin + v101.Direction * arg3
															end,
															get_offset = function(arg)
																return arg:map(workspace.CurrentCamera.ViewportSize.Y, 0, 1080, 8, 56)
															end,
														}, Util)

														index2 = {}
														index2.__index = index2

														index2.new = function(arg)
															local obj4 = setmetatable({ _object = arg, _folder = nil, _frame = nil, _root = nil }, index2)
															obj4:setup()
															return obj4
														end

														index2.create_folder = function(arg)
															local v101 = workspace.CurrentCamera:FindFirstChild("Acrylic")

															if v101 then
																Debris:AddItem(v101, 0)
															end

															local folder = Instance.new("Folder")
															folder.Name = "Acrylic"
															folder.Parent = workspace.CurrentCamera
															arg._folder = folder
														end

														index2.create_depth_of_fields = function()
															local acrylicBlur = Lighting:FindFirstChild("AcrylicBlur") or Instance.new("DepthOfFieldEffect")
															acrylicBlur.FarIntensity = 0
															acrylicBlur.FocusDistance = 0.05
															acrylicBlur.InFocusRadius = 0.1
															acrylicBlur.NearIntensity = 1
															acrylicBlur.Name = "AcrylicBlur"
															acrylicBlur.Parent = Lighting

															for _, v101 in Lighting:GetChildren() do
																if v101:IsA("DepthOfFieldEffect") then
																	if v101 ~= acrylicBlur then
																		obj2[v101] = v101:GetPropertyChangedSignal("FarIntensity"):Connect(function()
																			v101.FarIntensity = 0
																		end)

																		v101.FarIntensity = 0
																	end
																end
															end
														end

														index2.create_frame = function(arg)
															local frame = Instance.new("Frame")
															frame.Size = UDim2.new(1, 0, 1, 0)
															frame.Position = UDim2.new(0.5, 0, 0.5, 0)
															frame.AnchorPoint = Vector2.new(0.5, 0.5)
															frame.BackgroundTransparency = 1
															frame.Parent = arg._object
															arg._frame = frame
														end

														index2.create_root = function(arg)
															local part = Instance.new("Part")
															part.Name = "Root"
															part.Color = Color3.new(0, 0, 0)
															part.Material = Enum.Material.Glass
															part.Size = Vector3.new(1, 1, 0)
															part.Anchored = true
															part.CanCollide = false
															part.CanQuery = false
															part.Locked = true
															part.CastShadow = false
															part.Transparency = 0.98
															part.Parent = arg._folder
															local specialMesh = Instance.new("SpecialMesh")
															specialMesh.MeshType = Enum.MeshType.Brick
															specialMesh.Offset = Vector3.new(0, 0, -0.1)
															specialMesh.Parent = part
															arg._root = part
														end

														index2.setup = function(arg)
															arg:create_depth_of_fields()
															arg:create_folder()
															arg:create_root()
															arg:create_frame()
															arg:render(0.001)
															arg:check_quality_level()
														end

														index2.render = function(arg, arg2)
															local currentCamera = workspace.CurrentCamera
															local screenGui = arg._object:FindFirstAncestorWhichIsA("ScreenGui")
															local vector2 = Vector2.zero
															local vector22 = Vector2.zero
															local vector23 = Vector2.zero
															local flag21 = true

															local function fn32()
																return arg._root ~= nil and arg._object.Visible and (screenGui == nil or screenGui.Enabled)
															end

															local function fn33()
end

																local v101 = obj3:viewport_point_to_world(vector2, arg2)
																local v102 = obj3:viewport_point_to_world(vector22, arg2)
																local v103 = obj3:viewport_point_to_world(vector23, arg2)
																local magnitude = (v102 - v101).Magnitude
																local magnitude2 = (v102 - v103).Magnitude
																local cFrame = currentCamera.CFrame
																arg._root.CFrame = CFrame.fromMatrix((v101 + v103) / 2, cFrame.XVector, cFrame.YVector, cFrame.ZVector)
																arg._root.Mesh.Scale = Vector3.new(magnitude, magnitude2, 0)
															end

															local function fn34()
																local v101 = obj3:get_offset()
																local n = arg._frame.AbsoluteSize - Vector2.new(v101, v101)
																local n36 = arg._frame.AbsolutePosition + Vector2.new(v101 / 2, v101 / 2)
																vector2 = n36
																vector22 = n36 + Vector2.new(n.X, 0)
																vector23 = n36 + n
																flag21 = true
															end

															local function fn35()
																flag21 = true
															end

															obj2.cframe_update = currentCamera:GetPropertyChangedSignal("CFrame"):Connect(fn35)
															obj2.viewport_size_update = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn35)
															obj2.field_of_view_update = currentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(fn35)
															obj2.frame_absolute_position = arg._frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(fn34)
															obj2["frame_size_update"] = arg._frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn34)
															obj2.blur_render = RunService.RenderStepped:Connect(function()
    if not arg._object.Parent then obj2:disconnect("blur_render"); return end
    if fn32() then
        if flag21 then fn33(); flag21 = false end
    end
end)
															fn34()
														end
													end
												end

												do
													index2.check_quality_level = function(arg)
														local gameSettings = UserSettings().GameSettings

														if gameSettings.SavedQualityLevel.Value < 8 then
															arg:change_visiblity(false)
														end

														obj2.quality_level = gameSettings:GetPropertyChangedSignal("SavedQualityLevel"):Connect(function()
															arg:change_visiblity(UserSettings().GameSettings.SavedQualityLevel.Value >= 8)
														end)
													end

													index2.change_visiblity = function(arg, arg2)
														arg._root.Transparency = arg2 and 0.98 or 1
													end

													obj = setmetatable({
														save = function(arg, arg2, arg3)
															local ok, result = pcall(function()
																local json = HttpService:JSONEncode(arg3)
																writefile("WindsRecovered/" .. arg2 .. ".json", json)
															end)

															if not ok then
																warn("[Winds config]", result)
															end
														end,
														load = function(arg, arg2, arg3)
															local ok, result = pcall(function()
																if not isfile("WindsRecovered/" .. arg2 .. ".json") then
																	arg:save(arg2, arg3)
																	return
																end
																local v101 = readfile("WindsRecovered/" .. arg2 .. ".json")
																if not v101 then
																	arg:save(arg2, arg3)
																	return
																end
																return HttpService:JSONDecode(v101)
															end)

															if not ok then
																warn("failed to load config", result)
															end

															return result or { _flags = {}, _keybinds = {}, _library = {} }
														end,
													}, Config)

													Winds = {
														_config = obj:load(game.GameId),
														_choosing_keybind = false,
														_device = nil,
														_ui_open = true,
														_ui_scale = 1,
														_ui_loaded = false,
														_ui = nil,
														_dragging = false,
														_drag_start = nil,
														_container_position = nil,
													}

													Winds.__index = Winds
Winds._connections = obj2

													Winds.new = function()
														local obj3 = setmetatable({ _loaded = false, _tab = 0 }, Winds)
														obj3:create_ui()
														return obj3
													end

													Winds._all_modules = {}

													do
														local instance2 = Instance.new("ScreenGui")
														instance2.Name = "WindsNotifications"
														instance2.ResetOnSpawn = false
														instance2.IgnoreGuiInset = true
														instance2.ZIndexBehavior = Enum.ZIndexBehavior.Global
														instance2.Parent = CoreGui
														instance = Instance.new("Frame")
														instance.Name = "Container"
														instance.Size = UDim2.new(0, 340, 1, -40)
														instance.Position = UDim2.new(0, 20, 1, -20)
														instance.AnchorPoint = Vector2.new(0, 1)
														instance.BackgroundTransparency = 1
														instance.ClipsDescendants = false
														instance.Parent = instance2
													end
												end

												do
													local uiListLayout = Instance.new("UIListLayout")
													uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
													uiListLayout.Padding = UDim.new(0, 12)
													uiListLayout.Parent = instance
												end
											end

											do
												local color = Color3.fromRGB(18, 18, 24)
												local color2 = Color3.fromRGB(42, 45, 65)
												local color3 = Color3.fromRGB(235, 235, 245)
												local color4 = Color3.fromRGB(160, 160, 180)
												Color3.fromRGB(139, 92, 246)
												Color3.fromRGB(167, 139, 250)

												Winds.SendNotification = function(arg)
													local instance2 = Instance.new("Frame")
													instance2.Size = UDim2.new(0, 240, 0, 48)
													instance2.BackgroundTransparency = 1
													instance2.Parent = instance
													local frame = Instance.new("Frame")
													frame.Size = UDim2.new(1, 0, 1, 0)
													frame.BackgroundColor3 = color
													frame.BackgroundTransparency = 0.05
													frame.BorderSizePixel = 0
													frame.Parent = instance2
													local uiCorner = Instance.new("UICorner")
													uiCorner.CornerRadius = UDim.new(0, 14)
													uiCorner.Parent = frame
													local uiStroke = Instance.new("UIStroke")
													uiStroke.Color = color2
													uiStroke.Transparency = 0.1
													uiStroke.Thickness = 1
													uiStroke.Parent = frame
													local instance3 = Instance.new("ImageLabel")
													instance3.BackgroundTransparency = 1
													instance3.Size = UDim2.new(0, 16, 0, 16)
													instance3.Position = UDim2.new(0, 14, 0.5, 0)
													instance3.AnchorPoint = Vector2.new(0, 0.5)
													instance3.Image = arg.icon or ""
													instance3.ImageColor3 = arg.iconColor or Color3.fromRGB(200, 200, 200)
													instance3.Parent = frame
													local textLabel = Instance.new("TextLabel")
													textLabel.Text = arg.title or "Notification"
													textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
													textLabel.TextSize = 13
													textLabel.TextColor3 = color3
													textLabel.BackgroundTransparency = 1
													textLabel.Position = UDim2.new(0, 44, 0, 8)
													textLabel.Size = UDim2.new(1, -56, 0, 16)
													textLabel.TextXAlignment = Enum.TextXAlignment.Left
													textLabel.TextTruncate = Enum.TextTruncate.AtEnd
													textLabel.Parent = frame
													local textLabel2 = Instance.new("TextLabel")
													textLabel2.Text = arg.text or ""
													textLabel2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular)
													textLabel2.TextSize = 13
													textLabel2.TextColor3 = color4
													textLabel2.BackgroundTransparency = 1
													textLabel2.Position = UDim2.new(0, 44, 0, 24)
													textLabel2.Size = UDim2.new(1, -56, 0, 16)
													textLabel2.TextWrapped = false
													textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
													textLabel2.TextXAlignment = Enum.TextXAlignment.Left
													textLabel2.Parent = frame
													frame.Position = UDim2.new(-1, 0, 0, 0)
													TweenService:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) }):Play()

													task.delay(arg.duration or 5, function()
														TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { Position = UDim2.new(-1, 0, 0, 0), BackgroundTransparency = 1 }):Play()

														task.delay(0.3, function()
															instance2:Destroy()
														end)
													end)
												end
											end

											Winds.get_screen_scale = function(arg)
												arg._ui_scale = workspace.CurrentCamera.ViewportSize.X / 1920
											end

											Winds.get_device = function(arg)
												local device

												if not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
													device = "PC"
												elseif UserInputService.TouchEnabled then
													device = "Mobile"
												else
													device = "Unknown"

													if UserInputService.GamepadEnabled then
														device = "Console"
													end
												end

												arg._device = device
											end

											Winds.removed = function(arg, arg2)
												arg._ui.AncestryChanged:Once(arg2)
											end

											Winds.flag_type = function(arg, arg2, arg3)
												if not Winds._config._flags[arg2] then
													return
												end
												return typeof(Winds._config._flags[arg2]) == arg3
											end

											Winds.remove_table_value = function(arg, arg2, arg3)
												for k, v101 in pairs(arg2) do
													if v101 == arg3 then
														table.remove(arg2, k)
													end
												end
											end

											Winds.create_ui = function(arg)
												local winds = CoreGui:FindFirstChild("Winds")

												if winds then
													Debris:AddItem(winds, 0)
												end

												local screenGui = Instance.new("ScreenGui")
												screenGui.ResetOnSpawn = false
												screenGui.Name = "Winds"
												screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
												screenGui.Parent = CoreGui
												local frame = Instance.new("Frame")
												frame.ClipsDescendants = true
												frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
												frame.AnchorPoint = Vector2.new(0.5, 0.5)
												frame.Name = "Container"
												frame.BackgroundColor3 = Color3.fromRGB(12, 14, 16)
												frame.Position = UDim2.new(0.5, 0, 0.5, 0)
												frame.Size = UDim2.new(0, 0, 0, 0)
												frame.Active = true
												frame.BorderSizePixel = 0
												frame.Parent = screenGui
												local uiCorner = Instance.new("UICorner")
												uiCorner.CornerRadius = UDim.new(0, 16)
												uiCorner.Parent = frame
												local instance2 = Instance.new("Frame")
												instance2.BackgroundTransparency = 1
												instance2.Name = "Handler"
												instance2.BorderColor3 = Color3.fromRGB(0, 0, 0)
												instance2.Size = UDim2.new(0, 698, 0, 479)
												instance2.BorderSizePixel = 0
												instance2.ZIndex = 2
												instance2.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
												instance2.Parent = frame
												local frame2 = Instance.new("Frame")
												frame2.Name = "Search"
												frame2.Size = UDim2.new(0, 240, 0, 34)
												frame2.Position = UDim2.new(0, 180, 0, 12)
												frame2.AnchorPoint = Vector2.new(0, 0)
												frame2.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
												frame2.BackgroundTransparency = 0.1
												frame2.BorderSizePixel = 0
												frame2.Parent = instance2
												local uiCorner2 = Instance.new("UICorner")
												uiCorner2.CornerRadius = UDim.new(1, 0)
												uiCorner2.Parent = frame2
												local uiStroke = Instance.new("UIStroke")
												uiStroke.Color = Color3.fromRGB(38, 42, 58)
												uiStroke.Transparency = 0.5
												uiStroke.Parent = frame2
												local imageButton = Instance.new("ImageButton")
												imageButton.Size = UDim2.new(0, 18, 0, 18)
												imageButton.Position = UDim2.new(0, 8, 0.5, 0)
												imageButton.AnchorPoint = Vector2.new(0, 0.5)
												imageButton.ImageColor3 = Color3.fromRGB(139, 92, 246)
												imageButton.BackgroundTransparency = 1
												imageButton.Image = "rbxassetid://117707949657765"
												imageButton.Parent = frame2
												local textBox = Instance.new("TextBox")
												textBox.Size = UDim2.new(1, -44, 1, 0)
												textBox.Position = UDim2.new(0, 40, 0, 0)
												textBox.TextXAlignment = Enum.TextXAlignment.Left
												textBox.TextYAlignment = Enum.TextYAlignment.Center
												textBox.BackgroundTransparency = 1
												textBox.TextTransparency = 0
												textBox.PlaceholderText = "Search Functions.."
												textBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 140)
												textBox.TextColor3 = Color3.fromRGB(235, 235, 245)
												textBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular)
												textBox.TextSize = 12
												textBox.ClearTextOnFocus = false
												textBox.Text = ""
												textBox.Parent = frame2
												local uiPadding = Instance.new("UIPadding")
												uiPadding.PaddingLeft = UDim.new(0, 2)
												uiPadding.Parent = textBox
												local v101 = nil

												local function fn32(arg2)
													local v102 = string.lower(arg2)
													if v102 == v101 then
														return
													end
													v101 = v102
													local flag21 = v102 == ""

													for _, allModule in ipairs(Winds._all_modules) do
														local visible = flag21 or string.find(allModule.title, v102, 1, true) ~= nil

														if allModule.frame.Visible ~= visible then
															allModule.frame.Visible = visible
														end
													end
												end

												textBox:GetPropertyChangedSignal("Text"):Connect(function()
													fn32(textBox.Text)
												end)

												local instance3 = Instance.new("ScrollingFrame")
												instance3.ScrollBarImageTransparency = 1
												instance3.ScrollBarThickness = 0
												instance3.Name = "Tabs"
												instance3.Size = UDim2.new(0, 129, 0, 401)
												instance3.Selectable = false
												instance3.AutomaticCanvasSize = Enum.AutomaticSize.XY
												instance3.BackgroundTransparency = 1
												instance3.Position = UDim2.new(0.03, 0, 0.16, 0)
												instance3.BorderColor3 = Color3.fromRGB(0, 0, 0)
												instance3.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
												instance3.BorderSizePixel = 0
												instance3.CanvasSize = UDim2.new(0, 0, 0.5, 0)
												instance3.Parent = instance2
												local frame3 = Instance.new("Frame")
												frame3.Name = "Divider"
												frame3.BackgroundTransparency = 0.5
												frame3.BorderSizePixel = 0
												frame3.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
												frame3.Position = UDim2.new(0.03, 0, 0.125, 0)
												frame3.Size = UDim2.new(0, 650, 0, 1)
												frame3.Parent = instance2
												local uiGradient = Instance.new("UIGradient")
												local numberSequence = NumberSequence.new
												local tbl23 = {}
												local v102 = NumberSequenceKeypoint.new(0, 1)
												local v103 = NumberSequenceKeypoint.new(0.58, 0)
												local new = NumberSequenceKeypoint.new
												tbl23[1] = v102
												tbl23[2] = v103

												do
													local values = table.pack(new(1, 1))
													table.move(values, 1, values.n, 3, tbl23)
												end

												uiGradient.Transparency = numberSequence(tbl23)
												uiGradient.Parent = frame3
												local frame4 = Instance.new("Frame")
												frame4.Name = "Divider"
												frame4.BackgroundTransparency = 0.5
												frame4.BorderSizePixel = 0
												frame4.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
												frame4.Position = UDim2.new(0, 0, 0.9, 0)
												frame4.Size = UDim2.new(0, 150, 0, 1)
												frame4.Parent = instance2
												frame4.Visible = false
												local uiGradient2 = Instance.new("UIGradient")
												local numberSequence2 = NumberSequence.new
												local tbl24 = {}
												local v104 = NumberSequenceKeypoint.new(0, 1)
												local v105 = NumberSequenceKeypoint.new(0.5, 0)
												local new2 = NumberSequenceKeypoint.new
												local v106 = 1
												tbl24[1] = v104
												tbl24[2] = v105

												do
													local values = table.pack(new2(1, v106))
													table.move(values, 1, values.n, 3, tbl24)
												end

												uiGradient2.Transparency = numberSequence2(tbl24)
												uiGradient2.Parent = frame4
												local instance4 = Instance.new("UIListLayout")
												instance4.Padding = UDim.new(0, 5)
												instance4.SortOrder = Enum.SortOrder.LayoutOrder
												instance4.Parent = instance3
												local instance5 = Instance.new("TextLabel")
												instance5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
												instance5.TextColor3 = Color3.fromRGB(139, 92, 246)
												instance5.TextTransparency = 0.20000000298023224
												instance5.Text = "Winds"
												instance5.Name = "ClientName"
												instance5.Size = UDim2.new(0, 30, 0, 13)
												instance5.AnchorPoint = Vector2.new(0, 0.5)
												instance5.Position = UDim2.new(0.03, 0, 0.054999999701976776, 0)
												instance5.BackgroundTransparency = 1
												instance5.TextXAlignment = Enum.TextXAlignment.Left
												instance5.BorderSizePixel = 0
												instance5.BorderColor3 = Color3.fromRGB(0, 0, 0)
												instance5.TextSize = 15
												instance5.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
												instance5.Parent = instance2
												local uiGradient3 = Instance.new("UIGradient")
												local colorSequence = ColorSequence.new
												local tbl25 = {}
												local v107 = ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 92, 246))
												local v108 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0))
												local new3 = ColorSequenceKeypoint.new
												local v109 = 1
												local color = Color3.fromRGB
												local v110 = 139
												tbl25[1] = v107
												tbl25[2] = v108

												do
													local values = table.pack(new3(v109, color(v110, 92, 246)))
													table.move(values, 1, values.n, 3, tbl25)
												end

												uiGradient3.Color = colorSequence(tbl25)
												uiGradient3.Offset = Vector2.new(-1, 0)
												uiGradient3.Parent = instance5
												local TweenService = game:GetService("TweenService")
												TweenService:Create(uiGradient3, TweenInfo.new(1.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), { Offset = Vector2.new(1, 0) }):Play()
												local instance6 = Instance.new("Frame")
												instance6.Name = "Pin"
												instance6.Position = UDim2.new(0.026000000536441803, 0, 0.135, 0)
												instance6.BorderColor3 = Color3.fromRGB(0, 0, 0)
												instance6.Size = UDim2.new(0, 2, 0, 16)
												instance6.BorderSizePixel = 0
												instance6.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
												instance6.Parent = instance2
												instance6.Visible = false
												local uiCorner3 = Instance.new("UICorner")
												uiCorner3.CornerRadius = UDim.new(0, 12)
												uiCorner3.Parent = instance6
												local instance7 = Instance.new("ImageLabel")
												instance7.ScaleType = Enum.ScaleType.Fit
												instance7.BorderColor3 = Color3.fromRGB(0, 0, 0)
												instance7.AnchorPoint = Vector2.new(0, 0.5)
												instance7.Image = "rbxassetid://87073625404390"
												instance7.BackgroundTransparency = 1
												instance7.Position = UDim2.new(0.82, 0, 0.054999999701976776, 0)
												instance7.Name = "Icon"
												instance7.Size = UDim2.new(0, 25, 0, 25)
												instance7.BorderSizePixel = 0
												instance7.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
												instance7.Parent = instance2
												instance7.ImageRectSize = Vector2.new(32, 32)
												local n = 0

												task.spawn(function()
													while instance7.Parent do
														if instance7.Visible then
															n = n % 10 + 1
															instance7.ImageRectOffset = Vector2.new((n - 1) * 32, 0)
														end

														task.wait(0.16666666666666666)
													end
												end)

												local folder = Instance.new("Folder")
												folder.Name = "Sections"
												folder.Parent = instance2
												local instance8 = Instance.new("TextButton")
												instance8.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
												instance8.TextColor3 = Color3.fromRGB(0, 0, 0)
												instance8.BorderColor3 = Color3.fromRGB(0, 0, 0)
												instance8.Text = ""
												instance8.AutoButtonColor = false
												instance8.Name = "Minimize"
												instance8.BackgroundTransparency = 1
												instance8.Position = UDim2.new(0.020057305693626404, 0, 0.885, 0)
												instance8.Size = UDim2.new(0, 24, 0, 24)
												instance8.BorderSizePixel = 0
												instance8.TextSize = 14
												instance8.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
												instance8.Parent = instance2
												local instance9 = Instance.new("Frame")
												instance9.Name = "PlayerCapsule"
												instance9.Size = UDim2.new(0, 140, 0, 40)
												instance9.AnchorPoint = Vector2.new(0, 1)
												instance9.Position = UDim2.new(0, 14, 1, -14)
												instance9.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
												instance9.BackgroundTransparency = 0.2
												instance9.BorderSizePixel = 0
												instance9.Parent = instance2
												local uiCorner4 = Instance.new("UICorner")
												uiCorner4.CornerRadius = UDim.new(1, 0)
												uiCorner4.Parent = instance9
												local instance10 = Instance.new("UIStroke")
												instance10.Color = Color3.fromRGB(55, 55, 60)
												instance10.Transparency = 0.65
												instance10.Thickness = 1
												instance10.Parent = instance9
												local imageLabel = Instance.new("ImageLabel")
												imageLabel.Size = UDim2.new(0, 30, 0, 30)
												imageLabel.Position = UDim2.new(0, 8, 0.5, 0)
												imageLabel.AnchorPoint = Vector2.new(0, 0.5)
												imageLabel.BackgroundTransparency = 1
												imageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

												task.spawn(function()
													local ok, image = pcall(function()
														return Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
													end)

													if ok then
														imageLabel.Image = image
													end
												end)

												imageLabel.Parent = instance9
												local uiCorner5 = Instance.new("UICorner")
												uiCorner5.CornerRadius = UDim.new(1, 0)
												uiCorner5.Parent = imageLabel
												local frame5 = Instance.new("Frame")
												frame5.Size = UDim2.new(1, -52, 1, 0)
												frame5.Position = UDim2.new(0, 46, 0, 0)
												frame5.BackgroundTransparency = 1
												frame5.Parent = instance9
												local textLabel = Instance.new("TextLabel")
												textLabel.Size = UDim2.new(1, 0, 0, 18)
												textLabel.Position = UDim2.new(0, 0, 0, 5)
												textLabel.BackgroundTransparency = 1
												textLabel.Text = Players.LocalPlayer.DisplayName or Players.LocalPlayer.Name
												textLabel.TextXAlignment = Enum.TextXAlignment.Left
												textLabel.TextYAlignment = Enum.TextYAlignment.Center
												textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
												textLabel.TextSize = 13
												textLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
												textLabel.Parent = frame5
												local textLabel2 = Instance.new("TextLabel")
												textLabel2.Size = UDim2.new(1, 0, 0, 14)
												textLabel2.Position = UDim2.new(0, 0, 0, 20)
												textLabel2.BackgroundTransparency = 1
												textLabel2.Text = "Customer"
												textLabel2.TextXAlignment = Enum.TextXAlignment.Left
												textLabel2.TextYAlignment = Enum.TextYAlignment.Center
												textLabel2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular)
												textLabel2.TextSize = 11
												textLabel2.TextColor3 = Color3.fromRGB(160, 160, 165)
												textLabel2.Parent = frame5
												local RunService = game:GetService("RunService")
												local Stats = game:GetService("Stats")
												local frame6 = Instance.new("Frame")
												frame6.Name = "StatsCapsule"
												frame6.Size = UDim2.new(0, 150, 0, 32)
												frame6.AnchorPoint = Vector2.new(1, 0)
												frame6.Position = UDim2.new(1, -14, 0, 13)
												frame6.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
												frame6.BackgroundTransparency = 0.05
												frame6.BorderSizePixel = 0
												frame6.Parent = instance2
												Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)
												local instance11 = Instance.new("UIStroke", frame6)
												instance11.Color = Color3.fromRGB(55, 55, 60)
												instance11.Transparency = 0.65
												instance11.Thickness = 1
												local textLabel3 = Instance.new("TextLabel")
												textLabel3.BackgroundTransparency = 1
												textLabel3.Size = UDim2.new(1, -16, 1, 0)
												textLabel3.Position = UDim2.new(0, 8, 0, 0)
												textLabel3.TextXAlignment = Enum.TextXAlignment.Left
												textLabel3.TextYAlignment = Enum.TextYAlignment.Center
												textLabel3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
												textLabel3.TextSize = 12
												textLabel3.TextColor3 = Color3.fromRGB(230, 230, 235)
												textLabel3.Parent = frame6
												os.clock()
												local v111 = nil

												pcall(function()
													v111 = Stats.Network.ServerStatsItem["Data Ping"]
												end)

												do
    local elapsed, frames = 0, 0
    textLabel3.Text = "FPS -- | Ping --"
    obj2.performance_label = RunService.RenderStepped:Connect(function(dt)
        if not textLabel3.Parent then obj2:disconnect("performance_label"); return end
        elapsed += dt
        frames += 1
        if elapsed < 0.5 then return end
        local ping = 0
        if v111 then pcall(function() ping = v111:GetValue() end) end
        textLabel3.Text = string.format("%d FPS | %d ms", math.floor(frames / elapsed + 0.5), math.floor(ping + 0.5))
        elapsed, frames = 0, 0
    end)
end
												local uiScale = Instance.new("UIScale")
												uiScale.Parent = frame
												arg._ui = screenGui
screenGui.Destroying:Connect(function()
    obj2:disconnect_all()
end)
												local position = frame.Position
												local vector2 = Vector2.zero
												local v112 = nil
												local connection = nil
												local flag21 = false

												local function fn33()
													if connection then
														connection:Disconnect()
														connection = nil
													end

													v112 = nil
												end

												local function fn34(arg2)
													return arg2.UserInputState == Enum.UserInputState.End or arg2.UserInputState == Enum.UserInputState.Cancel
												end

												local function fn35()
													if not v112 then
														return
													end
													fn33()
													arg._dragging = false
												end

												local function fn36(arg2)
													fn33()
													v112 = arg2
													flag21 = arg2.UserInputType == Enum.UserInputType.Touch
													vector2 = Vector2.new(arg2.Position.X, arg2.Position.Y)
													position = frame.Position
													arg._dragging = false

													connection = arg2.Changed:Connect(function(arg3)
														if arg3 == "UserInputState" and fn34(arg2) then
															fn35()
														end
													end)
												end

												local function fn37(arg2)
													local vector22 = Vector2.new(arg2.Position.X - vector2.X, arg2.Position.Y - vector2.Y)

													if not arg._dragging then
														if vector22.Magnitude < 3 then
															return
														end
														arg._dragging = true
													end

													frame.Position = UDim2.new(position.X.Scale, position.X.Offset + vector22.X, position.Y.Scale, position.Y.Offset + vector22.Y)
												end

												local function fn38(input)
													if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
														fn36(input)
													end
												end

												local function fn39(input)
													if not v112 then
														return
													end

													if flag21 then
														if input == v112 then
															fn37(input)
														end
													elseif input.UserInputType == Enum.UserInputType.MouseMovement then
														fn37(input)
													end
												end

												obj2.container_input_began = frame.InputBegan:Connect(fn38)
												obj2.input_changed = UserInputService.InputChanged:Connect(fn39)

												obj2["input_ended"] = UserInputService.InputEnded:Connect(function(input)
													if not v112 then
														return
													end

													if input == v112 or not flag21 and input.UserInputType == Enum.UserInputType.MouseButton1 then
														fn35()
													end
												end)

												arg:removed(function()
													arg._ui = nil
													obj2:disconnect_all()
												end)

												arg.Update1Run = function(arg2, arg3)
													if arg3 == "nil" then
														frame.BackgroundTransparency = 0.05000000074505806
													else
														local v113 = 13

															frame.BackgroundTransparency = tonumber(arg3)
														else
end
													end
												end

												arg.UIVisiblity = function()
													screenGui.Enabled = not screenGui.Enabled
												end

												arg.change_visiblity = function(arg2, arg3)
													if arg3 then
														TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(698, 479) }):Play()
													else
														TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(104.5, 52) }):Play()
													end
												end

												arg.load = function(arg2)
													arg2:get_device()

													if arg2._device == "Mobile" or arg2._device == "Unknown" then
														arg2:get_screen_scale()
														uiScale.Scale = arg2._ui_scale

														obj2.ui_scale = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
															arg2:get_screen_scale()
															uiScale.Scale = arg2._ui_scale
														end)
													end

													TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(698, 479) }):Play()
													index2.new(frame)
													arg2._ui_loaded = true

													task.spawn(function()
														local tbl26 = {}

														for _, v113 in screenGui:GetDescendants() do
															if v113:IsA("ImageLabel") then
																table.insert(tbl26, v113)
															end
														end

														pcall(function()
															ContentProvider:PreloadAsync(tbl26)
														end)
													end)
												end

												arg.update_tabs = function(arg2, arg3)
													for _, v113 in instance3:GetChildren() do
														if v113.Name == "Tab" then
															if v113 == arg3 then
																if v113.BackgroundTransparency ~= 0.5 then
																	local n36 = v113.LayoutOrder * 0.086923076923076922
																	TweenService:Create(instance6, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.fromScale(0.026, 0.135 + n36) }):Play()
																	TweenService:Create(v113, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = 0.08 }):Play()
																	TweenService:Create(v113.TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextTransparency = 0.2, TextColor3 = Color3.fromRGB(139, 92, 246) }):Play()
																	TweenService:Create(v113.TextLabel.UIGradient, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Offset = Vector2.new(1, 0) }):Play()
																	TweenService:Create(v113.Icon, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { ImageTransparency = 0.2, ImageColor3 = Color3.fromRGB(139, 92, 246) }):Play()
																end
															elseif v113.BackgroundTransparency ~= 1 then
																TweenService:Create(v113, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()

																TweenService:Create(v113.TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
																	TextTransparency = 0.3,
																	TextColor3 = Color3.fromRGB(235, 235, 245),
																}):Play()

																TweenService:Create(v113.TextLabel.UIGradient, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Offset = Vector2.new(0, 0) }):Play()
																TweenService:Create(v113.Icon, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { ImageTransparency = 0.4, ImageColor3 = Color3.fromRGB(235, 235, 245) }):Play()
															end
														end
													end
												end

												arg.update_sections = function(arg2, arg3, arg4)
													if false then -- removed missing opaque flag guard
														return
													end

													for _, v113 in folder:GetChildren() do
														if v113 == arg3 or v113 == arg4 then
															v113.Visible = true
														else
															v113.Visible = false
														end
													end
												end

												arg.create_tab = function(arg2, text, image)
													local tbl26 = {}
													local instance12 = Instance.new("GetTextBoundsParams")
													instance12.Text = text
													instance12.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
													instance12.Size = 13
													instance12.Width = 10000
													local textBoundsAsync = TextService:GetTextBoundsAsync(instance12)
													local flag22 = not instance3:FindFirstChild("Tab")
													local textButton = Instance.new("TextButton")
													textButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
													textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
													textButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
													textButton.Text = ""
													textButton.AutoButtonColor = false
													textButton.BackgroundTransparency = 1
													textButton.Name = "Tab"
													textButton.Size = UDim2.new(0, 129, 0, 38)
													textButton.BorderSizePixel = 0
													textButton.TextSize = 14
													textButton.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
													textButton.Parent = instance3
													textButton.LayoutOrder = arg2._tab
													local instance13 = Instance.new("UICorner")
													instance13.CornerRadius = UDim.new(0, 6)
													instance13.Parent = textButton
													local textLabel4 = Instance.new("TextLabel")
													textLabel4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
													textLabel4.TextColor3 = Color3.fromRGB(235, 235, 245)
													textLabel4.TextTransparency = 0.3
													textLabel4.Text = text
													textLabel4.Size = UDim2.new(0, textBoundsAsync.X, 0, 16)
													textLabel4.AnchorPoint = Vector2.new(0, 0.5)
													textLabel4.Position = UDim2.new(0.26, 0, 0.5, 0)
													textLabel4.BackgroundTransparency = 1
													textLabel4.TextXAlignment = Enum.TextXAlignment.Left
													textLabel4.BorderSizePixel = 0
													textLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
													textLabel4.TextSize = 13
													textLabel4.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
													textLabel4.Parent = textButton
													local uiGradient4 = Instance.new("UIGradient")
													local colorSequence2 = ColorSequence.new
													local tbl27 = {}
													local v113 = ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 235, 245))
													local v114 = ColorSequenceKeypoint.new(0.7, Color3.fromRGB(140, 150, 180))
													local new4 = ColorSequenceKeypoint.new
													local color2 = Color3.fromRGB
													local v115 = 48
													local v116 = 48
													tbl27[1] = v113
													tbl27[2] = v114

													do
														local values = table.pack(new4(1, color2(v115, v116, 58)))
														table.move(values, 1, values.n, 3, tbl27)
													end

													uiGradient4.Color = colorSequence2(tbl27)
													uiGradient4.Parent = textLabel4
													local instance14 = Instance.new("ImageLabel")
													instance14.ScaleType = Enum.ScaleType.Fit
													instance14.ImageTransparency = 0.3
													instance14.BorderColor3 = Color3.fromRGB(0, 0, 0)
													instance14.AnchorPoint = Vector2.new(0, 0.5)
													instance14.BackgroundTransparency = 1
													instance14.Position = UDim2.new(0.10000000149011612, 0, 0.5, 0)
													instance14.Name = "Icon"
													instance14.Image = image
													instance14.Size = UDim2.new(0, 12, 0, 14)
													instance14.BorderSizePixel = 0
													instance14.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
													instance14.Parent = textButton
													local scrollingFrame = Instance.new("ScrollingFrame")
													scrollingFrame.Name = "LeftSection"
													scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
													scrollingFrame.ScrollBarThickness = 0
													scrollingFrame.Size = UDim2.new(0, 243, 0, 360)
													scrollingFrame.Selectable = false
													scrollingFrame.AnchorPoint = Vector2.new(0, 0)
													scrollingFrame.ScrollBarImageTransparency = 1
													scrollingFrame.BackgroundTransparency = 1
													scrollingFrame.Position = UDim2.new(0.235, 0, 0.16, 0)
													scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
													scrollingFrame.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
													scrollingFrame.BorderSizePixel = 0
													scrollingFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
													scrollingFrame.Visible = false
													scrollingFrame.Parent = folder
													local uiListLayout = Instance.new("UIListLayout")
													uiListLayout.Padding = UDim.new(0, 11)
													uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
													uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
													uiListLayout.Parent = scrollingFrame
													local instance15 = Instance.new("UIPadding")
													instance15.PaddingTop = UDim.new(0, 1)
													instance15.Parent = scrollingFrame
													local scrollingFrame2 = Instance.new("ScrollingFrame")
													scrollingFrame2.Name = "RightSection"
													scrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.XY
													scrollingFrame2.ScrollBarThickness = 0
													scrollingFrame2.Size = UDim2.new(0, 243, 0, 360)
													scrollingFrame2.Selectable = false
													scrollingFrame2.AnchorPoint = Vector2.new(0, 0)
													scrollingFrame2.ScrollBarImageTransparency = 1
													scrollingFrame2.BackgroundTransparency = 1
													scrollingFrame2.Position = UDim2.new(0.6, 0, 0.16, 0)
													scrollingFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
													scrollingFrame2.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
													scrollingFrame2.BorderSizePixel = 0
													scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0.5, 0)
													scrollingFrame2.Visible = false
													scrollingFrame2.Parent = folder
													local uiListLayout2 = Instance.new("UIListLayout")
													uiListLayout2.Padding = UDim.new(0, 11)
													uiListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
													uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
													uiListLayout2.Parent = scrollingFrame2
													local uiPadding2 = Instance.new("UIPadding")
													uiPadding2.PaddingTop = UDim.new(0, 1)
													uiPadding2.Parent = scrollingFrame2
													arg2._tab = arg2._tab + 1

													if flag22 then
														arg2:update_tabs(textButton, scrollingFrame, scrollingFrame2)
														arg2:update_sections(scrollingFrame, scrollingFrame2)
													end

													textButton.MouseButton1Click:Connect(function()
														arg2:update_tabs(textButton, scrollingFrame, scrollingFrame2)
														arg2:update_sections(scrollingFrame, scrollingFrame2)
													end)

													tbl26.create_module = function(arg3, arg4)
														local v117 = 0
														local tbl28 = { _state = false, _size = 0, _multiplier = 0 }

														if arg4.section == "right" then
															arg4.section = scrollingFrame2
														else
															arg4.section = scrollingFrame
														end

														local instance16 = Instance.new("Frame")
														instance16.ClipsDescendants = true
														instance16.BorderColor3 = Color3.fromRGB(0, 0, 0)
														instance16.BackgroundTransparency = 0.7
														instance16.Position = UDim2.new(0.0041152262128889561, 0, 0, 0)
														instance16.Name = "Module"
														instance16.Size = UDim2.new(1, -8, 0, 93)
														instance16.BorderSizePixel = 0
														instance16.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
														instance16.Parent = arg4.section
														local uiListLayout3 = Instance.new("UIListLayout")
														uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
														uiListLayout3.Parent = instance16
														local instance17 = Instance.new("UICorner")
														instance17.CornerRadius = UDim.new(0, 8)
														instance17.Parent = instance16
														local uiStroke2 = Instance.new("UIStroke")
														uiStroke2.Color = Color3.fromRGB(38, 42, 58)
														uiStroke2.Transparency = 0.5
														uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
														uiStroke2.Parent = instance16
														local textButton2 = Instance.new("TextButton")
														textButton2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
														textButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
														textButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
														textButton2.Text = ""
														textButton2.AutoButtonColor = false
														textButton2.BackgroundTransparency = 1
														textButton2.Name = "Header"
														textButton2.Size = UDim2.new(1, 0, 0, 93)
														textButton2.BorderSizePixel = 0
														textButton2.TextSize = 14
														textButton2.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
														textButton2.Parent = instance16
														table.insert(Winds._all_modules, { frame = instance16, title = string.lower(arg4.title or "") })
														local imageLabel2 = Instance.new("ImageLabel")
														imageLabel2.ImageColor3 = Color3.fromRGB(152, 181, 255)
														imageLabel2.ScaleType = Enum.ScaleType.Fit
														imageLabel2.BorderColor3 = Color3.fromRGB(139, 92, 246)
														imageLabel2.AnchorPoint = Vector2.new(0, 0.5)
														imageLabel2.Image = "rbxassetid://79095934438045"
														imageLabel2.BackgroundTransparency = 1
														imageLabel2.Position = UDim2.new(0.073, 0, 0.81999999284744263, 0)
														imageLabel2.Name = "Icon"
														imageLabel2.Size = UDim2.new(0, 10, 0, 10)
														imageLabel2.BorderSizePixel = 0
														imageLabel2.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
														imageLabel2.Parent = textButton2
														imageLabel2.Visible = false
														local textLabel5 = Instance.new("TextLabel")
														textLabel5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
														textLabel5.TextColor3 = Color3.fromRGB(139, 92, 246)
														textLabel5.TextTransparency = 0.2

														if not arg4.rich then
															textLabel5.Text = arg4.title or "Skibidi"
														else
															textLabel5.RichText = true
															textLabel5.Text = arg4.richtext or "<font color='rgb(255,0,0)'>Winds</font> user"
														end

														textLabel5.Name = "ModuleName"
														textLabel5.Size = UDim2.new(0, 205, 0, 13)
														textLabel5.AnchorPoint = Vector2.new(0, 0.5)
														textLabel5.Position = UDim2.new(0.072999998927116394, 0, 0.22, 0)
														textLabel5.BackgroundTransparency = 1
														textLabel5.TextXAlignment = Enum.TextXAlignment.Left
														textLabel5.BorderSizePixel = 0
														textLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
														textLabel5.TextSize = 13
														textLabel5.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
														textLabel5.Parent = textButton2
														local instance18 = Instance.new("TextLabel")
														instance18.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
														instance18.TextColor3 = Color3.fromRGB(139, 92, 246)
														instance18.TextTransparency = 0.69999998807907104
														instance18.Text = arg4.description
														instance18.Name = "Description"
														instance18.Size = UDim2.new(0, 205, 0, 13)
														instance18.AnchorPoint = Vector2.new(0, 0.5)
														instance18.Position = UDim2.new(0.072999998927116394, 0, 0.41999998688697815, 0)
														instance18.BackgroundTransparency = 1
														instance18.TextXAlignment = Enum.TextXAlignment.Left
														instance18.BorderSizePixel = 0
														instance18.BorderColor3 = Color3.fromRGB(0, 0, 0)
														instance18.TextSize = 10
														instance18.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
														instance18.Parent = textButton2
														local instance19 = Instance.new("Frame")
														instance19.Name = "Toggle"
														instance19.BackgroundTransparency = 0.7
														instance19.Position = UDim2.new(0.073, 0, 0.72, 0)
														instance19.BorderColor3 = Color3.fromRGB(0, 0, 0)
														instance19.Size = UDim2.new(0, 25, 0, 12)
														instance19.BorderSizePixel = 0
														instance19.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
														instance19.Parent = textButton2
														local uiCorner6 = Instance.new("UICorner")
														uiCorner6.CornerRadius = UDim.new(0, 12)
														uiCorner6.Parent = instance19
														local instance20 = Instance.new("Frame")
														instance20.BorderColor3 = Color3.fromRGB(0, 0, 0)
														instance20.AnchorPoint = Vector2.new(0, 0.5)
														instance20.BackgroundTransparency = 0.20000000298023224
														instance20.Position = UDim2.new(0.1, 0, 0.5, 0)
														instance20.Name = "Circle"
														instance20.Size = UDim2.new(0, 8, 0, 8)
														instance20.BorderSizePixel = 0
														instance20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
														instance20.Parent = instance19
														local uiCorner7 = Instance.new("UICorner")
														uiCorner7.CornerRadius = UDim.new(0, 12)
														uiCorner7.Parent = instance20
														local instance21 = Instance.new("Frame")
														instance21.Name = "Keybind"
														instance21.BackgroundTransparency = 0.69999998807907104
														instance21.Position = UDim2.new(0.78, 0, 0.73500001430511475, 0)
														instance21.BorderColor3 = Color3.fromRGB(0, 0, 0)
														instance21.Size = UDim2.new(0, 33, 0, 15)
														instance21.BorderSizePixel = 0
														instance21.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
														instance21.Parent = textButton2
														local instance22 = Instance.new("UICorner")
														instance22.CornerRadius = UDim.new(0, 3)
														instance22.Parent = instance21
														local textLabel6 = Instance.new("TextLabel")
														textLabel6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
														textLabel6.TextColor3 = Color3.fromRGB(220, 222, 255)
														textLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
														textLabel6.Text = "None"
														textLabel6.AnchorPoint = Vector2.new(0.5, 0.5)
														textLabel6.Size = UDim2.new(0, 25, 0, 13)
														textLabel6.BackgroundTransparency = 1
														textLabel6.TextXAlignment = Enum.TextXAlignment.Left
														textLabel6.Position = UDim2.new(0.5, 0, 0.5, 0)
														textLabel6.BorderSizePixel = 0
														textLabel6.TextSize = 10
														textLabel6.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
														textLabel6.Parent = instance21
														local frame7 = Instance.new("Frame")
														frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
														frame7.AnchorPoint = Vector2.new(0.5, 0)
														frame7.BackgroundTransparency = 0.08
														frame7.Position = UDim2.new(0.5, 0, 0.62000000476837158, 0)
														frame7.Name = "Divider"
														frame7.Size = UDim2.new(0, 241, 0, 1)
														frame7.BorderSizePixel = 0
														frame7.BackgroundColor3 = Color3.fromRGB(38, 42, 58)
														frame7.Parent = textButton2
														local frame8 = Instance.new("Frame")
														frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
														frame8.AnchorPoint = Vector2.new(0.5, 0)
														frame8.BackgroundTransparency = 0.08
														frame8.Position = UDim2.new(0.5, 0, 1, 0)
														frame8.Name = "Divider"
														frame8.Size = UDim2.new(0, 207, 0, 1)
														frame8.BorderSizePixel = 0
														frame8.BackgroundColor3 = Color3.fromRGB(38, 42, 58)
														frame8.Parent = textButton2
														local frame9 = Instance.new("Frame")
														frame9.Name = "Options"
														frame9.BackgroundTransparency = 1
														frame9.Position = UDim2.new(0, 0, 1, 0)
														frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
														frame9.Size = UDim2.new(1, 0, 0, 8)
														frame9.BorderSizePixel = 0
														frame9.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
														frame9.Parent = instance16
														local uiPadding3 = Instance.new("UIPadding")
														uiPadding3.PaddingTop = UDim.new(0, 8)
														uiPadding3.Parent = frame9
														local uiListLayout4 = Instance.new("UIListLayout")
														uiListLayout4.Padding = UDim.new(0, 6)
														uiListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Center
														uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
														uiListLayout4.Parent = frame9

														tbl28.change_state = function(arg5, state)
															arg5._state = state

															if arg5._state then
																TweenService:Create(instance16, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(1, -8, 0, 93 + arg5._size + arg5._multiplier) }):Play()
																TweenService:Create(instance19, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(99, 102, 241) }):Play()

																TweenService:Create(instance20, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
																	Size = UDim2.new(0, 8, 0, 8),
																	Position = UDim2.new(1, -13, 0.5, 0),
																	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
																}):Play()
															else
																TweenService:Create(instance16, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(1, -8, 0, 93) }):Play()
																TweenService:Create(instance19, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(0, 0, 0) }):Play()

																TweenService:Create(instance20, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
																	Size = UDim2.new(0, 8, 0, 8),
																	Position = UDim2.new(0.1, 0, 0.5, 0),
																	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
																}):Play()
															end

															Winds._config._flags[arg4.flag] = arg5._state
															obj:save(game.GameId, Winds._config)
															arg4.callback(arg5._state)
														end

														tbl28.connect_keybind = function(arg5)
															if not Winds._config._keybinds[arg4.flag] then
																return
															end

															obj2[arg4.flag .. "_keybind"] = UserInputService.InputBegan:Connect(function(input, gameProcessed)
																if gameProcessed then
																	return
																end
																local v118 = Winds._config._keybinds[arg4.flag]
																if tostring(input.KeyCode) ~= v118 then
																	return
																end
																arg5:change_state(not arg5._state)
															end)
														end

														tbl28.scale_keybind = function(arg5, arg6)
															if Winds._config._keybinds[arg4.flag] and not arg6 then
																local v118 = string.gsub(tostring(Winds._config._keybinds[arg4.flag]), "Enum.KeyCode.", "")
																local instance23 = Instance.new("GetTextBoundsParams")
																instance23.Text = v118
																instance23.Font = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
																instance23.Size = 10
																instance23.Width = 10000
																local textBoundsAsync2 = TextService:GetTextBoundsAsync(instance23)
																instance21.Size = UDim2.fromOffset(textBoundsAsync2.X + 6, 15)
																textLabel6.Size = UDim2.fromOffset(textBoundsAsync2.X, 13)
															else
																instance21.Size = UDim2.fromOffset(33, 15)
																textLabel6.Size = UDim2.fromOffset(25, 13)
															end
														end

														if Winds:flag_type(arg4.flag, "boolean") then
															tbl28._state = true
															arg4.callback(tbl28._state)
															instance19.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															instance20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															instance20.Position = UDim2.new(1, -13, 0.5, 0)
														end

														if Winds._config._keybinds[arg4.flag] then
															local v118 = "Enum.KeyCode."
															textLabel6.Text = string.gsub(tostring(Winds._config._keybinds[arg4.flag]), v118, "")
															tbl28:connect_keybind()
															tbl28:scale_keybind()
														end

														obj2[arg4.flag .. "_input_began"] = textButton2.InputBegan:Connect(function(input)
															if Winds._choosing_keybind then
																return
															end

															if input.UserInputType ~= Enum.UserInputType.MouseButton3 then
																return
															end
															Winds._choosing_keybind = true

															obj2.keybind_choose_start = UserInputService.InputBegan:Connect(function(input2, gameProcessed)
																if gameProcessed then
																	return
																end

																if input2 == Enum.UserInputState or input2 == Enum.UserInputType then
																	return
																end

																if input2.KeyCode == Enum.KeyCode.Unknown then
																	return
																end

																if input2.KeyCode == Enum.KeyCode.Backspace then
																	tbl28:scale_keybind(true)
																	Winds._config._keybinds[arg4.flag] = nil
																	obj:save(game.GameId, Winds._config)
																	textLabel6.Text = "None"

																	if obj2[arg4.flag .. "_keybind"] then
																		obj2[arg4.flag .. "_keybind"]:Disconnect()
																		obj2[arg4.flag .. "_keybind"] = nil
																	end

																	obj2.keybind_choose_start:Disconnect()
																	obj2.keybind_choose_start = nil
																	Winds._choosing_keybind = false
																	return
																end

																obj2.keybind_choose_start:Disconnect()
																obj2.keybind_choose_start = nil
																Winds._config._keybinds[arg4.flag] = tostring(input2.KeyCode)
																obj:save(game.GameId, Winds._config)

																if obj2[arg4.flag .. "_keybind"] then
																	obj2[arg4.flag .. "_keybind"]:Disconnect()
																	obj2[arg4.flag .. "_keybind"] = nil
																end

																tbl28:connect_keybind()
																tbl28:scale_keybind()
																Winds._choosing_keybind = false
																textLabel6.Text = string.gsub(tostring(Winds._config._keybinds[arg4.flag]), "Enum.KeyCode.", "")
															end)
														end)

														textButton2.MouseButton1Click:Connect(function()
															tbl28:change_state(not tbl28._state)
														end)

														tbl28.create_paragraph = function(arg5, arg6)
															v117 += 1
															local tbl29 = {}

															if arg5._size == 0 then
																arg5._size = 13
															end

															arg5._size = arg5._size + (arg6.customScale or 70)

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local frame10 = Instance.new("Frame")
															frame10.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
															frame10.BackgroundTransparency = 0.1
															frame10.Size = UDim2.new(1, -16, 0, 30)
															frame10.BorderSizePixel = 0
															frame10.Name = "Paragraph"
															frame10.AutomaticSize = Enum.AutomaticSize.Y
															frame10.Parent = frame9
															frame10.LayoutOrder = v117
															local instance23 = Instance.new("UICorner")
															instance23.CornerRadius = UDim.new(0, 5)
															instance23.Parent = frame10
															local textLabel7 = Instance.new("TextLabel")
															textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
															textLabel7.TextColor3 = Color3.fromRGB(225, 230, 240)
															textLabel7.Text = arg6.title or "Label"
															textLabel7.Size = UDim2.new(1, -10, 0, 20)
															textLabel7.Position = UDim2.new(0, 5, 0, 5)
															textLabel7.BackgroundTransparency = 1
															textLabel7.TextXAlignment = Enum.TextXAlignment.Left
															textLabel7.TextYAlignment = Enum.TextYAlignment.Center
															textLabel7.TextSize = 12
															textLabel7.AutomaticSize = Enum.AutomaticSize.XY
															textLabel7.Parent = frame10
															local textLabel8 = Instance.new("TextLabel")
															textLabel8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															textLabel8.TextColor3 = Color3.fromRGB(180, 180, 180)

															if not arg6.rich then
																textLabel8.Text = arg6.text or "Skibidi"
															else
																textLabel8.RichText = true
																textLabel8.Text = arg6.richtext or "<font color='rgb(255,0,0)'>Winds</font> user"
															end

															textLabel8.Size = UDim2.new(1, -12, 0, 20)
															textLabel8.Position = UDim2.new(0, 5, 0, 30)
															textLabel8.BackgroundTransparency = 1
															textLabel8.TextXAlignment = Enum.TextXAlignment.Left
															textLabel8.TextYAlignment = Enum.TextYAlignment.Top
															textLabel8.TextSize = 11
															textLabel8.TextWrapped = true
															textLabel8.AutomaticSize = Enum.AutomaticSize.XY
															textLabel8.Parent = frame10

															frame10.MouseEnter:Connect(function()
																TweenService:Create(frame10, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(42, 50, 66) }):Play()
															end)

															frame10.MouseLeave:Connect(function()
																TweenService:Create(frame10, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(22, 24, 32) }):Play()
															end)

															return tbl29
														end

														tbl28.create_text = function(arg5, arg6)
															v117 += 1
															local tbl29 = {}

															if arg5._size == 0 then
																arg5._size = 11
															end

															arg5._size = arg5._size + (arg6.customScale or 50)

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local frame10 = Instance.new("Frame")
															frame10.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
															frame10.BackgroundTransparency = 0.1
															frame10.Size = UDim2.new(0, 207, 0, arg6.CustomYSize)
															frame10.BorderSizePixel = 0
															frame10.Name = "Text"
															frame10.AutomaticSize = Enum.AutomaticSize.Y
															frame10.Parent = frame9
															frame10.LayoutOrder = v117
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 4)
															uiCorner8.Parent = frame10
															local textLabel7 = Instance.new("TextLabel")
															textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															textLabel7.TextColor3 = Color3.fromRGB(180, 180, 180)

															if not arg6.rich then
																textLabel7.Text = arg6.text or "Skibidi"
															else
																textLabel7.RichText = true
																textLabel7.Text = arg6.richtext or "<font color='rgb(255,0,0)'>Winds</font> user"
															end

															textLabel7.Size = UDim2.new(1, -10, 1, 0)
															textLabel7.Position = UDim2.new(0, 5, 0, 5)
															textLabel7.BackgroundTransparency = 1
															textLabel7.TextXAlignment = Enum.TextXAlignment.Left
															textLabel7.TextYAlignment = Enum.TextYAlignment.Top
															textLabel7.TextSize = 10
															textLabel7.TextWrapped = true
															textLabel7.AutomaticSize = Enum.AutomaticSize.XY
															textLabel7.Parent = frame10

															frame10.MouseEnter:Connect(function()
																TweenService:Create(frame10, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(42, 42, 66) }):Play()
															end)

															frame10.MouseLeave:Connect(function()
																TweenService:Create(frame10, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(22, 24, 32) }):Play()
															end)

															tbl29.Set = function(arg7, arg8)
																	if not arg8.rich then
																		textLabel7.Text = arg8.text or "Skibidi"
																	else
																		textLabel7.RichText = true
																		textLabel7.Text = arg8.richtext or "<font color='rgb(255,0,0)'>Winds</font> user"
																	end

																	return
																end
end

															return tbl29
														end

														tbl28.create_textbox = function(arg5, arg6)
															v117 += 1
															local tbl29 = { _text = "" }
															local flag23 = arg6.multiline == true
															local height

															if flag23 then
																height = arg6.height or 70
															else
																height = flag23
															end

															local n36 = height or 22

															if arg5._size == 0 then
																arg5._size = 11
															end

															arg5._size = arg5._size + 25 + n36

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local textLabel7 = Instance.new("TextLabel")
															textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
															textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.TextTransparency = 0.2
															textLabel7.Text = arg6.title or "Enter text"
															textLabel7.Size = UDim2.new(0, 207, 0, 13)
															textLabel7.AnchorPoint = Vector2.new(0, 0)
															textLabel7.Position = UDim2.new(0, 0, 0, 0)
															textLabel7.BackgroundTransparency = 1
															textLabel7.TextXAlignment = Enum.TextXAlignment.Left
															textLabel7.BorderSizePixel = 0
															textLabel7.Parent = frame9
															textLabel7.TextSize = 10
															textLabel7.LayoutOrder = v117
															local textBox2 = Instance.new("TextBox")
															textBox2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															textBox2.TextColor3 = Color3.fromRGB(235, 235, 245)
															textBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textBox2.PlaceholderText = arg6.placeholder or "Enter text..."
															textBox2.Text = Winds._config._flags[arg6.flag] or ""
															textBox2.Name = "Textbox"
															textBox2.Size = UDim2.new(0, 207, 0, n36)
															textBox2.BorderSizePixel = 0
															textBox2.TextSize = 12
															textBox2.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															textBox2.BackgroundTransparency = 0.9
															textBox2.ClearTextOnFocus = false
															textBox2.ClipsDescendants = true
															textBox2.TextTruncate = Enum.TextTruncate.AtEnd
															textBox2.Parent = frame9
															textBox2.LayoutOrder = v117
															textBox2.TextXAlignment = Enum.TextXAlignment.Left
															textBox2.TextYAlignment = flag23 and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
															local instance23 = Instance.new("UIPadding")
															instance23.PaddingLeft = UDim.new(0, 8)
															instance23.PaddingRight = UDim.new(0, 10)

															if flag23 then
																textBox2.MultiLine = true
																textBox2.TextWrapped = true
																textBox2.ClearTextOnFocus = false
																instance23.PaddingTop = UDim.new(0, 4)
																instance23.PaddingBottom = UDim.new(0, 4)
															end

															instance23.Parent = textBox2
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 4)
															uiCorner8.Parent = textBox2
															local v118 = 0

															local function fn40()
																if not flag23 then
																	return
																end
																local text2 = textBox2.Text

																if text2 == "" then
																	text2 = " "
																end

																local ok, result = pcall(function()
																	local instance24 = Instance.new("GetTextBoundsParams")
																	instance24.Text = text2
																	instance24.Font = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
																	instance24.Size = 10
																	instance24.Width = 195
																	return TextService:GetTextBoundsAsync(instance24)
																end)

																local n37 = math.clamp((ok and result and result.Y or n36) + 12, n36, arg6.max_height or 260)
																local n38 = n37 - n36

																if n38 ~= v118 then
																	v118 = n38
																	textBox2.Size = UDim2.new(0, 207, 0, n37)
																	frame9.Size = UDim2.new(1, -8, 0, arg5._size + n38)

																	if tbl28._state then
																		instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size + n38)
																	end
																end
															end

															tbl29.update_text = function(arg7, text2)
																arg7._text = text2
																Winds._config._flags[arg6.flag] = arg7._text
																obj:save(game.GameId, Winds._config)
																arg6.callback(arg7._text)
																fn40()
															end

															if Winds:flag_type(arg6.flag, "string") then
																tbl29:update_text(Winds._config._flags[arg6.flag])
															end

															if flag23 then
																local flag24 = false

																textBox2:GetPropertyChangedSignal("Text"):Connect(function()
																	if flag24 then
																		return
																	end
																	flag24 = true

																	task.defer(function()
																		flag24 = false
																		fn40()
																	end)
																end)

																task.defer(fn40)
															end

															textBox2.FocusLost:Connect(function()
																tbl29:update_text(textBox2.Text)
															end)

															return tbl29
														end

														tbl28.create_checkbox = function(arg5, arg6)
															v117 += 1
															local tbl29 = { _state = false }

															if arg5._size == 0 then
																arg5._size = 11
															end

															arg5._size = arg5._size + 20

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local textButton3 = Instance.new("TextButton")
															textButton3.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															textButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.Text = ""
															textButton3.AutoButtonColor = false
															textButton3.BackgroundTransparency = 1
															textButton3.Name = "Checkbox"
															textButton3.Size = UDim2.new(0, 207, 0, 10)
															textButton3.BorderSizePixel = 0
															textButton3.TextSize = 14
															textButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.Parent = frame9
															textButton3.LayoutOrder = v117
															local textLabel7 = Instance.new("TextLabel")
															textLabel7.Name = "TitleLabel"

															if language == "th" then
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextSize = 13
															else
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextSize = 11
															end

															textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.TextTransparency = 0.2
															textLabel7.Text = arg6.title or "Skibidi"
															textLabel7.Size = UDim2.new(0, 142, 0, 13)
															textLabel7.AnchorPoint = Vector2.new(0, 0.5)
															textLabel7.Position = UDim2.new(0, 0, 0.5, 0)
															textLabel7.BackgroundTransparency = 1
															textLabel7.TextXAlignment = Enum.TextXAlignment.Left
															textLabel7.Parent = textButton3
															local instance23 = Instance.new("Frame")
															instance23.Name = "Checkbox"
															instance23.Size = UDim2.fromOffset(14, 14)
															instance23.Position = UDim2.new(1, -35, 0.5, 0)
															instance23.AnchorPoint = Vector2.new(0, 0.5)
															instance23.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															instance23.BorderSizePixel = 0
															instance23.Parent = textButton3
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 4)
															uiCorner8.Parent = instance23
															local textLabel8 = Instance.new("TextLabel")
															textLabel8.Name = "Title"
															textLabel8.Size = UDim2.new(1, 0, 1, 0)
															textLabel8.BackgroundTransparency = 1
															textLabel8.TextColor3 = Color3.fromRGB(0, 0, 0)
															textLabel8.TextScaled = false
															textLabel8.TextSize = 12
															textLabel8.Font = Enum.Font.SourceSans
															textLabel8.Text = Winds._config._keybinds[arg6.flag] and string.gsub(tostring(Winds._config._keybinds[arg6.flag]), "Enum.KeyCode.", "") or "..."
															textLabel8.Parent = instance23
															local frame10 = Instance.new("Frame")
															frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame10.AnchorPoint = Vector2.new(1, 0.5)
															frame10.BackgroundTransparency = 0.9
															frame10.Position = UDim2.new(1, 0, 0.5, 0)
															frame10.Name = "Box"
															frame10.Size = UDim2.new(0, 15, 0, 15)
															frame10.BorderSizePixel = 0
															frame10.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															frame10.Parent = textButton3
															local uiCorner9 = Instance.new("UICorner")
															uiCorner9.CornerRadius = UDim.new(0, 5)
															uiCorner9.Parent = frame10
															local instance24 = Instance.new("Frame")
															instance24.AnchorPoint = Vector2.new(0.5, 0.5)
															instance24.BackgroundTransparency = 0.2
															instance24.Position = UDim2.new(0.5, 0, 0.5, 0)
															instance24.BorderColor3 = Color3.fromRGB(0, 0, 0)
															instance24.Name = "Fill"
															instance24.BorderSizePixel = 0
															instance24.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															instance24.Parent = frame10
															local uiCorner10 = Instance.new("UICorner")
															uiCorner10.CornerRadius = UDim.new(0, 5)
															uiCorner10.Parent = instance24

															tbl29.change_state = function(arg7, state)
																arg7._state = state

																if arg7._state then
																	TweenService:Create(frame10, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = 0.7 }):Play()
																	TweenService:Create(instance24, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(9, 9) }):Play()
																else
																	TweenService:Create(frame10, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = 0.9 }):Play()
																	TweenService:Create(instance24, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(0, 0) }):Play()
																end

																Winds._config._flags[arg6.flag] = arg7._state
																obj:save(game.GameId, Winds._config)
																arg6.callback(arg7._state)
															end

															if Winds:flag_type(arg6.flag, "boolean") then
																tbl29:change_state(Winds._config._flags[arg6.flag])
															end

															textButton3.MouseButton1Click:Connect(function()
																tbl29:change_state(not tbl29._state)
															end)

															textButton3.InputBegan:Connect(function(input, gameProcessed)
																if gameProcessed then
																	return
																end

																if input.UserInputType ~= Enum.UserInputType.MouseButton3 then
																	return
																end

																if Winds._choosing_keybind then
																	return
																end
																Winds._choosing_keybind = true
																local connection2 = nil

																connection2 = UserInputService.InputBegan:Connect(function(input2, gameProcessed2)
																	if gameProcessed2 then
																		return
																	end

																	if input2.UserInputType ~= Enum.UserInputType.Keyboard then
																		return
																	end

																	if input2.KeyCode == Enum.KeyCode.Unknown then
																		return
																	end

																	if input2.KeyCode == Enum.KeyCode.Backspace then
																		tbl28:scale_keybind(true)
																		Winds._config._keybinds[arg6.flag] = nil
																		obj:save(game.GameId, Winds._config)
																		textLabel8.Text = "..."

																		if obj2[arg6.flag .. "_keybind"] then
																			obj2[arg6.flag .. "_keybind"]:Disconnect()
																			obj2[arg6.flag .. "_keybind"] = nil
																		end

																		connection2:Disconnect()
																		Winds._choosing_keybind = false
																		return
																	end

																	connection2:Disconnect()
																	Winds._config._keybinds[arg6.flag] = tostring(input2.KeyCode)
																	obj:save(game.GameId, Winds._config)

																	if obj2[arg6.flag .. "_keybind"] then
																		obj2[arg6.flag .. "_keybind"]:Disconnect()
																		obj2[arg6.flag .. "_keybind"] = nil
																	end

																	tbl28:connect_keybind()
																	tbl28:scale_keybind()
																	Winds._choosing_keybind = false
																	textLabel8.Text = string.gsub(tostring(Winds._config._keybinds[arg6.flag]), "Enum.KeyCode.", "")
																end)
															end)

															obj2[arg6.flag .. "_keypress"] = UserInputService.InputBegan:Connect(function(input, gameProcessed)
																if gameProcessed then
																	return
																end

																if input.UserInputType == Enum.UserInputType.Keyboard then
																	local v118 = Winds._config._keybinds[arg6.flag]

																	if v118 and tostring(input.KeyCode) == v118 then
																		tbl29:change_state(not tbl29._state)
																	end
																end
															end)

															return tbl29
														end

														tbl28.create_divider = function(arg5, arg6)
															v117 += 1

															if arg5._size == 0 then
																arg5._size = 11

end
															end

															arg5._size = arg5._size + 27

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															local frame10 = Instance.new("Frame")
															frame10.Size = UDim2.new(0, 207, 0, 20)
															frame10.BackgroundTransparency = 1
															frame10.Name = "OuterFrame"
															frame10.Parent = frame9
															frame10.LayoutOrder = v117

															if arg6 and arg6.showtopic then
																local textLabel7 = Instance.new("TextLabel")
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
																textLabel7.TextTransparency = 0
																textLabel7.Text = arg6.title
																textLabel7.Size = UDim2.new(0, 165, 0, 13)
																textLabel7.Position = UDim2.new(0.5, 0, 0.501, 0)
																textLabel7.BackgroundTransparency = 1
																textLabel7.TextXAlignment = Enum.TextXAlignment.Center
																textLabel7.BorderSizePixel = 0
																textLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
																textLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
																textLabel7.TextSize = 11
																textLabel7.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
																textLabel7.ZIndex = 3
																textLabel7.TextStrokeTransparency = 0
																textLabel7.Parent = frame10
															end

															if not arg6 or arg6 and not arg6.disableline then
																local frame11 = Instance.new("Frame")
																frame11.Size = UDim2.new(1, 0, 0, 1)
																frame11.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
																frame11.BorderSizePixel = 0
																frame11.Name = "Divider"
																frame11.Parent = frame10
																frame11.ZIndex = 2
																frame11.Position = UDim2.new(0, 0, 0.5, -0.5)
																local uiGradient5 = Instance.new("UIGradient")
																uiGradient5.Parent = frame11
																local colorSequence3 = ColorSequence.new
																local tbl29 = {}
																local v118 = ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 235, 245))
																local v119 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(235, 235, 245))
																local new5 = ColorSequenceKeypoint.new
																local color3 = Color3.fromRGB
																local v120 = 255
																tbl29[1] = v118
																tbl29[2] = v119

																do
																	local values = table.pack(new5(1, color3(v120, 255, 255, 0)))
																	table.move(values, 1, values.n, 3, tbl29)
																end

																uiGradient5.Color = colorSequence3(tbl29)
																local numberSequence3 = NumberSequence.new
																local tbl30 = {}
																local v121 = NumberSequenceKeypoint.new(0, 1)
																local v122 = NumberSequenceKeypoint.new(0.5, 0)
																local new6 = NumberSequenceKeypoint.new
																local v123 = 1
																local v124 = 1
																tbl30[1] = v121
																tbl30[2] = v122

																do
																	local values = table.pack(new6(v123, v124))
																	table.move(values, 1, values.n, 3, tbl30)
																end

																uiGradient5.Transparency = numberSequence3(tbl30)
																uiGradient5.Rotation = 0
																local uiCorner8 = Instance.new("UICorner")
																uiCorner8.CornerRadius = UDim.new(0, 2)
																uiCorner8.Parent = frame11
															end

															return true
														end

														tbl28.create_slider = function(arg5, arg6)
															v117 += 1
															local tbl29 = {}

															if arg5._size == 0 then
																arg5._size = 11
															end

															arg5._size = arg5._size + 27

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)

end
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
															local tweenInfo2 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
															local tweenInfo3 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
															local textButton3 = Instance.new("TextButton")
															textButton3.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															textButton3.TextSize = 14
															textButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.Text = ""
															textButton3.AutoButtonColor = false
															textButton3.BackgroundTransparency = 1
															textButton3.Name = "Slider"
															textButton3.Size = UDim2.new(0, 207, 0, 22)
															textButton3.BorderSizePixel = 0
															textButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.Parent = frame9
															textButton3.LayoutOrder = v117
															local instance23 = Instance.new("TextLabel")

															if GG.SelectedLanguage == "th" then
																instance23.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																instance23.TextSize = 13
															else
																instance23.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																instance23.TextSize = 11
															end

															instance23.TextColor3 = Color3.fromRGB(235, 235, 245)
															instance23.TextTransparency = 0.20000000298023224
															instance23.Text = arg6.title
															instance23.Size = UDim2.new(1, -48, 0, 13)
															instance23.Position = UDim2.new(0, 0, 0.05000000074505806, 0)
															instance23.BackgroundTransparency = 1
															instance23.TextXAlignment = Enum.TextXAlignment.Left
															instance23.TextTruncate = Enum.TextTruncate.AtEnd
															instance23.BorderSizePixel = 0
															instance23.BorderColor3 = Color3.fromRGB(0, 0, 0)
															instance23.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															instance23.Parent = textButton3
															local frame10 = Instance.new("Frame")
															frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame10.AnchorPoint = Vector2.new(0.5, 1)
															frame10.BackgroundTransparency = 0.7
															frame10.Position = UDim2.new(0.5, 0, 0.94999998807907104, 0)
															frame10.Name = "Drag"
															frame10.Size = UDim2.new(0, 207, 0, 5)
															frame10.BorderSizePixel = 0
															frame10.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															frame10.Parent = textButton3
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 14)
															uiCorner8.Parent = frame10
															local frame11 = Instance.new("Frame")
															frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame11.AnchorPoint = Vector2.new(0, 0.5)
															frame11.BackgroundTransparency = 0.08
															frame11.Position = UDim2.new(0, 0, 0.5, 0)
															frame11.Name = "Fill"
															frame11.Size = UDim2.new(0, 0, 0, 4)
															frame11.BorderSizePixel = 0
															frame11.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															frame11.Parent = frame10
															local instance24 = Instance.new("UICorner")
															instance24.CornerRadius = UDim.new(0, 3)
															instance24.Parent = frame11
															local uiGradient5 = Instance.new("UIGradient")
															local new5 = ColorSequenceKeypoint.new
															local color3 = Color3.fromRGB
															local v118 = 40
															uiGradient5.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(167, 139, 250)), new5(1, color3(109, v118, 217)) })
															uiGradient5.Parent = frame11
															local frame12 = Instance.new("Frame")
															frame12.AnchorPoint = Vector2.new(0.5, 0.5)
															frame12.Name = "Thumb"
															frame12.Position = UDim2.new(0, 0, 0.5, 0)
															frame12.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame12.Size = UDim2.new(0, 8, 0, 8)
															frame12.BorderSizePixel = 0
															frame12.ZIndex = 3
															frame12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															frame12.Parent = frame10
															local instance25 = Instance.new("UICorner")
															instance25.CornerRadius = UDim.new(1, 0)
															instance25.Parent = frame12
															local uiStroke3 = Instance.new("UIStroke")
															uiStroke3.Color = Color3.fromRGB(30, 30, 38)
															uiStroke3.Thickness = 1.5
															uiStroke3.Parent = frame12
															local instance26 = Instance.new("TextLabel")
															instance26.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
															instance26.TextColor3 = Color3.fromRGB(235, 235, 245)
															instance26.TextTransparency = 0.2
															instance26.Text = "0"
															instance26.Name = "Value"
															instance26.Size = UDim2.new(0, 42, 0, 13)
															instance26.AnchorPoint = Vector2.new(1, 0)
															instance26.Position = UDim2.new(1, 0, 0, 0)
															instance26.BackgroundTransparency = 1
															instance26.TextXAlignment = Enum.TextXAlignment.Right
															instance26.BorderSizePixel = 0
															instance26.BorderColor3 = Color3.fromRGB(0, 0, 0)
															instance26.TextSize = 12
															instance26.TextTruncate = Enum.TextTruncate.AtEnd
															instance26.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															instance26.Parent = textButton3
															local flag23 = false

															tbl29.set_percentage = function(arg7, arg8)
																local n36

																if arg6.round_number then
																	n36 = math.floor(arg8)
																else
																	n36 = math.floor(arg8 * 10) / 10
																end

																local n37 = math.clamp((arg8 - arg6.minimum_value) / (arg6.maximum_value - arg6.minimum_value), 0, 1)
																local text2 = math.clamp(n36, arg6.minimum_value, arg6.maximum_value)
																local v119 = flag23 and tweenInfo2 or tweenInfo3
																Winds._config._flags[arg6.flag] = text2
																instance26.Text = text2
																TweenService:Create(frame11, v119, { Size = UDim2.new(n37, 0, 0, 4) }):Play()
																TweenService:Create(frame12, v119, { Position = UDim2.new(n37, (0.5 - n37) * 8, 0.5, 0) }):Play()
																arg6.callback(text2)
															end

															tbl29.update = function(arg7)
																local n36 = arg6.maximum_value - arg6.minimum_value
																arg7:set_percentage(arg6.minimum_value + math.clamp((mouse.X - frame10.AbsolutePosition.X) / math.max(1, frame10.AbsoluteSize.X), 0, 1) * n36)
															end

															tbl29.input = function()
																flag23 = true
																TweenService:Create(frame12, tweenInfo, { Size = UDim2.new(0, 11, 0, 11) }):Play()
																tbl29:update()
																if false then -- removed opaque flag guard
																	return
																end

																obj2["slider_drag_" .. arg6.flag] = mouse.Move:Connect(function()
																	tbl29:update()
																end)

																obj2["slider_input_ended_" .. arg6.flag] = UserInputService.InputEnded:Connect(function(input)
																	if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
																		return
																	end
																	flag23 = false
																	TweenService:Create(frame12, tweenInfo3, { Size = UDim2.new(0, 8, 0, 8) }):Play()
																	obj2:disconnect("slider_drag_" .. arg6.flag)
																	obj2:disconnect("slider_input_ended_" .. arg6.flag)

																	if not arg6.ignoresaved then
																		obj:save(game.GameId, Winds._config)
																	end
																end)
															end

															if Winds:flag_type(arg6.flag, "number") then
																if not arg6.ignoresaved then
																	tbl29:set_percentage(Winds._config._flags[arg6.flag])
																else
																	tbl29:set_percentage(arg6.value)
																end
															else
																tbl29:set_percentage(arg6.value)
															end

															textButton3.MouseButton1Down:Connect(function()
																tbl29:input()
															end)

															return tbl29
														end

														tbl28.create_range_slider = function(arg5, arg6)
															v117 += 1

															local tbl29 = {
																min_value = arg6.min_value or arg6.minimum_value,
																max_value = arg6.max_value or arg6.maximum_value,
																min_thumb = nil,
																max_thumb = nil,
																fill = nil,
																drag = nil,
																is_dragging = false,
																active_thumb = nil,
															}

															if arg5._size == 0 then
																arg5._size = 11
															end

															arg5._size = arg5._size + 27

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local textButton3 = Instance.new("TextButton")
															textButton3.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															textButton3.TextSize = 11
															textButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.Text = ""
															textButton3.AutoButtonColor = false
															textButton3.BackgroundTransparency = 1
															textButton3.Name = "RangeSlider"
															textButton3.Size = UDim2.new(0, 207, 0, 22)
															textButton3.BorderSizePixel = 0
															textButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
															textButton3.Parent = frame9
															textButton3.LayoutOrder = v117
															textButton3.ClipsDescendants = false
															local textLabel7 = Instance.new("TextLabel")

															if GG.SelectedLanguage == "th" then
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextSize = 13
															else
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextSize = 11
															end

															textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.TextTransparency = 0.2
															textLabel7.Text = arg6.title
															textLabel7.Size = UDim2.new(1, -42, 0, 13)
															textLabel7.Position = UDim2.new(0, 0, 0.05000000074505806, 0)
															textLabel7.BackgroundTransparency = 1
															textLabel7.TextXAlignment = Enum.TextXAlignment.Left
															textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
															textLabel7.BorderSizePixel = 0
															textLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textLabel7.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.Parent = textButton3
															local frame10 = Instance.new("Frame")
															frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame10.AnchorPoint = Vector2.new(0.5, 1)
															frame10.BackgroundTransparency = 0.89999997615814209
															frame10.Position = UDim2.new(0.5, 0, 0.94999998807907104, 0)
															frame10.Name = "Drag"
															frame10.Size = UDim2.new(0, 207, 0, 5)
															frame10.BorderSizePixel = 0
															frame10.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															frame10.Parent = textButton3
															tbl29.drag = frame10
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 12)
															uiCorner8.Parent = frame10
															local frame11 = Instance.new("Frame")
															frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame11.AnchorPoint = Vector2.new(0, 0.5)
															frame11.BackgroundTransparency = 0.08
															frame11.Position = UDim2.new(0, 0, 0.5, 0)
															frame11.Name = "Fill"
															frame11.Size = UDim2.new(0, 0, 0, 4)
															frame11.BorderSizePixel = 0
															frame11.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															frame11.Parent = frame10
															tbl29.fill = frame11
															local uiCorner9 = Instance.new("UICorner")
															uiCorner9.CornerRadius = UDim.new(0, 3)
															uiCorner9.Parent = frame11
															local uiGradient5 = Instance.new("UIGradient")
															local new5 = ColorSequenceKeypoint.new
															local color3 = Color3.fromRGB
															local v118 = 217
															uiGradient5.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(167, 139, 250)), new5(1, color3(109, 40, v118)) })
															uiGradient5.Parent = frame11
															local frame12 = Instance.new("Frame")
															frame12.AnchorPoint = Vector2.new(0.5, 0.5)
															frame12.Name = "MinThumb"
															frame12.Position = UDim2.new(0, 0, 0.5, 0)
															frame12.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame12.Size = UDim2.new(0, 8, 0, 8)
															frame12.BorderSizePixel = 0
															frame12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															frame12.Parent = frame10
															tbl29.min_thumb = frame12
															local uiCorner10 = Instance.new("UICorner")
															uiCorner10.CornerRadius = UDim.new(1, 0)
															uiCorner10.Parent = frame12
															local uiStroke3 = Instance.new("UIStroke")
															uiStroke3.Color = Color3.fromRGB(30, 30, 38)
															uiStroke3.Thickness = 1.5
															uiStroke3.Parent = frame12
															local frame13 = Instance.new("Frame")
															frame13.AnchorPoint = Vector2.new(0.5, 0.5)
															frame13.Name = "MaxThumb"
															frame13.Position = UDim2.new(0, 0, 0.5, 0)
															frame13.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame13.Size = UDim2.new(0, 8, 0, 8)
															frame13.BorderSizePixel = 0
															frame13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															frame13.Parent = frame10
															tbl29.max_thumb = frame13
															local uiCorner11 = Instance.new("UICorner")
															uiCorner11.CornerRadius = UDim.new(1, 0)
															uiCorner11.Parent = frame13
															local uiStroke4 = Instance.new("UIStroke")
															uiStroke4.Color = Color3.fromRGB(30, 30, 38)
															uiStroke4.Thickness = 1.5
															uiStroke4.Parent = frame13
															local textLabel8 = Instance.new("TextLabel")
															textLabel8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
															textLabel8.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel8.TextTransparency = 0.20000000298023224
															textLabel8.Text = string.format("%.3f, %.3f", tbl29.min_value, tbl29.max_value)
															textLabel8.Name = "Value"
															textLabel8.Size = UDim2.new(0, 80, 0, 13)
															textLabel8.AnchorPoint = Vector2.new(1, 0)
															textLabel8.Position = UDim2.new(1, 0, 0, 0)
															textLabel8.BackgroundTransparency = 1
															textLabel8.TextXAlignment = Enum.TextXAlignment.Right
															textLabel8.BorderSizePixel = 0
															textLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textLabel8.TextSize = 10
															textLabel8.TextTruncate = Enum.TextTruncate.AtEnd
															textLabel8.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															textLabel8.Parent = textButton3

															local function fn40(arg7)
																local x = frame10.AbsoluteSize.X
																return arg6.minimum_value + (arg6.maximum_value - arg6.minimum_value) * math.clamp(arg7 - frame10.AbsolutePosition.X, 0, x) / x
															end

															tbl29.update_positions = function(arg7, arg8)
																local n36 = (arg7.max_value - arg6.minimum_value) / (arg6.maximum_value - arg6.minimum_value)
																local n37 = math.clamp((arg7.min_value - arg6.minimum_value) / (arg6.maximum_value - arg6.minimum_value), 0, 1)
																local n38 = math.clamp(n36, 0, 1)

																if arg8 then
																	TweenService:Create(arg7.min_thumb, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(n37, (0.5 - n37) * 8, 0.5, 0) }):Play()
																	TweenService:Create(arg7.max_thumb, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(n38, (0.5 - n38) * 8, 0.5, 0) }):Play()
																	TweenService:Create(arg7.fill, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(n38 - n37, 0, 1, 0), Position = UDim2.new(n37, 0, 0.5, 0) }):Play()
																	arg7.min_thumb.Position = UDim2.new(n37, (0.5 - n37) * 8, 0.5, 0)
																	arg7.max_thumb.Position = UDim2.new(n38, (0.5 - n38) * 8, 0.5, 0)
																	arg7.fill.Size = UDim2.new(n38 - n37, 0, 1, 0)
																	arg7.fill.Position = UDim2.new(n37, 0, 0.5, 0)
																else
end

																if arg6.round_number then
																	textLabel8.Text = string.format("%.0f, %.0f", arg7.min_value, arg7.max_value)
																else
																	textLabel8.Text = string.format("%.1f, %.1f", arg7.min_value, arg7.max_value)
																end

																Winds._config._flags[arg6.flag .. "_min"] = arg7.min_value
																Winds._config._flags[arg6.flag .. "_max"] = arg7.max_value
																obj:save(game.GameId, Winds._config)
																arg6.callback(arg7.min_value, arg7.max_value)
															end

															local function fn41(arg7)
																if arg7.UserInputType ~= Enum.UserInputType.MouseButton1 and arg7.UserInputType ~= Enum.UserInputType.Touch then
																	return
																end
																local position2 = arg7.Position
																local absolutePosition = frame10.AbsolutePosition
																local n36 = absolutePosition.X + (tbl29.min_value - arg6.minimum_value) / (arg6.maximum_value - arg6.minimum_value) * frame10.AbsoluteSize.X
																if false then -- removed opaque flag guard
																	return
																end
																local n37 = absolutePosition.X + (tbl29.max_value - arg6.minimum_value) / (arg6.maximum_value - arg6.minimum_value) * frame10.AbsoluteSize.X
																local n38 = math.abs(position2.X - n36)
																local n39 = math.abs(position2.X - n37)

																if n38 < 35 and n38 < n39 then
																	tbl29.active_thumb = "min"
																	tbl29.is_dragging = true
																elseif n39 < 35 then
																	tbl29.active_thumb = "max"
																	tbl29.is_dragging = true
																end
															end

															local function fn42(arg7)
																if not tbl29.is_dragging or not tbl29.active_thumb then
																	return
																end
																local v119 = fn40(arg7.Position.X)

																if tbl29.active_thumb == "min" then
																	tbl29.min_value = math.max(math.min(v119, tbl29.max_value), arg6.minimum_value)
																elseif tbl29.active_thumb == "max" then
																	local maximumValue = arg6.maximum_value
																	tbl29.max_value = math.min(math.max(v119, tbl29.min_value), maximumValue)
																end

																tbl29:update_positions(false)
															end

															local function fn43(arg7)
																if not (arg7.UserInputType ~= Enum.UserInputType.MouseButton1 and arg7.UserInputType ~= Enum.UserInputType.Touch) then
																	if tbl29.is_dragging then
																		tbl29:update_positions(true)
																	end

																	tbl29.is_dragging = false
																	tbl29.active_thumb = nil
																	return
																end

																	return
																end
end

															textButton3.InputBegan:Connect(function(input)
																if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
																	fn41(input)
																end
															end)

															textButton3.InputChanged:Connect(function(input)
																if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
																	if tbl29.is_dragging then
																		fn42(input)
																	end
																end

																if false then -- removed missing opaque flag guard
																	return
																end
															end)

															textButton3.InputEnded:Connect(function(input)
																if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
																	fn43(input)
																	if false then -- removed opaque flag guard
																		return
																	end
																end
															end)

															obj2["range_slider_touch_" .. arg6.flag] = UserInputService.TouchMoved:Connect(function(arg7, arg8)
																if arg8 then
																	return
																end

																if tbl29.is_dragging then
																	fn42(arg7)
																end
															end)

															if Winds:flag_type(arg6.flag .. "_min", "number") then
																tbl29.min_value = Winds._config._flags[arg6.flag .. "_min"]
																tbl29.max_value = Winds._config._flags[arg6.flag .. "_max"] or arg6.max_value
															end

															task.spawn(function()
																task.wait()
																tbl29:update_positions(true)
															end)

															return tbl29
														end

														tbl28.create_dropdown = function(arg5, arg6)
															if not arg6.Order then
																v117 += 1
															end

															local tbl29 = { _state = false, _size = 0 }

															if not arg6.Order then
																if arg5._size == 0 then
																	arg5._size = 11
																end

																arg5._size = arg5._size + 44
															end

															if not arg6.Order then
																if tbl28._state then
																	instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
																end

																frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															end

															local instance23 = Instance.new("TextButton")
															instance23.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
															instance23.TextColor3 = Color3.fromRGB(0, 0, 0)
															instance23.BorderColor3 = Color3.fromRGB(0, 0, 0)
															instance23.Text = ""
															instance23.AutoButtonColor = false
															instance23.BackgroundTransparency = 1
															instance23.Name = "Dropdown"
															instance23.Size = UDim2.new(0, 207, 0, 38)
															instance23.BorderSizePixel = 0
															instance23.TextSize = 14
															instance23.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
															instance23.Parent = frame9

															if not arg6.Order then
																instance23.LayoutOrder = v117
															else
																instance23.LayoutOrder = arg6.OrderValue
															end

															if not Winds._config._flags[arg6.flag] then
																Winds._config._flags[arg6.flag] = {}
															end

															local textLabel7 = Instance.new("TextLabel")

															if GG.SelectedLanguage == "th" then
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/NotoSansThai.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextSize = 13
															else
																textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																textLabel7.TextSize = 11
															end

															textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.TextTransparency = 0.20000000298023224
															textLabel7.Text = arg6.title
															textLabel7.Size = UDim2.new(0, 207, 0, 13)
															textLabel7.BackgroundTransparency = 1
															textLabel7.TextXAlignment = Enum.TextXAlignment.Left
															textLabel7.BorderSizePixel = 0
															textLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textLabel7.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.Parent = instance23
															local frame10 = Instance.new("Frame")
															frame10.ClipsDescendants = true
															frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame10.AnchorPoint = Vector2.new(0.5, 0)
															frame10.BackgroundTransparency = 0.7
															frame10.Position = UDim2.new(0.5, 0, 1.2000000476837158, 0)
															frame10.Name = "Container"
															frame10.Size = UDim2.new(0, 207, 0, 22)
															frame10.BorderSizePixel = 0
															frame10.BackgroundColor3 = Color3.fromRGB(139, 92, 246)
															frame10.Parent = textLabel7
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 5)
															uiCorner8.Parent = frame10
															local frame11 = Instance.new("Frame")
															frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
															frame11.AnchorPoint = Vector2.new(0.5, 0)
															frame11.BackgroundTransparency = 1
															frame11.Position = UDim2.new(0.5, 0, 0, 0)
															frame11.Name = "Header"
															frame11.Size = UDim2.new(0, 207, 0, 22)
															frame11.BorderSizePixel = 0
															frame11.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															frame11.Parent = frame10
															local textLabel8 = Instance.new("TextLabel")
															textLabel8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
															textLabel8.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel8.TextTransparency = 0.20000000298023224
															textLabel8.Name = "CurrentOption"
															textLabel8.Size = UDim2.new(0, 161, 0, 13)
															textLabel8.AnchorPoint = Vector2.new(0, 0.5)
															textLabel8.Position = UDim2.new(0.05, 0, 0.5, 0)
															textLabel8.BackgroundTransparency = 1
															textLabel8.TextXAlignment = Enum.TextXAlignment.Left
															textLabel8.BorderSizePixel = 0
															textLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
															textLabel8.TextSize = 10
															textLabel8.TextTruncate = Enum.TextTruncate.AtEnd
															textLabel8.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															textLabel8.Parent = frame11
															local uiGradient5 = Instance.new("UIGradient")
															local numberSequence3 = NumberSequence.new
															local tbl30 = {}
															local v118 = NumberSequenceKeypoint.new(0, 0)
															local v119 = NumberSequenceKeypoint.new(0.704, 0)
															local v120 = NumberSequenceKeypoint.new(0.872, 0.3625)
															local new5 = NumberSequenceKeypoint.new
															local v121 = 1
															local v122 = 1
															tbl30[1] = v118
															tbl30[2] = v119
															tbl30[3] = v120

															do
																local values = table.pack(new5(v121, v122))
																table.move(values, 1, values.n, 4, tbl30)
															end

															uiGradient5.Transparency = numberSequence3(tbl30)
															uiGradient5.Parent = textLabel8
															local instance24 = Instance.new("TextLabel")
															instance24.Text = "⇅"
															instance24.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold)
															instance24.TextSize = 10
															instance24.TextColor3 = Color3.fromRGB(235, 235, 245)
															instance24.BackgroundTransparency = 1
															instance24.Size = UDim2.new(0, 10, 0, 10)
															instance24.Position = UDim2.new(0.91, 0, 0.5, 0)
															instance24.AnchorPoint = Vector2.new(0, 0.5)
															instance24.Parent = frame11
															local scrollingFrame3 = Instance.new("ScrollingFrame")
															scrollingFrame3.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
															scrollingFrame3.Active = true
															scrollingFrame3.ScrollBarImageTransparency = 1
															scrollingFrame3.AutomaticCanvasSize = Enum.AutomaticSize.XY
															scrollingFrame3.ScrollBarThickness = 0
															scrollingFrame3.Name = "Options"
															scrollingFrame3.Size = UDim2.new(0, 207, 0, 0)
															scrollingFrame3.BackgroundTransparency = 1
															scrollingFrame3.Position = UDim2.new(0, 0, 1, 0)
															scrollingFrame3.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
															scrollingFrame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
															scrollingFrame3.BorderSizePixel = 0
															scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0.5, 0)
															scrollingFrame3.Parent = frame10
															local instance25 = Instance.new("UIListLayout")
															instance25.SortOrder = Enum.SortOrder.LayoutOrder
															instance25.Parent = scrollingFrame3
															instance25.Padding = UDim.new(0, 3)
															local instance26 = Instance.new("UIPadding")
															instance26.PaddingTop = UDim.new(0, 2)
															instance26.PaddingBottom = UDim.new(0, 4)
															instance26.PaddingLeft = UDim.new(0, 8)
															instance26.Parent = scrollingFrame3
															local uiListLayout5 = Instance.new("UIListLayout")
															uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
															uiListLayout5.Parent = frame10

															tbl29.update = function(arg7, arg8)
																if arg6.multi_dropdown then
																	if not Winds._config._flags[arg6.flag] then
																		Winds._config._flags[arg6.flag] = {}
																	end

																	local v123 = nil

																	if #Winds._config._flags[arg6.flag] > 0 then
																		v123 = convertTableToString(Winds._config._flags[arg6.flag])
																	end

																	local tbl31 = {}

																	if v123 then
																		for match in string.gmatch(v123, "([^,]+)") do
																			local match2 = match:match("^%s*(.-)%s*$")

																			if match2 ~= "Label" then
																				table.insert(tbl31, match2)
																			end
																		end
																	else
																		for match in string.gmatch(textLabel8.Text, "([^,]+)") do
																			local match2 = match:match("^%s*(.-)%s*$")

																			if match2 ~= "Label" then
																				table.insert(tbl31, match2)
																			end
																		end
																	end

																	local v124 = convertStringToTable(textLabel8.Text)
																	optionSkibidi = "nil"

																	if typeof(arg8) ~= "string" then
																		optionSkibidi = arg8.Name
																	else
																		optionSkibidi = arg8
																	end

																	for k, v125 in pairs(v124) do
																		if v125 == optionSkibidi then
																			table.remove(v124, k)
																			break
																		end
																	end

																	textLabel8.Text = table.concat(tbl31, ", ")
																	local tbl32 = {}

																	for _, v125 in scrollingFrame3:GetChildren() do
																		if v125.Name == "Option" then
																			table.insert(tbl32, v125.Text)

																			if table.find(tbl31, v125.Text) then
																				v125.TextTransparency = 0.2
																			else
																				v125.TextTransparency = 0.6
																			end
																		end
																	end

																	for k, v125 in convertStringToTable(textLabel8.Text), nil, nil do
																		if not table.find(tbl32, v125) and table.find(tbl31, v125) then
																			table.remove(tbl31, k)
																		end
																	end

																	textLabel8.Text = table.concat(tbl31, ", ")
																	Winds._config._flags[arg6.flag] = convertStringToTable(textLabel8.Text)
																else
																	textLabel8.Text = typeof(arg8) == "string" and arg8 or arg8.Name

																	for _, v123 in scrollingFrame3:GetChildren() do
																		if v123.Name == "Option" then
																			if v123.Text == textLabel8.Text then
																				v123.TextTransparency = 0.2
																			else
																				v123.TextTransparency = 0.6
																			end
																		end
																	end

																	Winds._config._flags[arg6.flag] = arg8
																end

																obj:save(game.GameId, Winds._config)
																arg6.callback(arg8)
															end

															local n36 = 0

															tbl29.unfold_settings = function(arg7)
																arg7._state = not arg7._state

																if arg7._state then
																	tbl28._multiplier = tbl28._multiplier + arg7._size
																	n36 = arg7._size
																	TweenService:Create(instance16, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(1, -8, 0, 93 + tbl28._size + tbl28._multiplier) }):Play()
																	TweenService:Create(instance16.Options, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(1, -8, 0, tbl28._size + tbl28._multiplier) }):Play()
																	TweenService:Create(instance23, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(207, 39 + arg7._size) }):Play()
																	TweenService:Create(frame10, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(207, 22 + arg7._size) }):Play()
																	TweenService:Create(instance24, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Rotation = 180 }):Play()
																else
																	tbl28._multiplier = tbl28._multiplier - arg7._size
																	n36 = 0
																	TweenService:Create(instance16, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(1, -8, 0, 93 + tbl28._size + tbl28._multiplier) }):Play()
																	TweenService:Create(instance16.Options, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(1, -8, 0, tbl28._size + tbl28._multiplier) }):Play()
																	TweenService:Create(instance23, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(207, 39) }):Play()
																	TweenService:Create(frame10, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(207, 22) }):Play()
																	TweenService:Create(instance24, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Rotation = 0 }):Play()
																end
															end

															if 0 < #arg6.options then
																tbl29._size = 7

																for k, v123 in arg6.options, nil, nil do
																	local textButton3 = Instance.new("TextButton")
																	textButton3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
																	textButton3.Active = false
																	textButton3.TextTransparency = 0.60000002384185791
																	textButton3.AnchorPoint = Vector2.new(0, 0.5)
																	textButton3.TextSize = 10
																	textButton3.Size = UDim2.new(0, 186, 0, 16)
																	textButton3.TextColor3 = Color3.fromRGB(235, 235, 245)
																	textButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
																	textButton3.Text = typeof(v123) == "string" and v123 or v123.Name
																	textButton3.AutoButtonColor = false
																	textButton3.Name = "Option"
																	textButton3.BackgroundTransparency = 1
																	textButton3.TextXAlignment = Enum.TextXAlignment.Left
																	textButton3.Selectable = false
																	textButton3.Position = UDim2.new(0.049999881535768509, 0, 0.34210526943206787, 0)
																	textButton3.BorderSizePixel = 0
																	textButton3.BackgroundColor3 = Color3.fromRGB(235, 235, 245)
																	textButton3.Parent = scrollingFrame3

																	if arg6.bindable then
																		local str8 = arg6.flag .. "_" .. (typeof(v123) == "string" and v123 or v123.Name)

																		local tbl31 = {
																			LeftControl = "LCTRL",
																			RightControl = "RCTRL",
																			LeftShift = "LSHIFT",
																			RightShift = "RSHIFT",
																			LeftAlt = "LALT",
																			RightAlt = "RALT",
																			Backspace = "BACK",
																			Backquote = "`",
																			LeftBracket = "[",
																			RightBracket = "]",
																			Semicolon = ";",
																			Quote = "'",
																			Comma = ",",
																			Period = ".",
																			Slash = "/",
																			BackSlash = "\\",
																			Minus = "-",
																			Equals = "=",
																			Space = "SPACE",
																			Return = "ENTER",
																			CapsLock = "CAPS",
																			Tab = "TAB",
																		}

																		local function fn40(arg7)
																			if not arg7 then
																				return nil
																			end
																			local v124 = string.gsub(tostring(arg7), "Enum.KeyCode.", "")
																			local v125 = tbl31[v124] or v124
																			local str9

																			if not (#v125 > 5) then
																				str9 = v125
																			else
																				str9 = string.sub(v125, 1, 5)
																			end

																			return string.upper(str9)
																		end

																		local instance27 = Instance.new("TextButton")
																		instance27.Name = "Bind"
																		instance27.Size = UDim2.fromOffset(36, 12)
																		instance27.Position = UDim2.new(1, -3, 0.5, 0)
																		instance27.AnchorPoint = Vector2.new(1, 0.5)
																		instance27.BackgroundColor3 = Color3.fromRGB(24, 26, 34)
																		instance27.BackgroundTransparency = 0.15
																		instance27.AutoButtonColor = false
																		instance27.BorderSizePixel = 0
																		instance27.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
																		instance27.TextSize = 8
																		instance27.Text = "BIND"
																		instance27.TextColor3 = Color3.fromRGB(120, 124, 140)
																		instance27.ZIndex = 5
																		instance27.Parent = textButton3
																		local uiCorner9 = Instance.new("UICorner")
																		uiCorner9.CornerRadius = UDim.new(0, 5)
																		uiCorner9.Parent = instance27
																		local uiStroke3 = Instance.new("UIStroke")
																		uiStroke3.Color = Color3.fromRGB(48, 52, 70)
																		uiStroke3.Thickness = 1
																		uiStroke3.Transparency = 0.55
																		uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
																		uiStroke3.Parent = instance27
																		local flag23 = false

																		local function fn41()
																			if flag23 then
																				instance27.Text = "PRESS"
																				instance27.TextColor3 = Color3.fromRGB(235, 235, 245)
																				instance27.BackgroundColor3 = Color3.fromRGB(45, 36, 64)
																				uiStroke3.Color = Color3.fromRGB(167, 139, 250)
																				uiStroke3.Transparency = 0
																				return
																			end

																			local v124 = fn40(Winds._config._keybinds[str8])
																			instance27.Text = v124 or "None"
																			instance27.TextColor3 = v124 and Color3.fromRGB(196, 181, 253) or Color3.fromRGB(120, 130, 140)
																			instance27.BackgroundColor3 = v124 and Color3.fromRGB(31, 27, 48) or Color3.fromRGB(24, 26, 34)
																			uiStroke3.Color = v124 and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(48, 52, 70)
																			uiStroke3.Transparency = v124 and 0.35 or 0.55
																		end

																		local function fn42()
																			for _, v124 in scrollingFrame3:GetChildren() do
																				local isTextButton = v124:IsA("TextButton") and v124:FindFirstChild("Bind")

																				if isTextButton then
																					local v125 = fn40(Winds._config._keybinds[arg6.flag .. "_" .. v124.Text])
																					isTextButton.Text = v125 or "BIND"
																					isTextButton.TextColor3 = v125 and Color3.fromRGB(196, 181, 253) or Color3.fromRGB(120, 124, 140)
																					isTextButton.BackgroundColor3 = v125 and Color3.fromRGB(31, 27, 48) or Color3.fromRGB(24, 26, 34)
																					local uiStroke4 = isTextButton:FindFirstChildOfClass("UIStroke")

																					if uiStroke4 then
																						uiStroke4.Color = v125 and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(48, 52, 70)
																						uiStroke4.Transparency = v125 and 0.35 or 0.75
																					end
																				end
																			end
																		end

																		fn41()

																		instance27.MouseEnter:Connect(function()
																			if flag23 then
																				return
																			end
																			TweenService:Create(uiStroke3, TweenInfo.new(0.15), { Transparency = 0.1 }):Play()
																		end)

																		instance27.MouseLeave:Connect(function()
																			if flag23 then
																				return
																			end
																			fn41()
																		end)

																		instance27.MouseButton2Click:Connect(function()
																			if flag23 then
																				return
																			end
																			Winds._config._keybinds[str8] = nil
																			obj:save(game.GameId, Winds._config)
																			fn41()
																		end)

																		instance27.MouseButton1Click:Connect(function()
																			if Winds._choosing_keybind or flag23 then
																				return
																			end
																			Winds._choosing_keybind = true
																			flag23 = true
																			fn41()
																			local connection2 = nil

																			connection2 = UserInputService.InputBegan:Connect(function(input, gameProcessed)
																				if gameProcessed or input.UserInputType ~= Enum.UserInputType.Keyboard then
																					return
																				end
																				connection2:Disconnect()
																				flag23 = false
																				Winds._choosing_keybind = false
																				if input.KeyCode == Enum.KeyCode.Escape then
																					fn41()
																					return
																				end

																				if input.KeyCode == Enum.KeyCode.Backspace then
																					Winds._config._keybinds[str8] = nil
																				else
																					local str9 = tostring(input.KeyCode)

																					for _, v124 in arg6.options, nil, nil do
																						local v125 = "string"
																						local str10 = arg6.flag .. "_" .. (typeof(v124) == v125 and v124 or v124.Name)

																						if str10 ~= str8 and Winds._config._keybinds[str10] == str9 then
																							Winds._config._keybinds[str10] = nil
																						end
																					end

																					Winds._config._keybinds[str8] = str9
																				end

																				obj:save(game.GameId, Winds._config)
																				fn42()
																			end)
																		end)
																	end

																	local instance27 = Instance.new("UIGradient")
																	local numberSequence4 = NumberSequence.new
																	local tbl31 = {}
																	local v124 = NumberSequenceKeypoint.new(0, 0)
																	local v125 = NumberSequenceKeypoint.new(0.704, 0)
																	local v126 = NumberSequenceKeypoint.new(0.872, 0.36250001192092896)
																	local new6 = NumberSequenceKeypoint.new
																	local v127 = 1
																	tbl31[1] = v124
																	tbl31[2] = v125
																	tbl31[3] = v126

																	do
																		local values = table.pack(new6(1, v127))
																		table.move(values, 1, values.n, 4, tbl31)
																	end

																	instance27.Transparency = numberSequence4(tbl31)
																	instance27.Parent = textButton3

																	textButton3.MouseButton1Click:Connect(function()
																		if not Winds._config._flags[arg6.flag] then
																			Winds._config._flags[arg6.flag] = {}
																		end

																		if arg6.multi_dropdown then
																			if table.find(Winds._config._flags[arg6.flag], v123) then
																				Winds:remove_table_value(Winds._config._flags[arg6.flag], v123)
																			else
																				table.insert(Winds._config._flags[arg6.flag], v123)
																			end
																		end

																		tbl29:update(v123)
																	end)

																	if not (k > arg6.maximum_options) then
																		tbl29._size = tbl29._size + 19
																		scrollingFrame3.Size = UDim2.fromOffset(207, tbl29._size)
																	end
																end
															end

															tbl29.New = function(arg7, arg8)
																instance23:Destroy(true)
																arg8.OrderValue = instance23.LayoutOrder
																tbl28._multiplier = tbl28._multiplier - n36
																return tbl28:create_dropdown(arg8)
															end

															if Winds:flag_type(arg6.flag, "string") then
																tbl29:update(Winds._config._flags[arg6.flag])

end
															else
																tbl29:update(arg6.options[1])
															end

															instance23.MouseButton1Click:Connect(function()
																tbl29:unfold_settings()

end
															end)

															if arg6.bindable then
																obj2[arg6.flag .. "_option_binds"] = UserInputService.InputBegan:Connect(function(input, gameProcessed)
																	if gameProcessed then
																		return
																	end

																	if Winds._choosing_keybind then
																		return
																	end

																	if input.UserInputType ~= Enum.UserInputType.Keyboard then
																		return
																	end

																	for _, v123 in arg6.options, nil, nil do
																		local v124 = Winds._config._keybinds[arg6.flag .. "_" .. (typeof(v123) == "string" and v123 or v123.Name)]
																		if v124 and tostring(input.KeyCode) == v124 then
																			tbl29:update(v123)
																			break
																		end
																	end
																end)
															end

															return tbl29
														end

														tbl28.create_feature = function(arg5, arg6)
															v117 += 1
															local flag23 = arg6.history == true
															local flag24 = arg6.no_image == true
															local n36 = flag24 and 22
															local n37

															if n36 then
																n37 = n36
															else
																n37 = flag23 and 30 or 22
															end

															if arg5._size == 0 then
																arg5._size = 11
															end

															arg5._size = arg5._size + n37 + 6

															if tbl28._state then
																instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size)
															end

															frame9.Size = UDim2.new(1, -8, 0, arg5._size)
															local instance23 = Instance.new("Frame")
															instance23.Name = "Feature"
															instance23.Size = UDim2.new(0, 207, 0, n37)
															instance23.BackgroundColor3 = flag24 and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(22, 24, 32)
															instance23.BackgroundTransparency = flag24 and 0.9 or 0.9
															instance23.BorderSizePixel = 0
															instance23.Parent = frame9
															instance23.LayoutOrder = v117
															local uiCorner8 = Instance.new("UICorner")
															uiCorner8.CornerRadius = UDim.new(0, 4)
															uiCorner8.Parent = instance23
															local uiStroke3 = nil

															if not flag24 then
																	uiStroke3 = Instance.new("UIStroke")
																	uiStroke3.Color = Color3.fromRGB(38, 42, 58)
																	uiStroke3.Transparency = 0.35
																	uiStroke3.Thickness = 1
																	uiStroke3.Parent = instance23
																else
end
															end

															local instance24 = Instance.new("TextButton")
															instance24.BackgroundTransparency = 1
															instance24.BorderSizePixel = 0
															instance24.Size = UDim2.new(1, 0, 1, 0)
															instance24.Text = ""
															instance24.AutoButtonColor = false
															instance24.ZIndex = 2
															instance24.Parent = instance23
															local imageLabel3 = Instance.new("ImageLabel")
															imageLabel3.Name = "Thumb"
															imageLabel3.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
															imageLabel3.BackgroundTransparency = 0.2
															imageLabel3.BorderSizePixel = 0
															imageLabel3.Size = UDim2.new(0, flag23 and 22 or 16, 0, flag23 and 22 or 16)
															imageLabel3.Position = UDim2.new(0, 6, 0.5, 0)
															imageLabel3.AnchorPoint = Vector2.new(0, 0.5)
															imageLabel3.Image = arg6.image or "rbxassetid://10734966447"
															imageLabel3.ScaleType = Enum.ScaleType.Crop
															imageLabel3.ZIndex = 3
															imageLabel3.Visible = arg6.no_image ~= true
															imageLabel3.Parent = instance23
															local uiCorner9 = Instance.new("UICorner")
															uiCorner9.CornerRadius = UDim.new(0, 5)
															uiCorner9.Parent = imageLabel3
															local textLabel7 = Instance.new("TextLabel")
															textLabel7.BackgroundTransparency = 1
															textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
															textLabel7.Text = arg6.title or "Checkbox"
															textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
															textLabel7.TextTransparency = 0.2
															textLabel7.TextSize = flag24 and 12 or flag23 and 11 or 12
															textLabel7.TextXAlignment = flag24 and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
															textLabel7.TextTruncate = Enum.TextTruncate.AtEnd
															textLabel7.Position = UDim2.new(0, flag24 and 0 or flag23 and 34 or 26, 0, 0)
															textLabel7.Size = UDim2.new(1, flag24 and 0 or flag23 and -100 or -70, 1, 0)
															textLabel7.ZIndex = 3
															textLabel7.Parent = instance23

															if arg6.subtitle and flag23 and not arg6.no_image then
																textLabel7.Position = UDim2.new(0, 34, 0, 5)
																textLabel7.Size = UDim2.new(1, -62, 0, 13)
																local instance25 = Instance.new("TextLabel")
																instance25.BackgroundTransparency = 1
																instance25.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
																instance25.Text = arg6.subtitle
																instance25.TextColor3 = Color3.fromRGB(160, 170, 180)
																instance25.TextTransparency = 0.15
																instance25.TextSize = 9
																instance25.TextXAlignment = Enum.TextXAlignment.Left
																instance25.TextTruncate = Enum.TextTruncate.AtEnd
																instance25.Position = UDim2.new(0, 34, 0, 15)
																instance25.Size = UDim2.new(1, -62, 0, 14)
																instance25.ZIndex = 3
																instance25.Parent = instance23
															end

															instance24.MouseEnter:Connect(function()
																TweenService:Create(instance23, TweenInfo.new(0.18), {
																	BackgroundColor3 = flag24 and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(32, 34, 46),
																	BackgroundTransparency = flag24 and 0 or 0.12,
																}):Play()

																if uiStroke3 then
																	TweenService:Create(uiStroke3, TweenInfo.new(0.18), { Color = Color3.fromRGB(139, 92, 246), Transparency = 0.25 }):Play()
																end
															end)

															instance24.MouseLeave:Connect(function()
																TweenService:Create(instance23, TweenInfo.new(0.18), {
																	BackgroundColor3 = flag24 and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(22, 24, 32),
																	BackgroundTransparency = flag24 and 0.9 or 0.12,
																}):Play()

																if uiStroke3 then
																	TweenService:Create(uiStroke3, TweenInfo.new(0.18), { Color = Color3.fromRGB(38, 42, 58), Transparency = 0.3 }):Play()
																end
															end)

															instance24.MouseButton1Click:Connect(function()
																if arg6.button_callback then
																	arg6.button_callback()
																end
															end)

															if flag23 then
																if arg6.on_delete then
																	local textButton3 = Instance.new("TextButton")
																	textButton3.Name = "Reset"
																	textButton3.AnchorPoint = Vector2.new(1, 0.5)
																	textButton3.Position = UDim2.new(1, -6, 0.5, 0)
																	textButton3.Size = UDim2.new(0, 18, 0, 18)
																	textButton3.BackgroundColor3 = Color3.fromRGB(40, 24, 32)
																	textButton3.BackgroundTransparency = 0.05
																	textButton3.BorderSizePixel = 0
																	textButton3.Text = "×"
																	textButton3.TextColor3 = Color3.fromRGB(248, 113, 113)
																	textButton3.TextSize = 14
																	textButton3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
																	textButton3.AutoButtonColor = false
																	textButton3.ZIndex = 4
																	textButton3.Parent = instance23
																	local instance25 = Instance.new("UICorner")
																	instance25.CornerRadius = UDim.new(0, 5)
																	instance25.Parent = textButton3

																	textButton3.MouseEnter:Connect(function()
																		textButton3.BackgroundColor3 = Color3.fromRGB(80, 28, 36)
																	end)

																	textButton3.MouseLeave:Connect(function()
																		textButton3.BackgroundColor3 = Color3.fromRGB(40, 24, 32)
																	end)

																	textButton3.MouseButton1Click:Connect(function()
																		arg6.on_delete()
																	end)
																end
															else
																if not Winds._config._flags then
																	Winds._config._flags = {}
																end

																if not Winds._config._flags[arg6.flag] then
																	Winds._config._flags[arg6.flag] = { checked = false, BIND = arg6.default or "Unknown" }
																end

																local checked = Winds._config._flags[arg6.flag].checked
																local textButton3 = Instance.new("TextButton")
																textButton3.AnchorPoint = Vector2.new(1, 0.5)
																textButton3.Position = UDim2.new(1, -6, 0.5, 0)
																textButton3.Size = UDim2.new(0, 16, 0, 16)
																textButton3.BackgroundColor3 = checked and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(18, 18, 24)
																textButton3.Text = ""
																textButton3.AutoButtonColor = false
																textButton3.ZIndex = 5
																textButton3.Parent = instance23
																local uiCorner10 = Instance.new("UICorner")
																uiCorner10.CornerRadius = UDim.new(0, 4)
																uiCorner10.Parent = textButton3
																local uiStroke4 = Instance.new("UIStroke")
																uiStroke4.Color = Color3.fromRGB(139, 92, 246)
																uiStroke4.Thickness = 1
																uiStroke4.Parent = textButton3

																textButton3.MouseButton1Click:Connect(function()
																	checked = not checked
																	textButton3.BackgroundColor3 = checked and Color3.fromRGB(139, 92, 246) or Color3.fromRGB(18, 18, 24)
																	Winds._config._flags[arg6.flag].checked = checked
																	obj:save(game.GameId, Winds._config)

																	if arg6.callback then
																		arg6.callback(checked)
																	end
																end)

																if arg6.callback then
																	arg6.callback(checked)

end
																end
															end

															return {
																instance = instance23,
																remove = function()
																	if not instance23.Parent then
																		return
																	end
																	instance23:Destroy()
																	arg5._size = math.max(11, arg5._size - n37 - 6)
																	frame9.Size = UDim2.new(1, -8, 0, arg5._size)

																	if tbl28._state then
																		instance16.Size = UDim2.new(1, -8, 0, 93 + arg5._size + tbl28._multiplier)
																	end
																end,
															}
														end

														return tbl28
													end

													return tbl26
												end

												obj2.library_visiblity = UserInputService.InputBegan:Connect(function(input)
													if input.KeyCode ~= Enum.KeyCode.RightControl then
														return
													end

													if getgenv().guilibraryVisible then
														arg._ui.Enabled = not arg._ui.Enabled
														arg._ui_open = not arg._ui_open
														arg:change_visiblity(arg._ui_open)
													else
end
												end)

												arg._ui.Container.Handler.Minimize.MouseButton1Click:Connect(function()
													arg._ui_open = not arg._ui_open
													arg:change_visiblity(arg._ui_open)
												end)

												return arg
											end
										end


return Winds
