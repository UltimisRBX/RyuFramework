local TweenService = game:GetService("TweenService")
local Hitbox = {}

local ActivePieces = {}

function Hitbox:Initialize(Character, Piece, Arguments)
    if not Character then return end
    if not Piece then return end

	local object = {}
    local meta = {}

   

	local hitboxPart = Instance.new("Part", workspace.Terrain);
	hitboxPart.Anchored = false;
	hitboxPart.Massless = true;
	hitboxPart.CanCollide = false;
	hitboxPart.Transparency = 1;
	hitboxPart.Size = Arguments.Size;
	hitboxPart.CFrame = Piece.CFrame * Arguments.SourceCFrame;

	local Weld = Instance.new("Weld",hitboxPart);      
	Weld.Part0 = Piece;
	Weld.Part1 = hitboxPart;
	Weld.C0 = Arguments.SourceCFrame;


	local Outline = Instance.new("SelectionBox",hitboxPart);
	Outline.Adornee = hitboxPart;
	Outline.Color3 = Color3.fromRGB(0,255,0);
	Outline.LineThickness = 0.01;
	Outline.SurfaceColor3 = Color3.fromRGB(0,255,0);
	Outline.SurfaceTransparency = 0.75;
	Outline.Transparency = 0;




	local AlreadyHit = {Character, workspace.Terrain}

	local HitPeople = {}

	local Params = OverlapParams.new()
	Params.FilterDescendantsInstances = AlreadyHit
	Params.FilterType = Enum.RaycastFilterType.Exclude


	--coroutine.wrap(function()
	local Connection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
		local Parts = workspace:GetPartBoundsInBox(hitboxPart.CFrame, Arguments.Size, Params)
		for _,v in pairs(Parts) do
			local HitCharacter = v.Parent
			if not table.find(HitPeople, HitCharacter) and v:IsDescendantOf(workspace.World.Live) then
				if HitCharacter:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid") and HitCharacter:FindFirstChild("Humanoid") ~= nil and not HitCharacter:GetAttribute("IFrame") then
					table.insert(HitPeople, HitCharacter)
					--if not HitCharacter:FindFirstChild("Counter") then
						local Humanoid = HitCharacter:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid")
						if HitCharacter:FindFirstChild("iFrame") then return end
						Humanoid:TakeDamage(Arguments.Damage)
						if Arguments.Func then
							Arguments["Func"](Character, HitCharacter)
						end
				--	end
				end
			end
		end
		task.wait(0.1)
	end)

	task.delay(Arguments.Duration, function() Connection:Disconnect() hitboxPart:Destroy() end)




    return setmetatable(object, {__index = meta})
end

return Hitbox