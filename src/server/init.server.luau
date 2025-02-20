local Framework = require(game:GetService("ReplicatedStorage"):FindFirstChild("Shared"):FindFirstChild("Framework"))
local Storage = game:GetService("ServerStorage"):FindFirstChild("Storage")





game:GetService("Players").PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function(Character)
        local Player = Framework.new()
        Player:SetModel(Character)

        coroutine.wrap(function()
            while true do
                Player:EmitSound("Assets/sfx/punch_hit03", 60)
                task.wait(3)
            end
        end)
    end)
end)