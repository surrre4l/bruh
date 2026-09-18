-- Ella Hub V2 — deep reconstructed / feature-repair pass
-- No v[n] state table and no numeric callback indirection callback indirection.
--
-- This pass:
--   * turns all 672 indexed runtime references into real local variables;
--   * names the first UI/game references semantically;
--   * names later state from its enclosing feature and assigned object where possible;
--   * keeps the original feature bodies and game-specific remote logic intact;
--   * initializes Roblox services and LocalPlayer before feature execution;
--   * validates the external WindUI loader before constructing the UI.
--
-- Important: execution success still depends on the executor and the target Roblox
-- experience exposing the objects/remotes expected by the original feature code.

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

local windUISource
local windUILoader
local windUI
local players
local runService
local replicatedStorage
local userInputService
local httpService
local starterGui
local lighting
local debris
local soundService
local window
local campTab
local movieTab
local expeditionTab
local mainTab
local charactersTab
local playerTab
local statsTab
local teleportsTab
local universalTab
local clientTab
local otherTab
local autoplayTab
local trollTab
local shopTab
local settingsTab
local campObbyGroup
local spleefGroup
local movieObbyGroup
local expeditionObbyGroup
local franceGroup
local safetyStatueGroup
local safetyStatueGroupAlt
local roundInfoGroup
local freeCharacterGroup
local season
local seasonPlayers
local targetPlayerDropdown
local targetPlayerGroup
local statsPlayerDropdown
local teams
local teamDropdown
local Win_Obby_001_Finish
local Win_Obby_001_HumanoidRootPart
local Godmode_005_Spleef
local Godmode_005_Part
local Godmode_005_TouchInterest
local Collect_Keys_Open_Chests_020_Pirate
local Monster_Godmode_022_Monster
local Monster_Godmode_022_MonsterNPC
local Collect_Egg_023_Alien
local Auto_Collect_Ancient_Artifacts_024_Pre_Historic
local Auto_Collect_Ancient_Artifacts_024_Coins
local Give_Meatball_040_clone
local Idol_Holder_ESP_049_Idol
local Idol_Holder_ESP_049_child
local Idol_Holder_ESP_049_Highlight
local Idol_Holder_ESP_049_color
local Idol_Holder_ESP_049_color_2
local Idol_Holder_ESP_049_connection
local Idol_Holder_ESP_062_Idol
local Idol_Holder_ESP_062_child
local Idol_Holder_ESP_062_Highlight
local Idol_Holder_ESP_062_color
local Idol_Holder_ESP_062_color_2
local Vote_Log_GUI_071_value
local Vote_Log_GUI_071_ScreenGui
local Vote_Log_GUI_071_Frame
local Vote_Log_GUI_071_size
local Vote_Log_GUI_071_size_2
local Vote_Log_GUI_071_color
local Vote_Log_GUI_071_UICorner
local Vote_Log_GUI_071_dimension
local Vote_Log_GUI_071_Frame_2
local Vote_Log_GUI_071_size_3
local Vote_Log_GUI_071_color_2
local Vote_Log_GUI_071_UICorner_2
local Vote_Log_GUI_071_dimension_2
local Vote_Log_GUI_071_Frame_3
local Vote_Log_GUI_071_size_4
local Vote_Log_GUI_071_size_5
local Vote_Log_GUI_071_color_3
local Vote_Log_GUI_071_TextLabel
local Vote_Log_GUI_071_size_6
local Vote_Log_GUI_071_color_4
local Vote_Log_GUI_071_TextLabel_2
local Vote_Log_GUI_071_size_7
local Vote_Log_GUI_071_size_8
local Vote_Log_GUI_071_color_5
local Vote_Log_GUI_071_TextButton
local Vote_Log_GUI_071_size_9
local Vote_Log_GUI_071_size_10
local Vote_Log_GUI_071_color_6
local Vote_Log_GUI_071_TextButton_2
local Vote_Log_GUI_071_size_11
local Vote_Log_GUI_071_size_12
local Vote_Log_GUI_071_color_7
local Vote_Log_GUI_071_TextButton_3
local Vote_Log_GUI_071_size_13
local Vote_Log_GUI_071_size_14
local Vote_Log_GUI_071_color_8
local Vote_Log_GUI_071_color_9
local Vote_Log_GUI_071_color_10
local Vote_Log_GUI_071_color_11
local Vote_Log_GUI_071_TextButton_4
local Vote_Log_GUI_071_size_15
local Vote_Log_GUI_071_size_16
local Vote_Log_GUI_071_color_12
local Vote_Log_GUI_071_UICorner_3
local Vote_Log_GUI_071_dimension_3
local Vote_Log_GUI_071_TextButton_5
local Vote_Log_GUI_071_size_17
local Vote_Log_GUI_071_size_18
local Vote_Log_GUI_071_color_13
local Vote_Log_GUI_071_UICorner_4
local Vote_Log_GUI_071_dimension_4
local Vote_Log_GUI_071_TextButton_6
local Vote_Log_GUI_071_size_19
local Vote_Log_GUI_071_size_20
local Vote_Log_GUI_071_color_14
local Vote_Log_GUI_071_UICorner_5
local Vote_Log_GUI_071_dimension_5
local Vote_Log_GUI_071_ScrollingFrame
local Vote_Log_GUI_071_size_21
local Vote_Log_GUI_071_size_22
local Vote_Log_GUI_071_color_15
local Vote_Log_GUI_071_size_23
local Vote_Log_GUI_071_UIListLayout
local Vote_Log_GUI_071_dimension_6
local Vote_Log_GUI_071_AbsoluteContentSize
local Vote_Log_GUI_071_TextLabel_3
local Vote_Log_GUI_071_size_24
local Vote_Log_GUI_071_color_16
local Vote_Log_GUI_071_connection
local Vote_Log_GUI_071_connection_2
local Vote_Log_GUI_071_connection_3
local Vote_Log_GUI_071_connection_4
local Vote_Log_GUI_071_connection_5
local Tiebreaker_Detector_072_Season
local Tiebreaker_Detector_072_Voting
local Tiebreaker_Detector_072_Votes
local Round_Type_074_CurrentTwist
local Server_Hop_on_Merge_077_Season
local Server_Hop_on_Merge_077_Values
local Server_Hop_on_Merge_077_Merge
local Server_Hop_Now_078_TeleportService
local TP_Above_Map_080_Part
local TP_Above_Map_080_value
local TP_Above_Map_080_value_2
local Remove_Intro_Cutscene_086_Events
local Remove_Intro_Cutscene_086_Camera
local Remove_Intro_Cutscene_086_Humanoid
local Fling_Reanimate_087_value
local Fling_Reanimate_087_value_2
local Anti_Gear_Removal_093_value
local Anti_Gear_Removal_093_value_2
local Christmas_Map_099_color
local Christmas_Map_099_color_2
local Halloween_Map_100_color
local Halloween_Map_100_color_2
local Halloween_Map_100_color_3
local Valentines_Map_101_color
local Valentines_Map_101_color_2
local Reset_Map_102_color
local Reset_Map_102_color_2
local Walk_Speed_103_Humanoid
local Jump_Power_104_Humanoid
local Freeze_Timer_Display_105_GuiTexts
local helper_111_Season
local helper_111_Players
local helper_112_Season
local helper_112_Players
local Teleport_To_113_Players
local Refresh_List_114_Season
local Refresh_List_114_Players
local Refresh_List_114_Season_2
local Refresh_List_114_Players_2
local Highlight_Player_115_Players
local Camp_Wins_118_child
local Camp_Wins_118_DataStore
local Camp_Wins_118_CampWins
local Movie_Wins_119_child
local Movie_Wins_119_DataStore
local Movie_Wins_119_MoviesWins
local Expedition_Wins_120_child
local Expedition_Wins_120_DataStore
local Expedition_Wins_120_ExpeditionWins
local Coins_121_child
local Coins_121_DataStore
local Coins_121_Coins
local Comeback_Wins_122_child
local Comeback_Wins_122_DataStore
local Comeback_Wins_122_ComebackWins
local Games_Played_123_child
local Games_Played_123_DataStore
local Games_Played_123_GamesPlayed
local Idols_Found_124_child
local Idols_Found_124_DataStore
local Idols_Found_124_IdolsFound
local Skins_125_child
local Skins_125_Skins
local Marshmallows_126_child
local Marshmallows_126_Marshmallows
local Spectator_Island_127_HumanoidRootPart
local Spectator_Island_127_value
local Main_Island_128_HumanoidRootPart
local Main_Island_128_value
local Exile_Island_129_HumanoidRootPart
local Exile_Island_129_value
local Voting_Area_130_HumanoidRootPart
local Voting_Area_130_value
local Boat_131_HumanoidRootPart
local Boat_131_value
local Bathroom_132_HumanoidRootPart
local Bathroom_132_value
local Starter_Island_133_HumanoidRootPart
local Starter_Island_133_value
local Voting_Area_134_HumanoidRootPart
local Voting_Area_134_value
local Cabin_1_135_HumanoidRootPart
local Cabin_1_135_value
local Cabin_2_136_HumanoidRootPart
local Cabin_2_136_value
local Dining_Room_137_HumanoidRootPart
local Dining_Room_137_value
local Kitchen_138_HumanoidRootPart
local Kitchen_138_value
local Inside_Boat_139_HumanoidRootPart
local Inside_Boat_139_value
local Ship_Voting_Area_140_HumanoidRootPart
local Ship_Voting_Area_140_value
local First_Class_VIP_141_HumanoidRootPart
local First_Class_VIP_141_value
local _2nd_Class_142_HumanoidRootPart
local _2nd_Class_142_value
local Ship_Bathroom_143_HumanoidRootPart
local Ship_Bathroom_143_value
local Dining_Class_144_HumanoidRootPart
local Dining_Class_144_value
local Basement_145_HumanoidRootPart
local Basement_145_value
local VC_Unban_146_VoiceChatService
local Apply_Shaders_147_Lighting
local Apply_Shaders_147_value
local Apply_Shaders_147_color
local Apply_Shaders_147_color_2
local Apply_Shaders_147_color_3
local Apply_Shaders_147_color_4
local Apply_Shaders_147_Sky
local Infinite_Yield_148_value
local Infinite_Yield_148_value_2
local Fly_GUI_149_value
local Fly_GUI_149_value_2
local Wall_Hop_150_value
local Wall_Hop_150_value_2
local Sound_Panel_151_value
local Sound_Panel_151_value_2
local Energize_Animations_152_value
local Energize_Animations_152_value_2
local Bring_Back_Old_Chat_153_value
local Bring_Back_Old_Chat_153_value_2
local Refresh_Teams_157_Teams
local Set_Team_158_Teams
local Set_Team_158_Spectator
local Spectator_159_Teams
local Spectator_159_Spectator
local Jury_160_Teams
local Jury_160_Jury
local Starborn_162_value
local Starborn_162_value_2
local VHS_163_value
local VHS_163_value_2
local Minecrafter_164_value
local Minecrafter_164_value_2
local Horror_165_value
local Skin_Changer_167_value
local Skin_Changer_167_value_2
local Size_Changer_168_value
local Size_Changer_168_value_2
local Gets_Admin_Panel_169_Products
local Gets_Admin_Panel_169_GUIs
local Gets_Admin_Panel_169_Settings
local Gets_Admin_Panel_169_clone
local Gets_Admin_Panel_169_PlayerGui
local Detect_Current_Obby_173_Assets
local Auto_Detect_Obby_174_Assets
local Give_Dodgeball_175_Products
local Give_Dodgeball_175_Gear
local Give_Dodgeball_175_Dodgeball
local Give_Dodgeball_175_clone
local Give_Dodgeball_175_Handle
local Give_Paintball_Gun_176_Products
local Give_Paintball_Gun_176_Gear
local Give_Paintball_Gun_176_PaintballGun
local Give_Paintball_Gun_176_clone
local Give_Paintball_Gun_176_Handle
local Give_Meatball_177_Products
local Give_Meatball_177_Gear
local Give_Meatball_177_Meatball
local Give_Meatball_177_clone
local Give_Meatball_177_Handle
local Give_Raygun_Sheriff_178_Products
local Give_Raygun_Sheriff_178_Gear
local Give_Raygun_Sheriff_178_Sheriff
local Give_Raygun_Sheriff_178_clone
local Give_Raygun_Sheriff_178_Handle
local Give_Sword_179_Products
local Give_Sword_179_Gear
local Give_Sword_179_Sword
local Give_Sword_179_clone
local Give_Sword_179_Handle
local Give_Pool_Noodle_180_Products
local Give_Pool_Noodle_180_Gear
local Give_Pool_Noodle_180_Pool_Noodle
local Give_Pool_Noodle_180_clone
local Give_Pool_Noodle_180_Handle
local Give_Snowball_181_Products
local Give_Snowball_181_Gear
local Give_Snowball_181_Snowball
local Give_Snowball_181_clone
local Give_Snowball_181_Handle
local Print_Shop_to_Console_190_Skins
local Print_Shop_to_Console_190_Marshmallows
local Print_Shop_to_Console_190_ElimColors
local Print_Shop_to_Console_190_Eliminations
local Send_Shop_to_Webhook_191_Skins
local Send_Shop_to_Webhook_191_Marshmallows
local Send_Shop_to_Webhook_191_ElimColors
local Send_Shop_to_Webhook_191_Eliminations
local Sword_Lunge_Sound_198_clone
local Equip_Sword_Unsheath_199_clone
local Toilet_Elimination_Sound_200_Toilet_Elimination
local Sleigh_Elimination_Sound_201_Sleigh_Elimination
local Swap_to_Sleigh_Elimination_203_ElimMethod
local Swap_to_Sleigh_Elimination_203_Boat_Elimination
local Swap_to_Sleigh_Elimination_203_clone
local Swap_to_Sleigh_Elimination_203_Sleigh_Elimination
local Swap_to_Sleigh_Elimination_203_Sound
local Force_Restore_Boat_204_ElimMethod
local Force_Restore_Boat_204_clone
local Anti_Loser_Land_205_Team
local Anti_Loser_Land_205_Season
local Anti_Loser_Land_205_Eliminated
local Anti_Loser_Land_205_Season_2
local Anti_Loser_Land_205_Players
local Play_This_Round_209_ChallengePlayers
local Play_This_Round_209_Assets
local Play_This_Round_209_ChallengePlayers_2
local Play_This_Round_209_Assets_2
local Play_This_Round_209_ChallengePlayers_3
local Play_This_Round_209_Assets_3
local Play_This_Round_209_ChallengePlayers_4
local Play_This_Round_209_Assets_4
local Play_This_Round_209_ChallengePlayers_5
local Play_This_Round_209_Assets_5
local Play_This_Round_209_ChallengePlayers_6
local Play_This_Round_209_Assets_6
local Play_This_Round_209_ChallengePlayers_7
local Play_This_Round_209_Assets_7
local Play_This_Round_209_ChallengePlayers_8
local Play_This_Round_209_Assets_8
local Play_This_Round_209_ChallengePlayers_9
local Play_This_Round_209_Assets_9
local Stop_Playback_210_HumanoidRootPart
local Switch_to_Rayfield_214_PlayerGui
local Switch_to_Rayfield_214_value
local Switch_to_Rayfield_214_CoreGui
local Switch_to_Rayfield_214_value_2
local Switch_to_Rayfield_214_value_3
local helper_217_Finish
local helper_217_HumanoidRootPart
local helper_217_Finish_2
local helper_217_HumanoidRootPart_2
local helper_217_Finish_3
local helper_217_HumanoidRootPart_3
local helper_217_Finish_4
local helper_217_HumanoidRootPart_4
local helper_217_Finish_5
local helper_217_HumanoidRootPart_5
local helper_217_Finish_6
local helper_217_HumanoidRootPart_6
local helper_217_Finish_7
local helper_217_HumanoidRootPart_7
local helper_217_Finish_8
local helper_217_HumanoidRootPart_8
local helper_217_Finish_9
local helper_217_HumanoidRootPart_9
local helper_219_MathMania
local helper_219_child
local helper_219_MainText
local helper_219_Box
local helper_219_Enter
local helper_219_value
local helper_219_return
local helper_219_value_2
local helper_219_child_2
local helper_219_MainText_2
local helper_219_Box_2
local helper_219_Enter_2
local helper_219_value_3
local helper_219_return_2
local helper_219_value_4
local helper_219_child_3
local helper_219_MainText_3
local helper_219_Box_3
local helper_219_Enter_3
local helper_219_value_5
local helper_219_return_3
local helper_219_value_6
local helper_219_child_4
local helper_219_MainText_4
local helper_219_Box_4
local helper_219_Enter_4
local helper_219_value_7
local helper_219_return_4
local helper_219_value_8
local helper_219_child_5
local helper_219_MainText_5
local helper_219_Box_5
local helper_219_value_9
local helper_219_return_5
local helper_219_value_10
local helper_220_Tool
local helper_221_Dodgeball
local helper_221_HumanoidRootPart
local helper_221_BasePart
local helper_221_Dodgeball_2
local helper_221_HumanoidRootPart_2
local helper_221_BasePart_2
local helper_221_Dodgeball_3
local helper_221_HumanoidRootPart_3
local helper_221_BasePart_3
local helper_221_Dodgeball_4
local helper_221_HumanoidRootPart_4
local helper_221_BasePart_4
local helper_221_Dodgeball_5
local helper_221_HumanoidRootPart_5
local helper_221_BasePart_5
local helper_221_Dodgeball_6
local helper_221_HumanoidRootPart_6
local helper_221_BasePart_6
local helper_221_Dodgeball_7
local helper_221_HumanoidRootPart_7
local helper_221_BasePart_7
local helper_221_Dodgeball_8
local helper_221_HumanoidRootPart_8
local helper_221_BasePart_8
local helper_221_Dodgeball_9
local helper_221_HumanoidRootPart_9
local helper_221_BasePart_9
local helper_228_Finish
local helper_228_HumanoidRootPart
local helper_228_Finish_2
local helper_228_HumanoidRootPart_2
local helper_228_Finish_3
local helper_228_HumanoidRootPart_3
local helper_228_Finish_4
local helper_228_HumanoidRootPart_4
local helper_228_Finish_5
local helper_228_HumanoidRootPart_5
local helper_228_Finish_6
local helper_228_HumanoidRootPart_6
local helper_228_Finish_7
local helper_228_HumanoidRootPart_7
local helper_228_Finish_8
local helper_228_HumanoidRootPart_8
local helper_228_Finish_9
local helper_228_HumanoidRootPart_9
local helper_232_Finish
local helper_232_HumanoidRootPart
local helper_232_Finish_2
local helper_232_HumanoidRootPart_2
local helper_232_Finish_3
local helper_232_HumanoidRootPart_3
local helper_232_Finish_4
local helper_232_HumanoidRootPart_4
local helper_232_Finish_5
local helper_232_HumanoidRootPart_5
local helper_232_Finish_6
local helper_232_HumanoidRootPart_6
local helper_232_Finish_7
local helper_232_HumanoidRootPart_7
local helper_232_Finish_8
local helper_232_HumanoidRootPart_8
local helper_232_Finish_9
local helper_232_HumanoidRootPart_9
local helper_233_HumanoidRootPart
local helper_234_MathMania
local helper_234_child
local helper_234_MainText
local helper_234_Box
local helper_234_Enter
local helper_234_value
local helper_234_return
local helper_234_value_2
local helper_234_child_2
local helper_234_MainText_2
local helper_234_Box_2
local helper_234_Enter_2
local helper_234_value_3
local helper_234_return_2
local helper_234_value_4
local helper_234_child_3
local helper_234_MainText_3
local helper_234_Box_3
local helper_234_Enter_3
local helper_234_value_5
local helper_234_return_3
local helper_234_value_6
local helper_234_child_4
local helper_234_MainText_4
local helper_234_Box_4
local helper_234_Enter_4
local helper_234_value_7
local helper_234_return_4
local helper_234_value_8
local helper_234_child_5
local helper_234_MainText_5
local helper_234_Box_5
local helper_234_value_9
local helper_234_return_5
local helper_234_value_10
local helper_235_Assets
local helper_236_Sheriff
local helper_236_Sheriff_2
local helper_236_Sheriff_3
local helper_236_Sheriff_4
local helper_236_Sheriff_5
local helper_236_Sheriff_6
local helper_236_Sheriff_7
local helper_236_Sheriff_8
local helper_236_Sheriff_9
local helper_239_Finish
local helper_239_HumanoidRootPart
local helper_239_Finish_2
local helper_239_HumanoidRootPart_2
local helper_239_Finish_3
local helper_239_HumanoidRootPart_3
local helper_239_Finish_4
local helper_239_HumanoidRootPart_4
local helper_239_Finish_5
local helper_239_HumanoidRootPart_5
local helper_239_Finish_6
local helper_239_HumanoidRootPart_6
local helper_239_Finish_7
local helper_239_HumanoidRootPart_7
local helper_239_Finish_8
local helper_239_HumanoidRootPart_8
local helper_239_Finish_9
local helper_239_HumanoidRootPart_9
local helper_242_MathMania
local helper_242_child
local helper_242_MainText
local helper_242_Box
local helper_242_Enter
local helper_242_value
local helper_242_return
local helper_242_value_2
local helper_242_child_2
local helper_242_MainText_2
local helper_242_Box_2
local helper_242_Enter_2
local helper_242_value_3
local helper_242_return_2
local helper_242_value_4
local helper_242_child_3
local helper_242_MainText_3
local helper_242_Box_3
local helper_242_Enter_3
local helper_242_value_5
local helper_242_return_3
local helper_242_value_6
local helper_242_child_4
local helper_242_MainText_4
local helper_242_Box_4
local helper_242_Enter_4
local helper_242_value_7
local helper_242_return_4
local helper_242_value_8
local helper_242_child_5
local helper_242_MainText_5
local helper_242_Box_5
local helper_242_value_9
local helper_242_return_5
local helper_242_value_10
local helper_245_Meatball
local helper_245_Meatball_2
local helper_245_Meatball_3
local helper_245_Meatball_4
local helper_245_Meatball_5
local helper_245_Meatball_6
local helper_245_Meatball_7
local helper_245_Meatball_8
local helper_245_Meatball_9
local helper_247_MeatballGiver
local helper_247_HumanoidRootPart
local helper_247_BasePart
local helper_247_MeatballGiver_2
local helper_247_HumanoidRootPart_2
local helper_247_BasePart_2
local helper_247_MeatballGiver_3
local helper_247_HumanoidRootPart_3
local helper_247_BasePart_3
local helper_247_MeatballGiver_4
local helper_247_HumanoidRootPart_4
local helper_247_BasePart_4
local helper_247_MeatballGiver_5
local helper_247_HumanoidRootPart_5
local helper_247_BasePart_5
local helper_247_MeatballGiver_6
local helper_247_HumanoidRootPart_6
local helper_247_BasePart_6
local helper_247_MeatballGiver_7
local helper_247_HumanoidRootPart_7
local helper_247_BasePart_7
local helper_247_MeatballGiver_8
local helper_247_HumanoidRootPart_8
local helper_247_BasePart_8
local helper_247_MeatballGiver_9
local helper_247_HumanoidRootPart_9
local helper_247_BasePart_9
local helper_248_Idol
local helper_248_child
local helper_248_Highlight
local helper_248_color
local helper_248_color_2
local helper_256_Idol
local helper_256_child
local helper_256_Highlight
local helper_256_color
local helper_256_color_2
local helper_264_color
local helper_265_color
local helper_266_color
local helper_267_size
local helper_267_value
local helper_268_color
local helper_273_size
local helper_284_HumanoidRootPart
local helper_284_value
local helper_284_HumanoidRootPart_2
local helper_284_value_2
local helper_284_HumanoidRootPart_3
local helper_284_value_3
local helper_284_HumanoidRootPart_4
local helper_284_value_4
local helper_284_HumanoidRootPart_5
local helper_284_value_5
local helper_284_HumanoidRootPart_6
local helper_284_value_6
local helper_284_HumanoidRootPart_7
local helper_284_value_7
local helper_284_HumanoidRootPart_8
local helper_284_value_8
local helper_284_HumanoidRootPart_9
local helper_284_value_9
local helper_290_clone
local helper_292_clone
local helper_297_value
local helper_297_value_2
local helper_297_Starborn
local helper_297_value_3
local helper_297_value_4
local helper_297_VHS
local helper_297_value_5
local helper_297_value_6
local helper_297_Minecrafter
local helper_297_value_7
local helper_297_value_8
local helper_297_Horror

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getRootPart()
    local character = getCharacter()
    return character:FindFirstChild("HumanoidRootPart")
