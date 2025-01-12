-- Load the DrRay library from the GitHub repository
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

-- Create a new window with title and theme
local window = DrRayLibrary:Load("Val", "Default")

-- Create the "Visual" tab
local visualTab = DrRayLibrary.newTab("Visual", "ImageIdHere")

-- Add Visual elements
visualTab.newLabel("Visual Features")
visualTab.newToggle("Fullbright", "Toggle full brightness and shadows.", true, function(toggleState)
    local lighting = game:GetService("Lighting")
    if toggleState then
        lighting.Brightness = 2
        lighting.GlobalShadows = false
        lighting.Ambient = Color3.new(1, 1, 1)
    else
        lighting.Brightness = 1
        lighting.GlobalShadows = true
        lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
    end
end)

local Lighting = game:GetService("Lighting")

-- Bloom Effect Toggle
visualTab.newToggle("Bloom Effect", "Toggle Bloom (makes everything glow)", false, function(toggleState)
    if toggleState then
        local bloom = Instance.new("BloomEffect", Lighting)
        bloom.Name = "CustomBloom"
        bloom.Intensity = 1.5 -- Customize as needed
        bloom.Size = 24
        bloom.Threshold = 2
    else
        if Lighting:FindFirstChild("CustomBloom") then
            Lighting.CustomBloom:Destroy()
        end
    end
end)

-- ColorCorrection Toggle
visualTab.newToggle("Color Correction", "Toggle Color Correction (adjusts saturation & contrast)", false, function(toggleState)
    if toggleState then
        local cc = Instance.new("ColorCorrectionEffect", Lighting)
        cc.Name = "CustomCC"
        cc.Brightness = 0.1
        cc.Contrast = 0.3
        cc.Saturation = 1.5
    else
        if Lighting:FindFirstChild("CustomCC") then
            Lighting.CustomCC:Destroy()
        end
    end
end)

-- SunRays Toggle
visualTab.newToggle("Sun Rays", "Toggle Sun Rays (adds light beams from the sun)", false, function(toggleState)
    if toggleState then
        local sunRays = Instance.new("SunRaysEffect", Lighting)
        sunRays.Name = "CustomSunRays"
        sunRays.Intensity = 0.2 -- Adjust as needed
        sunRays.Spread = 1
    else
        if Lighting:FindFirstChild("CustomSunRays") then
            Lighting.CustomSunRays:Destroy()
        end
    end
end)

-- Create the "Player" tab
local playerTab = DrRayLibrary.newTab("Player", "ImageIdLogoHere")

-- Add Player elements
playerTab.newLabel("Local Player Features")

-- Player Service and Local Player
local playerService = game:GetService("Players")
local localPlayer = playerService.LocalPlayer
local playerList = {}

-- Function to refresh player list
local function refreshPlayers()
    playerList = {}
    for _, player in ipairs(playerService:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerList, player.Name)
        end
    end
end

-- Initial Player List Refresh
refreshPlayers()

-- Dropdown for selecting players
local selectedPlayer
local dropdown = playerTab.newDropdown("Select Player", "Choose a player to teleport to.", playerList, function(playerName)
    selectedPlayer = playerName
end)

-- Refresh Button
playerTab.newButton("Refresh Player List", "Updates the player list in the dropdown.", function()
    refreshPlayers()
    dropdown:SetOptions(playerList) -- Update dropdown options
end)

-- Teleport Button
playerTab.newButton("Teleport to Player", "Move to the selected player.", function()
    if selectedPlayer then
        local targetPlayer = playerService:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
        else
            warn("Player not valid or doesn't have a character.")
        end
    else
        warn("No player selected.")
    end
end)
