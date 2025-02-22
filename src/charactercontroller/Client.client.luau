local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local Character = Player.Character
local CharacterController = script.Parent

local InputRemote = CharacterController:FindFirstChild("Input")

UserInputService.InputBegan:Connect(function(Input, gameProcessedEvent)
    if Input.UserInputType == Enum.UserInputType.None then return end
    warn(Input.KeyCode.Name)
    if (not gameProcessedEvent) then
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            InputRemote:FireServer("MouseButton1", true)
        elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
            InputRemote:FireServer("MouseButton2", true)
        else
            InputRemote:FireServer(Input.KeyCode.Name, true)
        end
    end
end)

UserInputService.InputEnded:Connect(function(Input, gameProcessedEvent)
    if Input.UserInputType == Enum.UserInputType.None then return end
    if (not gameProcessedEvent) then
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            InputRemote:FireServer("MouseButton1", false)
        elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
            InputRemote:FireServer("MouseButton2", false)
        else
            InputRemote:FireServer(Input.KeyCode.Name, false)
        end
    end
end)