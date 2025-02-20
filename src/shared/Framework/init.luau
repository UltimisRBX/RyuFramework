local Framework = {}

function GetPath(Path)
    local string = string.split(Path, "/")
    local currentPath = script
    for _, nextPath in pairs(string) do
        currentPath = currentPath[nextPath]
    end
    return currentPath
end


function Framework.new()
    local object = {
        Model = nil,
        ComboTable = {
            LastPressed = os.clock(),
            BlockStartTime = os.clock(),
            KeysLogged = 0,
            LastKey = nil,
            Hits = 0,
            DamagedEntities = {},
            ComboVariation = ""
        }
    };
    local meta = {};
  
    function meta:DoSomething()
      return true;
    end

    function meta:SetModel(model)
        self.Model = model
    end

    function meta:EmitSound(SoundPath, Range)
        local Path = GetPath(SoundPath)
        if Path then
            local Sound = Instance.new("Sound")
            Sound.SoundId = Path.SoundId
            Sound.RollOffMinDistance = Range/2
            Sound.RollOffMaxDistance = Range
            Sound.Parent = self.Model.PrimaryPart
            Sound:Play()
            game:GetService("Debris"):AddItem(Sound, Sound.TimeLength)
        else
            warn("Sound wasn't found!")
        end
    end

    function meta:Attack(Args, Function)
        
    end

    function meta:SendLastKey(Key)
        self.ComboTable.ComboVariation = os.clock() - self.ComboTable.LastPressed <= 2 and self.ComboTable.ComboVariation or ""
        self.ComboTable.ComboVariation = string.len(self.ComboTable.ComboVariation) > 4 and "" or self.ComboTable.ComboVariation
        self.ComboTable.ComboVariation = self.ComboTable.ComboVariation..Key
        self.ComboTable.KeysLogged = string.len(self.ComboTable.ComboVariation)
        self.ComboTable.LastPressed = os.clock()
    end
  
    return setmetatable(object, {__index = meta})
end
  


return Framework