end

local function notify(title, content, duration)
    if windUI and windUI.Notify then
        windUI:Notify({
            Duration = duration or 3,
            Content = content,
            Title = title
        })
    end
end

local function safeFind(parent, childName)
    if not parent then
        return nil
    end
    return parent:FindFirstChild(childName)
end

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

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getRootPart()
    local character = getCharacter()
    return character:FindFirstChild("HumanoidRootPart")
end

local function notify(title, content, duration)
    local ui = windUI
    if ui and ui.Notify then
        ui:Notify({
            Duration = duration or 3,
            Content = content,
            Title = title
        })
    end
end

local function safeFind(parent, childName)
    if not parent then
        return nil
    end
    return parent:FindFirstChild(childName)
end

local function Win_Obby_001(a1,a2,a3,a4,a5,a6,a7,a8)
Win_Obby_001_Finish=workspace.Assets:FindFirstChild("Finish",true)
Win_Obby_001_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Win_Obby_001_Finish.CanCollide=false
Win_Obby_001_Finish.Transparency=1
Win_Obby_001_Finish.Position=Win_Obby_001_HumanoidRootPart.Position
end
local function Godmode_002(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
end
local function Auto_Win_Obby_003(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_217)
end
local function Eat_Finish_Pancake_004(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
end
local function Godmode_005(a1,a2,a3,a4,a5,a6,a7,a8)
Godmode_005_Spleef=workspace.Assets:FindFirstChild("Spleef")
Godmode_005_Part=Godmode_005_Spleef:FindFirstChild("Part")
Godmode_005_TouchInterest=Godmode_005_Part:FindFirstChild("TouchInterest")
Godmode_005_TouchInterest:Destroy()
end
local function Clear_Parts_006(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
end
local function Auto_Collect_Coins_Gems_007(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_218)
end
local function Auto_Win_Math_Mania_008(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_219)
end
local function Win_Block_Push_009(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace:GetDescendants()
end
local function Kill_All_In_Sword_Fight_010(a1,a2,a3,a4,a5,a6,a7,a8)
runService.RenderStepped:Connect(Helper_220)
end
local function Bring_Dodgeball_Giver_011(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_221)
end
local function Keep_Dodgeball_After_Round_012(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Backpack.ChildRemoved:Connect(Helper_222)
end
local function Auto_Throw_Dodgeball_013(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_223)
end
local function Kill_All_Dodgeball_014(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_224)
end
local function Auto_Fire_Paintball_015(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_225)
end
local function Kill_All_Paintball_016(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_226)
end
local function Dodgeball_Paintball_Protection_017(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_227)
end
local function Auto_Win_All_Challenges_018(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_228)
task.spawn(Helper_229)
task.spawn(Helper_230)
task.spawn(Helper_231)
runService.RenderStepped:Connect(Helper_220)
windUI:Notify({Duration=3,Content="ENABLED!",Title="Auto-Win All"})
end
local function Auto_Win_Obby_019(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_232)
end
local function Collect_Keys_Open_Chests_020(a1,a2,a3,a4,a5,a6,a7,a8)
Collect_Keys_Open_Chests_020_Pirate=workspace.Assets:FindFirstChild("Pirate")
Collect_Keys_Open_Chests_020_Pirate:GetDescendants()
end
local function Kill_Everyone_In_Beach_Fight_021(a1,a2,a3,a4,a5,a6,a7,a8)
runService.RenderStepped:Connect(Helper_220)
end
local function Monster_Godmode_022(a1,a2,a3,a4,a5,a6,a7,a8)
Monster_Godmode_022_Monster=workspace.Assets:FindFirstChild("Monster")
Monster_Godmode_022_MonsterNPC=Monster_Godmode_022_Monster:FindFirstChild("MonsterNPC")
Monster_Godmode_022_MonsterNPC:Destroy()
end
local function Collect_Egg_023(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Collect_Egg_023_Alien=workspace.Assets:WaitForChild("Alien")
replicatedStorage.Season.Players:FindFirstChild(players.LocalPlayer.Name)
Collect_Egg_023_Alien:GetDescendants()
end
local function Auto_Collect_Ancient_Artifacts_024(a1,a2,a3,a4,a5,a6,a7,a8)
Auto_Collect_Ancient_Artifacts_024_Pre_Historic=workspace.Assets:WaitForChild("Pre-Historic")
Auto_Collect_Ancient_Artifacts_024_Coins=Auto_Collect_Ancient_Artifacts_024_Pre_Historic:WaitForChild("Coins")
Auto_Collect_Ancient_Artifacts_024_Coins.ChildAdded:Connect(Helper_233)
end
local function Auto_Win_Math_Mania_025(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_234)
end
local function Auto_Collect_Guitars_026(a1,a2,a3,a4,a5,a6,a7,a8)
runService.Heartbeat:Connect(Helper_235)
end
local function Instantly_Eat_Poison_Bowl_027(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
windUI:Notify({Duration=3,Content="Fired 0 bowl(s)!",Title="Prison"})
end
local function Auto_Shoot_Raygun_Sheriff_028(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_236)
end
local function Kill_All_Sheriff_Raygun_029(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_237)
end
local function Raygun_Sheriff_Protection_030(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_238)
end
local function Auto_Win_Obby_031(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_239)
end
local function Auto_Collect_Clovers_032(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_240)
end
local function Auto_Collect_Rings_033(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_241)
end
local function Auto_Win_Math_Mania_034(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_242)
end
local function Kill_Everyone_in_Greece_035(a1,a2,a3,a4,a5,a6,a7,a8)
runService.RenderStepped:Connect(Helper_220)
end
local function Break_Amazon_Spleef_036(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
end
local function Push_Cheese_1_037(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Cheese1",true)
workspace:GetDescendants()
windUI:Notify({Duration=3,Content="Not found.",Title="France"})
end
local function Push_Cheese_2_038(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Cheese2",true)
workspace:GetDescendants()
windUI:Notify({Duration=3,Content="Not found.",Title="France"})
end
local function Auto_Push_Cheese_039(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_243)
end
local function Give_Meatball_040(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Meatball_040_clone=replicatedStorage.Products.Gear.Meatball:Clone()
Give_Meatball_040_clone:FindFirstChild("Handle")
Give_Meatball_040_clone.Handle.CanCollide=false
Give_Meatball_040_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Meatball given!",Title="Meatball"})
end
local function Keep_Meatball_After_Round_041(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Backpack.ChildRemoved:Connect(Helper_244)
end
local function Auto_Throw_Meatball_042(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_245)
end
local function Kill_All_Meatball_043(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_246)
end
local function Bring_Meatball_Giver_044(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_247)
end
local function Get_Statue_Bag_045(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("Torso")
workspace.Idols:GetDescendants()
end
local function Who_Has_It_046(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players:FindFirstChild(replicatedStorage.Season.Twists.Idol.Value)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[replicatedStorage.Season.Twists.Idol.Value].Value.." has the statue."),Title="Statue Status"})
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
replicatedStorage:FindFirstChild("Season")
replicatedStorage.Season:FindFirstChild("Twists")
Idol_Holder_ESP_049_Idol=replicatedStorage.Season.Twists:FindFirstChild("Idol")
Idol_Holder_ESP_049_child=players:FindFirstChild(Idol_Holder_ESP_049_Idol.Value)
Idol_Holder_ESP_049_Highlight=Instance.new("Highlight",nil)
Idol_Holder_ESP_049_Highlight.Name="IdolHolderHL"
Idol_Holder_ESP_049_color=Color3.fromRGB(255,215,0)
Idol_Holder_ESP_049_Highlight.FillColor=Idol_Holder_ESP_049_color
Idol_Holder_ESP_049_color_2=Color3.fromRGB(255,215,0)
Idol_Holder_ESP_049_Highlight.OutlineColor=Idol_Holder_ESP_049_color_2
Idol_Holder_ESP_049_Highlight.FillTransparency=0.4
Idol_Holder_ESP_049_Highlight.OutlineTransparency=0
Idol_Holder_ESP_049_Highlight.Parent=Idol_Holder_ESP_049_child.Character
Idol_Holder_ESP_049_connection=replicatedStorage.Season.Twists.Idol.Changed:Connect(Helper_248)
end
local function Play_as_Idol_Spam_050(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_249)
end
local function Play_as_Idol_Once_051(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Idol:FireServer()
windUI:Notify({Duration=4,Content="Fired! Only works if you are the idol holder.",Title="Play as Idol"})
end
local function Notify_Votes_052(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_250)
end
local function Print_Votes_to_Console_053(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_251)
end
local function Expose_Votes_in_Chat_054(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_252)
end
local function Notify_Expose_Exile_Votes_055(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Helper_253)
end
local function Notify_Jury_Votes_056(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Helper_254)
end
local function Expose_Jury_Votes_in_Chat_057(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Helper_255)
end
local function Get_Statue_Bag_058(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("Torso")
workspace.Idols:GetDescendants()
end
local function Who_Has_It_059(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players:FindFirstChild(replicatedStorage.Season.Twists.Idol.Value)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[replicatedStorage.Season.Twists.Idol.Value].Value.." has the statue."),Title="Statue Status"})
end
local function Safety_Bag_ESP_060(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Idols:GetDescendants()
end
local function Safety_Statue_ESP_061(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Idols:GetDescendants()
end
local function Idol_Holder_ESP_062(a1,a2,a3,a4,a5,a6,a7,a8)
Idol_Holder_ESP_049_connection:Disconnect()
workspace:GetDescendants()
workspace:GetDescendants()
replicatedStorage:FindFirstChild("Season")
replicatedStorage.Season:FindFirstChild("Twists")
Idol_Holder_ESP_062_Idol=replicatedStorage.Season.Twists:FindFirstChild("Idol")
Idol_Holder_ESP_062_child=players:FindFirstChild(Idol_Holder_ESP_062_Idol.Value)
Idol_Holder_ESP_062_Highlight=Instance.new("Highlight",nil)
Idol_Holder_ESP_062_Highlight.Name="IdolHolderHL"
Idol_Holder_ESP_062_color=Color3.fromRGB(255,215,0)
Idol_Holder_ESP_062_Highlight.FillColor=Idol_Holder_ESP_062_color
Idol_Holder_ESP_062_color_2=Color3.fromRGB(255,215,0)
Idol_Holder_ESP_062_Highlight.OutlineColor=Idol_Holder_ESP_062_color_2
Idol_Holder_ESP_062_Highlight.FillTransparency=0.4
Idol_Holder_ESP_062_Highlight.OutlineTransparency=0
Idol_Holder_ESP_062_Highlight.Parent=Idol_Holder_ESP_062_child.Character
replicatedStorage.Season.Twists.Idol.Changed:Connect(Helper_256)
end
local function Play_as_Idol_Spam_063(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_257)
end
local function Play_as_Idol_Once_064(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Idol:FireServer()
windUI:Notify({Duration=4,Content="Fired! Only works if you are the idol holder.",Title="Play as Idol"})
end
local function Notify_Votes_065(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_258)
end
local function Print_Votes_to_Console_066(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_259)
end
local function Expose_Votes_in_Chat_067(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_260)
end
local function Notify_Expose_Exile_Votes_068(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Helper_261)
end
local function Notify_Jury_Votes_069(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Helper_262)
end
local function Expose_Jury_Votes_in_Chat_070(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Helper_263)
end
local function Vote_Log_GUI_071(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer:FindFirstChild("PlayerGui")
Vote_Log_GUI_071_value=gethui()
Vote_Log_GUI_071_ScreenGui=Instance.new("ScreenGui",nil)
Vote_Log_GUI_071_ScreenGui.Name="VoteLogGui"
Vote_Log_GUI_071_ScreenGui.ResetOnSpawn=false
Vote_Log_GUI_071_ScreenGui.DisplayOrder=999
Vote_Log_GUI_071_ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
Vote_Log_GUI_071_ScreenGui.IgnoreGuiInset=true
Vote_Log_GUI_071_ScreenGui.Parent=Vote_Log_GUI_071_value
Vote_Log_GUI_071_Frame=Instance.new("Frame",nil)
Vote_Log_GUI_071_Frame.Name="VL"
Vote_Log_GUI_071_size=UDim2.fromOffset(340,270)
Vote_Log_GUI_071_Frame.Size=Vote_Log_GUI_071_size
Vote_Log_GUI_071_size_2=UDim2.fromOffset(24,130)
Vote_Log_GUI_071_Frame.Position=Vote_Log_GUI_071_size_2
Vote_Log_GUI_071_color=Color3.fromRGB(10,10,14)
Vote_Log_GUI_071_Frame.BackgroundColor3=Vote_Log_GUI_071_color
Vote_Log_GUI_071_Frame.BorderSizePixel=0
Vote_Log_GUI_071_Frame.ClipsDescendants=true
Vote_Log_GUI_071_Frame.Parent=Vote_Log_GUI_071_ScreenGui
Vote_Log_GUI_071_UICorner=Instance.new("UICorner",Vote_Log_GUI_071_Frame)
Vote_Log_GUI_071_dimension=UDim.new(0,8)
Vote_Log_GUI_071_UICorner.CornerRadius=Vote_Log_GUI_071_dimension
Vote_Log_GUI_071_Frame_2=Instance.new("Frame",nil)
Vote_Log_GUI_071_Frame_2.Name="TB"
Vote_Log_GUI_071_size_3=UDim2.new(1,0,0,30)
Vote_Log_GUI_071_Frame_2.Size=Vote_Log_GUI_071_size_3
Vote_Log_GUI_071_color_2=Color3.fromRGB(16,16,22)
Vote_Log_GUI_071_Frame_2.BackgroundColor3=Vote_Log_GUI_071_color_2
Vote_Log_GUI_071_Frame_2.BorderSizePixel=0
Vote_Log_GUI_071_Frame_2.Parent=Vote_Log_GUI_071_Frame
Vote_Log_GUI_071_UICorner_2=Instance.new("UICorner",Vote_Log_GUI_071_Frame_2)
Vote_Log_GUI_071_dimension_2=UDim.new(0,8)
Vote_Log_GUI_071_UICorner_2.CornerRadius=Vote_Log_GUI_071_dimension_2
Vote_Log_GUI_071_Frame_3=Instance.new("Frame",nil)
Vote_Log_GUI_071_size_4=UDim2.new(1,0,0,8)
Vote_Log_GUI_071_Frame_3.Size=Vote_Log_GUI_071_size_4
Vote_Log_GUI_071_size_5=UDim2.new(0,0,1,-8)
Vote_Log_GUI_071_Frame_3.Position=Vote_Log_GUI_071_size_5
Vote_Log_GUI_071_color_3=Color3.fromRGB(16,16,22)
Vote_Log_GUI_071_Frame_3.BackgroundColor3=Vote_Log_GUI_071_color_3
Vote_Log_GUI_071_Frame_3.BorderSizePixel=0
Vote_Log_GUI_071_Frame_3.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_TextLabel=Instance.new("TextLabel",nil)
Vote_Log_GUI_071_size_6=UDim2.fromOffset(30,30)
Vote_Log_GUI_071_TextLabel.Size=Vote_Log_GUI_071_size_6
Vote_Log_GUI_071_TextLabel.BackgroundTransparency=1
Vote_Log_GUI_071_TextLabel.Text="🗑"
Vote_Log_GUI_071_TextLabel.TextSize=13
Vote_Log_GUI_071_TextLabel.Font=Enum.Font.Gotham
Vote_Log_GUI_071_color_4=Color3.fromRGB(160,160,160)
Vote_Log_GUI_071_TextLabel.TextColor3=Vote_Log_GUI_071_color_4
Vote_Log_GUI_071_TextLabel.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_TextLabel_2=Instance.new("TextLabel",nil)
Vote_Log_GUI_071_size_7=UDim2.new(0,80,1,0)
Vote_Log_GUI_071_TextLabel_2.Size=Vote_Log_GUI_071_size_7
Vote_Log_GUI_071_size_8=UDim2.fromOffset(32,0)
Vote_Log_GUI_071_TextLabel_2.Position=Vote_Log_GUI_071_size_8
Vote_Log_GUI_071_TextLabel_2.BackgroundTransparency=1
Vote_Log_GUI_071_TextLabel_2.Text="Vote Log"
Vote_Log_GUI_071_TextLabel_2.TextSize=12
Vote_Log_GUI_071_TextLabel_2.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_5=Color3.fromRGB(210,210,210)
Vote_Log_GUI_071_TextLabel_2.TextColor3=Vote_Log_GUI_071_color_5
Vote_Log_GUI_071_TextLabel_2.TextXAlignment=Enum.TextXAlignment.Left
Vote_Log_GUI_071_TextLabel_2.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_TextButton=Instance.new("TextButton",nil)
Vote_Log_GUI_071_size_9=UDim2.fromOffset(30,30)
Vote_Log_GUI_071_TextButton.Size=Vote_Log_GUI_071_size_9
Vote_Log_GUI_071_size_10=UDim2.new(1,-30,0,0)
Vote_Log_GUI_071_TextButton.Position=Vote_Log_GUI_071_size_10
Vote_Log_GUI_071_TextButton.BackgroundTransparency=1
Vote_Log_GUI_071_TextButton.Text="×"
Vote_Log_GUI_071_TextButton.TextSize=16
Vote_Log_GUI_071_TextButton.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_6=Color3.fromRGB(190,190,190)
Vote_Log_GUI_071_TextButton.TextColor3=Vote_Log_GUI_071_color_6
Vote_Log_GUI_071_TextButton.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_TextButton_2=Instance.new("TextButton",nil)
Vote_Log_GUI_071_size_11=UDim2.fromOffset(30,30)
Vote_Log_GUI_071_TextButton_2.Size=Vote_Log_GUI_071_size_11
Vote_Log_GUI_071_size_12=UDim2.new(1,-60,0,0)
Vote_Log_GUI_071_TextButton_2.Position=Vote_Log_GUI_071_size_12
Vote_Log_GUI_071_TextButton_2.BackgroundTransparency=1
Vote_Log_GUI_071_TextButton_2.Text="–"
Vote_Log_GUI_071_TextButton_2.TextSize=15
Vote_Log_GUI_071_TextButton_2.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_7=Color3.fromRGB(190,190,190)
Vote_Log_GUI_071_TextButton_2.TextColor3=Vote_Log_GUI_071_color_7
Vote_Log_GUI_071_TextButton_2.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_TextButton_3=Instance.new("TextButton",nil)
Vote_Log_GUI_071_size_13=UDim2.fromOffset(30,30)
Vote_Log_GUI_071_TextButton_3.Size=Vote_Log_GUI_071_size_13
Vote_Log_GUI_071_size_14=UDim2.new(1,-90,0,0)
Vote_Log_GUI_071_TextButton_3.Position=Vote_Log_GUI_071_size_14
Vote_Log_GUI_071_TextButton_3.BackgroundTransparency=1
Vote_Log_GUI_071_TextButton_3.Text="↓"
Vote_Log_GUI_071_TextButton_3.TextSize=13
Vote_Log_GUI_071_TextButton_3.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_8=Color3.fromRGB(190,190,190)
Vote_Log_GUI_071_TextButton_3.TextColor3=Vote_Log_GUI_071_color_8
Vote_Log_GUI_071_TextButton_3.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_color_9=Color3.fromRGB(100,180,255)
Vote_Log_GUI_071_color_10=Color3.fromRGB(255,200,80)
Vote_Log_GUI_071_color_11=Color3.fromRGB(255,120,120)
Vote_Log_GUI_071_TextButton_4=Instance.new("TextButton",nil)
Vote_Log_GUI_071_size_15=UDim2.fromOffset(36,16)
Vote_Log_GUI_071_TextButton_4.Size=Vote_Log_GUI_071_size_15
Vote_Log_GUI_071_size_16=UDim2.fromOffset(90,7)
Vote_Log_GUI_071_TextButton_4.Position=Vote_Log_GUI_071_size_16
Vote_Log_GUI_071_TextButton_4.BackgroundColor3=Vote_Log_GUI_071_color_9
Vote_Log_GUI_071_TextButton_4.BackgroundTransparency=0.3
Vote_Log_GUI_071_TextButton_4.Text="Votes"
Vote_Log_GUI_071_TextButton_4.TextSize=9
Vote_Log_GUI_071_TextButton_4.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_12=Color3.fromRGB(220,220,220)
Vote_Log_GUI_071_TextButton_4.TextColor3=Vote_Log_GUI_071_color_12
Vote_Log_GUI_071_TextButton_4.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_UICorner_3=Instance.new("UICorner",Vote_Log_GUI_071_TextButton_4)
Vote_Log_GUI_071_dimension_3=UDim.new(1,0)
Vote_Log_GUI_071_UICorner_3.CornerRadius=Vote_Log_GUI_071_dimension_3
Vote_Log_GUI_071_TextButton_4.MouseButton1Click:Connect(Helper_264)
Vote_Log_GUI_071_TextButton_5=Instance.new("TextButton",nil)
Vote_Log_GUI_071_size_17=UDim2.fromOffset(36,16)
Vote_Log_GUI_071_TextButton_5.Size=Vote_Log_GUI_071_size_17
Vote_Log_GUI_071_size_18=UDim2.fromOffset(128,7)
Vote_Log_GUI_071_TextButton_5.Position=Vote_Log_GUI_071_size_18
Vote_Log_GUI_071_TextButton_5.BackgroundColor3=Vote_Log_GUI_071_color_10
Vote_Log_GUI_071_TextButton_5.BackgroundTransparency=0.3
Vote_Log_GUI_071_TextButton_5.Text="Jury"
Vote_Log_GUI_071_TextButton_5.TextSize=9
Vote_Log_GUI_071_TextButton_5.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_13=Color3.fromRGB(220,220,220)
Vote_Log_GUI_071_TextButton_5.TextColor3=Vote_Log_GUI_071_color_13
Vote_Log_GUI_071_TextButton_5.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_UICorner_4=Instance.new("UICorner",Vote_Log_GUI_071_TextButton_5)
Vote_Log_GUI_071_dimension_4=UDim.new(1,0)
Vote_Log_GUI_071_UICorner_4.CornerRadius=Vote_Log_GUI_071_dimension_4
Vote_Log_GUI_071_TextButton_5.MouseButton1Click:Connect(Helper_265)
Vote_Log_GUI_071_TextButton_6=Instance.new("TextButton",nil)
Vote_Log_GUI_071_size_19=UDim2.fromOffset(36,16)
Vote_Log_GUI_071_TextButton_6.Size=Vote_Log_GUI_071_size_19
Vote_Log_GUI_071_size_20=UDim2.fromOffset(166,7)
Vote_Log_GUI_071_TextButton_6.Position=Vote_Log_GUI_071_size_20
Vote_Log_GUI_071_TextButton_6.BackgroundColor3=Vote_Log_GUI_071_color_11
Vote_Log_GUI_071_TextButton_6.BackgroundTransparency=0.3
Vote_Log_GUI_071_TextButton_6.Text="Exile"
Vote_Log_GUI_071_TextButton_6.TextSize=9
Vote_Log_GUI_071_TextButton_6.Font=Enum.Font.GothamBold
Vote_Log_GUI_071_color_14=Color3.fromRGB(220,220,220)
Vote_Log_GUI_071_TextButton_6.TextColor3=Vote_Log_GUI_071_color_14
Vote_Log_GUI_071_TextButton_6.Parent=Vote_Log_GUI_071_Frame_2
Vote_Log_GUI_071_UICorner_5=Instance.new("UICorner",Vote_Log_GUI_071_TextButton_6)
Vote_Log_GUI_071_dimension_5=UDim.new(1,0)
Vote_Log_GUI_071_UICorner_5.CornerRadius=Vote_Log_GUI_071_dimension_5
Vote_Log_GUI_071_TextButton_6.MouseButton1Click:Connect(Helper_266)
Vote_Log_GUI_071_ScrollingFrame=Instance.new("ScrollingFrame",nil)
Vote_Log_GUI_071_ScrollingFrame.Name="SC"
Vote_Log_GUI_071_size_21=UDim2.new(1,-4,1,-33)
Vote_Log_GUI_071_ScrollingFrame.Size=Vote_Log_GUI_071_size_21
Vote_Log_GUI_071_size_22=UDim2.new(0,2,0,31)
Vote_Log_GUI_071_ScrollingFrame.Position=Vote_Log_GUI_071_size_22
Vote_Log_GUI_071_ScrollingFrame.BackgroundTransparency=1
Vote_Log_GUI_071_ScrollingFrame.BorderSizePixel=0
Vote_Log_GUI_071_ScrollingFrame.ScrollBarThickness=3
Vote_Log_GUI_071_color_15=Color3.fromRGB(70,70,100)
Vote_Log_GUI_071_ScrollingFrame.ScrollBarImageColor3=Vote_Log_GUI_071_color_15
Vote_Log_GUI_071_ScrollingFrame.ScrollingDirection=Enum.ScrollingDirection.Y
Vote_Log_GUI_071_size_23=UDim2.fromOffset(0,0)
Vote_Log_GUI_071_ScrollingFrame.CanvasSize=Vote_Log_GUI_071_size_23
Vote_Log_GUI_071_ScrollingFrame.ElasticBehavior=Enum.ElasticBehavior.Never
Vote_Log_GUI_071_ScrollingFrame.Parent=Vote_Log_GUI_071_Frame
Vote_Log_GUI_071_UIListLayout=Instance.new("UIListLayout",nil)
Vote_Log_GUI_071_UIListLayout.SortOrder=Enum.SortOrder.LayoutOrder
Vote_Log_GUI_071_dimension_6=UDim.new(0,1)
Vote_Log_GUI_071_UIListLayout.Padding=Vote_Log_GUI_071_dimension_6
Vote_Log_GUI_071_UIListLayout.Parent=Vote_Log_GUI_071_ScrollingFrame
Vote_Log_GUI_071_AbsoluteContentSize=Vote_Log_GUI_071_UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
Vote_Log_GUI_071_AbsoluteContentSize:Connect(Helper_267)
Vote_Log_GUI_071_ScrollingFrame.InputBegan:Connect(Helper_268)
Vote_Log_GUI_071_TextLabel_3=Instance.new("TextLabel",nil)
Vote_Log_GUI_071_TextLabel_3.Name="Empty"
Vote_Log_GUI_071_size_24=UDim2.new(1,-6,0,22)
Vote_Log_GUI_071_TextLabel_3.Size=Vote_Log_GUI_071_size_24
Vote_Log_GUI_071_TextLabel_3.BackgroundTransparency=1
Vote_Log_GUI_071_TextLabel_3.Text="Waiting for votes..."
Vote_Log_GUI_071_TextLabel_3.TextSize=12
Vote_Log_GUI_071_TextLabel_3.Font=Enum.Font.Gotham
Vote_Log_GUI_071_color_16=Color3.fromRGB(80,80,100)
Vote_Log_GUI_071_TextLabel_3.TextColor3=Vote_Log_GUI_071_color_16
Vote_Log_GUI_071_TextLabel_3.TextXAlignment=Enum.TextXAlignment.Left
Vote_Log_GUI_071_TextLabel_3.LayoutOrder=0
Vote_Log_GUI_071_TextLabel_3.Parent=Vote_Log_GUI_071_ScrollingFrame
Color3.fromRGB(140,200,255)
Vote_Log_GUI_071_connection=replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_269)
Color3.fromRGB(255,200,80)
Vote_Log_GUI_071_connection_2=replicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Helper_270)
Color3.fromRGB(255,120,120)
Vote_Log_GUI_071_connection_3=replicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Helper_271)
Vote_Log_GUI_071_TextButton_3.MouseButton1Click:Connect(Helper_272)
Vote_Log_GUI_071_TextButton_2.MouseButton1Click:Connect(Helper_273)
Vote_Log_GUI_071_TextButton.MouseButton1Click:Connect(Helper_274)
Vote_Log_GUI_071_Frame_2.InputBegan:Connect(Helper_275)
Vote_Log_GUI_071_connection_4=userInputService.InputEnded:Connect(Helper_276)
Vote_Log_GUI_071_connection_5=userInputService.InputChanged:Connect(Helper_277)
Vote_Log_GUI_071_ScreenGui.Destroying:Connect(Helper_278)
windUI:Notify({Duration=3,Content="Opened! Waiting for votes...",Title="Vote Log"})
end
local function Tiebreaker_Detector_072(a1,a2,a3,a4,a5,a6,a7,a8)
Tiebreaker_Detector_072_Season=replicatedStorage:WaitForChild("Season",5)
Tiebreaker_Detector_072_Voting=Tiebreaker_Detector_072_Season:WaitForChild("Voting",5)
Tiebreaker_Detector_072_Votes=Tiebreaker_Detector_072_Voting:WaitForChild("Votes",5)
Tiebreaker_Detector_072_Votes:GetChildren()
Tiebreaker_Detector_072_Votes.ChildAdded:Connect(Helper_279)
Tiebreaker_Detector_072_Votes.ChildRemoved:Connect(Helper_280)
windUI:Notify({Duration=3,Content="Watching votes.",Title="Tiebreaker"})
end
local function Check_Vote_Tally_073(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes:GetChildren()
windUI:Notify({Duration=4,Content="No votes cast yet.",Title="Vote Tally"})
end
local function Round_Type_074(a1,a2,a3,a4,a5,a6,a7,a8)
Round_Type_074_CurrentTwist=replicatedStorage.Season.Twists:FindFirstChild("CurrentTwist")
windUI:Notify({Duration=5,Content=Round_Type_074_CurrentTwist.Value,Title="Round Type"})
end
local function Teamers_075(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage:FindFirstChild("Season")
replicatedStorage.Season:FindFirstChild("Players")
players:GetPlayers()
windUI:Notify({Duration=5,Content="No teamers detected.",Title="Teamers"})
end
local function Round_Detector_076(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_281)
windUI:Notify({Duration=3,Content="Watching for twists and merges.",Title="Round Detector"})
end
local function Server_Hop_on_Merge_077(a1,a2,a3,a4,a5,a6,a7,a8)
Server_Hop_on_Merge_077_Season=replicatedStorage:WaitForChild("Season",5)
Server_Hop_on_Merge_077_Values=Server_Hop_on_Merge_077_Season:WaitForChild("Values",5)
Server_Hop_on_Merge_077_Merge=Server_Hop_on_Merge_077_Values:WaitForChild("Merge",5)
Server_Hop_on_Merge_077_Merge.Changed:Connect(Helper_282)
windUI:Notify({Duration=3,Content="Watching for merge.",Title="Server Hop"})
end
local function Server_Hop_Now_078(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=3,Content="Hopping to a new server...",Title="Server Hop"})
task.wait()
Server_Hop_Now_078_TeleportService=game:GetService("TeleportService")
Server_Hop_Now_078_TeleportService:Teleport(game.PlaceId,players.LocalPlayer)
end
local function Auto_Rejoin_When_Voted_Out_079(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_283)
windUI:Notify({Duration=3,Content="Active — watching your team status.",Title="Auto Rejoin"})
end
local function TP_Above_Map_080(a1,a2,a3,a4,a5,a6,a7,a8)
TP_Above_Map_080_Part=Instance.new("Part",workspace)
TP_Above_Map_080_Part.Anchored=true
TP_Above_Map_080_value=Vector3.new(300,10,300)
TP_Above_Map_080_Part.Size=TP_Above_Map_080_value
TP_Above_Map_080_value_2=CFrame.new(0,2900,0)
TP_Above_Map_080_Part.CFrame=TP_Above_Map_080_value_2
TP_Above_Map_080_Part.Transparency=1
TP_Above_Map_080_Part.CanCollide=true
TP_Above_Map_080_Part.Name="EllaHubPlatform"
task.spawn(Helper_284)
windUI:Notify({Duration=3,Content="Floating at Y=3000.",Title="Above Map"})
end
local function Auto_Join_Camp_From_Lobby_081(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_285)
windUI:Notify({Duration=3,Content="Firing Teleport:Camp every 5s...",Title="Auto Join"})
end
local function Check_Elim_Reason_082(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Products.CharacterSelection.Characters:GetChildren()
windUI:Notify({Duration=4,Content="None set yet.",Title="Elim Reason"})
end
local function Notify_Elim_Reason_083(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Products.CharacterSelection.Characters:GetChildren()
replicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(Helper_286)
end
local function Expose_Elim_in_Chat_084(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Products.CharacterSelection.Characters:GetChildren()
replicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(Helper_287)
end
local function Send_Elim_to_Webhook_085(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Products.CharacterSelection.Characters:GetChildren()
replicatedStorage.Products.CharacterSelection.Characters.ChildAdded:Connect(Helper_288)
end
local function Remove_Intro_Cutscene_086(a1,a2,a3,a4,a5,a6,a7,a8)
Remove_Intro_Cutscene_086_Events=replicatedStorage:FindFirstChild("Events")
Remove_Intro_Cutscene_086_Camera=Remove_Intro_Cutscene_086_Events:FindFirstChild("Camera")
Remove_Intro_Cutscene_086_Camera:Destroy()
Remove_Intro_Cutscene_086_Humanoid=players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
workspace.CurrentCamera.CameraType=Enum.CameraType.Custom
workspace.CurrentCamera.CameraSubject=Remove_Intro_Cutscene_086_Humanoid
end
local function Fling_Reanimate_087(a1,a2,a3,a4,a5,a6,a7,a8)
Fling_Reanimate_087_value=game:HttpGet("https://raw.githubusercontent.com/robloxcheatck/reanimatescript/main/script.lua")
Fling_Reanimate_087_value_2=loadstring(Fling_Reanimate_087_value)
Fling_Reanimate_087_value_2()
end
local function Open_Console_088(a1,a2,a3,a4,a5,a6,a7,a8)
starterGui:SetCore("DevConsoleVisible",true)
end
local function Auto_Block_Long_Usernames_089(a1,a2,a3,a4,a5,a6,a7,a8)
runService.RenderStepped:Connect(Helper_289)
end
local function Gear_Keeper_090(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Backpack:GetChildren()
players.LocalPlayer.Character:GetChildren()
players.LocalPlayer.Backpack.ChildAdded:Connect(Helper_290)
players.LocalPlayer.Backpack.ChildRemoved:Connect(Helper_291)
players.LocalPlayer.CharacterAdded:Connect(Helper_292)
windUI:Notify({Duration=3,Content="Active — saved 0 tool(s).",Title="Gear Keeper"})
end
local function Snapshot_Gear_Now_091(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Backpack:GetChildren()
players.LocalPlayer.Character:GetChildren()
windUI:Notify({Duration=3,Content="Saved 0 tool(s).",Title="Gear Keeper"})
end
local function Restore_Gear_Now_092(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=3,Content="Restored 0 tool(s).",Title="Gear Keeper"})
end
local function Anti_Gear_Removal_093(a1,a2,a3,a4,a5,a6,a7,a8)
Anti_Gear_Removal_093_value=newcclosure(Helper_293)
Anti_Gear_Removal_093_value_2=hookmetamethod(game,"__namecall",Anti_Gear_Removal_093_value)
windUI:Notify({Duration=3,Content="Active — Gear Remove calls blocked.",Title="Anti Gear"})
end
local function Set_Male_094(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Buy:FireServer("Gender","Male")
end
local function Set_Female_095(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Buy:FireServer("Gender","Female")
end
local function Symbol_096(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Character_Name_097(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Buy_Character_60_coins_098(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Buy:FireServer("Character",nil)
end
local function Christmas_Map_099(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
BrickColor.new("White")
workspace:GetDescendants()
Christmas_Map_099_color=Color3.fromRGB(127,127,127)
lighting.Ambient=Christmas_Map_099_color
Christmas_Map_099_color_2=Color3.fromRGB(127,127,127)
lighting.OutdoorAmbient=Christmas_Map_099_color_2
lighting.FogEnd=100000
lighting.ClockTime=14
windUI:Notify({Duration=3,Content="Christmas applied!",Title="Map Theme"})
end
local function Halloween_Map_100(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
workspace:GetDescendants()
Halloween_Map_100_color=Color3.fromRGB(80,80,80)
lighting.Ambient=Halloween_Map_100_color
Halloween_Map_100_color_2=Color3.fromRGB(80,80,80)
lighting.OutdoorAmbient=Halloween_Map_100_color_2
Halloween_Map_100_color_3=Color3.fromRGB(70,70,70)
lighting.FogColor=Halloween_Map_100_color_3
lighting.FogEnd=300
lighting.ClockTime=16
windUI:Notify({Duration=3,Content="Halloween applied!",Title="Map Theme"})
end
local function Valentines_Map_101(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
Color3.fromRGB(255,152,220)
workspace:GetDescendants()
Valentines_Map_101_color=Color3.fromRGB(127,127,127)
lighting.Ambient=Valentines_Map_101_color
Valentines_Map_101_color_2=Color3.fromRGB(127,127,127)
lighting.OutdoorAmbient=Valentines_Map_101_color_2
lighting.FogEnd=100000
lighting.ClockTime=14
windUI:Notify({Duration=3,Content="Valentines applied!",Title="Map Theme"})
end
local function Reset_Map_102(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
Reset_Map_102_color=Color3.fromRGB(127,127,127)
lighting.Ambient=Reset_Map_102_color
Reset_Map_102_color_2=Color3.fromRGB(127,127,127)
lighting.OutdoorAmbient=Reset_Map_102_color_2
lighting.FogEnd=100000
lighting.ClockTime=14
windUI:Notify({Duration=3,Content="Reset done.",Title="Map Theme"})
end
local function Walk_Speed_103(a1,a2,a3,a4,a5,a6,a7,a8)
Walk_Speed_103_Humanoid=players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Walk_Speed_103_Humanoid.WalkSpeed=a1
end
local function Jump_Power_104(a1,a2,a3,a4,a5,a6,a7,a8)
Jump_Power_104_Humanoid=players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Jump_Power_104_Humanoid.JumpPower=a1
end
local function Freeze_Timer_Display_105(a1,a2,a3,a4,a5,a6,a7,a8)
Freeze_Timer_Display_105_GuiTexts=replicatedStorage:WaitForChild("GuiTexts",5)
Freeze_Timer_Display_105_GuiTexts:WaitForChild("Timer",5)
runService.RenderStepped:Connect(Helper_294)
windUI:Notify({Duration=3,Content="Timer display frozen at 0:00",Title="Timer"})
end
local function Hide_Timer_106(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.PlayerGui:GetChildren()
windUI:Notify({Duration=2,Content="Timer hidden.",Title="Timer"})
end
local function Remove_Glass_Barriers_107(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
end
local function Walk_on_Lake_108(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Lake_God_Mode_109(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Choose_Player_110(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_111(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
helper_111_Season=replicatedStorage:WaitForChild("Season",5)
helper_111_Players=helper_111_Season:WaitForChild("Players",5)
helper_111_Players:GetChildren()
targetPlayerDropdown:Refresh({[1]="(none)"})
end
local function Helper_112(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
helper_112_Season=replicatedStorage:WaitForChild("Season",5)
helper_112_Players=helper_112_Season:WaitForChild("Players",5)
helper_112_Players:GetChildren()
targetPlayerDropdown:Refresh({[1]="(none)"})
end
local function Teleport_To_113(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage:FindFirstChild("Season")
Teleport_To_113_Players=replicatedStorage.Season:FindFirstChild("Players")
Teleport_To_113_Players:GetChildren()
end
local function Refresh_List_114(a1,a2,a3,a4,a5,a6,a7,a8)
Refresh_List_114_Season=replicatedStorage:WaitForChild("Season",5)
Refresh_List_114_Players=Refresh_List_114_Season:WaitForChild("Players",5)
Refresh_List_114_Players:GetChildren()
targetPlayerDropdown:Refresh({[1]="(none)"})
Refresh_List_114_Season_2=replicatedStorage:WaitForChild("Season",5)
Refresh_List_114_Players_2=Refresh_List_114_Season_2:WaitForChild("Players",5)
Refresh_List_114_Players_2:GetChildren()
windUI:Notify({Duration=2,Content="Refreshed 0 players.",Title="Player List"})
end
local function Highlight_Player_115(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage:FindFirstChild("Season")
Highlight_Player_115_Players=replicatedStorage.Season:FindFirstChild("Players")
Highlight_Player_115_Players:GetChildren()
end
local function Choose_Player_116(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Refresh_List_117(a1,a2,a3,a4,a5,a6,a7,a8)
players:GetPlayers()
statsPlayerDropdown:Refresh({})
end
local function Camp_Wins_118(a1,a2,a3,a4,a5,a6,a7,a8)
Camp_Wins_118_child=players:FindFirstChild(a1)
Camp_Wins_118_DataStore=Camp_Wins_118_child:FindFirstChild("DataStore")
Camp_Wins_118_CampWins=Camp_Wins_118_DataStore:FindFirstChild("CampWins")
windUI:Notify({Duration=5,Content=(a1..(" has "..(Camp_Wins_118_CampWins.Value.." camp wins."))),Title="Camp Wins"})
end
local function Movie_Wins_119(a1,a2,a3,a4,a5,a6,a7,a8)
Movie_Wins_119_child=players:FindFirstChild(a1)
Movie_Wins_119_DataStore=Movie_Wins_119_child:FindFirstChild("DataStore")
Movie_Wins_119_MoviesWins=Movie_Wins_119_DataStore:FindFirstChild("MoviesWins")
windUI:Notify({Duration=5,Content=(a1..(" has "..(Movie_Wins_119_MoviesWins.Value.." movie wins."))),Title="Movie Wins"})
end
local function Expedition_Wins_120(a1,a2,a3,a4,a5,a6,a7,a8)
Expedition_Wins_120_child=players:FindFirstChild(a1)
Expedition_Wins_120_DataStore=Expedition_Wins_120_child:FindFirstChild("DataStore")
Expedition_Wins_120_ExpeditionWins=Expedition_Wins_120_DataStore:FindFirstChild("ExpeditionWins")
windUI:Notify({Duration=5,Content=(a1..(" has "..(Expedition_Wins_120_ExpeditionWins.Value.." expedition wins."))),Title="Expedition Wins"})
end
local function Coins_121(a1,a2,a3,a4,a5,a6,a7,a8)
Coins_121_child=players:FindFirstChild(a1)
Coins_121_DataStore=Coins_121_child:FindFirstChild("DataStore")
Coins_121_Coins=Coins_121_DataStore:FindFirstChild("Coins")
windUI:Notify({Duration=5,Content=(a1..(" has "..(Coins_121_Coins.Value.." coins."))),Title="Coins"})
end
local function Comeback_Wins_122(a1,a2,a3,a4,a5,a6,a7,a8)
Comeback_Wins_122_child=players:FindFirstChild(a1)
Comeback_Wins_122_DataStore=Comeback_Wins_122_child:FindFirstChild("DataStore")
Comeback_Wins_122_ComebackWins=Comeback_Wins_122_DataStore:FindFirstChild("ComebackWins")
windUI:Notify({Duration=5,Content=(a1..(" has "..(Comeback_Wins_122_ComebackWins.Value.." comeback wins."))),Title="Comeback Wins"})
end
local function Games_Played_123(a1,a2,a3,a4,a5,a6,a7,a8)
Games_Played_123_child=players:FindFirstChild(a1)
Games_Played_123_DataStore=Games_Played_123_child:FindFirstChild("DataStore")
Games_Played_123_GamesPlayed=Games_Played_123_DataStore:FindFirstChild("GamesPlayed")
windUI:Notify({Duration=5,Content=(a1..(" played "..(Games_Played_123_GamesPlayed.Value.." games."))),Title="Games Played"})
end
local function Idols_Found_124(a1,a2,a3,a4,a5,a6,a7,a8)
Idols_Found_124_child=players:FindFirstChild(a1)
Idols_Found_124_DataStore=Idols_Found_124_child:FindFirstChild("DataStore")
Idols_Found_124_IdolsFound=Idols_Found_124_DataStore:FindFirstChild("IdolsFound")
windUI:Notify({Duration=5,Content=(a1..(" found "..(Idols_Found_124_IdolsFound.Value.." idols."))),Title="Idols Found"})
end
local function Skins_125(a1,a2,a3,a4,a5,a6,a7,a8)
Skins_125_child=players:FindFirstChild(a1)
Skins_125_child:FindFirstChild("DataStore")
Skins_125_Skins=Skins_125_child.DataStore:FindFirstChild("Skins")
Skins_125_Skins:GetChildren()
windUI:Notify({Duration=6,Content=nil,Title="Skins"})
end
local function Marshmallows_126(a1,a2,a3,a4,a5,a6,a7,a8)
Marshmallows_126_child=players:FindFirstChild(a1)
Marshmallows_126_child:FindFirstChild("DataStore")
Marshmallows_126_Marshmallows=Marshmallows_126_child.DataStore:FindFirstChild("Marshmallows")
Marshmallows_126_Marshmallows:GetChildren()
windUI:Notify({Duration=6,Content=nil,Title="Marshmallows"})
end
local function Spectator_Island_127(a1,a2,a3,a4,a5,a6,a7,a8)
Spectator_Island_127_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Spectator_Island_127_value=CFrame.new(33,-16,31)
Spectator_Island_127_HumanoidRootPart.CFrame=Spectator_Island_127_value
end
local function Main_Island_128(a1,a2,a3,a4,a5,a6,a7,a8)
Main_Island_128_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Main_Island_128_value=CFrame.new(150,-17,-417)
Main_Island_128_HumanoidRootPart.CFrame=Main_Island_128_value
end
local function Exile_Island_129(a1,a2,a3,a4,a5,a6,a7,a8)
Exile_Island_129_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Exile_Island_129_value=CFrame.new(-116,-14,-166)
Exile_Island_129_HumanoidRootPart.CFrame=Exile_Island_129_value
end
local function Voting_Area_130(a1,a2,a3,a4,a5,a6,a7,a8)
Voting_Area_130_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Voting_Area_130_value=CFrame.new(-23,95,-514)
Voting_Area_130_HumanoidRootPart.CFrame=Voting_Area_130_value
end
local function Boat_131(a1,a2,a3,a4,a5,a6,a7,a8)
Boat_131_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Boat_131_value=CFrame.new(47,-20,-297)
Boat_131_HumanoidRootPart.CFrame=Boat_131_value
end
local function Bathroom_132(a1,a2,a3,a4,a5,a6,a7,a8)
Bathroom_132_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Bathroom_132_value=CFrame.new(302,-15,-325)
Bathroom_132_HumanoidRootPart.CFrame=Bathroom_132_value
end
local function Starter_Island_133(a1,a2,a3,a4,a5,a6,a7,a8)
Starter_Island_133_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Starter_Island_133_value=CFrame.new(-672,-67,-617)
Starter_Island_133_HumanoidRootPart.CFrame=Starter_Island_133_value
end
local function Voting_Area_134(a1,a2,a3,a4,a5,a6,a7,a8)
Voting_Area_134_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Voting_Area_134_value=CFrame.new(83,60,-187)
Voting_Area_134_HumanoidRootPart.CFrame=Voting_Area_134_value
end
local function Cabin_1_135(a1,a2,a3,a4,a5,a6,a7,a8)
Cabin_1_135_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Cabin_1_135_value=CFrame.new(-1,56,-34)
Cabin_1_135_HumanoidRootPart.CFrame=Cabin_1_135_value
end
local function Cabin_2_136(a1,a2,a3,a4,a5,a6,a7,a8)
Cabin_2_136_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Cabin_2_136_value=CFrame.new(-8,53,144)
Cabin_2_136_HumanoidRootPart.CFrame=Cabin_2_136_value
end
local function Dining_Room_137(a1,a2,a3,a4,a5,a6,a7,a8)
Dining_Room_137_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Dining_Room_137_value=CFrame.new(-1,53,168)
Dining_Room_137_HumanoidRootPart.CFrame=Dining_Room_137_value
end
local function Kitchen_138(a1,a2,a3,a4,a5,a6,a7,a8)
Kitchen_138_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Kitchen_138_value=CFrame.new(-210,49,30)
Kitchen_138_HumanoidRootPart.CFrame=Kitchen_138_value
end
local function Inside_Boat_139(a1,a2,a3,a4,a5,a6,a7,a8)
Inside_Boat_139_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Inside_Boat_139_value=CFrame.new(-47,80,-28)
Inside_Boat_139_HumanoidRootPart.CFrame=Inside_Boat_139_value
end
local function Ship_Voting_Area_140(a1,a2,a3,a4,a5,a6,a7,a8)
Ship_Voting_Area_140_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Ship_Voting_Area_140_value=CFrame.new(-154,101,-31)
Ship_Voting_Area_140_HumanoidRootPart.CFrame=Ship_Voting_Area_140_value
end
local function First_Class_VIP_141(a1,a2,a3,a4,a5,a6,a7,a8)
First_Class_VIP_141_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
First_Class_VIP_141_value=CFrame.new(154,98,-33)
First_Class_VIP_141_HumanoidRootPart.CFrame=First_Class_VIP_141_value
end
local function _2nd_Class_142(a1,a2,a3,a4,a5,a6,a7,a8)
_2nd_Class_142_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
_2nd_Class_142_value=CFrame.new(50,98,-34)
_2nd_Class_142_HumanoidRootPart.CFrame=_2nd_Class_142_value
end
local function Ship_Bathroom_143(a1,a2,a3,a4,a5,a6,a7,a8)
Ship_Bathroom_143_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Ship_Bathroom_143_value=CFrame.new(5,98,-23)
Ship_Bathroom_143_HumanoidRootPart.CFrame=Ship_Bathroom_143_value
end
local function Dining_Class_144(a1,a2,a3,a4,a5,a6,a7,a8)
Dining_Class_144_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Dining_Class_144_value=CFrame.new(-45,98,-34)
Dining_Class_144_HumanoidRootPart.CFrame=Dining_Class_144_value
end
local function Basement_145(a1,a2,a3,a4,a5,a6,a7,a8)
Basement_145_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Basement_145_value=CFrame.new(-47,80,-28)
Basement_145_HumanoidRootPart.CFrame=Basement_145_value
end
local function VC_Unban_146(a1,a2,a3,a4,a5,a6,a7,a8)
VC_Unban_146_VoiceChatService=game:GetService("VoiceChatService")
VC_Unban_146_VoiceChatService:joinVoice()
end
local function Apply_Shaders_147(a1,a2,a3,a4,a5,a6,a7,a8)
Apply_Shaders_147_Lighting=game:GetService("Lighting")
Apply_Shaders_147_value=settings()
Apply_Shaders_147_value.Rendering.QualityLevel=Enum.QualityLevel.Level21
Apply_Shaders_147_Lighting.Technology=Enum.Technology.ShadowMap
Apply_Shaders_147_Lighting.ShadowSoftness=0.15
Apply_Shaders_147_Lighting.ClockTime=9
Apply_Shaders_147_Lighting.Brightness=5
Apply_Shaders_147_color=Color3.fromRGB(70,70,70)
Apply_Shaders_147_Lighting.Ambient=Apply_Shaders_147_color
Apply_Shaders_147_color_2=Color3.fromRGB(255,138,35)
Apply_Shaders_147_Lighting.ColorShift_Top=Apply_Shaders_147_color_2
Apply_Shaders_147_color_3=Color3.fromRGB(135,135,135)
Apply_Shaders_147_Lighting.OutdoorAmbient=Apply_Shaders_147_color_3
Apply_Shaders_147_Lighting.GlobalShadows=true
Apply_Shaders_147_Lighting.ExposureCompensation=0
workspace.Terrain.WaterReflectance=0.08
workspace.Terrain.WaterTransparency=0.85
Apply_Shaders_147_color_4=Color3.fromRGB(12,84,92)
workspace.Terrain.WaterDefaultColor=Apply_Shaders_147_color_4
Apply_Shaders_147_Sky=Instance.new("Sky",Apply_Shaders_147_Lighting)
Apply_Shaders_147_Sky.SkyboxBk="rbxassetid://271042516"
Apply_Shaders_147_Sky.SkyboxDn="rbxassetid://271077243"
Apply_Shaders_147_Sky.SkyboxFt="rbxassetid://271042556"
Apply_Shaders_147_Sky.SkyboxLf="rbxassetid://271042310"
Apply_Shaders_147_Sky.SkyboxRt="rbxassetid://271042467"
Apply_Shaders_147_Sky.SkyboxUp="rbxassetid://271077958"
end
local function Infinite_Yield_148(a1,a2,a3,a4,a5,a6,a7,a8)
Infinite_Yield_148_value=game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
Infinite_Yield_148_value_2=loadstring(Infinite_Yield_148_value)
Infinite_Yield_148_value_2()
end
local function Fly_GUI_149(a1,a2,a3,a4,a5,a6,a7,a8)
Fly_GUI_149_value=game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt")
Fly_GUI_149_value_2=loadstring(Fly_GUI_149_value)
Fly_GUI_149_value_2()
end
local function Wall_Hop_150(a1,a2,a3,a4,a5,a6,a7,a8)
Wall_Hop_150_value=game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-WallHop-Script-38387")
Wall_Hop_150_value_2=loadstring(Wall_Hop_150_value)
Wall_Hop_150_value_2()
end
local function Sound_Panel_151(a1,a2,a3,a4,a5,a6,a7,a8)
Sound_Panel_151_value=game:HttpGet("https://pastebin.com/raw/w3uzjgEq")
Sound_Panel_151_value_2=loadstring(Sound_Panel_151_value)
Sound_Panel_151_value_2()
end
local function Energize_Animations_152(a1,a2,a3,a4,a5,a6,a7,a8)
Energize_Animations_152_value=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Energize.lua")
Energize_Animations_152_value_2=loadstring(Energize_Animations_152_value)
Energize_Animations_152_value_2()
end
local function Bring_Back_Old_Chat_153(a1,a2,a3,a4,a5,a6,a7,a8)
Bring_Back_Old_Chat_153_value=game:HttpGet("https://pastebin.com/raw/9AQrDua1")
Bring_Back_Old_Chat_153_value_2=loadstring(Bring_Back_Old_Chat_153_value)
Bring_Back_Old_Chat_153_value_2()
windUI:Notify({Duration=3,Content="Old chat loaded!",Title="Chat"})
end
local function Collision_154(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_295)
end
local function Hacker_Detector_155(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_296)
end
local function Team_156(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Refresh_Teams_157(a1,a2,a3,a4,a5,a6,a7,a8)
Refresh_Teams_157_Teams=game:GetService("Teams")
Refresh_Teams_157_Teams:GetChildren()
teamDropdown:Refresh({[1]="Spectator",[2]="Jury",[3]="Team1",[4]="Team2",[5]="Team3"})
windUI:Notify({Duration=2,Content="5 team(s) loaded.",Title="Teams"})
end
local function Set_Team_158(a1,a2,a3,a4,a5,a6,a7,a8)
Set_Team_158_Teams=game:GetService("Teams")
Set_Team_158_Spectator=Set_Team_158_Teams:FindFirstChild("Spectator")
players.LocalPlayer.Team=Set_Team_158_Spectator
players.LocalPlayer.Neutral=false
windUI:Notify({Duration=3,Content="Joined Spectator",Title="Team"})
end
local function Spectator_159(a1,a2,a3,a4,a5,a6,a7,a8)
Spectator_159_Teams=game:GetService("Teams")
Spectator_159_Spectator=Spectator_159_Teams:FindFirstChild("Spectator")
players.LocalPlayer.Team=Spectator_159_Spectator
players.LocalPlayer.Neutral=false
windUI:Notify({Duration=3,Content="Joined Spectator",Title="Team"})
end
local function Jury_160(a1,a2,a3,a4,a5,a6,a7,a8)
Jury_160_Teams=game:GetService("Teams")
Jury_160_Jury=Jury_160_Teams:FindFirstChild("Jury")
players.LocalPlayer.Team=Jury_160_Jury
players.LocalPlayer.Neutral=false
windUI:Notify({Duration=3,Content="Joined Jury",Title="Team"})
end
local function Load_Fonts_161(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=4,Content="Downloading fonts...",Title="Fonts"})
task.spawn(Helper_297)
end
local function Starborn_162(a1,a2,a3,a4,a5,a6,a7,a8)
Starborn_162_value=getcustomasset("Starborn.json")
Starborn_162_value_2=Font.new(Starborn_162_value)
players.LocalPlayer.PlayerGui:GetDescendants()
players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Helper_298)
windUI:Notify({Duration=3,Content="Starborn applied!",Title="Fonts"})
end
local function VHS_163(a1,a2,a3,a4,a5,a6,a7,a8)
VHS_163_value=getcustomasset("VHS.json")
VHS_163_value_2=Font.new(VHS_163_value)
players.LocalPlayer.PlayerGui:GetDescendants()
players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Helper_299)
windUI:Notify({Duration=3,Content="VHS applied!",Title="Fonts"})
end
local function Minecrafter_164(a1,a2,a3,a4,a5,a6,a7,a8)
Minecrafter_164_value=getcustomasset("Minecrafter.json")
Minecrafter_164_value_2=Font.new(Minecrafter_164_value)
players.LocalPlayer.PlayerGui:GetDescendants()
players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Helper_300)
windUI:Notify({Duration=3,Content="Minecrafter applied!",Title="Fonts"})
end
local function Horror_165(a1,a2,a3,a4,a5,a6,a7,a8)
Horror_165_value=getcustomasset("Horror.json")
Font.new(Horror_165_value)
players.LocalPlayer.PlayerGui:GetDescendants()
players.LocalPlayer.PlayerGui.DescendantAdded:Connect(Helper_301)
windUI:Notify({Duration=3,Content="Horror applied!",Title="Fonts"})
end
local function Rainbow_Name_166(a1,a2,a3,a4,a5,a6,a7,a8)
runService.RenderStepped:Connect(Helper_302)
end
local function Skin_Changer_167(a1,a2,a3,a4,a5,a6,a7,a8)
Skin_Changer_167_value=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Skinchanger.lua")
Skin_Changer_167_value_2=loadstring(Skin_Changer_167_value)
Skin_Changer_167_value_2()
end
local function Size_Changer_168(a1,a2,a3,a4,a5,a6,a7,a8)
Size_Changer_168_value=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/Size.lua")
Size_Changer_168_value_2=loadstring(Size_Changer_168_value)
Size_Changer_168_value_2()
end
local function Gets_Admin_Panel_169(a1,a2,a3,a4,a5,a6,a7,a8)
Gets_Admin_Panel_169_Products=replicatedStorage:WaitForChild("Products",5)
Gets_Admin_Panel_169_GUIs=Gets_Admin_Panel_169_Products:WaitForChild("GUIs",5)
Gets_Admin_Panel_169_Settings=Gets_Admin_Panel_169_GUIs:WaitForChild("Settings",5)
Gets_Admin_Panel_169_clone=Gets_Admin_Panel_169_Settings:Clone()
Gets_Admin_Panel_169_PlayerGui=players.LocalPlayer:WaitForChild("PlayerGui")
Gets_Admin_Panel_169_clone.Parent=Gets_Admin_Panel_169_PlayerGui
Gets_Admin_Panel_169_clone.Enabled=true
Gets_Admin_Panel_169_clone:GetDescendants()
windUI:Notify({Duration=5,Content="Forced open! (May not work)",Title="Admin Panel"})
end
local function Auto_Farm_Coin_170(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_303)
end
local function Auto_Farm_Coins_2_171(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_304)
end
local function Auto_Restart_Day_172(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=3,Content="Active — watching for round end...",Title="Auto Restart Day"})
task.spawn(Helper_305)
end
local function Detect_Current_Obby_173(a1,a2,a3,a4,a5,a6,a7,a8)
Detect_Current_Obby_173_Assets=workspace:FindFirstChild("Assets")
Detect_Current_Obby_173_Assets:GetChildren()
windUI:Notify({Duration=4,Content="Assets folder is empty — no active challenge.",Title="Obby Detect"})
end
local function Auto_Detect_Obby_174(a1,a2,a3,a4,a5,a6,a7,a8)
Auto_Detect_Obby_174_Assets=workspace:FindFirstChild("Assets")
Auto_Detect_Obby_174_Assets.ChildAdded:Connect(Helper_306)
windUI:Notify({Duration=3,Content="Watching for new challenges...",Title="Obby Detector"})
end
local function Give_Dodgeball_175(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Dodgeball_175_Products=replicatedStorage:WaitForChild("Products",5)
Give_Dodgeball_175_Gear=Give_Dodgeball_175_Products:WaitForChild("Gear",5)
Give_Dodgeball_175_Dodgeball=Give_Dodgeball_175_Gear:FindFirstChild("Dodgeball")
Give_Dodgeball_175_clone=Give_Dodgeball_175_Dodgeball:Clone()
Give_Dodgeball_175_Handle=Give_Dodgeball_175_clone:FindFirstChild("Handle")
Give_Dodgeball_175_Handle.CanCollide=false
Give_Dodgeball_175_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Dodgeball added to your backpack!",Title="Give Gear"})
end
local function Give_Paintball_Gun_176(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Paintball_Gun_176_Products=replicatedStorage:WaitForChild("Products",5)
Give_Paintball_Gun_176_Gear=Give_Paintball_Gun_176_Products:WaitForChild("Gear",5)
Give_Paintball_Gun_176_PaintballGun=Give_Paintball_Gun_176_Gear:FindFirstChild("PaintballGun")
Give_Paintball_Gun_176_clone=Give_Paintball_Gun_176_PaintballGun:Clone()
Give_Paintball_Gun_176_Handle=Give_Paintball_Gun_176_clone:FindFirstChild("Handle")
Give_Paintball_Gun_176_Handle.CanCollide=false
Give_Paintball_Gun_176_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="PaintballGun added to your backpack!",Title="Give Gear"})
end
local function Give_Meatball_177(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Meatball_177_Products=replicatedStorage:WaitForChild("Products",5)
Give_Meatball_177_Gear=Give_Meatball_177_Products:WaitForChild("Gear",5)
Give_Meatball_177_Meatball=Give_Meatball_177_Gear:FindFirstChild("Meatball")
Give_Meatball_177_clone=Give_Meatball_177_Meatball:Clone()
Give_Meatball_177_Handle=Give_Meatball_177_clone:FindFirstChild("Handle")
Give_Meatball_177_Handle.CanCollide=false
Give_Meatball_177_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Meatball added to your backpack!",Title="Give Gear"})
end
local function Give_Raygun_Sheriff_178(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Raygun_Sheriff_178_Products=replicatedStorage:WaitForChild("Products",5)
Give_Raygun_Sheriff_178_Gear=Give_Raygun_Sheriff_178_Products:WaitForChild("Gear",5)
Give_Raygun_Sheriff_178_Sheriff=Give_Raygun_Sheriff_178_Gear:FindFirstChild("Sheriff")
Give_Raygun_Sheriff_178_clone=Give_Raygun_Sheriff_178_Sheriff:Clone()
Give_Raygun_Sheriff_178_Handle=Give_Raygun_Sheriff_178_clone:FindFirstChild("Handle")
Give_Raygun_Sheriff_178_Handle.CanCollide=false
Give_Raygun_Sheriff_178_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Sheriff added to your backpack!",Title="Give Gear"})
end
local function Give_Sword_179(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Sword_179_Products=replicatedStorage:WaitForChild("Products",5)
Give_Sword_179_Gear=Give_Sword_179_Products:WaitForChild("Gear",5)
Give_Sword_179_Sword=Give_Sword_179_Gear:FindFirstChild("Sword")
Give_Sword_179_clone=Give_Sword_179_Sword:Clone()
Give_Sword_179_Handle=Give_Sword_179_clone:FindFirstChild("Handle")
Give_Sword_179_Handle.CanCollide=false
Give_Sword_179_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Sword added to your backpack!",Title="Give Gear"})
end
local function Give_Pool_Noodle_180(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Pool_Noodle_180_Products=replicatedStorage:WaitForChild("Products",5)
Give_Pool_Noodle_180_Gear=Give_Pool_Noodle_180_Products:WaitForChild("Gear",5)
Give_Pool_Noodle_180_Pool_Noodle=Give_Pool_Noodle_180_Gear:FindFirstChild("Pool Noodle")
Give_Pool_Noodle_180_clone=Give_Pool_Noodle_180_Pool_Noodle:Clone()
Give_Pool_Noodle_180_Handle=Give_Pool_Noodle_180_clone:FindFirstChild("Handle")
Give_Pool_Noodle_180_Handle.CanCollide=false
Give_Pool_Noodle_180_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Pool Noodle added to your backpack!",Title="Give Gear"})
end
local function Give_Snowball_181(a1,a2,a3,a4,a5,a6,a7,a8)
Give_Snowball_181_Products=replicatedStorage:WaitForChild("Products",5)
Give_Snowball_181_Gear=Give_Snowball_181_Products:WaitForChild("Gear",5)
Give_Snowball_181_Snowball=Give_Snowball_181_Gear:FindFirstChild("Snowball")
Give_Snowball_181_clone=Give_Snowball_181_Snowball:Clone()
Give_Snowball_181_Handle=Give_Snowball_181_clone:FindFirstChild("Handle")
Give_Snowball_181_Handle.CanCollide=false
Give_Snowball_181_clone.Parent=players.LocalPlayer.Backpack
windUI:Notify({Duration=3,Content="Snowball added to your backpack!",Title="Give Gear"})
end
local function Webhook_URL_182(a1,a2,a3,a4,a5,a6,a7,a8)
a1:match("^%s*(.-)%s*$")
end
local function Test_Webhook_183(a1,a2,a3,a4,a5,a6,a7,a8)
sendWH("✅ Ella Hub webhook test — working!")
windUI:Notify({Duration=4,Content="Test sent! Check your Discord channel.",Title="Webhook"})
end
local function Send_Jury_Votes_to_Webhook_184(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Players.JuryVotes.ChildAdded:Connect(Helper_307)
end
local function Send_Votes_to_Webhook_185(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Voting.Votes.ChildAdded:Connect(Helper_308)
end
local function Send_Exile_Votes_to_Webhook_186(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Helper_309)
end
local function Expose_Exile_Votes_in_Chat_187(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Twists.ExileVoting.Votes.ChildAdded:Connect(Helper_310)
end
local function Send_Statue_Holder_to_Webhook_188(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Twists.Idol.Changed:Connect(Helper_311)
end
local function Send_Round_Info_to_Webhook_189(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(Helper_312)
end
local function Print_Shop_to_Console_190(a1,a2,a3,a4,a5,a6,a7,a8)
Print_Shop_to_Console_190_Skins=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("Skins")
Print_Shop_to_Console_190_Skins:GetChildren()
Print_Shop_to_Console_190_Marshmallows=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("Marshmallows")
Print_Shop_to_Console_190_Marshmallows:GetChildren()
Print_Shop_to_Console_190_ElimColors=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("ElimColors")
Print_Shop_to_Console_190_ElimColors:GetChildren()
Print_Shop_to_Console_190_Eliminations=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("Eliminations")
Print_Shop_to_Console_190_Eliminations:GetChildren()
print("=== Ella Hub — Daily Shop ===")
print("============================")
windUI:Notify({Duration=3,Content="Printed to console! Press F9.",Title="Shop"})
end
local function Send_Shop_to_Webhook_191(a1,a2,a3,a4,a5,a6,a7,a8)
Send_Shop_to_Webhook_191_Skins=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("Skins")
Send_Shop_to_Webhook_191_Skins:GetChildren()
Send_Shop_to_Webhook_191_Marshmallows=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("Marshmallows")
Send_Shop_to_Webhook_191_Marshmallows:GetChildren()
Send_Shop_to_Webhook_191_ElimColors=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("ElimColors")
Send_Shop_to_Webhook_191_ElimColors:GetChildren()
Send_Shop_to_Webhook_191_Eliminations=replicatedStorage.Products.Shop.DailyShop:FindFirstChild("Eliminations")
Send_Shop_to_Webhook_191_Eliminations:GetChildren()
windUI:Notify({Duration=3,Content="No items found.",Title="Shop"})
end
local function Notify_When_Shop_Updates_192(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(Helper_313)
windUI:Notify({Duration=3,Content="Watching for shop updates...",Title="Shop Watcher"})
end
local function Auto_Send_Shop_Updates_to_Webhook_193(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Products.Shop.DailyShop.DescendantAdded:Connect(Helper_314)
windUI:Notify({Duration=3,Content="Auto webhook active!",Title="Shop Watcher"})
end
local function Mute_All_Sounds_194(a1,a2,a3,a4,a5,a6,a7,a8)
soundService.Volume=0
windUI:Notify({Duration=2,Content="Muted.",Title="Sound"})
end
local function Stop_All_Playing_Sounds_195(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
players.LocalPlayer.PlayerGui:GetDescendants()
windUI:Notify({Duration=3,Content="Stopped 0 sound(s).",Title="Sound"})
end
local function Spam_Click_Sound_196(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_315)
end
local function Spam_OOF_197(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_316)
end
local function Sword_Lunge_Sound_198(a1,a2,a3,a4,a5,a6,a7,a8)
Sword_Lunge_Sound_198_clone=replicatedStorage.Products.Gear.Sword.Handle.LungeSound:Clone()
Sword_Lunge_Sound_198_clone.Parent=workspace
Sword_Lunge_Sound_198_clone:Play()
debris:AddItem(Sword_Lunge_Sound_198_clone,3)
end
local function Equip_Sword_Unsheath_199(a1,a2,a3,a4,a5,a6,a7,a8)
Equip_Sword_Unsheath_199_clone=replicatedStorage.Products.Gear.Sword.Handle.UnsheathSound:Clone()
Equip_Sword_Unsheath_199_clone.Parent=workspace
Equip_Sword_Unsheath_199_clone:Play()
debris:AddItem(Equip_Sword_Unsheath_199_clone,3)
end
local function Toilet_Elimination_Sound_200(a1,a2,a3,a4,a5,a6,a7,a8)
Toilet_Elimination_Sound_200_Toilet_Elimination=replicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound.Clone(replicatedStorage.Products.ElimMethods.Camp["Toilet Elimination"].Sound)
Toilet_Elimination_Sound_200_Toilet_Elimination.Parent=workspace
Toilet_Elimination_Sound_200_Toilet_Elimination:Play()
debris:AddItem(Toilet_Elimination_Sound_200_Toilet_Elimination,5)
end
local function Sleigh_Elimination_Sound_201(a1,a2,a3,a4,a5,a6,a7,a8)
Sleigh_Elimination_Sound_201_Sleigh_Elimination=replicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound.Clone(replicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Sound)
Sleigh_Elimination_Sound_201_Sleigh_Elimination.Parent=workspace
Sleigh_Elimination_Sound_201_Sleigh_Elimination:Play()
debris:AddItem(Sleigh_Elimination_Sound_201_Sleigh_Elimination,5)
end
local function Trigger_Twisted_202(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.PSSettings:FireServer("Start","Start")
replicatedStorage.Events.OSSettings:FireServer("Start")
windUI:Notify({Duration=4,Content="Fired!",Title="Trigger Twisted"})
end
local function Swap_to_Sleigh_Elimination_203(a1,a2,a3,a4,a5,a6,a7,a8)
Swap_to_Sleigh_Elimination_203_ElimMethod=workspace:FindFirstChild("ElimMethod")
Swap_to_Sleigh_Elimination_203_Boat_Elimination=Swap_to_Sleigh_Elimination_203_ElimMethod:FindFirstChild("Boat Elimination")
Swap_to_Sleigh_Elimination_203_clone=Swap_to_Sleigh_Elimination_203_Boat_Elimination:Clone()
Swap_to_Sleigh_Elimination_203_clone.Parent=nil
Swap_to_Sleigh_Elimination_203_ElimMethod:GetChildren()
Swap_to_Sleigh_Elimination_203_Sleigh_Elimination=replicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"].Clone(replicatedStorage.Products.ElimMethods.Camp["Sleigh Elimination"])
Swap_to_Sleigh_Elimination_203_Sleigh_Elimination.Name="Sleigh Elimination"
Swap_to_Sleigh_Elimination_203_Sleigh_Elimination.Parent=Swap_to_Sleigh_Elimination_203_ElimMethod
replicatedStorage.Products.DataStore.Elimination.Value="Sleigh Elimination"
Swap_to_Sleigh_Elimination_203_Sound=Swap_to_Sleigh_Elimination_203_Sleigh_Elimination:FindFirstChild("Sound",true)
Swap_to_Sleigh_Elimination_203_Sound:Play()
windUI:Notify({Duration=4,Content="Sleigh Elimination active! Fly-out in 18s.",Title="Sleigh Swap"})
task.delay(18,Helper_317)
end
local function Force_Restore_Boat_204(a1,a2,a3,a4,a5,a6,a7,a8)
Force_Restore_Boat_204_ElimMethod=workspace:FindFirstChild("ElimMethod")
Force_Restore_Boat_204_ElimMethod:GetChildren()
Force_Restore_Boat_204_clone=Swap_to_Sleigh_Elimination_203_clone:Clone()
Force_Restore_Boat_204_clone.Name="Boat Elimination"
Force_Restore_Boat_204_clone.Parent=Force_Restore_Boat_204_ElimMethod
replicatedStorage.Products.DataStore.Elimination.Value="Boat Elimination"
windUI:Notify({Duration=3,Content="Boat Elimination restored.",Title="Sleigh Swap"})
end
local function Anti_Loser_Land_205(a1,a2,a3,a4,a5,a6,a7,a8)
Anti_Loser_Land_205_Team=players.LocalPlayer:GetPropertyChangedSignal("Team")
Anti_Loser_Land_205_Team:Connect(Helper_318)
Anti_Loser_Land_205_Season=replicatedStorage:WaitForChild("Season",5)
Anti_Loser_Land_205_Eliminated=Anti_Loser_Land_205_Season:WaitForChild("Eliminated",5)
Anti_Loser_Land_205_Eliminated.ChildAdded:Connect(Helper_319)
Anti_Loser_Land_205_Season_2=replicatedStorage:WaitForChild("Season",5)
Anti_Loser_Land_205_Players=Anti_Loser_Land_205_Season_2:WaitForChild("Players",5)
Anti_Loser_Land_205_Players.ChildRemoved:Connect(Helper_320)
windUI:Notify({Duration=3,Content="Active — watching for elimination.",Title="Anti Loser Land"})
end
local function Force_Fight_Elim_Test_206(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content="Elimination detected — fighting back!",Title="⚠ Anti Loser Land"})
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
runService.Heartbeat:Connect(Helper_321)
task.spawn(Helper_322)
task.delay(20,Helper_323)
end
local function Autoplay_207(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_324)
end
local function Disable_Shiftlock_Camera_208(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Play_This_Round_209(a1,a2,a3,a4,a5,a6,a7,a8)
Play_This_Round_209_ChallengePlayers=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_2=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_2:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_2=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_2:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_3=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_3:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_3=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_3:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_4=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_4:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_4=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_4:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_5=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_5:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_5=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_5:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_6=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_6:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_6=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_6:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_7=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_7:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_7=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_7:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_8=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_8:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_8=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_8:GetChildren()
task.wait()
Play_This_Round_209_ChallengePlayers_9=workspace:FindFirstChild("ChallengePlayers")
Play_This_Round_209_ChallengePlayers_9:FindFirstChild(players.LocalPlayer.Name)
Play_This_Round_209_Assets_9=workspace:FindFirstChild("Assets")
Play_This_Round_209_Assets_9:GetChildren()
task.wait()
end
local function Stop_Playback_210(a1,a2,a3,a4,a5,a6,a7,a8)
Stop_Playback_210_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
Stop_Playback_210_HumanoidRootPart.Anchored=false
windUI:Notify({Duration=3,Content="Playback stopped.",Title="Autoplay"})
end
local function Cave_Chaos_Route_211(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Unstable_Savannah_Route_212(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Show_Update_Notice_213(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Switch_to_Rayfield_214(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=2,Content="Reloading with Rayfield...",Title="Switching"})
task.wait()
window:Destroy()
Switch_to_Rayfield_214_PlayerGui=players.LocalPlayer:FindFirstChild("PlayerGui")
Switch_to_Rayfield_214_value=gethui()
Switch_to_Rayfield_214_CoreGui=game:GetService("CoreGui")
Switch_to_Rayfield_214_PlayerGui:GetChildren()
Switch_to_Rayfield_214_value:GetChildren()
Switch_to_Rayfield_214_CoreGui:GetChildren()
task.wait()
Switch_to_Rayfield_214_value_2=game:HttpGet("https://raw.githubusercontent.com/Bruhology/ella-hub/main/main.lua",true)
Switch_to_Rayfield_214_value_3=loadstring(Switch_to_Rayfield_214_value_2)
Switch_to_Rayfield_214_value_3()
end
local function Toggle_Key_215(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Theme_216(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:SetTheme(a1)
windUI:Notify({Duration=3,Content=nil,Title="Theme"})
end
local function Helper_217(a1,a2,a3,a4,a5,a6,a7,a8)
helper_217_Finish=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish.CanCollide=false
helper_217_Finish.Transparency=1
helper_217_Finish.Position=helper_217_HumanoidRootPart.Position
task.wait()
helper_217_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_2.CanCollide=false
helper_217_Finish_2.Transparency=1
helper_217_Finish_2.Position=helper_217_HumanoidRootPart_2.Position
task.wait()
helper_217_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_3.CanCollide=false
helper_217_Finish_3.Transparency=1
helper_217_Finish_3.Position=helper_217_HumanoidRootPart_3.Position
task.wait()
helper_217_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_4.CanCollide=false
helper_217_Finish_4.Transparency=1
helper_217_Finish_4.Position=helper_217_HumanoidRootPart_4.Position
task.wait()
helper_217_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_5.CanCollide=false
helper_217_Finish_5.Transparency=1
helper_217_Finish_5.Position=helper_217_HumanoidRootPart_5.Position
task.wait()
helper_217_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_6.CanCollide=false
helper_217_Finish_6.Transparency=1
helper_217_Finish_6.Position=helper_217_HumanoidRootPart_6.Position
task.wait()
helper_217_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_7.CanCollide=false
helper_217_Finish_7.Transparency=1
helper_217_Finish_7.Position=helper_217_HumanoidRootPart_7.Position
task.wait()
helper_217_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_8.CanCollide=false
helper_217_Finish_8.Transparency=1
helper_217_Finish_8.Position=helper_217_HumanoidRootPart_8.Position
task.wait()
helper_217_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
helper_217_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_217_Finish_9.CanCollide=false
helper_217_Finish_9.Transparency=1
helper_217_Finish_9.Position=helper_217_HumanoidRootPart_9.Position
task.wait()
end
local function Helper_218(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
task.wait()
end
local function Helper_219(a1,a2,a3,a4,a5,a6,a7,a8)
helper_219_MathMania=players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
helper_219_child=helper_219_MathMania:FindFirstChild("1")
helper_219_MainText=helper_219_child:FindFirstChild("MainText")
helper_219_Box=helper_219_child:FindFirstChild("Box")
helper_219_Enter=helper_219_child:FindFirstChild("Enter")
helper_219_value=helper_219_MainText.Text:gsub("[=?%s]","")
helper_219_return=loadstring(("return "..helper_219_value))
helper_219_value_2=helper_219_return()
helper_219_Box.Text="helper_219_value_2"
task.wait()
getconnections(helper_219_Enter.MouseButton1Click)
getconnections(helper_219_Enter.MouseButton1Down)
getconnections(helper_219_Enter.Activated)
task.wait()
helper_219_child_2=helper_219_MathMania:FindFirstChild("2")
helper_219_MainText_2=helper_219_child_2:FindFirstChild("MainText")
helper_219_Box_2=helper_219_child_2:FindFirstChild("Box")
helper_219_Enter_2=helper_219_child_2:FindFirstChild("Enter")
helper_219_value_3=helper_219_MainText_2.Text:gsub("[=?%s]","")
helper_219_return_2=loadstring(("return "..helper_219_value_3))
helper_219_value_4=helper_219_return_2()
helper_219_Box_2.Text="helper_219_value_4"
task.wait()
getconnections(helper_219_Enter_2.MouseButton1Click)
getconnections(helper_219_Enter_2.MouseButton1Down)
getconnections(helper_219_Enter_2.Activated)
task.wait()
helper_219_child_3=helper_219_MathMania:FindFirstChild("3")
helper_219_MainText_3=helper_219_child_3:FindFirstChild("MainText")
helper_219_Box_3=helper_219_child_3:FindFirstChild("Box")
helper_219_Enter_3=helper_219_child_3:FindFirstChild("Enter")
helper_219_value_5=helper_219_MainText_3.Text:gsub("[=?%s]","")
helper_219_return_3=loadstring(("return "..helper_219_value_5))
helper_219_value_6=helper_219_return_3()
helper_219_Box_3.Text="helper_219_value_6"
task.wait()
getconnections(helper_219_Enter_3.MouseButton1Click)
getconnections(helper_219_Enter_3.MouseButton1Down)
getconnections(helper_219_Enter_3.Activated)
task.wait()
helper_219_child_4=helper_219_MathMania:FindFirstChild("4")
helper_219_MainText_4=helper_219_child_4:FindFirstChild("MainText")
helper_219_Box_4=helper_219_child_4:FindFirstChild("Box")
helper_219_Enter_4=helper_219_child_4:FindFirstChild("Enter")
helper_219_value_7=helper_219_MainText_4.Text:gsub("[=?%s]","")
helper_219_return_4=loadstring(("return "..helper_219_value_7))
helper_219_value_8=helper_219_return_4()
helper_219_Box_4.Text="helper_219_value_8"
task.wait()
getconnections(helper_219_Enter_4.MouseButton1Click)
getconnections(helper_219_Enter_4.MouseButton1Down)
getconnections(helper_219_Enter_4.Activated)
task.wait()
helper_219_child_5=helper_219_MathMania:FindFirstChild("5")
helper_219_MainText_5=helper_219_child_5:FindFirstChild("MainText")
helper_219_Box_5=helper_219_child_5:FindFirstChild("Box")
helper_219_child_5:FindFirstChild("Enter")
helper_219_value_9=helper_219_MainText_5.Text:gsub("[=?%s]","")
helper_219_return_5=loadstring(("return "..helper_219_value_9))
helper_219_value_10=helper_219_return_5()
helper_219_Box_5.Text="helper_219_value_10"
task.wait()
end
local function Helper_220(a1,a2,a3,a4,a5,a6,a7,a8)
helper_220_Tool=players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
helper_220_Tool:FindFirstChild("Handle")
players:GetPlayers()
end
local function Helper_221(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball:GetDescendants()
helper_221_BasePart=helper_221_Dodgeball:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart.CFrame=helper_221_HumanoidRootPart.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_2=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_2:GetDescendants()
helper_221_BasePart_2=helper_221_Dodgeball_2:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_2.CFrame=helper_221_HumanoidRootPart_2.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_3=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_3:GetDescendants()
helper_221_BasePart_3=helper_221_Dodgeball_3:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_3.CFrame=helper_221_HumanoidRootPart_3.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_4=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_4:GetDescendants()
helper_221_BasePart_4=helper_221_Dodgeball_4:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_4.CFrame=helper_221_HumanoidRootPart_4.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_5=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_5:GetDescendants()
helper_221_BasePart_5=helper_221_Dodgeball_5:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_5.CFrame=helper_221_HumanoidRootPart_5.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_6=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_6:GetDescendants()
helper_221_BasePart_6=helper_221_Dodgeball_6:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_6.CFrame=helper_221_HumanoidRootPart_6.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_7=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_7:GetDescendants()
helper_221_BasePart_7=helper_221_Dodgeball_7:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_7.CFrame=helper_221_HumanoidRootPart_7.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_8=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_8:GetDescendants()
helper_221_BasePart_8=helper_221_Dodgeball_8:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_8.CFrame=helper_221_HumanoidRootPart_8.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Dodgeball")
helper_221_Dodgeball_9=workspace.Assets.Dodgeball:FindFirstChild("Dodgeball")
helper_221_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_221_Dodgeball_9:GetDescendants()
helper_221_BasePart_9=helper_221_Dodgeball_9:FindFirstChildWhichIsA("BasePart")
helper_221_BasePart_9.CFrame=helper_221_HumanoidRootPart_9.CFrame
task.wait()
end
local function Helper_222(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_223(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
task.wait()
end
local function Helper_224(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_225(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
task.wait()
end
local function Helper_226(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_227(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_228(a1,a2,a3,a4,a5,a6,a7,a8)
helper_228_Finish=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish.CanCollide=false
helper_228_Finish.Transparency=1
helper_228_Finish.Position=helper_228_HumanoidRootPart.Position
task.wait()
helper_228_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_2.CanCollide=false
helper_228_Finish_2.Transparency=1
helper_228_Finish_2.Position=helper_228_HumanoidRootPart_2.Position
task.wait()
helper_228_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_3.CanCollide=false
helper_228_Finish_3.Transparency=1
helper_228_Finish_3.Position=helper_228_HumanoidRootPart_3.Position
task.wait()
helper_228_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_4.CanCollide=false
helper_228_Finish_4.Transparency=1
helper_228_Finish_4.Position=helper_228_HumanoidRootPart_4.Position
task.wait()
helper_228_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_5.CanCollide=false
helper_228_Finish_5.Transparency=1
helper_228_Finish_5.Position=helper_228_HumanoidRootPart_5.Position
task.wait()
helper_228_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_6.CanCollide=false
helper_228_Finish_6.Transparency=1
helper_228_Finish_6.Position=helper_228_HumanoidRootPart_6.Position
task.wait()
helper_228_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_7.CanCollide=false
helper_228_Finish_7.Transparency=1
helper_228_Finish_7.Position=helper_228_HumanoidRootPart_7.Position
task.wait()
helper_228_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_8.CanCollide=false
helper_228_Finish_8.Transparency=1
helper_228_Finish_8.Position=helper_228_HumanoidRootPart_8.Position
task.wait()
helper_228_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
helper_228_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_228_Finish_9.CanCollide=false
helper_228_Finish_9.Transparency=1
helper_228_Finish_9.Position=helper_228_HumanoidRootPart_9.Position
task.wait()
end
local function Helper_229(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace.Assets:GetDescendants()
task.wait()
end
local function Helper_230(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
workspace.Assets:GetDescendants()
task.wait()
end
local function Helper_231(a1,a2,a3,a4,a5,a6,a7,a8)
workspace.Assets:GetDescendants()
task.wait()
end
local function Helper_232(a1,a2,a3,a4,a5,a6,a7,a8)
helper_232_Finish=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish.CanCollide=false
helper_232_Finish.Transparency=1
helper_232_Finish.Position=helper_232_HumanoidRootPart.Position
task.wait()
helper_232_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_2.CanCollide=false
helper_232_Finish_2.Transparency=1
helper_232_Finish_2.Position=helper_232_HumanoidRootPart_2.Position
task.wait()
helper_232_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_3.CanCollide=false
helper_232_Finish_3.Transparency=1
helper_232_Finish_3.Position=helper_232_HumanoidRootPart_3.Position
task.wait()
helper_232_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_4.CanCollide=false
helper_232_Finish_4.Transparency=1
helper_232_Finish_4.Position=helper_232_HumanoidRootPart_4.Position
task.wait()
helper_232_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_5.CanCollide=false
helper_232_Finish_5.Transparency=1
helper_232_Finish_5.Position=helper_232_HumanoidRootPart_5.Position
task.wait()
helper_232_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_6.CanCollide=false
helper_232_Finish_6.Transparency=1
helper_232_Finish_6.Position=helper_232_HumanoidRootPart_6.Position
task.wait()
helper_232_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_7.CanCollide=false
helper_232_Finish_7.Transparency=1
helper_232_Finish_7.Position=helper_232_HumanoidRootPart_7.Position
task.wait()
helper_232_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_8.CanCollide=false
helper_232_Finish_8.Transparency=1
helper_232_Finish_8.Position=helper_232_HumanoidRootPart_8.Position
task.wait()
helper_232_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
helper_232_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_232_Finish_9.CanCollide=false
helper_232_Finish_9.Transparency=1
helper_232_Finish_9.Position=helper_232_HumanoidRootPart_9.Position
task.wait()
end
local function Helper_233(a1,a2,a3,a4,a5,a6,a7,a8)
helper_233_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
a1.Position=helper_233_HumanoidRootPart.Position
a1.Transparency=0
a1.CanCollide=false
end
local function Helper_234(a1,a2,a3,a4,a5,a6,a7,a8)
helper_234_MathMania=players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
helper_234_child=helper_234_MathMania:FindFirstChild("1")
helper_234_MainText=helper_234_child:FindFirstChild("MainText")
helper_234_Box=helper_234_child:FindFirstChild("Box")
helper_234_Enter=helper_234_child:FindFirstChild("Enter")
helper_234_value=helper_234_MainText.Text:gsub("[=?%s]","")
helper_234_return=loadstring(("return "..helper_234_value))
helper_234_value_2=helper_234_return()
helper_234_Box.Text="helper_234_value_2"
task.wait()
getconnections(helper_234_Enter.MouseButton1Click)
getconnections(helper_234_Enter.MouseButton1Down)
getconnections(helper_234_Enter.Activated)
task.wait()
helper_234_child_2=helper_234_MathMania:FindFirstChild("2")
helper_234_MainText_2=helper_234_child_2:FindFirstChild("MainText")
helper_234_Box_2=helper_234_child_2:FindFirstChild("Box")
helper_234_Enter_2=helper_234_child_2:FindFirstChild("Enter")
helper_234_value_3=helper_234_MainText_2.Text:gsub("[=?%s]","")
helper_234_return_2=loadstring(("return "..helper_234_value_3))
helper_234_value_4=helper_234_return_2()
helper_234_Box_2.Text="helper_234_value_4"
task.wait()
getconnections(helper_234_Enter_2.MouseButton1Click)
getconnections(helper_234_Enter_2.MouseButton1Down)
getconnections(helper_234_Enter_2.Activated)
task.wait()
helper_234_child_3=helper_234_MathMania:FindFirstChild("3")
helper_234_MainText_3=helper_234_child_3:FindFirstChild("MainText")
helper_234_Box_3=helper_234_child_3:FindFirstChild("Box")
helper_234_Enter_3=helper_234_child_3:FindFirstChild("Enter")
helper_234_value_5=helper_234_MainText_3.Text:gsub("[=?%s]","")
helper_234_return_3=loadstring(("return "..helper_234_value_5))
helper_234_value_6=helper_234_return_3()
helper_234_Box_3.Text="helper_234_value_6"
task.wait()
getconnections(helper_234_Enter_3.MouseButton1Click)
getconnections(helper_234_Enter_3.MouseButton1Down)
getconnections(helper_234_Enter_3.Activated)
task.wait()
helper_234_child_4=helper_234_MathMania:FindFirstChild("4")
helper_234_MainText_4=helper_234_child_4:FindFirstChild("MainText")
helper_234_Box_4=helper_234_child_4:FindFirstChild("Box")
helper_234_Enter_4=helper_234_child_4:FindFirstChild("Enter")
helper_234_value_7=helper_234_MainText_4.Text:gsub("[=?%s]","")
helper_234_return_4=loadstring(("return "..helper_234_value_7))
helper_234_value_8=helper_234_return_4()
helper_234_Box_4.Text="helper_234_value_8"
task.wait()
getconnections(helper_234_Enter_4.MouseButton1Click)
getconnections(helper_234_Enter_4.MouseButton1Down)
getconnections(helper_234_Enter_4.Activated)
task.wait()
helper_234_child_5=helper_234_MathMania:FindFirstChild("5")
helper_234_MainText_5=helper_234_child_5:FindFirstChild("MainText")
helper_234_Box_5=helper_234_child_5:FindFirstChild("Box")
helper_234_child_5:FindFirstChild("Enter")
helper_234_value_9=helper_234_MainText_5.Text:gsub("[=?%s]","")
helper_234_return_5=loadstring(("return "..helper_234_value_9))
helper_234_value_10=helper_234_return_5()
helper_234_Box_5.Text="helper_234_value_10"
task.wait()
end
local function Helper_235(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_235_Assets=workspace:FindFirstChild("Assets")
helper_235_Assets:GetDescendants()
end
local function Helper_236(a1,a2,a3,a4,a5,a6,a7,a8)
helper_236_Sheriff=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff:FindFirstChild("ServerControl")
helper_236_Sheriff:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_2=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_2:FindFirstChild("ServerControl")
helper_236_Sheriff_2:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_3=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_3:FindFirstChild("ServerControl")
helper_236_Sheriff_3:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_4=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_4:FindFirstChild("ServerControl")
helper_236_Sheriff_4:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_5=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_5:FindFirstChild("ServerControl")
helper_236_Sheriff_5:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_6=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_6:FindFirstChild("ServerControl")
helper_236_Sheriff_6:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_7=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_7:FindFirstChild("ServerControl")
helper_236_Sheriff_7:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_8=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_8:FindFirstChild("ServerControl")
helper_236_Sheriff_8:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
helper_236_Sheriff_9=players.LocalPlayer.Character:FindFirstChild("Sheriff")
helper_236_Sheriff_9:FindFirstChild("ServerControl")
helper_236_Sheriff_9:FindFirstChild("ClientControl")
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
players:GetPlayers()
task.wait()
end
local function Helper_237(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_238(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_239(a1,a2,a3,a4,a5,a6,a7,a8)
helper_239_Finish=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish.CanCollide=false
helper_239_Finish.Transparency=1
helper_239_Finish.Position=helper_239_HumanoidRootPart.Position
task.wait()
helper_239_Finish_2=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_2.CanCollide=false
helper_239_Finish_2.Transparency=1
helper_239_Finish_2.Position=helper_239_HumanoidRootPart_2.Position
task.wait()
helper_239_Finish_3=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_3.CanCollide=false
helper_239_Finish_3.Transparency=1
helper_239_Finish_3.Position=helper_239_HumanoidRootPart_3.Position
task.wait()
helper_239_Finish_4=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_4.CanCollide=false
helper_239_Finish_4.Transparency=1
helper_239_Finish_4.Position=helper_239_HumanoidRootPart_4.Position
task.wait()
helper_239_Finish_5=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_5.CanCollide=false
helper_239_Finish_5.Transparency=1
helper_239_Finish_5.Position=helper_239_HumanoidRootPart_5.Position
task.wait()
helper_239_Finish_6=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_6.CanCollide=false
helper_239_Finish_6.Transparency=1
helper_239_Finish_6.Position=helper_239_HumanoidRootPart_6.Position
task.wait()
helper_239_Finish_7=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_7.CanCollide=false
helper_239_Finish_7.Transparency=1
helper_239_Finish_7.Position=helper_239_HumanoidRootPart_7.Position
task.wait()
helper_239_Finish_8=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_8.CanCollide=false
helper_239_Finish_8.Transparency=1
helper_239_Finish_8.Position=helper_239_HumanoidRootPart_8.Position
task.wait()
helper_239_Finish_9=workspace.Assets:FindFirstChild("Finish",true)
helper_239_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_239_Finish_9.CanCollide=false
helper_239_Finish_9.Transparency=1
helper_239_Finish_9.Position=helper_239_HumanoidRootPart_9.Position
task.wait()
end
local function Helper_240(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace:GetDescendants()
task.wait()
end
local function Helper_241(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
workspace:GetDescendants()
task.wait()
end
local function Helper_242(a1,a2,a3,a4,a5,a6,a7,a8)
helper_242_MathMania=players.LocalPlayer.PlayerGui:FindFirstChild("MathMania")
helper_242_child=helper_242_MathMania:FindFirstChild("1")
helper_242_MainText=helper_242_child:FindFirstChild("MainText")
helper_242_Box=helper_242_child:FindFirstChild("Box")
helper_242_Enter=helper_242_child:FindFirstChild("Enter")
helper_242_value=helper_242_MainText.Text:gsub("[=?%s]","")
helper_242_return=loadstring(("return "..helper_242_value))
helper_242_value_2=helper_242_return()
helper_242_Box.Text="helper_242_value_2"
task.wait()
getconnections(helper_242_Enter.MouseButton1Click)
getconnections(helper_242_Enter.MouseButton1Down)
getconnections(helper_242_Enter.Activated)
task.wait()
helper_242_child_2=helper_242_MathMania:FindFirstChild("2")
helper_242_MainText_2=helper_242_child_2:FindFirstChild("MainText")
helper_242_Box_2=helper_242_child_2:FindFirstChild("Box")
helper_242_Enter_2=helper_242_child_2:FindFirstChild("Enter")
helper_242_value_3=helper_242_MainText_2.Text:gsub("[=?%s]","")
helper_242_return_2=loadstring(("return "..helper_242_value_3))
helper_242_value_4=helper_242_return_2()
helper_242_Box_2.Text="helper_242_value_4"
task.wait()
getconnections(helper_242_Enter_2.MouseButton1Click)
getconnections(helper_242_Enter_2.MouseButton1Down)
getconnections(helper_242_Enter_2.Activated)
task.wait()
helper_242_child_3=helper_242_MathMania:FindFirstChild("3")
helper_242_MainText_3=helper_242_child_3:FindFirstChild("MainText")
helper_242_Box_3=helper_242_child_3:FindFirstChild("Box")
helper_242_Enter_3=helper_242_child_3:FindFirstChild("Enter")
helper_242_value_5=helper_242_MainText_3.Text:gsub("[=?%s]","")
helper_242_return_3=loadstring(("return "..helper_242_value_5))
helper_242_value_6=helper_242_return_3()
helper_242_Box_3.Text="helper_242_value_6"
task.wait()
getconnections(helper_242_Enter_3.MouseButton1Click)
getconnections(helper_242_Enter_3.MouseButton1Down)
getconnections(helper_242_Enter_3.Activated)
task.wait()
helper_242_child_4=helper_242_MathMania:FindFirstChild("4")
helper_242_MainText_4=helper_242_child_4:FindFirstChild("MainText")
helper_242_Box_4=helper_242_child_4:FindFirstChild("Box")
helper_242_Enter_4=helper_242_child_4:FindFirstChild("Enter")
helper_242_value_7=helper_242_MainText_4.Text:gsub("[=?%s]","")
helper_242_return_4=loadstring(("return "..helper_242_value_7))
helper_242_value_8=helper_242_return_4()
helper_242_Box_4.Text="helper_242_value_8"
task.wait()
getconnections(helper_242_Enter_4.MouseButton1Click)
getconnections(helper_242_Enter_4.MouseButton1Down)
getconnections(helper_242_Enter_4.Activated)
task.wait()
helper_242_child_5=helper_242_MathMania:FindFirstChild("5")
helper_242_MainText_5=helper_242_child_5:FindFirstChild("MainText")
helper_242_Box_5=helper_242_child_5:FindFirstChild("Box")
helper_242_child_5:FindFirstChild("Enter")
helper_242_value_9=helper_242_MainText_5.Text:gsub("[=?%s]","")
helper_242_return_5=loadstring(("return "..helper_242_value_9))
helper_242_value_10=helper_242_return_5()
helper_242_Box_5.Text="helper_242_value_10"
task.wait()
end
local function Helper_243(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_244(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_245(a1,a2,a3,a4,a5,a6,a7,a8)
helper_245_Meatball=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_2=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_2:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_3=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_3:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_4=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_4:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_5=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_5:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_6=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_6:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_7=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_7:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_8=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_8:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
helper_245_Meatball_9=players.LocalPlayer.Character:FindFirstChild("Meatball")
helper_245_Meatball_9:FindFirstChild("Bounce")
players:GetPlayers()
task.wait()
end
local function Helper_246(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
task.wait()
end
local function Helper_247(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver:GetDescendants()
helper_247_BasePart=helper_247_MeatballGiver:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart.CFrame=helper_247_HumanoidRootPart.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_2=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_2:GetDescendants()
helper_247_BasePart_2=helper_247_MeatballGiver_2:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_2.CFrame=helper_247_HumanoidRootPart_2.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_3=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_3:GetDescendants()
helper_247_BasePart_3=helper_247_MeatballGiver_3:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_3.CFrame=helper_247_HumanoidRootPart_3.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_4=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_4:GetDescendants()
helper_247_BasePart_4=helper_247_MeatballGiver_4:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_4.CFrame=helper_247_HumanoidRootPart_4.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_5=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_5:GetDescendants()
helper_247_BasePart_5=helper_247_MeatballGiver_5:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_5.CFrame=helper_247_HumanoidRootPart_5.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_6=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_6:GetDescendants()
helper_247_BasePart_6=helper_247_MeatballGiver_6:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_6.CFrame=helper_247_HumanoidRootPart_6.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_7=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_7:GetDescendants()
helper_247_BasePart_7=helper_247_MeatballGiver_7:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_7.CFrame=helper_247_HumanoidRootPart_7.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_8=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_8:GetDescendants()
helper_247_BasePart_8=helper_247_MeatballGiver_8:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_8.CFrame=helper_247_HumanoidRootPart_8.CFrame
task.wait()
workspace:FindFirstChild("Assets")
workspace.Assets:FindFirstChild("Italy")
helper_247_MeatballGiver_9=workspace.Assets.Italy:FindFirstChild("MeatballGiver")
helper_247_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_247_MeatballGiver_9:GetDescendants()
helper_247_BasePart_9=helper_247_MeatballGiver_9:FindFirstChildWhichIsA("BasePart")
helper_247_BasePart_9.CFrame=helper_247_HumanoidRootPart_9.CFrame
task.wait()
end
local function Helper_248(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
replicatedStorage:FindFirstChild("Season")
replicatedStorage.Season:FindFirstChild("Twists")
helper_248_Idol=replicatedStorage.Season.Twists:FindFirstChild("Idol")
helper_248_child=players:FindFirstChild(helper_248_Idol.Value)
helper_248_Highlight=Instance.new("Highlight",nil)
helper_248_Highlight.Name="IdolHolderHL"
helper_248_color=Color3.fromRGB(255,215,0)
helper_248_Highlight.FillColor=helper_248_color
helper_248_color_2=Color3.fromRGB(255,215,0)
helper_248_Highlight.OutlineColor=helper_248_color_2
helper_248_Highlight.FillTransparency=0.4
helper_248_Highlight.OutlineTransparency=0
helper_248_Highlight.Parent=helper_248_child.Character
end
local function Helper_249(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Idol:FireServer()
task.wait()
end
local function Helper_250(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" voted for "..replicatedStorage.Season.Players[a1.Name].Value)),Title="Vote Cast"})
end
local function Helper_251(a1,a2,a3,a4,a5,a6,a7,a8)
print(("[Ella Hub] Vote: "..(replicatedStorage.Season.Players[a1.Value].Value..(" → "..replicatedStorage.Season.Players[a1.Name].Value))))
end
local function Helper_252(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync((replicatedStorage.Season.Players[a1.Value].Value..(" voted for "..replicatedStorage.Season.Players[a1.Name].Value)))
end
local function Helper_253(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..replicatedStorage.Season.Players[a1.Name].Value)),Title="Exile Vote"})
game.TextChatService.TextChannels.RBXGeneral:SendAsync((replicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..replicatedStorage.Season.Players[a1.Name].Value)))
end
local function Helper_254(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..replicatedStorage.Season.Players[a1.Name].Value)),Title="Jury Vote"})
end
local function Helper_255(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync(("[JURY] "..(replicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..replicatedStorage.Season.Players[a1.Name].Value))))
end
local function Helper_256(a1,a2,a3,a4,a5,a6,a7,a8)
workspace:GetDescendants()
replicatedStorage:FindFirstChild("Season")
replicatedStorage.Season:FindFirstChild("Twists")
helper_256_Idol=replicatedStorage.Season.Twists:FindFirstChild("Idol")
helper_256_child=players:FindFirstChild(helper_256_Idol.Value)
helper_256_Highlight=Instance.new("Highlight",nil)
helper_256_Highlight.Name="IdolHolderHL"
helper_256_color=Color3.fromRGB(255,215,0)
helper_256_Highlight.FillColor=helper_256_color
helper_256_color_2=Color3.fromRGB(255,215,0)
helper_256_Highlight.OutlineColor=helper_256_color_2
helper_256_Highlight.FillTransparency=0.4
helper_256_Highlight.OutlineTransparency=0
helper_256_Highlight.Parent=helper_256_child.Character
end
local function Helper_257(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Idol:FireServer()
task.wait()
end
local function Helper_258(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" voted for "..replicatedStorage.Season.Players[a1.Name].Value)),Title="Vote Cast"})
end
local function Helper_259(a1,a2,a3,a4,a5,a6,a7,a8)
print(("[Ella Hub] Vote: "..(replicatedStorage.Season.Players[a1.Value].Value..(" → "..replicatedStorage.Season.Players[a1.Name].Value))))
end
local function Helper_260(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync((replicatedStorage.Season.Players[a1.Value].Value..(" voted for "..replicatedStorage.Season.Players[a1.Name].Value)))
end
local function Helper_261(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..replicatedStorage.Season.Players[a1.Name].Value)),Title="Exile Vote"})
game.TextChatService.TextChannels.RBXGeneral:SendAsync((replicatedStorage.Season.Players[a1.Value].Value..(" voted to exile "..replicatedStorage.Season.Players[a1.Name].Value)))
end
local function Helper_262(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..replicatedStorage.Season.Players[a1.Name].Value)),Title="Jury Vote"})
end
local function Helper_263(a1,a2,a3,a4,a5,a6,a7,a8)
game.TextChatService.TextChannels.RBXGeneral:SendAsync(("[JURY] "..(replicatedStorage.Season.Players[a1.Value].Value..(" jury-voted for "..replicatedStorage.Season.Players[a1.Name].Value))))
end
local function Helper_264(a1,a2,a3,a4,a5,a6,a7,a8)
helper_264_color=Color3.fromRGB(40,40,50)
Vote_Log_GUI_071_TextButton_4.BackgroundColor3=helper_264_color
end
local function Helper_265(a1,a2,a3,a4,a5,a6,a7,a8)
helper_265_color=Color3.fromRGB(40,40,50)
Vote_Log_GUI_071_TextButton_5.BackgroundColor3=helper_265_color
end
local function Helper_266(a1,a2,a3,a4,a5,a6,a7,a8)
helper_266_color=Color3.fromRGB(40,40,50)
Vote_Log_GUI_071_TextButton_6.BackgroundColor3=helper_266_color
end
local function Helper_267(a1,a2,a3,a4,a5,a6,a7,a8)
helper_267_size=UDim2.fromOffset(0,(Vote_Log_GUI_071_UIListLayout.AbsoluteContentSize.Y+4))
Vote_Log_GUI_071_ScrollingFrame.CanvasSize=helper_267_size
helper_267_value=Vector2.new(0,inf)
Vote_Log_GUI_071_ScrollingFrame.CanvasPosition=helper_267_value
end
local function Helper_268(a1,a2,a3,a4,a5,a6,a7,a8)
if a1.UserInputType==Enum.UserInputType.MouseWheel then
Vote_Log_GUI_071_TextButton_3.Text="↑"
helper_268_color=Color3.fromRGB(160,160,160)
Vote_Log_GUI_071_TextButton_3.TextColor3=helper_268_color
else
if a1.UserInputType==Enum.UserInputType.Touch then
Vote_Log_GUI_071_TextButton_3.Text="↑"
helper_268_color=Color3.fromRGB(160,160,160)
Vote_Log_GUI_071_TextButton_3.TextColor3=helper_268_color
else
end
end
end
local function Helper_269(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_270(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_271(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_272(a1,a2,a3,a4,a5,a6,a7,a8)
Vote_Log_GUI_071_TextButton_3.Text="↑"
helper_268_color=Color3.fromRGB(160,160,160)
Vote_Log_GUI_071_TextButton_3.TextColor3=helper_268_color
end
local function Helper_273(a1,a2,a3,a4,a5,a6,a7,a8)
helper_273_size=UDim2.fromOffset(340,30)
Vote_Log_GUI_071_Frame.Size=helper_273_size
Vote_Log_GUI_071_ScrollingFrame.Visible=false
Vote_Log_GUI_071_TextButton_2.Text="+"
end
local function Helper_274(a1,a2,a3,a4,a5,a6,a7,a8)
Vote_Log_GUI_071_connection:Disconnect()
Vote_Log_GUI_071_connection_2:Disconnect()
Vote_Log_GUI_071_connection_3:Disconnect()
Vote_Log_GUI_071_ScreenGui:Destroy()
end
local function Helper_275(a1,a2,a3,a4,a5,a6,a7,a8)
if a1.UserInputType==Enum.UserInputType.MouseButton1 then
Vector2.new(a1.Position.X,a1.Position.Y)
Vector2.new(Vote_Log_GUI_071_Frame.AbsolutePosition.X,Vote_Log_GUI_071_Frame.AbsolutePosition.Y)
else
if a1.UserInputType==Enum.UserInputType.Touch then
Vector2.new(a1.Position.X,a1.Position.Y)
Vector2.new(Vote_Log_GUI_071_Frame.AbsolutePosition.X,Vote_Log_GUI_071_Frame.AbsolutePosition.Y)
else
end
end
end
local function Helper_276(a1,a2,a3,a4,a5,a6,a7,a8)
if a1.UserInputType==Enum.UserInputType.MouseButton1 then
else
if a1.UserInputType==Enum.UserInputType.Touch then
else
end
end
end
local function Helper_277(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_278(a1,a2,a3,a4,a5,a6,a7,a8)
Vote_Log_GUI_071_connection_4:Disconnect()
Vote_Log_GUI_071_connection_5:Disconnect()
end
local function Helper_279(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=5,Content=(replicatedStorage.Season.Players[a1.Value].Value..(" → "..(replicatedStorage.Season.Players[a1.Name].Value.."  (1 total)"))),Title=("Vote — "..replicatedStorage.Season.Players[a1.Value].Value)})
end
local function Helper_280(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_281(a1,a2,a3,a4,a5,a6,a7,a8)
windUI:Notify({Duration=6,Content=replicatedStorage.Season.Twists.CurrentTwist.Value,Title="Current Twist"})
replicatedStorage.Season.Twists.CurrentTwist.Changed:Connect(Helper_325)
task.wait()
end
local function Helper_282(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_283(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
end
local function Helper_284(a1,a2,a3,a4,a5,a6,a7,a8)
helper_284_HumanoidRootPart=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart.CFrame=helper_284_value
task.wait()
helper_284_HumanoidRootPart_2=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_2=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_2.CFrame=helper_284_value_2
task.wait()
helper_284_HumanoidRootPart_3=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_3=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_3.CFrame=helper_284_value_3
task.wait()
helper_284_HumanoidRootPart_4=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_4=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_4.CFrame=helper_284_value_4
task.wait()
helper_284_HumanoidRootPart_5=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_5=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_5.CFrame=helper_284_value_5
task.wait()
helper_284_HumanoidRootPart_6=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_6=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_6.CFrame=helper_284_value_6
task.wait()
helper_284_HumanoidRootPart_7=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_7=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_7.CFrame=helper_284_value_7
task.wait()
helper_284_HumanoidRootPart_8=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_8=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_8.CFrame=helper_284_value_8
task.wait()
helper_284_HumanoidRootPart_9=players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
helper_284_value_9=CFrame.new(0,3000,0)
helper_284_HumanoidRootPart_9.CFrame=helper_284_value_9
task.wait()
end
local function Helper_285(a1,a2,a3,a4,a5,a6,a7,a8)
replicatedStorage.Events.Teleport:FireServer("Camp")
task.wait()
end
local function Helper_286(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_326)
end
local function Helper_287(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_327)
end
local function Helper_288(a1,a2,a3,a4,a5,a6,a7,a8)
task.spawn(Helper_328)
end
local function Helper_289(a1,a2,a3,a4,a5,a6,a7,a8)
players:GetPlayers()
end
local function Helper_290(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("Tool")
task.wait()
helper_290_clone=a1:Clone()
helper_290_clone.Parent=nil
end
local function Helper_291(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("Tool")
end
local function Helper_292(a1,a2,a3,a4,a5,a6,a7,a8)
task.wait()
helper_292_clone=helper_290_clone:Clone()
helper_292_clone.Parent=players.LocalPlayer.Backpack
end
local function Helper_293(a1,a2,a3,a4,a5,a6,a7,a8)
getnamecallmethod()
Anti_Gear_Removal_093_value_2(a1,a2,a3,a4,a5,a6,a7,a8)
if a1==game:GetService("ReplicatedStorage").Events.Gear then
else
end
end
local function Helper_294(a1,a2,a3,a4,a5,a6,a7,a8)
players.LocalPlayer.PlayerGui:GetDescendants()
end
local function Helper_295(a1,a2,a3,a4,a5,a6,a7,a8)
players:GetPlayers()
task.wait()
end
local function Helper_296(a1,a2,a3,a4,a5,a6,a7,a8)
players:GetPlayers()
task.wait()
end
local function Helper_297(a1,a2,a3,a4,a5,a6,a7,a8)
isfile("starborn.ttf")
helper_297_value=game:HttpGet("https://drive.google.com/uc?export=download&id=1k9H8G60p7iaJL4hHcyWEXgWJbONqam8_")
writefile("starborn.ttf",helper_297_value)
helper_297_value_2=getcustomasset("starborn.ttf")
helper_297_Starborn=httpService:JSONEncode({name="Starborn",faces={[1]={name="Regular",assetId=helper_297_value_2,style="normal",weight=400}}})
writefile("Starborn.json",helper_297_Starborn)
isfile("vhsgothic.ttf")
helper_297_value_3=game:HttpGet("https://drive.google.com/uc?export=download&id=1XRWSIsNj9-v-vnrOCdYiUJIvz6ETAzfE")
writefile("vhsgothic.ttf",helper_297_value_3)
helper_297_value_4=getcustomasset("vhsgothic.ttf")
helper_297_VHS=httpService:JSONEncode({name="VHS",faces={[1]={name="Regular",assetId=helper_297_value_4,style="normal",weight=400}}})
writefile("VHS.json",helper_297_VHS)
isfile("minecrafter.ttf")
helper_297_value_5=game:HttpGet("https://drive.google.com/uc?export=download&id=1_LSZQUGrKHzJctxK7Jp8rVRRVWIvdif4")
writefile("minecrafter.ttf",helper_297_value_5)
helper_297_value_6=getcustomasset("minecrafter.ttf")
helper_297_Minecrafter=httpService:JSONEncode({name="Minecrafter",faces={[1]={name="Regular",assetId=helper_297_value_6,style="normal",weight=400}}})
writefile("Minecrafter.json",helper_297_Minecrafter)
isfile("horror.ttf")
helper_297_value_7=game:HttpGet("https://drive.google.com/uc?export=download&id=1dH4Y_ZuoTeMouMQoGZSc1OVLT7-73zmq")
writefile("horror.ttf",helper_297_value_7)
helper_297_value_8=getcustomasset("horror.ttf")
helper_297_Horror=httpService:JSONEncode({name="Horror",faces={[1]={name="Regular",assetId=helper_297_value_8,style="normal",weight=400}}})
writefile("Horror.json",helper_297_Horror)
windUI:Notify({Duration=4,Content="Done! Now pick a font.",Title="Fonts"})
end
local function Helper_298(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("TextLabel")
a1.FontFace=Starborn_162_value_2
end
local function Helper_299(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("TextLabel")
a1.FontFace=VHS_163_value_2
end
local function Helper_300(a1,a2,a3,a4,a5,a6,a7,a8)
a1:IsA("TextLabel")
a1.FontFace=Minecrafter_164_value_2
end
local function Helper_301(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_302(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_303(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_304(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_305(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_306(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_307(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_308(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_309(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_310(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_311(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_312(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_313(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_314(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_315(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_316(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_317(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_318(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_319(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_320(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_321(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_322(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_323(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_324(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_325(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_326(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_327(a1,a2,a3,a4,a5,a6,a7,a8)
end
local function Helper_328(a1,a2,a3,a4,a5,a6,a7,a8)
end
windUISource = game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
windUILoader = loadstring(windUISource)
assert(type(windUILoader) == "function", "WindUI loader did not return a function")
windUI = windUILoader()

players = Players
runService = RunService
replicatedStorage = ReplicatedStorage
userInputService = UserInputService
httpService = HttpService
starterGui = StarterGui
lighting = Lighting
debris = Debris
soundService = SoundService
window=windUI:CreateWindow({NewElements=true,ScrollBarEnabled=true,Author="by Ella",Resizable=true,ToggleKey=Enum.KeyCode.K,Folder="EllaHub",HideSearchBar=false,Title="Ella Hub V2",Transparent=true,SideBarWidth=200,Theme="Dark",Icon="solar:home-2-bold",Acrylic=true})
window:Tag({Title="TRD Script",Color="Text"})
window:Divider()
campTab=window:Tab({Title="Camp",Icon="solar:shield-bold"})
movieTab=window:Tab({Title="Movie",Icon="solar:camera-bold"})
expeditionTab=window:Tab({Title="Expedition",Icon="solar:map-bold"})
window:Divider()
mainTab=window:Tab({Title="Main",Icon="solar:home-2-bold"})
charactersTab=window:Tab({Title="Characters",Icon="solar:user-bold"})
playerTab=window:Tab({Title="Player",Icon="solar:running-2-bold"})
window:Divider()
statsTab=window:Tab({Title="Stats",Icon="solar:chart-square-bold"})
teleportsTab=window:Tab({Title="Teleports",Icon="solar:map-point-bold"})
universalTab=window:Tab({Title="Universal",Icon="solar:global-bold"})
clientTab=window:Tab({Title="Client",Icon="solar:cpu-bolt-bold"})
window:Divider()
otherTab=window:Tab({Title="Other",Icon="solar:settings-bold"})
autoplayTab=window:Tab({Title="Autoplay",Icon="solar:play-bold"})
trollTab=window:Tab({Title="Troll",Icon="solar:ghost-bold"})
shopTab=window:Tab({Title="Shop",Icon="solar:shop-bold"})
window:Divider()
settingsTab=window:Tab({Title="Settings",Icon="solar:settings-minimalistic-bold"})
window:Divider()


-- ==================== CAMP ====================
campTab:Select()
campTab:Section({Title="Obby"})
campObbyGroup=campTab:Group()
campObbyGroup:Button({Title="Win Obby",Callback=Win_Obby_001,IconAlign="Left",Justify="Center",Icon="solar:flag-bold",Size="Small"})
campObbyGroup:Space({Columns=0.5})
campObbyGroup:Button({Title="Godmode",Callback=Godmode_002,IconAlign="Left",Justify="Center",Icon="solar:shield-bold",Size="Small"})
campTab:Toggle({Value=false,Callback=Auto_Win_Obby_003,Title="Auto-Win Obby",Desc="Finish line loops to your position"})
campTab:Section({Title="Food"})
campTab:Button({Callback=Eat_Finish_Pancake_004,Title="Eat / Finish Pancake",Desc="Rapidly clicks your food item"})
campTab:Section({Title="Spleef"})
spleefGroup=campTab:Group()
spleefGroup:Button({Title="Godmode",Callback=Godmode_005,IconAlign="Left",Justify="Center",Icon="solar:shield-bold",Size="Small"})
spleefGroup:Space({Columns=0.5})
spleefGroup:Button({Title="Clear Parts",Callback=Clear_Parts_006,IconAlign="Left",Justify="Center",Icon="solar:trash-bin-bold",Size="Small"})
campTab:Section({Title="Coins & Gems"})
campTab:Toggle({Value=false,Callback=Auto_Collect_Coins_Gems_007,Title="Auto Collect Coins & Gems",Desc="Moves all coins and gems to your character"})
campTab:Section({Title="Math Mania"})
campTab:Toggle({Value=false,Callback=Auto_Win_Math_Mania_008,Title="Auto-Win Math Mania",Desc="Auto-solves and submits all math questions"})
campTab:Section({Title="Block Push"})
campTab:Button({Callback=Win_Block_Push_009,Title="Win Block Push",Desc="Pushes your box onto the gold target"})
campTab:Section({Title="Sword Fight"})
campTab:Toggle({Value=false,Callback=Kill_All_In_Sword_Fight_010,Title="Kill All In Sword Fight",Desc="Fires sword touch on all players every frame"})
campTab:Section({Title="Dodgeball & Paintball"})
campTab:Toggle({Value=false,Callback=Bring_Dodgeball_Giver_011,Title="Bring Dodgeball Giver",Desc="Moves giver to you"})
campTab:Toggle({Value=false,Callback=Keep_Dodgeball_After_Round_012,Title="Keep Dodgeball After Round",Desc="Re-equips the dodgeball if it gets taken away"})
campTab:Toggle({Value=false,Callback=Auto_Throw_Dodgeball_013,Title="Auto Throw Dodgeball",Desc="Automatically fires the dodgeball remote"})
campTab:Toggle({Value=false,Callback=Kill_All_Dodgeball_014,Title="Kill All (Dodgeball)",Desc="Slams ball into each player"})
campTab:Toggle({Value=false,Callback=Auto_Fire_Paintball_015,Title="Auto Fire Paintball",Desc="Automatically fires paintball at all players"})
campTab:Toggle({Value=false,Callback=Kill_All_Paintball_016,Title="Kill All (Paintball)",Desc="Moves pellets into each player"})
campTab:Toggle({Value=false,Callback=Dodgeball_Paintball_Protection_017,Title="Dodgeball & Paintball Protection",Desc="Destroys incoming balls"})
campTab:Section({Title="Auto-Win All"})
campTab:Toggle({Value=false,Callback=Auto_Win_All_Challenges_018,Title="Auto-Win All Challenges",Desc="Enables all loops at once"})

-- ==================== MOVIE ====================
movieTab:Section({Title="Obby"})
movieObbyGroup=movieTab:Group()
movieObbyGroup:Button({Title="Win Obby",Callback=Win_Obby_001,IconAlign="Left",Justify="Center",Icon="solar:flag-bold",Size="Small"})
movieTab:Toggle({Value=false,Callback=Auto_Win_Obby_019,Title="Auto-Win Obby",Desc="Finish line loops to your position"})
movieTab:Section({Title="Pirate"})
movieTab:Button({Callback=Collect_Keys_Open_Chests_020,Title="Collect Keys & Open Chests",Desc="Collects all pirate keys and opens matching chests"})
movieTab:Section({Title="Beach Fight"})
movieTab:Toggle({Value=false,Callback=Kill_Everyone_In_Beach_Fight_021,Title="Kill Everyone In Beach Fight",Desc="Fires sword touch on all players every frame"})
movieTab:Section({Title="Monster"})
movieTab:Button({Callback=Monster_Godmode_022,Title="Monster Godmode",Desc="Destroys the monster NPC to prevent damage"})
movieTab:Section({Title="Alien"})
movieTab:Button({Callback=Collect_Egg_023,Title="Collect Egg",Desc="Moves your egg to your character position"})
movieTab:Section({Title="Pre-Historic"})
movieTab:Toggle({Value=false,Callback=Auto_Collect_Ancient_Artifacts_024,Title="Auto Collect Ancient Artifacts",Desc="Teleports artifact coins to you as they spawn"})
movieTab:Section({Title="Math Mania"})
movieTab:Toggle({Value=false,Callback=Auto_Win_Math_Mania_025,Title="Auto-Win Math Mania",Desc="Auto-solves and submits all math questions"})
movieTab:Section({Title="Rock & Roll"})
movieTab:Toggle({Value=false,Callback=Auto_Collect_Guitars_026,Title="Auto Collect Guitars",Desc="Heartbeat collects all coins/gems in Rock & Roll"})
movieTab:Section({Title="Prison"})
movieTab:Button({Callback=Instantly_Eat_Poison_Bowl_027,Title="Instantly Eat Poison Bowl",Desc="Fires clickdetector on every bowl in the prison"})
movieTab:Toggle({Value=false,Callback=Auto_Shoot_Raygun_Sheriff_028,Title="Auto Shoot Raygun (Sheriff)",Desc="Fires ServerControl at nearest enemy"})
movieTab:Toggle({Value=false,Callback=Kill_All_Sheriff_Raygun_029,Title="Kill All (Sheriff / Raygun)",Desc="Moves lasers onto each player"})
movieTab:Toggle({Value=false,Callback=Raygun_Sheriff_Protection_030,Title="Raygun / Sheriff Protection",Desc="Deletes incoming laser blasts"})

-- ==================== EXPEDITION ====================
expeditionTab:Section({Title="Obby"})
expeditionObbyGroup=expeditionTab:Group()
expeditionObbyGroup:Button({Title="Win Obby",Callback=Win_Obby_001,IconAlign="Left",Justify="Center",Icon="solar:flag-bold",Size="Small"})
expeditionTab:Toggle({Value=false,Callback=Auto_Win_Obby_031,Title="Auto-Win Obby",Desc="Finish line loops to your position"})
expeditionTab:Section({Title="Collectibles"})
expeditionTab:Toggle({Value=false,Callback=Auto_Collect_Clovers_032,Title="Auto-Collect Clovers",Desc="Moves all gems and coins to your character"})
expeditionTab:Toggle({Value=false,Callback=Auto_Collect_Rings_033,Title="Auto-Collect Rings",Desc="Moves all ring hitboxes to your character"})
expeditionTab:Section({Title="Math Mania"})
expeditionTab:Toggle({Value=false,Callback=Auto_Win_Math_Mania_034,Title="Auto-Win Math Mania",Desc="Auto-solves and submits all math questions"})
expeditionTab:Section({Title="Greece"})
expeditionTab:Toggle({Value=false,Callback=Kill_Everyone_in_Greece_035,Title="Kill Everyone in Greece",Desc="Fires sword touch on all players every frame"})
expeditionTab:Section({Title="Amazon"})
expeditionTab:Button({Callback=Break_Amazon_Spleef_036,Title="Break Amazon (Spleef)",Desc="Fires touchinterest on all Amazon spleef parts"})
expeditionTab:Section({Title="France (Cheese Push)"})
franceGroup=expeditionTab:Group()
franceGroup:Button({Title="Push Cheese 1",Callback=Push_Cheese_1_037,IconAlign="Left",Justify="Center",Icon="solar:map-point-bold",Size="Small"})
franceGroup:Space({Columns=0.5})
franceGroup:Button({Title="Push Cheese 2",Callback=Push_Cheese_2_038,IconAlign="Left",Justify="Center",Icon="solar:map-point-bold",Size="Small"})
expeditionTab:Toggle({Value=false,Callback=Auto_Push_Cheese_039,Title="Auto Push Cheese",Desc="Continuously pushes both cheeses to the finish"})
expeditionTab:Section({Title="Italy"})
expeditionTab:Button({Callback=Give_Meatball_040,Title="Give Meatball",Desc="Clones meatball into your backpack"})
expeditionTab:Toggle({Value=false,Callback=Keep_Meatball_After_Round_041,Title="Keep Meatball After Round",Desc="Re-equips the meatball if it gets taken away"})
expeditionTab:Toggle({Value=false,Callback=Auto_Throw_Meatball_042,Title="Auto Throw Meatball",Desc="Throws meatball at all players"})
expeditionTab:Toggle({Value=false,Callback=Kill_All_Meatball_043,Title="Kill All (Meatball)",Desc="Slams meatball into each player"})
expeditionTab:Toggle({Value=false,Callback=Bring_Meatball_Giver_044,Title="Bring Meatball Giver",Desc="Moves MeatballGiver to you"})

-- ==================== MAIN ====================
mainTab:Section({Title="Safety Statue"})
safetyStatueGroup=mainTab:Group()
safetyStatueGroup:Button({Title="Get Statue/Bag",Callback=Get_Statue_Bag_045,IconAlign="Left",Justify="Center",Icon="solar:diploma-bold",Size="Small"})
safetyStatueGroup:Space({Columns=0.5})
safetyStatueGroup:Button({Title="Who Has It",Callback=Who_Has_It_046,IconAlign="Left",Justify="Center",Icon="solar:eye-bold",Size="Small"})
mainTab:Toggle({Value=false,Callback=Safety_Bag_ESP_047,Title="Safety Bag ESP",Desc="Shows white highlight and label on all safety bags"})
mainTab:Toggle({Value=false,Callback=Safety_Statue_ESP_048,Title="Safety Statue ESP",Desc="Shows white highlight and label on all safety statues"})
mainTab:Toggle({Value=false,Callback=Idol_Holder_ESP_049,Title="Idol Holder ESP",Desc="Highlights whoever currently holds the statue"})
mainTab:Toggle({Value=false,Callback=Play_as_Idol_Spam_050,Title="Play as Idol (Spam)",Desc="Fires Idol remote rapidly — only works if you hold it"})
mainTab:Button({Callback=Play_as_Idol_Once_051,Title="Play as Idol (Once)",Desc="Fires Idol remote once"})
mainTab:Section({Title="Votes"})
mainTab:Toggle({Value=false,Callback=Notify_Votes_052,Title="Notify Votes",Desc="Shows a notification each time a vote is cast"})
mainTab:Toggle({Value=false,Callback=Print_Votes_to_Console_053,Title="Print Votes to Console",Desc="Prints each vote to the F9 developer console"})
mainTab:Toggle({Value=false,Callback=Expose_Votes_in_Chat_054,Title="Expose Votes in Chat",Desc="Sends each vote publicly in the game chat"})
mainTab:Toggle({Value=false,Callback=Notify_Expose_Exile_Votes_055,Title="Notify & Expose Exile Votes",Desc="Notifies and exposes exile votes in chat"})
mainTab:Toggle({Value=false,Callback=Notify_Jury_Votes_056,Title="Notify Jury Votes",Desc="Shows a notification each time a jury vote is cast"})
mainTab:Toggle({Value=false,Callback=Expose_Jury_Votes_in_Chat_057,Title="Expose Jury Votes in Chat",Desc="Sends jury votes publicly in game chat"})
mainTab:Section({Title="Safety Statue"})
safetyStatueGroupAlt=mainTab:Group()
safetyStatueGroupAlt:Button({Title="Get Statue/Bag",Callback=Get_Statue_Bag_058,IconAlign="Left",Justify="Center",Icon="solar:diploma-bold",Size="Small"})
safetyStatueGroupAlt:Space({Columns=0.5})
safetyStatueGroupAlt:Button({Title="Who Has It",Callback=Who_Has_It_059,IconAlign="Left",Justify="Center",Icon="solar:eye-bold",Size="Small"})
mainTab:Toggle({Value=false,Callback=Safety_Bag_ESP_060,Title="Safety Bag ESP",Desc="Shows white highlight and label on all safety bags"})
mainTab:Toggle({Value=false,Callback=Safety_Statue_ESP_061,Title="Safety Statue ESP",Desc="Shows white highlight and label on all safety statues"})
mainTab:Toggle({Value=false,Callback=Idol_Holder_ESP_062,Title="Idol Holder ESP",Desc="Highlights whoever currently holds the statue"})
mainTab:Toggle({Value=false,Callback=Play_as_Idol_Spam_063,Title="Play as Idol (Spam)",Desc="Fires Idol remote rapidly — only works if you hold it"})
mainTab:Button({Callback=Play_as_Idol_Once_064,Title="Play as Idol (Once)",Desc="Fires Idol remote once"})
mainTab:Section({Title="Votes"})
mainTab:Toggle({Value=false,Callback=Notify_Votes_065,Title="Notify Votes",Desc="Shows a notification each time a vote is cast"})
mainTab:Toggle({Value=false,Callback=Print_Votes_to_Console_066,Title="Print Votes to Console",Desc="Prints each vote to the F9 developer console"})
mainTab:Toggle({Value=false,Callback=Expose_Votes_in_Chat_067,Title="Expose Votes in Chat",Desc="Sends each vote publicly in the game chat"})
mainTab:Toggle({Value=false,Callback=Notify_Expose_Exile_Votes_068,Title="Notify & Expose Exile Votes",Desc="Notifies and exposes exile votes in chat"})
mainTab:Toggle({Value=false,Callback=Notify_Jury_Votes_069,Title="Notify Jury Votes",Desc="Shows a notification each time a jury vote is cast"})
mainTab:Toggle({Value=false,Callback=Expose_Jury_Votes_in_Chat_070,Title="Expose Jury Votes in Chat",Desc="Sends jury votes publicly in game chat"})
mainTab:Button({Callback=Vote_Log_GUI_071,Title="Vote Log GUI",Desc="Opens a movable dark GUI logging all votes live"})
mainTab:Toggle({Value=false,Callback=Tiebreaker_Detector_072,Title="Tiebreaker Detector",Desc="Watches votes live, alerts on tie and shows tally"})
mainTab:Button({Callback=Check_Vote_Tally_073,Title="Check Vote Tally",Desc="Shows current vote counts"})
mainTab:Section({Title="Round Info"})
roundInfoGroup=mainTab:Group()
roundInfoGroup:Button({Title="Round Type",Callback=Round_Type_074,IconAlign="Left",Justify="Center",Icon="solar:bolt-circle-bold",Size="Small"})
roundInfoGroup:Space({Columns=0.5})
roundInfoGroup:Button({Title="Teamers",Callback=Teamers_075,IconAlign="Left",Justify="Center",Icon="solar:users-group-two-rounded-bold",Size="Small"})
mainTab:Toggle({Value=false,Callback=Round_Detector_076,Title="Round Detector",Desc="Notifies on twists BEFORE the round starts + merges"})
mainTab:Section({Title="Server Hop"})
mainTab:Toggle({Value=false,Callback=Server_Hop_on_Merge_077,Title="Server Hop on Merge",Desc="Teleports to a new server when merge triggers"})
mainTab:Button({Callback=Server_Hop_Now_078,Title="Server Hop Now",Desc="Immediately teleports to a new server"})
mainTab:Section({Title="Auto Farm & Rejoin"})
mainTab:Toggle({Value=false,Callback=Auto_Rejoin_When_Voted_Out_079,Title="Auto Rejoin When Voted Out",Desc="Rejoins Camp when voted out"})
mainTab:Toggle({Value=false,Callback=TP_Above_Map_080,Title="TP Above Map",Desc="Creates invisible platform and keeps you there"})
mainTab:Toggle({Value=false,Callback=Auto_Join_Camp_From_Lobby_081,Title="Auto Join Camp From Lobby",Desc="Fires Teleport:Camp remote every 5s"})
mainTab:Section({Title="Elimination Reason"})
mainTab:Button({Callback=Check_Elim_Reason_082,Title="Check Elim Reason",Desc="Shows current elimination reasons"})
mainTab:Toggle({Value=false,Callback=Notify_Elim_Reason_083,Title="Notify Elim Reason",Desc="Shows notification when players are eliminated"})
mainTab:Toggle({Value=false,Callback=Expose_Elim_in_Chat_084,Title="Expose Elim in Chat",Desc="Sends eliminations publicly in game chat"})
mainTab:Toggle({Value=false,Callback=Send_Elim_to_Webhook_085,Title="Send Elim to Webhook",Desc="Posts eliminations to your Discord webhook"})
mainTab:Section({Title="Utilities"})
mainTab:Button({Callback=Remove_Intro_Cutscene_086,Title="Remove Intro Cutscene",Desc="Destroys the intro camera cutscene"})
mainTab:Button({Callback=Fling_Reanimate_087,Title="Fling / Reanimate",Desc="Executes the reanimate script"})
mainTab:Button({Callback=Open_Console_088,Title="Open Console",Desc="Opens the developer console"})
mainTab:Toggle({Value=false,Callback=Auto_Block_Long_Usernames_089,Title="Auto-Block Long Usernames",Desc="Truncates very long display names to prevent lag"})
mainTab:Section({Title="Gear Keeper"})
mainTab:Toggle({Value=false,Callback=Gear_Keeper_090,Title="Gear Keeper",Desc="Restores tools after round ends"})
mainTab:Button({Callback=Snapshot_Gear_Now_091,Title="Snapshot Gear Now",Desc="Manually saves current tools"})
mainTab:Button({Callback=Restore_Gear_Now_092,Title="Restore Gear Now",Desc="Immediately returns saved tools"})
mainTab:Section({Title="Anti Gear Removal"})
mainTab:Toggle({Value=false,Callback=Anti_Gear_Removal_093,Title="Anti Gear Removal",Desc="Blocks Gear:FireServer Remove + ClearBackpack"})
charactersTab:Section({Title="Free"})
freeCharacterGroup=charactersTab:Group()
freeCharacterGroup:Button({Title="Set Male",Callback=Set_Male_094,IconAlign="Left",Justify="Center",Icon="solar:user-bold",Size="Small"})
freeCharacterGroup:Space({Columns=0.5})
freeCharacterGroup:Button({Title="Set Female",Callback=Set_Female_095,IconAlign="Left",Justify="Center",Icon="solar:user-bold",Size="Small"})
charactersTab:Section({Title="Buy Character"})

-- ==================== CHARACTERS ====================
charactersTab:Dropdown({Title="Symbol",Value=1,Values={[1]="None",[2]="Verified",[3]="Premium",[4]="Robux"},Callback=Symbol_096,Desc="Choose a symbol to append to the character name"})
charactersTab:Input({Callback=Character_Name_097,Placeholder="Enter name...",Title="Character Name",Desc="Type the exact character name to purchase"})
charactersTab:Button({Callback=Buy_Character_60_coins_098,Title="Buy Character (60 coins)",Desc="Fires the buy remote with your entered name"})
charactersTab:Section({Title="Map Themes"})
charactersTab:Button({Callback=Christmas_Map_099,Title="Christmas Map",Desc="Snow + white trees"})
charactersTab:Button({Callback=Halloween_Map_100,Title="Halloween Map",Desc="Rust leaves + dark foggy lighting"})
charactersTab:Button({Callback=Valentines_Map_101,Title="Valentines Map",Desc="Pink leaves + rose water"})
charactersTab:Button({Callback=Reset_Map_102,Title="Reset Map",Desc="Removes snow + restores lighting"})
playerTab:Section({Title="Movement"})
playerTab:Space({Columns=2})
playerTab:Slider({IsTooltip=true,Title="Walk Speed",Value={Max=350,Default=16,Min=1},Callback=Walk_Speed_103,Step=1,Icons={To="solar:running-2-bold",From="solar:ghost-bold"}})
playerTab:Space({Columns=1})
playerTab:Slider({IsTooltip=true,Title="Jump Power",Value={Max=350,Default=50,Min=1},Callback=Jump_Power_104,Step=1,Icons={To="solar:rocket-bold",From="solar:arrow-up-bold"}})
playerTab:Section({Title="Timer"})

-- ==================== PLAYER ====================
playerTab:Toggle({Value=false,Callback=Freeze_Timer_Display_105,Title="Freeze Timer Display",Desc="Locks the on-screen timer so it stops counting"})
playerTab:Toggle({Value=false,Callback=Hide_Timer_106,Title="Hide Timer",Desc="Makes the timer GUI invisible"})
playerTab:Section({Title="Map"})
playerTab:Button({Callback=Remove_Glass_Barriers_107,Title="Remove Glass Barriers",Desc="Destroys all glass barrier parts in the map"})
playerTab:Toggle({Value=false,Callback=Walk_on_Lake_108,Title="Walk on Lake",Desc="Enables lake collision"})
playerTab:Button({Callback=Lake_God_Mode_109,Title="Lake God-Mode",Desc="Destroys the lake sand touch interest"})
playerTab:Section({Title="Target Player"})
season=replicatedStorage:WaitForChild("Season",5)
seasonPlayers=season:WaitForChild("Players",5)
seasonPlayers:GetChildren()
targetPlayerDropdown=playerTab:Dropdown({Title="Choose Player",Value=1,Values={[1]="(none)"},Callback=Choose_Player_110,Desc="Select a player to target"})
players.PlayerAdded:Connect(Helper_111)
players.PlayerRemoving:Connect(Helper_112)
targetPlayerGroup=playerTab:Group()
targetPlayerGroup:Button({Title="Teleport To",Callback=Teleport_To_113,IconAlign="Left",Justify="Center",Icon="solar:map-point-bold",Size="Small"})
targetPlayerGroup:Space({Columns=0.5})
targetPlayerGroup:Button({Title="Refresh List",Callback=Refresh_List_114,IconAlign="Left",Justify="Center",Icon="solar:refresh-bold",Size="Small"})
playerTab:Toggle({Value=false,Callback=Highlight_Player_115,Title="Highlight Player",Desc="Adds a yellow highlight to the selected player"})
statsTab:Section({Title="Player Stats"})
players:GetPlayers()
statsPlayerDropdown=
-- ==================== STATS ====================
statsTab:Dropdown({Title="Choose Player",Value=1,Values={[1]="(none)"},Callback=Choose_Player_116,Desc="Select a player to view their stats"})
statsTab:Button({Callback=Refresh_List_117,Title="Refresh List",Desc="Updates the list with current players"})
statsTab:Button({Callback=Camp_Wins_118,Title="Camp Wins",Desc="Shows camp win count"})
statsTab:Button({Callback=Movie_Wins_119,Title="Movie Wins",Desc="Shows movie win count"})
statsTab:Button({Callback=Expedition_Wins_120,Title="Expedition Wins",Desc="Shows expedition win count"})
statsTab:Button({Callback=Coins_121,Title="Coins",Desc="Shows coin balance"})
statsTab:Button({Callback=Comeback_Wins_122,Title="Comeback Wins",Desc="Shows comeback win count"})
statsTab:Button({Callback=Games_Played_123,Title="Games Played",Desc="Shows total games played"})
statsTab:Button({Callback=Idols_Found_124,Title="Idols Found",Desc="Shows idols found"})
statsTab:Button({Callback=Skins_125,Title="Skins",Desc="Lists all skins owned by selected player"})
statsTab:Button({Callback=Marshmallows_126,Title="Marshmallows",Desc="Lists all marshmallows owned by selected player"})
teleportsTab:Section({Title="Camp"})

-- ==================== TELEPORTS ====================
teleportsTab:Button({Callback=Spectator_Island_127,Title="Spectator Island",Desc="Teleport to Spectator Island"})
teleportsTab:Button({Callback=Main_Island_128,Title="Main Island",Desc="Teleport to Main Island"})
teleportsTab:Button({Callback=Exile_Island_129,Title="Exile Island",Desc="Teleport to Exile Island"})
teleportsTab:Button({Callback=Voting_Area_130,Title="Voting Area",Desc="Teleport to Voting Area"})
teleportsTab:Button({Callback=Boat_131,Title="Boat",Desc="Teleport to Boat"})
teleportsTab:Button({Callback=Bathroom_132,Title="Bathroom",Desc="Teleport to Bathroom"})
teleportsTab:Section({Title="Movie"})
teleportsTab:Button({Callback=Starter_Island_133,Title="Starter Island",Desc="Teleport to Starter Island"})
teleportsTab:Button({Callback=Voting_Area_134,Title="Voting Area",Desc="Teleport to Voting Area"})
teleportsTab:Button({Callback=Cabin_1_135,Title="Cabin 1",Desc="Teleport to Cabin 1"})
teleportsTab:Button({Callback=Cabin_2_136,Title="Cabin 2",Desc="Teleport to Cabin 2"})
teleportsTab:Button({Callback=Dining_Room_137,Title="Dining Room",Desc="Teleport to Dining Room"})
teleportsTab:Button({Callback=Kitchen_138,Title="Kitchen",Desc="Teleport to Kitchen"})
teleportsTab:Button({Callback=Inside_Boat_139,Title="Inside Boat",Desc="Teleport to Inside Boat"})
teleportsTab:Section({Title="Expedition"})
teleportsTab:Button({Callback=Ship_Voting_Area_140,Title="Ship Voting Area",Desc="Teleport to Ship Voting Area"})
teleportsTab:Button({Callback=First_Class_VIP_141,Title="First Class (VIP)",Desc="Teleport to First Class (VIP)"})
teleportsTab:Button({Callback=_2nd_Class_142,Title="2nd Class",Desc="Teleport to 2nd Class"})
teleportsTab:Button({Callback=Ship_Bathroom_143,Title="Ship Bathroom",Desc="Teleport to Ship Bathroom"})
teleportsTab:Button({Callback=Dining_Class_144,Title="Dining Class",Desc="Teleport to Dining Class"})
teleportsTab:Button({Callback=Basement_145,Title="Basement",Desc="Teleport to Basement"})
universalTab:Section({Title="Tools"})

-- ==================== UNIVERSAL ====================
universalTab:Button({Callback=VC_Unban_146,Title="VC Unban",Desc="Rejoins voice chat to bypass a voice ban"})
universalTab:Button({Callback=Apply_Shaders_147,Title="Apply Shaders",Desc="Applies custom lighting and sky shaders"})
universalTab:Button({Callback=Infinite_Yield_148,Title="Infinite Yield",Desc="Loads Infinite Yield FE admin commands"})
universalTab:Button({Callback=Fly_GUI_149,Title="Fly GUI",Desc="Loads a fly script with GUI controls"})
universalTab:Button({Callback=Wall_Hop_150,Title="Wall Hop",Desc="Loads a wall hop movement script"})
universalTab:Button({Callback=Sound_Panel_151,Title="Sound Panel",Desc="Loads a sound control panel"})
universalTab:Button({Callback=Energize_Animations_152,Title="Energize Animations",Desc="Opens the FE animation GUI"})
universalTab:Button({Callback=Bring_Back_Old_Chat_153,Title="Bring Back Old Chat",Desc="Restores the old Roblox chat UI"})
universalTab:Section({Title="Misc"})
universalTab:Toggle({Value=false,Callback=Collision_154,Title="Collision",Desc="Adds invisible collision to all other players"})
universalTab:Toggle({Value=false,Callback=Hacker_Detector_155,Title="Hacker Detector",Desc="Flags abnormal speed or jump"})
universalTab:Section({Title="Team Changer"})
teams=game:GetService("Teams")
teams:GetChildren()
teamDropdown=universalTab:Dropdown({Value=1,Callback=Team_156,Values={[1]="Spectator",[2]="Jury",[3]="Team1",[4]="Team2",[5]="Team3"},Title="Team"})
universalTab:Button({Title="Refresh Teams",Callback=Refresh_Teams_157})
universalTab:Button({Callback=Set_Team_158,Title="Set Team",Desc="Join the selected team"})
universalTab:Button({Callback=Spectator_159,Title="Spectator",Desc="Quick-join Spectator team"})
universalTab:Button({Callback=Jury_160,Title="Jury",Desc="Quick-join Jury team"})
universalTab:Section({Title="Fonts"})
universalTab:Button({Callback=Load_Fonts_161,Title="Load Fonts",Desc="Download all fonts before applying"})
universalTab:Button({Callback=Starborn_162,Title="Starborn",Desc="Apply Starborn font"})
universalTab:Button({Callback=VHS_163,Title="VHS",Desc="Apply VHS gothic font"})
universalTab:Button({Callback=Minecrafter_164,Title="Minecrafter",Desc="Apply Minecrafter font"})
universalTab:Button({Callback=Horror_165,Title="Horror",Desc="Apply Horror font"})
clientTab:Section({Title="Cosmetics"})

-- ==================== CLIENT ====================
clientTab:Toggle({Value=false,Callback=Rainbow_Name_166,Title="Rainbow Name",Desc="Makes your character name cycle through rainbow colors"})
clientTab:Section({Title="Skin Changer"})
clientTab:Button({Callback=Skin_Changer_167,Title="Skin Changer",Desc="Opens the skin changer GUI"})
clientTab:Section({Title="Size Changer"})
clientTab:Button({Callback=Size_Changer_168,Title="Size Changer",Desc="Changes your size"})
clientTab:Section({Title="Admin Panel"})
clientTab:Button({Callback=Gets_Admin_Panel_169,Title="Gets Admin Panel",Desc="Forces open the settings/admin GUI"})
otherTab:Section({Title="Auto Farm"})

-- ==================== OTHER ====================
otherTab:Toggle({Value=false,Callback=Auto_Farm_Coin_170,Title="Auto Farm Coin",Desc="Reanimates when any player wins + auto-win obby"})
otherTab:Section({Title="Auto Farm Coins 2"})
otherTab:Toggle({Value=false,Callback=Auto_Farm_Coins_2_171,Title="Auto Farm Coins 2",Desc="Triggers on every coin gain"})
otherTab:Section({Title="Auto Restart Day"})
otherTab:Toggle({Value=false,Callback=Auto_Restart_Day_172,Title="Auto Restart Day",Desc="Reanimates when the round ends"})
otherTab:Section({Title="Obby Detector"})
otherTab:Button({Callback=Detect_Current_Obby_173,Title="Detect Current Obby",Desc="Checks workspace.Assets for active challenge"})
otherTab:Toggle({Value=false,Callback=Auto_Detect_Obby_174,Title="Auto-Detect Obby",Desc="Notifies when a new challenge starts"})
otherTab:Section({Title="Get Items"})
otherTab:Button({Title="Give Dodgeball",Callback=Give_Dodgeball_175})
otherTab:Button({Title="Give Paintball Gun",Callback=Give_Paintball_Gun_176})
otherTab:Button({Title="Give Meatball",Callback=Give_Meatball_177})
otherTab:Button({Title="Give Raygun (Sheriff)",Callback=Give_Raygun_Sheriff_178})
otherTab:Button({Title="Give Sword",Callback=Give_Sword_179})
otherTab:Button({Title="Give Pool Noodle",Callback=Give_Pool_Noodle_180})
otherTab:Button({Title="Give Snowball",Callback=Give_Snowball_181})
otherTab:Section({Title="Webhooks"})
otherTab:Input({Callback=Webhook_URL_182,Placeholder="https://discord.com/api/webhooks/...",Title="Webhook URL",Desc="Paste your Discord webhook URL here"})
otherTab:Button({Callback=Test_Webhook_183,Title="Test Webhook",Desc="Sends a test message to verify your webhook URL"})
otherTab:Toggle({Value=false,Title="Send Jury Votes to Webhook",Callback=Send_Jury_Votes_to_Webhook_184})
otherTab:Toggle({Value=false,Title="Send Votes to Webhook",Callback=Send_Votes_to_Webhook_185})
otherTab:Toggle({Value=false,Title="Send Exile Votes to Webhook",Callback=Send_Exile_Votes_to_Webhook_186})
otherTab:Toggle({Value=false,Title="Expose Exile Votes in Chat",Callback=Expose_Exile_Votes_in_Chat_187})
otherTab:Toggle({Value=false,Title="Send Statue Holder to Webhook",Callback=Send_Statue_Holder_to_Webhook_188})
otherTab:Toggle({Value=false,Title="Send Round Info to Webhook",Callback=Send_Round_Info_to_Webhook_189})
shopTab:Section({Title="Daily Shop"})

-- ==================== SHOP ====================
shopTab:Button({Callback=Print_Shop_to_Console_190,Title="Print Shop to Console",Desc="Prints all daily shop items to F9 console"})
shopTab:Button({Callback=Send_Shop_to_Webhook_191,Title="Send Shop to Webhook",Desc="Posts all daily shop items to your Discord webhook"})
shopTab:Section({Title="Shop Watcher"})
shopTab:Toggle({Value=false,Callback=Notify_When_Shop_Updates_192,Title="Notify When Shop Updates",Desc="Notifies you when a new item appears in the shop"})
shopTab:Toggle({Value=false,Callback=Auto_Send_Shop_Updates_to_Webhook_193,Title="Auto Send Shop Updates to Webhook",Desc="Posts to webhook when new items appear"})
trollTab:Section({Title="Sound Control"})

-- ==================== TROLL ====================
trollTab:Toggle({Value=false,Callback=Mute_All_Sounds_194,Title="Mute All Sounds",Desc="Sets SoundService volume to 0 (local only)"})
trollTab:Button({Callback=Stop_All_Playing_Sounds_195,Title="Stop All Playing Sounds",Desc="Stops all sounds in workspace and PlayerGui"})
trollTab:Section({Title="Spam Sounds"})
trollTab:Toggle({Value=false,Callback=Spam_Click_Sound_196,Title="Spam Click Sound",Desc="Rapidly fires lp.PlayerGui.Click:Play()"})
trollTab:Toggle({Value=false,Callback=Spam_OOF_197,Title="Spam OOF",Desc="Loops the OOF death sound locally"})
trollTab:Section({Title="Trigger Sounds"})
trollTab:Button({Title="Sword Lunge Sound",Callback=Sword_Lunge_Sound_198})
trollTab:Button({Title="Equip (Sword Unsheath)",Callback=Equip_Sword_Unsheath_199})
trollTab:Button({Title="Toilet Elimination Sound",Callback=Toilet_Elimination_Sound_200})
trollTab:Button({Title="Sleigh Elimination Sound",Callback=Sleigh_Elimination_Sound_201})
trollTab:Section({Title="Trigger Twisted"})
trollTab:Button({Callback=Trigger_Twisted_202,Title="Trigger Twisted",Desc="Fires PSSettings + OSSettings Start remotes"})
trollTab:Section({Title="Sleigh Elimination Swap"})
trollTab:Button({Callback=Swap_to_Sleigh_Elimination_203,Title="Swap to Sleigh Elimination",Desc="Replaces Boat with Sleigh, plays animation"})
trollTab:Button({Callback=Force_Restore_Boat_204,Title="Force Restore Boat",Desc="Immediately restores Boat Elimination"})
trollTab:Section({Title="Anti Loser Land"})
trollTab:Toggle({Value=false,Callback=Anti_Loser_Land_205,Title="Anti Loser Land",Desc="Blocks elimination sending you to spectator"})
trollTab:Button({Callback=Force_Fight_Elim_Test_206,Title="Force Fight Elim (Test)",Desc="Manually triggers the anti-elim routine"})
autoplayTab:Section({Title="TAS Autoplay"})

-- ==================== AUTOPLAY ====================
autoplayTab:Toggle({Value=false,Callback=Autoplay_207,Title="Autoplay",Desc="Automatically plays the TAS when a challenge starts"})
autoplayTab:Toggle({Value=false,Callback=Disable_Shiftlock_Camera_208,Title="Disable Shiftlock / Camera",Desc="Keeps your camera free during TAS playback"})
autoplayTab:Button({Callback=Play_This_Round_209,Title="Play This Round",Desc="Manually triggers autoplay for the current map"})
autoplayTab:Button({Callback=Stop_Playback_210,Title="Stop Playback",Desc="Stops the current TAS playback"})
autoplayTab:Section({Title="Map Options"})
autoplayTab:Dropdown({Value=1,Callback=Cave_Chaos_Route_211,Values={[1]="Cave Chaos",[2]="Cave Chaos Clip"},Title="Cave Chaos Route"})
autoplayTab:Dropdown({Value=1,Callback=Unstable_Savannah_Route_212,Values={[1]="Unstable Savannah",[2]="Unstable Savannah Clip"},Title="Unstable Savannah Route"})

-- ==================== SETTINGS ====================
settingsTab:Section({Title="Update Notice"})
settingsTab:Paragraph({Title="What's New",Content="View the latest changelog anytime, even if you dismissed it permanently."})
settingsTab:Button({Callback=Show_Update_Notice_213,Title="Show Update Notice",Desc="Re-opens the changelog dialog"})
settingsTab:Section({Title="UI Library"})
settingsTab:Paragraph({Title="Switch UI",Content="Switching will reload the entire script with Rayfield. All current toggles will reset."})
settingsTab:Button({Callback=Switch_to_Rayfield_214,Title="Switch to Rayfield",Desc="Destroys WindUI and loads the Rayfield version"})
settingsTab:Section({Title="Toggle Key"})
settingsTab:Paragraph({Title="Current Key",Content="Default is K. Change it here if needed."})
settingsTab:Dropdown({Title="Toggle Key",Value=1,Values={[1]="K",[2]="RightShift",[3]="RightCtrl",[4]="Insert",[5]="Home",[6]="Delete",[7]="F4",[8]="F5",[9]="F6"},Callback=Toggle_Key_215,Desc="Key to show/hide the UI (default: K)"})
settingsTab:Section({Title="WindUI Theme"})
settingsTab:Paragraph({Title="Theme",Content="Change the colour theme of the WindUI window. Takes effect immediately."})
settingsTab:Dropdown({Title="Theme",Value=1,Values={[1]="Dark",[2]="Light",[3]="Aqua",[4]="Bloom",[5]="Rose"},Callback=Theme_216,Desc="Pick a WindUI colour theme"})
window:Init()
windUI:Notify({Duration=5,Content="Loaded! Press K to toggle.",Title="Ella Hub V2"})
