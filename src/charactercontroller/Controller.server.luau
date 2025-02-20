local Character = script.Parent.Parent
local Humanoid = Character:FindFirstChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Player = game:GetService("Players"):GetPlayerFromCharacter(Character)

local Shared = game.ReplicatedStorage:FindFirstChild("Shared")
local Framework = require(Shared.Framework)
local PlayerObject = Framework.new()
Framework:addObject(Character, PlayerObject)


Player.CharacterRemoving:Connect(function(character)
    Framework:removeObject(Character)
end)