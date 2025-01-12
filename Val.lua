-- Load the DrRay library from the GitHub repository Library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("Val", "Default")

-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Visual", "ImageIdHere")

-- Add elements to the first tab
tab1.newLabel("Visual")
tab1.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
tab1.newToggle("Visual", "Toggle! (prints the state)", true, function(toggleState)
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
tab1.newInput("Input", "Prints your input.", function(text)
    print("Entered text in Tab 1: " .. text)
end)

-- Create the second tab with a different image ID
local tab2 = DrRayLibrary.newTab("Player", "ImageIdLogoHere")

-- Add elements to the second tab
tab2.newLabel("Player")

ocal playerService = game:GetService("Players")
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

local selectedPlayer
local dropdown = localPlayerTab:newDropdown("Select Player", "Choose a player to teleport to.", playerList, function(playerName)
    selectedPlayer = playerName
end)

-- Refresh Button
localPlayerTab:newButton("Refresh Player List", "Updates the player list in the dropdown.", function()
    refreshPlayers()
    dropdown:SetOptions(playerList) -- Update dropdown options
end)

-- Teleport Button
localPlayerTab:newButton("Teleport to Player", "Move to the selected player.", function()
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

tab2.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
tab2.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)
tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)
    print(selectedOption)
end)
