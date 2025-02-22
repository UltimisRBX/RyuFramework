local Controller = script.Parent
local Character = Controller.Parent
local Humanoid = Character:FindFirstChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Player = game:GetService("Players"):GetPlayerFromCharacter(Character)

local Shared = game.ReplicatedStorage:FindFirstChild("Shared")
local Framework = require(Shared.Framework)
local PlayerObject = Framework.new()
Framework:addObject(Character, PlayerObject)

local InputRemote = Controller:FindFirstChild("Input")

Player.CharacterRemoving:Connect(function(character)
    Framework:removeObject(Character)
end)


InputRemote.OnServerEvent:Connect(function(player, Input, Hold)
    if Player ~= player then return warn("Recipient error") end
    if (Input == nil) or (Hold == nil) then return warn("Communication error") end
    warn(Input, Hold)
end)