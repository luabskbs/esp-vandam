-- Parent this LocalScript to StarterPlayerScripts or a similar location
local function highlightPlayer(player)
    -- Check if the player's character exists
    if player.Character then
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                -- Create a Highlight instance
                local highlight = Instance.new("Highlight")
                highlight.Adornee = part
                highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Yellow highlight
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0) -- Red outline
                highlight.Parent = part
            end
        end
    end
end

-- Loop through all players in the game
local Players = game:GetService("Players")

for _, player in ipairs(Players:GetPlayers()) do
    highlightPlayer(player)
end

-- Update when a new player joins
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        highlightPlayer(player)
    end)
end)