local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local Character = Player.Character
local CharacterController = script.Parent

local Camera = workspace.CurrentCamera

local InputRemote = CharacterController:FindFirstChild("Input")

local targetMoveVelocity = Vector3.new()
local moveVelocity = Vector3.new()
local moveAcceleration = 8

local walkKeyBinds = {
	Forward = { Key = Enum.KeyCode.W, InpPos = Vector3.new(), Direction = Enum.NormalId.Front },
	Backward = { Key = Enum.KeyCode.S, Direction = Enum.NormalId.Back },
	Left = { Key = Enum.KeyCode.A, Direction = Enum.NormalId.Left },
	Right = { Key = Enum.KeyCode.D, Direction = Enum.NormalId.Right }
}


local function lerp(a, b, t)
	return a + (b - a) * t
end

--[[local function getWalkDirectionCameraSpace()
	local walkDir = Vector3.new()

	for keyBindName, keyBind in walkKeyBinds do
		if UserInputService:IsKeyDown(keyBind.Key) and not UserInputService:GetFocusedTextBox() then
			walkDir += Vector3.FromNormalId(keyBind.Direction)
		end
	end

	if walkDir.Magnitude > 0 then
		walkDir = walkDir.Unit
	end

	return walkDir
end

local function getWalkDirectionWorldSpace()
	local walkDir = Camera.CFrame:VectorToWorldSpace(getWalkDirectionCameraSpace())
	walkDir *= Vector3.new(1, Character:FindFirstChild("Humanoid") and Character.Humanoid:GetState() == Enum.HumanoidStateType.Swimming and 1 or 0, 1)

	if walkDir.Magnitude > 0 then
		walkDir = walkDir.Unit
	end

	return walkDir
end

local function updateMovement(dt)
	local humanoid = Character:FindFirstChild("Humanoid")
	if humanoid and humanoid.WalkSpeed > 0 then
		local moveDir = getWalkDirectionWorldSpace()
		if humanoid:GetState() == Enum.HumanoidStateType.Swimming then
			moveDir = Vector3.new(moveDir.x, 1, moveDir.z)
		end
		targetMoveVelocity = moveDir
		moveVelocity = lerp(moveVelocity, targetMoveVelocity, math.clamp(dt * (moveAcceleration), 0, 1))
		humanoid:Move(moveVelocity)
	end
end]]

UserInputService.InputBegan:Connect(function(Input, gameProcessedEvent)
    if Input.UserInputType == Enum.UserInputType.None then return end
 --   warn(Input.KeyCode.Name)
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

--RunService.RenderStepped:Connect(updateMovement)