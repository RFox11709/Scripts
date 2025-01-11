local function rejoin()
    local TeleportService = game:GetService("TeleportService")
    local player = game.Players.LocalPlayer
    TeleportService:Teleport(game.PlaceId, player)
end

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Failed then
        wait(5) -- Retry delay in case it fails
        rejoin()
    end
end)

rejoin()
