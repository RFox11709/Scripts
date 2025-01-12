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
