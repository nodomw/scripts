Studio = game:GetService("RunService"):IsStudio()
local library
if Studio then
	library = require(workspace.UI)
else
	library = loadstring(game:HttpGet("http://bloxxite.xyz/rgwergdsfgsdtrjhsdrth", true))()
end

Services = setmetatable({}, {
    __index = function(self, index)
        return game:GetService(index)
    end
})

Player = Services.Players.LocalPlayer
Camera = workspace:FindFirstChildOfClass("Camera")
Mouse = Player:GetMouse()
Environment = nil
if not Studio then
	Environment = getsenv(Player.PlayerGui.Client)
end

Backtrack = Instance.new("Model", workspace)
BacktrackSample = game:GetObjects("rbxassetid://4707836033")[1]
DefaultAimbot = "Legit"

function Players(func, includenewplayers)
    for i,v in pairs(Services.Players:GetPlayers()) do
        func(v)
    end
	if includenewplayers then
		Services.Players.PlayerAdded:connect(func)
	end
end

function IsEnemy(v)
	return v.Team ~= Player.Team
end

function IsAlly(v)
	return v.Team == Player.Team
end

function Enemies(func)
	Players(function(v)
		if IsEnemy(v) then
        	func(v)
		end
	end)
end

function Allies(func)
	Players(function(v)
		if IsAlly(v) and v ~= Player then
        	func(v)
		end
	end)
end

function isAlive(v)
	return v and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart")
end

function GetDistanceSq(v1, v2) -- yeah optimization
	local a = v2.x - v1.x
	local b = v2.y - v1.y
    return (a*a) + (b*b)
end

function GetDistanceSq3(v1, v2) -- yeah optimization
	local a = v2.x - v1.x
	local b = v2.y - v1.y
	local c = v2.z - v1.z
    return a*a + b*b + c*c
end

function GetDistanceToCrosshair(v)
	local worldPoint = v.Character.HumanoidRootPart.Position
	local vector, onScreen = Camera:WorldToScreenPoint(worldPoint)
	local magnitude = GetDistanceSq(Vector2.new(Mouse.X, Mouse.Y), Vector2.new(vector.X, vector.Y))
	return magnitude, onScreen
end

function CalculateThreat(p)
	local ignorelist = {Camera, Player.Character, p.Character, Backtrack}
	local parts = Camera:GetPartsObscuringTarget({p.CameraCF.Value.p}, ignorelist)
	if #parts < 2 then
		return true
	end
end

function GetStatus(player)
	return DefaultAimbot
end

function GetThreat(prefix)
	local target = nil
	local distance = math.huge
	
	Enemies(function(v)
		if isAlive(v) then
			local magnitude = GetDistanceSq3(Player.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position)
			if GetStatus(v) == prefix and distance > magnitude and CalculateThreat(v) then
				distance = magnitude
				target = v
			end
		end
	end)

	return target, 0
end


function GetClosestToCrosshair(prefix)
	local target = nil
	local distance = math.huge
	
	Enemies(function(v)
		if isAlive(v) then
			local magnitude, onScreen = GetDistanceToCrosshair(v)
			if GetStatus(v) == prefix and onScreen and magnitude < distance then
				distance = magnitude
				target = v
			end
		end
	end)

	return target, distance
end

function GetNearest(prefix)
	local target = nil;
	local distance = math.huge
	
	Enemies(function(v)
		if isAlive(v) then
			local magnitude = GetDistanceSq3(Player.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position)
			if GetStatus(v) == prefix and distance > magnitude then
				distance = magnitude
				target = v
			end
		end
	end)
	
	return target, 0
end

local Skyboxes = {
	["Alien Red (Nostalgia)"] = {
		SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889",
		SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890",
		SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891",
		SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887",
		SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889",
		SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888",
		SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Cloudy Skies"] = {
		SkyboxLf = "http://www.roblox.com/asset/?id=252760980",
		SkyboxBk = "http://www.roblox.com/asset/?id=252760981",
		SkyboxDn = "http://www.roblox.com/asset/?id=252763035",
		SkyboxFt = "http://www.roblox.com/asset/?id=252761439",
		SkyboxLf = "http://www.roblox.com/asset/?id=252760980",
		SkyboxRt = "http://www.roblox.com/asset/?id=252760986",
		SkyboxUp = "http://www.roblox.com/asset/?id=252762652",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Counter Strike City"] = {
		SkyboxLf = "rbxassetid://2240133550",
		SkyboxBk = "rbxassetid://2240134413",
		SkyboxDn = "rbxassetid://2240136039",
		SkyboxFt = "rbxassetid://2240130790",
		SkyboxLf = "rbxassetid://2240133550",
		SkyboxRt = "rbxassetid://2240132643",
		SkyboxUp = "rbxassetid://2240135222",
		StarCount = 3000,
		SunAngularSize = 0
	},
	["Dark City"] = {
		SkyboxLf = "rbxassetid://1424484951",
		SkyboxBk = "rbxassetid://1424486234",
		SkyboxDn = "rbxassetid://1424485998",
		SkyboxFt = "rbxassetid://1424485697",
		SkyboxLf = "rbxassetid://1424484951",
		SkyboxRt = "rbxassetid://1424484760",
		SkyboxUp = "rbxassetid://1424484510",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Earth"] = {
		SkyboxLf = "http://www.roblox.com/asset/?id=166510092",
		SkyboxBk = "http://www.roblox.com/asset/?id=166509999",
		SkyboxDn = "http://www.roblox.com/asset/?id=166510057",
		SkyboxFt = "http://www.roblox.com/asset/?id=166510116",
		SkyboxLf = "http://www.roblox.com/asset/?id=166510092",
		SkyboxRt = "http://www.roblox.com/asset/?id=166510131",
		SkyboxUp = "http://www.roblox.com/asset/?id=166510114",
		StarCount = 0,
		SunAngularSize = 21
	},
	["Mountains By Crykee"] = {
		SkyboxLf = "http://www.roblox.com/asset/?id=368390615",
		SkyboxBk = "http://www.roblox.com/asset/?id=368385273",
		SkyboxDn = "http://www.roblox.com/asset/?id=48015300",
		SkyboxFt = "http://www.roblox.com/asset/?id=368388290",
		SkyboxLf = "http://www.roblox.com/asset/?id=368390615",
		SkyboxRt = "http://www.roblox.com/asset/?id=368385190",
		SkyboxUp = "http://www.roblox.com/asset/?id=48015387",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Old Skybox"] = {
		SkyboxLf = "http://www.roblox.com/asset/?id=15437157",
		SkyboxBk = "http://www.roblox.com/asset/?id=15436783",
		SkyboxDn = "http://www.roblox.com/asset/?id=15436796",
		SkyboxFt = "http://www.roblox.com/asset/?id=15436831",
		SkyboxLf = "http://www.roblox.com/asset/?id=15437157",
		SkyboxRt = "http://www.roblox.com/asset/?id=15437166",
		SkyboxUp = "http://www.roblox.com/asset/?id=15437184",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Purple Clouds"] = {
		SkyboxLf = "http://www.roblox.com/asset/?id=570557620",
		SkyboxBk = "http://www.roblox.com/asset/?id=570557514",
		SkyboxDn = "http://www.roblox.com/asset/?id=570557775",
		SkyboxFt = "http://www.roblox.com/asset/?id=570557559",
		SkyboxLf = "http://www.roblox.com/asset/?id=570557620",
		SkyboxRt = "http://www.roblox.com/asset/?id=570557672",
		SkyboxUp = "http://www.roblox.com/asset/?id=570557727",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Purple Nebula"] = {
		SkyboxLf = "http://www.roblox.com/asset/?id=159454286",
		SkyboxBk = "http://www.roblox.com/asset/?id=159454299",
		SkyboxDn = "http://www.roblox.com/asset/?id=159454296",
		SkyboxFt = "http://www.roblox.com/asset/?id=159454293",
		SkyboxLf = "http://www.roblox.com/asset/?id=159454286",
		SkyboxRt = "http://www.roblox.com/asset/?id=159454300",
		SkyboxUp = "http://www.roblox.com/asset/?id=159454288",
		StarCount = 0,
		SunAngularSize = 21
	},
	["Red Sky"] = {
		SkyboxLf = "http://www.roblox.com/Asset/?ID=401664881",
		SkyboxBk = "http://www.roblox.com/Asset/?ID=401664839",
		SkyboxDn = "http://www.roblox.com/Asset/?ID=401664862",
		SkyboxFt = "http://www.roblox.com/Asset/?ID=401664960",
		SkyboxLf = "http://www.roblox.com/Asset/?ID=401664881",
		SkyboxRt = "http://www.roblox.com/Asset/?ID=401664901",
		SkyboxUp = "http://www.roblox.com/Asset/?ID=401664936",
		StarCount = 0,
		SunAngularSize = 21
	},
	["Shrek"] = {
		SkyboxLf = "rbxassetid://198329363",
		SkyboxBk = "rbxassetid://198329363",
		SkyboxDn = "rbxassetid://198329363",
		SkyboxFt = "rbxassetid://198329363",
		SkyboxLf = "rbxassetid://198329363",
		SkyboxRt = "rbxassetid://198329363",
		SkyboxUp = "rbxassetid://198329363",
		StarCount = 0,
		SunAngularSize = 21
	},
	["Stormy Sky"] = {
		SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1327363",
		SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1327366",
		SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1327367",
		SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1327362",
		SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1327363",
		SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1327361",
		SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1327368",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Twilight"] = {
		SkyboxLf = "rbxassetid://264909758",
		SkyboxBk = "rbxassetid://264908339",
		SkyboxDn = "rbxassetid://264907909",
		SkyboxFt = "rbxassetid://264909420",
		SkyboxLf = "rbxassetid://264909758",
		SkyboxRt = "rbxassetid://264908886",
		SkyboxUp = "rbxassetid://264907379",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Vaporwave Colors"] = {
		SkyboxLf = "rbxassetid://1417494402",
		SkyboxBk = "rbxassetid://1417494030",
		SkyboxDn = "rbxassetid://1417494146",
		SkyboxFt = "rbxassetid://1417494253",
		SkyboxLf = "rbxassetid://1417494402",
		SkyboxRt = "rbxassetid://1417494499",
		SkyboxUp = "rbxassetid://1417494643",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Vivid Skies"] = {
		SkyboxLf = "rbxassetid://2800902328",
		SkyboxBk = "rbxassetid://2800905936",
		SkyboxDn = "rbxassetid://2800905936",
		SkyboxFt = "rbxassetid://2800905116",
		SkyboxLf = "rbxassetid://2800902328",
		SkyboxRt = "rbxassetid://2800903916",
		SkyboxUp = "rbxassetid://2800906739",
		StarCount = 3000,
		SunAngularSize = 21
	},
	["Wasteland"] = {
		SkyboxLf = "rbxassetid://2046135392",
		SkyboxBk = "rbxassetid://2046134302",
		SkyboxDn = "rbxassetid://2046134976",
		SkyboxFt = "rbxassetid://2046135977",
		SkyboxLf = "rbxassetid://2046135392",
		SkyboxRt = "rbxassetid://2046136939",
		SkyboxUp = "rbxassetid://2046136551",
		StarCount = 3000,
		SunAngularSize = 21
	},
}

local ToSimplified = {
	["LeftHand"] = "Left Arm",
	["LeftLowerArm"] = "Left Arm",
	["LeftUpperArm"] = "Left Arm",
	["RightHand"] = "Right Arm",
	["RightLowerArm"] = "Right Arm",
	["RightUpperArm"] = "Right Arm",
	["HeadHB"] = "Head",
	["FakeHead"] = "Head",
	["UpperTorso"] = "Torso",
	["LowerTorso"] = "Torso",
	["LeftFoot"] = "Left Leg",
	["LeftLowerLeg"] = "Left Leg",
	["LeftUpperLeg"] = "Left Leg",
	["RightFoot"] = "Right Leg",
	["RightLowerLeg"] = "Right Leg",
	["RightUpperLeg"] = "Right Leg"
}

local FromSimplified = {
	["Left Arm"] = "LeftLowerArm",
	["Right Arm"] = "RightLowerArm",
	["Head"] = "Head",
	["Torso"] = "UpperTorso",
	["Left Leg"] = "LeftUpperLeg",
	["Right Leg"] = "RightUpperLeg"
}

local Weapons = {
	Pistols = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"},
	SMGs = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"},
	Rifles = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG"},
	AWP = {"AWP"},
	Scout = {"Scout", "SG"},
	Autosnipers = {"G3SG1"},
	Heavies = {"M249", "Negev"},
	Shotguns = {"XM", "Nova", "MAG7", "SawedOff"},
	AllWeapons = {"USP","P2000","Glock","DualBerettas","P250","FiveSeven","Tec9","CZ","DesertEagle","R8","MP9","MAC10","MP7","UMP","P90","Bizon","M4A4","M4A1","AK47","Famas","Galil","AUG","Scout","SG","AWP","SCAR20","G3SG1","M249","Negev","XM","Nova","MAG7","SawedOff"},
	Types = {"Pistols", "SMGs", "Rifles", "AWP", "Autosnipers", "Scout", "Heavies", "Shotguns"},
	Path = Services.ReplicatedStorage:FindFirstChild("Weapons"),
}

Weapons.Old = Weapons.Path:Clone()

Exploits = library:CreateWindow("Qual v3")
RS = Services.RunService.RenderStepped

-- GUI OBJECTS
local function Scan(item, parent)
	local partsWithId = {}
	local awaitRef = {}
	local obj = Instance.new(item.Type)
	if (item.ID) then
		local awaiting = awaitRef[item.ID]
		if (awaiting) then
			awaiting[1][awaiting[2]] = obj
			awaitRef[item.ID] = nil
		else
			partsWithId[item.ID] = obj
		end
	end
	for p,v in pairs(item.Properties) do
		if (type(v) == "string") then
			local id = tonumber(v:match("^_R:(%w+)_$"))
			if (id) then
				if (partsWithId[id]) then
					v = partsWithId[id]
				else
					awaitRef[id] = {obj, p}
					v = nil
				end
			end
		end
		obj[p] = v
	end
	for _,c in pairs(item.Children) do
		Scan(c, obj)
	end
	obj.Parent = parent
	return obj
end

local ViewportFrame = Instance.new("ViewportFrame", library.base)
ViewportFrame.Size = UDim2.new(1, 0, 1, 0)
ViewportFrame.CurrentCamera = workspace.CurrentCamera
ViewportFrame.BackgroundTransparency = 1
ViewportFrame.ImageTransparency = 1/4

local BombGUI = Scan({
	ID = 0;
	Type = "Frame";
	Properties = {
		AnchorPoint = Vector2.new(0.5,0.5);
		Name = "Bomb";
		Visible = false;
		Position = UDim2.new(0.5,0,0.22698412835598,0);
		BackgroundTransparency = 1;
		Size = UDim2.new(0.25,0,0.15396825969219,0);
		BackgroundColor3 = Color3.new(1,1,1);
	};
	Children = {
		{
			ID = 1;
			Type = "TextLabel";
			Properties = {
				LayoutOrder = 1;
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(2/51,79/255,43/85);
				Text = "A";
				Font = Enum.Font.Code;
				Name = "Site";
				BackgroundTransparency = 1;
				Size = UDim2.new(1,0,0,14);
				TextSize = 16;
				BackgroundColor3 = Color3.new(7/85,154/255,1);
			};
			Children = {};
		};
		{
			ID = 2;
			Type = "UIListLayout";
			Properties = {
				Padding = UDim.new(0,5);
				SortOrder = Enum.SortOrder.LayoutOrder;
			};
			Children = {};
		};
		{
			ID = 3;
			Type = "TextLabel";
			Properties = {
				LayoutOrder = 2;
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(2/51,79/255,43/85);
				Text = "Explosion Time: 38 seconds";
				Font = Enum.Font.Code;
				Name = "ET";
				BackgroundTransparency = 1;
				Size = UDim2.new(1,0,0,14);
				TextSize = 16;
				BackgroundColor3 = Color3.new(7/85,154/255,1);
			};
			Children = {};
		};
		{
			ID = 4;
			Type = "Frame";
			Properties = {
				LayoutOrder = 3;
				Name = "T";
				Position = UDim2.new(0,0,0.10052909702063,0);
				Size = UDim2.new(1,0,0,10);
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(226/255,49/85,59/255);
			};
			Children = {};
		};
		{
			ID = 5;
			Type = "Frame";
			Properties = {
				LayoutOrder = 5;
				Name = "CT";
				Position = UDim2.new(0,0,0.10052909702063,0);
				Size = UDim2.new(1,0,0,10);
				BorderSizePixel = 0;
				BackgroundColor3 = Color3.new(47/255,8/15,66/85);
			};
			Children = {};
		};
		{
			ID = 6;
			Type = "TextLabel";
			Properties = {
				LayoutOrder = 4;
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(2/51,79/255,43/85);
				Text = "Defuse Time: 5 seconds";
				Font = Enum.Font.Code;
				Name = "DT";
				BackgroundTransparency = 1;
				Size = UDim2.new(1,0,0,14);
				TextSize = 16;
				BackgroundColor3 = Color3.new(7/85,154/255,1);
			};
			Children = {};
		};
	};
}, library.base)


local CreateArrows = function(color3, alpha, size, bounds)
	return Scan({
		ID = 0;
		Type = "Frame";
		Properties = {
			AnchorPoint = Vector2.new(0.5,0.5);
			Name = "MDMain";
			Position = UDim2.new(0.5,0,0.5,0);
			BackgroundTransparency = 1;
			Size = UDim2.new(0,bounds,0,bounds);
			BackgroundColor3 = Color3.new(1,1,1);
		};
		Children = {
			{
				ID = 1;
				Type = "ImageLabel";
				Properties = {
					AnchorPoint = Vector2.new(0.5,0);
					Image = "rbxassetid://4292970642";
					ImageColor3 = color3;
					ImageTransparency = alpha;
					Name = "Marker";
					Position = UDim2.new(0.5,0,0,0);
					BackgroundTransparency = 1;
					Size = UDim2.new(0,size,0,size);
					BackgroundColor3 = Color3.new(1,1,1);
				};
				Children = {};
			};
		};
	})
end

local SkeetMain = Scan({
	ID = 0;
	Type = "Frame";
	Properties = {
		BackgroundTransparency = 1;
		Size = UDim2.new(0.2,0,1,-350);
		Name = "Skeet";
		BackgroundColor3 = Color3.new(1,1,1);
	};
	Children = {
		{
			ID = 1;
			Type = "UIListLayout";
			Properties = {
				VerticalAlignment = Enum.VerticalAlignment.Bottom;
				SortOrder = Enum.SortOrder.LayoutOrder;
			};
			Children = {};
		};
	};
})

local Aimmarker = Scan({
	ID = 0;
	Type = "ImageLabel";
	Properties = {
		AnchorPoint = Vector2.new(0.5,0.5);
		Image = "rbxassetid://58786096";
		Name = "Aimmarker";
		ImageTransparency = 0.5;
		Position = UDim2.new(0,1067,0,328);
		BackgroundTransparency = 1;
		Size = UDim2.new(0,25,0,25);
		BackgroundColor3 = Color3.new(1,1,1);
	};
	Children = {};
})

local HitboxPriorityControl = Scan({
	ID = 0;
	Type = "Frame";
	Properties = {
		Name = "Hitbox Priorities";
		BackgroundColor3 = Color3.new(1,1,1);
	};
	Children = {
		{
			ID = 1;
			Type = "TextButton";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(0,0,0);
				BorderColor3 = Color3.new(35/51,181/255,3/5);
				Text = "4";
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Name = "Head";
				Position = UDim2.new(0,119,0,48);
				TextTransparency = 0.60000002384186;
				Size = UDim2.new(0,44,0,44);
				TextSize = 16;
				BackgroundColor3 = Color3.new(49/51,41/51,16/85);
			};
			Children = {};
		};
		{
			ID = 2;
			Type = "TextButton";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(0,0,0);
				BorderColor3 = Color3.new(35/51,181/255,3/5);
				Text = "1";
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Name = "Left Arm";
				Position = UDim2.new(0,47,0,100);
				TextTransparency = 0.60000002384186;
				Size = UDim2.new(0,40,0,88);
				TextSize = 16;
				BackgroundColor3 = Color3.new(49/51,41/51,16/85);
			};
			Children = {};
		};
		{
			ID = 3;
			Type = "TextButton";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(0,0,0);
				BorderColor3 = Color3.fromRGB(65, 67, 56);
				Text = "3";
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Name = "Torso";
				Position = UDim2.new(0,95,0,100);
				TextTransparency = 0.60000002384186;
				Size = UDim2.new(0,88,0,88);
				TextSize = 16;
				BackgroundColor3 = Color3.new(11/85,28/85,37/51);
			};
			Children = {};
		};
		{
			ID = 4;
			Type = "TextButton";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(0,0,0);
				BorderColor3 = Color3.new(35/51,181/255,3/5);
				Text = "2";
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Name = "Right Leg";
				Position = UDim2.new(0,143,0,194);
				TextTransparency = 0.60000002384186;
				Size = UDim2.new(0,40,0,88);
				TextSize = 16;
				BackgroundColor3 = Color3.new(164/255,63/85,71/255);
			};
			Children = {};
		};
		{
			ID = 5;
			Type = "TextButton";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(0,0,0);
				BorderColor3 = Color3.new(35/51,181/255,3/5);
				Text = "1";
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Name = "Right Arm";
				Position = UDim2.new(0,191,0,100);
				TextTransparency = 0.60000002384186;
				Size = UDim2.new(0,40,0,88);
				TextSize = 16;
				BackgroundColor3 = Color3.new(49/51,41/51,16/85);
			};
			Children = {};
		};
		{
			ID = 6;
			Type = "TextButton";
			Properties = {
				FontSize = Enum.FontSize.Size18;
				TextColor3 = Color3.new(0,0,0);
				BorderColor3 = Color3.new(35/51,181/255,3/5);
				Text = "2";
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Name = "Left Leg";
				Position = UDim2.new(0,95,0,194);
				TextTransparency = 0.60000002384186;
				Size = UDim2.new(0,40,0,88);
				TextSize = 16;
				BackgroundColor3 = Color3.new(164/255,63/85,71/255);
			};
			Children = {};
		};
	};
})

local CreateSkeetText = function(text)
	local bounds = Services.TextService:GetTextSize(text, 32, Enum.Font.GothamBold, Vector2.new(math.huge, math.huge))
	return Scan({
		ID = 0;
		Type = "TextLabel";
		Properties = {
			FontSize = Enum.FontSize.Size32;
			TextColor3 = Color3.new(0,0,0);
			TextXAlignment = Enum.TextXAlignment.Left;
			Text = text;
			BackgroundTransparency = 1;
			Size = UDim2.new(0,bounds.X,0,bounds.Y);
			TextWrapped = true;
			Font = Enum.Font.GothamBold;
			Name = "shadow";
			Position = UDim2.new(0,0,0.9459902048111,0);
			BackgroundColor3 = Color3.new(1,1,1);
			TextSize = 32;
			TextWrap = true;
		};
		Children = {
			{
				ID = 1;
				Type = "TextLabel";
				Properties = {
					FontSize = Enum.FontSize.Size32;
					TextColor3 = Color3.new(1,0,0);
					Text = text;
					TextXAlignment = Enum.TextXAlignment.Left;
					BackgroundTransparency = 1;
					TextWrapped = true;
					Font = Enum.Font.GothamBold;
					Name = "actual";
					Position = UDim2.new(0,0,0,-2);
					Size = UDim2.new(0,bounds.X,0,bounds.Y);
					BackgroundColor3 = Color3.new(1,1,1);
					TextSize = 32;
					TextWrap = true;
				};
				Children = {};
			};
		};
	})
end 

SkeetMain.Parent = library.base
-- SKEET TEXT

function SkeetText(name, callback)
	local text = {}
	text.shadow = CreateSkeetText(name)
	text.actual = text.shadow.actual
	text.bind = RS:connect(function()
		local t = callback()
		if t < 0.5 then
			text.actual.TextColor3 = Color3.new(1,0,0):lerp(Color3.new(1,1,0), t / 0.5)
		else
			text.actual.TextColor3 = Color3.new(1,1,0):lerp(Color3.new(0,1,0), (t - 0.5) / 0.5)
		end
	end)
	text.Visible = false
	
	function text:SetVisibility(b)
		if b then
			self.shadow.Parent = SkeetMain
			self.Visible = true
		else
			self.shadow.Parent = nil
			self.Visible = false
		end
	end
	
	return text
end

function SimulateShot(cf, c)
	local range
	local penetrationpower
	local gun = Environment.gun
	if gun:FindFirstChild("Range") then
		range = gun.Range.Value
	end
	if gun:FindFirstChild("Penetration") then
		penetrationpower = gun.Penetration.Value * 0.01
	end
	local firerate
	if gun:FindFirstChild("FireRate") then
		firerate = gun.FireRate.Value
	end
	if gun:FindFirstChild("Melee") then
		range = 64
		if Environment.Held2 == true then
			firerate = 1
			range = 48
		end
	end
	local tinsert = table.insert
	local hitlist = {
		workspace.Debris,
		Player.Character,
		workspace.Ray_Ignore,
		Camera,
		workspace.Map:WaitForChild("Clips"),
		workspace.Map:WaitForChild("SpawnPoints")
	}
	local crud = Services.Players:GetPlayers()
	for i = 1, #crud do
		if crud[i].Name ~= Player.Name and crud[i].Character and crud[i].Character:FindFirstChild("UpperTorso") then
			if crud[i] and crud[i].Character:FindFirstChild("HumanoidRootPart") then
				tinsert(hitlist, crud[i].Character.HumanoidRootPart)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Head") then
				tinsert(hitlist, crud[i].Character.Head)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat1") then
				tinsert(hitlist, crud[i].Character.Hat1)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat2") then
				tinsert(hitlist, crud[i].Character.Hat2)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat3") then
				tinsert(hitlist, crud[i].Character.Hat3)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat4") then
				tinsert(hitlist, crud[i].Character.Hat4)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat5") then
				tinsert(hitlist, crud[i].Character.Hat5)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat6") then
				tinsert(hitlist, crud[i].Character.Hat6)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat7") then
				tinsert(hitlist, crud[i].Character.Hat7)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat8") then
				tinsert(hitlist, crud[i].Character.Hat8)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat9") then
				tinsert(hitlist, crud[i].Character.Hat9)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat10") then
				tinsert(hitlist, crud[i].Character.Hat10)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat11") then
				tinsert(hitlist, crud[i].Character.Hat11)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat12") then
				tinsert(hitlist, crud[i].Character.Hat12)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat13") then
				tinsert(hitlist, crud[i].Character.Hat13)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat14") then
				tinsert(hitlist, crud[i].Character.Hat14)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Hat15") then
				tinsert(hitlist, crud[i].Character.Hat15)
			end
			if crud[i] and crud[i].Character:FindFirstChild("DKit") then
				tinsert(hitlist, crud[i].Character.DKit)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Gun") then
				tinsert(hitlist, crud[i].Character.Gun)
			end
			if crud[i] and crud[i].Character:FindFirstChild("Gun2") then
				tinsert(hitlist, crud[i].Character.Gun2)
			end
		end
	end
	local direction = Vector3.new()
	local Mouse = cf.p + cf.lookVector * 999
	direction = (CFrame.new(cf.p, Mouse)).lookVector.unit * range * hammerunit2stud
	if Environment.equipped ~= "melee" then
		direction = cf.lookVector.unit * range * hammerunit2stud
	end
	local RayCasted = Ray.new(cf.p, direction)
	local partpenetrated = 0
	local limit = 0
	local PartHit, PositionHit, NormalHit
	local partmodifier = 1
	local damagemodifier = 1
	repeat
		PartHit, PositionHit, NormalHit = workspace:FindPartOnRayWithIgnoreList(RayCasted, hitlist, false, true)
		if PartHit and PartHit.Parent then
			partmodifier = 1
			if PartHit.Material == Enum.Material.DiamondPlate then
				partmodifier = 3
			end
			if PartHit.Material == Enum.Material.CorrodedMetal or PartHit.Material == Enum.Material.Metal or PartHit.Material == Enum.Material.Concrete or PartHit.Material == Enum.Material.Brick then
				partmodifier = 2
			end
			if PartHit.Name == "Grate" or PartHit.Material == Enum.Material.Wood or PartHit.Material == Enum.Material.WoodPlanks or PartHit and PartHit.Parent and PartHit.Parent:FindFirstChild("Humanoid") then
				partmodifier = 0.1
			end
			if PartHit.Transparency == 1 or PartHit.CanCollide == false or PartHit.Name == "Glass" or PartHit.Name == "Cardboard" or PartHit:IsDescendantOf(workspace.Ray_Ignore) or PartHit:IsDescendantOf(workspace.Debris) or PartHit and PartHit.Parent and PartHit.Parent.Name == "Hitboxes" then
				partmodifier = 0
			end
			if PartHit.Name == "nowallbang" then
				partmodifier = 100
			end
			if PartHit:FindFirstChild("PartModifier") then
				partmodifier = PartHit.PartModifier.Value
			end
			local fakehit, Endposition = workspace:FindPartOnRayWithWhitelist(Ray.new(PositionHit + direction * 1, direction * -2), {PartHit}, true)
			local PenetrationDistance = (Endposition - PositionHit).magnitude
			PenetrationDistance = PenetrationDistance * partmodifier
			limit = math.min(penetrationpower, limit + PenetrationDistance)
			local wallbang = false
			if partpenetrated >= 1 then
				wallbang = true
			end
			if PartHit and PartHit.Parent and PartHit.Parent.Name == "Hitboxes" or PartHit and PartHit.Parent.className == "Accessory" or PartHit and PartHit.Parent.className == "Hat" or PartHit.Name == "HumanoidRootPart" and PartHit.Parent.Name ~= "Door" or PartHit.Name == "Head" and PartHit.Parent:FindFirstChild("Hostage") == nil then
			else
				if PartHit and PartHit:IsDescendantOf(c) and PartHit.Transparency < 1 or PartHit.Name == "HeadHB" then
					return PartHit, PositionHit, damagemodifier, wallbang
				end
			end
			if partmodifier > 0 then
				partpenetrated = partpenetrated + 1
			end
			damagemodifier = 1 - limit / penetrationpower
			if PartHit and PartHit.Parent and PartHit.Parent.Name == "Hitboxes" or PartHit and PartHit.Parent and PartHit.Parent.Parent and PartHit.Parent.Parent:FindFirstChild("Humanoid2") or PartHit and PartHit.Parent and PartHit.Parent:FindFirstChild("Humanoid2") or PartHit and PartHit.Parent and PartHit.Parent:FindFirstChild("Humanoid") and (1 > PartHit.Transparency or PartHit.Name == "HeadHB") and PartHit.Parent:IsA("Model") then
				table.insert(hitlist, PartHit.Parent)
			else
				table.insert(hitlist, PartHit)
			end
		end
	until PartHit == nil or limit >= penetrationpower or partpenetrated >= 4 or 0 >= damagemodifier
end

function MathforArrows(vector, abspos)
	--Get the directional vector between your arrow and the object by using
	--Euclidean vectors & Pythagoras theorem in our calculations.
	local x1,y1 = vector.X,vector.Y
	local x2,y2 = abspos.X, abspos.Y
	local xlength,ylength,zlength = x1-x2,y1-y2,vector.Z
	local hypotenuse = math.sqrt(xlength*xlength + ylength*ylength)
	local UnitX,UnitY,UnitZ = xlength/hypotenuse, ylength/hypotenuse,zlength/hypotenuse
	local Normalized2dDirection = Vector3.new(UnitX,-UnitY,UnitZ)
	
	--Calculate the angle.
	--We assume the default arrow position at 0° is "up"
	local angle = math.deg(math.acos(Normalized2dDirection:Dot(Camera.CFrame.UpVector)))
	
	--Use the cross product to determine if the angle is clockwise
	--or anticlockwise
	local cross = Normalized2dDirection:Cross(Camera.CFrame.UpVector)
	return math.sign(cross.Z) * angle
end

function getRealCameraVector(v)
	return v.HumanoidRootPart.CFrame.p + v.Humanoid.CameraOffset + Vector3.new(0, 1.5, 0)
end

function RainbowColor(speed, saturation, brightness) 
	if speed == nil then
		speed = 3
	end
	if saturation == nil then
		saturation = 0.5
	end
	if brightness == nil then
		brightness = 1
	end
	return Color3.fromHSV(math.sin((tick() / (3/speed)) % 1), saturation, brightness) 
end

-- ON HIT FUNCTIONS

lastHit = nil
HitFunctions = {}
HitlogFrame = nil

do  --CREATE HITLOGS (LEGACY CREATION)
    local Frame = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    Frame.Parent = library.base
    Frame.BackgroundTransparency = 1
    Frame.Position = UDim2.new(0.005, 0, 0, 0)
    Frame.Size = UDim2.new(0, 91, 0, 100)

    UIListLayout.Parent = Frame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    HitlogFrame = Frame
end

function OnHit(name, damage)
	HitFunctions.Hitsound(name, damage)
    HitFunctions.Hitmarker(name, damage)
    HitFunctions.Hitlog(name, damage)
    HitFunctions.History(name, damage)
end

spawn(function()
    Player:WaitForChild("DamageLogs").ChildAdded:Connect(function(hit)
        local DMG = hit:WaitForChild("DMG")
        local lastdmg = 0
        local function HitHook()
            OnHit(hit.Name, DMG.Value-lastdmg)
            lastdmg = DMG.Value
            --[[
            if Settings.Killsay then
                if Services.Players[hit.Name].Status.Alive.Value then
                    Services.Players[hit.Name].Status.Alive:GetPropertyChangedSignal("Value"):Wait()
                end
                Chat(Settings.Chat2:gsub("{}", hit.Name))
            end]]
        end
        HitHook()
        DMG:GetPropertyChangedSignal("Value"):Connect(function()
            HitHook()
        end)
    end)    
end)

local Defaults = {}
local Events = Services.ReplicatedStorage.Events
-- AIMBOT {
local default_debounce = false
local Aimbots = {}
local Priorities = {
	Legit = {
		["Left Arm"] = 1,
		["Right Arm"] = 1,
		["Head"] = 2,
		["Torso"] = 2,
		["Left Leg"] = 0,
		["Right Leg"] = 0
	},
	Rage = {
		["Left Arm"] = 1,
		["Right Arm"] = 1,
		["Head"] = 3,
		["Torso"] = 2,
		["Left Leg"] = 0,
		["Right Leg"] = 0
	},
	Override = {
		["Left Arm"] = 1,
		["Right Arm"] = 1,
		["Head"] = 2,
		["Torso"] = 3,
		["Left Leg"] = 0,
		["Right Leg"] = 0
	}
}
TargetAimpoint = nil
meta = getrawmetatable(game)

for tab,prefix in pairs({"Legit", "Rage"}) do
	Aimbots[prefix] = {}
	local Aimbot = Exploits:CreateTab(prefix.."bot")
	local AimbotTab = Aimbot:AddLocalTab(prefix.." Aimbot Settings")

	local Default = AimbotTab:AddToggle("Default", false, function(b)
		if b and default_debounce then
			default_debounce = false
			for i,v in pairs(Defaults) do
				if prefix ~= i then
					v:SetToggle(false)
				end
			end
			default_debounce = true
			DefaultAimbot = prefix
		end
		if not b and default_debounce then
			default_debounce = false
			Defaults[prefix]:SetToggle(true)
			default_debounce = true
		end
	end)

	Defaults[prefix] = Default

	local AimbotTarget = AimbotTab:AddDropdown("Target", 1, 
		{"Closest to Crosshair", "Crosshair or Nearest (360°)", "All Threats (360°)"}
	)

	Aimbots[prefix][1] = AimbotTarget
	
	if prefix == "Legit" then
		local TB = Aimbot:AddLocalTab("Triggerbot")
		local TriggerbotMode = TB:AddDropdown("Mode", 3, 
			{"Enabled", "On Key", "Disabled"}
		)
		
		local TriggerbotDelay = TB:AddSlider("Delay", 100, 0)

		local Triggerkey = TB:AddKeybind("Triggerbot key", nil, nil, true)
		
		local debounce = false
	
		local function Shoot()
			if TriggerbotDelay.value ~= 0 then
				wait(TriggerbotDelay.value)
			end
			if not debounce and not Studio then
				mouse1press()
				wait(0.04)
				mouse1release()
			end
		end
		
		RS:connect(function()
			debounce = true
		  	if Mouse.Target and TriggerbotMode.value == "Enabled" or (TriggerbotMode.value == "On Key" and Triggerkey.holding) and isAlive(Player) then
				local OtherHuman = Mouse.Target.Parent
				if OtherHuman:IsDescendantOf(Backtrack) then
					Shoot()
					debounce = false
					return
				end
				local OtherPlayer = Services.Players:FindFirstChild(OtherHuman.Name)
				if not OtherPlayer then 
					debounce = false
					return 
				end
				if OtherPlayer.Team == Player.Team then 
					debounce = false
					return 
				end
				Shoot()
			end
			debounce = false
		end)
	end
	
	do
		local Backtrack = Aimbot:AddLocalTab("Backtrack")
		local Enabled = Backtrack:AddToggle("Enabled", false)
		local Length = Backtrack:AddSlider("Backtrack Length", 2000, 500)
		local Color = Backtrack:AddCP("Backtrack Color", Color3.new(0,0.5,1), nil, 0)
		local Rainbow = Backtrack:AddToggle("Backtrack Rainbow", false)
		
		Aimbots[prefix][4] = function(target)
			if not Enabled.state then return end
			local bss = BacktrackSample:clone()
			for _,o in pairs(target.Character:GetChildren()) do
				local p = bss:FindFirstChild(o.Name)
				if p then
					p.Name = "nowallbang"
					p.CFrame = o.CFrame
					if not Rainbow.value then
						p.Color = Color.color
					else
						p.Color = RainbowColor(2,1,1)
					end
					p.Transparency = Color.alpha
					local br = Instance.new("ObjectValue", p)
					br.Name = "PT"
					br.Value = o
				end
			end
            bss.Parent = Backtrack
            Services.Debris:AddItem(bss, Length.value/1000)
		end
	end
    local AimSettings = {}
    
	for i,v in pairs(( prefix == "Legit" and {"Aim Assist", "Silent Aim"} ) or {"Silent Aim"}) do
		local AimbotTab = Aimbot:AddLocalTab(v)
		local AimbotMode = AimbotTab:AddDropdown("Mode", 3,
			{"Enabled", "On Key", "Disabled"}
		)
        
        
		if v == "Aim Assist" then
			AimSettings.Smoothness = AimbotTab:AddSlider("Smoothness", 100, 50)
			AimSettings.VSmoothness = AimbotTab:AddSlider("Smoothness Variance", 100, 10)
			AimSettings.AimJitter = AimbotTab:AddSlider("Aim Jitter", 20, 8)
			AimSettings.WhenShooting = AimbotTab:AddToggle("Assist only when shooting", false)
			AimSettings.VisualIndicator = AimbotTab:AddToggle("Show visual indicator", true)
		else
			AimSettings.AimbotHook = AimbotTab:AddDropdown("Hooking Method", 1, 
				{"Camera Hooking (Legit)", "Raycast Hooking (HvH)", "Hitpart Hooking (Rage)"}
			)
		end
		
		local FOVToggle = AimbotTab:AddToggle("Limit to AimFOV", true)
        local FOVCircle = {Visible = false, Filled = false, Transparency = 1, Color = Color3.new(), Thickness = 0, Radius = 0, Position = nil}
        local FOV = AimbotTab:AddSlider("AimFOV in pixels", 200, 50, function(r)
            FOVCircle.Radius = r
        end)
		if not Studio then
			FOVCircle = Drawing.new("Circle")
			local ViewportSize = Camera.ViewportSize
			FOVCircle.Position = ViewportSize / 2
		end
		
		AimbotTab:AddToggle("FOV Circle Enabled", false, function(b)
			FOVCircle.Visible = b
		end)
	
		AimbotTab:AddToggle("FOV Circle Filled", false, function(b)
			FOVCircle.Filled = b
		end)
	
		AimbotTab:AddCP("FOV Circle Color", (v == "Aim Assist" and Color3.new(0,0.5,1)) or Color3.fromRGB(70, 0, 255), function(c3, alpha)
			if alpha then
				FOVCircle.Transparency = 1-alpha
			end
			FOVCircle.Color = c3
		end, 0)
	
		AimbotTab:AddSlider("FOV Circle Thickness", 5, 1, function(v)
			FOVCircle.Thickness = v
		end)
	
		
		local Aimkey = AimbotTab:AddKeybind("Aimkey", nil, nil, true)
		
		local theText = SkeetText(v.."ing", function()
			return (Aimkey.holding and 1) or 0
		end)
			
		local AimSkeet = AimbotTab:AddToggle("Aimkey Text", false, function(b)
			theText:SetVisibility(b)
		end)
        
        if v == "Silent Aim" then
            Aimbots[prefix][2] = function(target, distance) --Silent Aim
                if AimbotMode.value == "Disabled" then return end
                if FOVToggle.state and distance > FOV.value then return end -- Check if FOV is good
                if AimbotMode.value == "On Key" and not Aimkey.holding then return end -- Check if Aimkey down if On Key is enabled

                local Character = target.Character
                local Aimpoints = {}
                            
                for i,v in pairs(FromSimplified) do
                    local Points = {Character[v].Position}
                    local Ignore = {Camera, Character, Player.Character}
                    local Visible = #Camera:GetPartsObscuringTarget(Points, Ignore) == 0
                    
                    if Visible or (v == "Silent Aim" and AimSettings.AimbotHook.value == "Hitpart Hooking (Rage)") then
                        table.insert(Aimpoints, {i, Character[v].Position, Character[v]})
                    end
                end
                
                table.sort(Aimpoints, function(a, b)
                    return Priorities[prefix][a[1]] > Priorities[prefix][b[1]]
                end)
                
                if #Aimpoints > 0 then
                    TargetAimpoint = {Aimpoints[1], AimSettings.AimbotHook.value}
                end
            end
        else
            Aimbots[prefix][3] = function(target, distance) --Aim Assist
                if Studio then return end
                if AimbotMode.value == "Disabled" then return end
                if FOVToggle.state and distance > FOV.value then return end -- Check if FOV is good
                if AimbotMode.value == "On Key" and not Aimkey.holding then return end -- Check if Aimkey down if On Key is enabled
                if AimSettings.WhenShooting.state and not Services.UserInputService:IsMouseButtonPressed(0) then return end -- Check if holding mouse1 down if "Assist when shooting" is toggled
                --if Environment.reloadani.IsPlaying or Environment.reloadani1.IsPlaying or Environment.equipani.IsPlaying then return end
                
                local Character = target.Character
                local Aimpoints = {}
                            
                for i,v in pairs(FromSimplified) do
                    local Points = {Character[v].Position}
                    local Ignore = {Camera, Character, Player.Character}
                    local Visible = #Camera:GetPartsObscuringTarget(Points, Ignore) == 0
                    
                    if Visible then
                        table.insert(Aimpoints, {i, Character[v].Position})
                    end
                end
                
                table.sort(Aimpoints, function(a, b)
                    return Priorities[prefix][a[1]] > Priorities[prefix][b[1]]
                end)
                
                if #Aimpoints > 0 then
                    local Aimpoint = Aimpoints[1]
                    if AimSettings.VisualIndicator.state then
                        Aimmarker.Parent = library.base
                        local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(Aimpoint[2])
                        Aimmarker.Position = UDim2.new(0, ScreenPoint.X, 0, ScreenPoint.Y)
                    end
                    local RandomJitter = Vector2.new(math.random()-.5, math.random()-.5)
                    local AimJ = AimSettings.AimJitter.value/14
                    local Goal = CFrame.new(getRealCameraVector(Player.Character), Aimpoint[2]) * CFrame.Angles(math.rad(RandomJitter.X * AimJ), math.rad(RandomJitter.Y * AimJ), 0)
                    local Smoothing = AimSettings.Smoothness.value
                    local Variance = (math.random()-.5) * AimSettings.VSmoothness.value
                    Smoothing = Smoothing + Variance
                    if Smoothing < 0 then
                        Smoothing = 0
                    elseif Smoothing > 100 then
                        Smoothing = 100
                    end
                    Camera.CFrame = Camera.CFrame:lerp(Goal, 1-(Smoothing / 100))
                end
            end
        end
	end
	
	if prefix == "Rage" then
		ASTab = Aimbot:AddLocalTab("Auto-shoot")
		ASTab:AddToggle("Auto-shoot", false)
		ASTab:AddToggle("Autowall", false)
	end

	--[[
	ASTab:AddSlider("Minimum Damage (Visible)", 100, Settings[prefix].MinVisibleDamage, function(d)
		Settings[prefix].MinVisibleDamage = d
	end)

	ASTab:AddSlider("Minimum Damage (Autowall)", 100, Settings[prefix].MinAWDamage, function(d)
		Settings[prefix].MinAWDamage = d
	end)]]
end

SkinChanged = false
picking = false
default_debounce = true
Defaults[DefaultAimbot]:SetToggle(true)

if not Studio then
    indexed = hookfunction(meta.__index, function(self, key)
        local callerScript = rawget(getfenv(0), "script")
	    callerScript = typeof(callerScript) == "Instance" and callerScript or nil

		local ta = TargetAimpoint
        if ta and ta[2] == "Camera Hooking (Legit)" and self == Camera and (key == "CFrame" or key == "CoordinateFrame") then
			local Goal = CFrame.new(getRealCameraVector(Player.Character), ta[1][2])
			return Goal
        end
		
		return indexed(self, key)
    end)

    newindex = hookfunction(meta.__newindex, function(self, key, value)
        if ZoomScope and self == Camera and key == "FieldOfView" and not checkcaller() then
            return
        end
        return newindex(self, key, value)
    end)
	
	namecall = hookfunction(meta.__namecall, function(self, ...)
		local method = getnamecallmethod()
		local args = {...}
        local ta = TargetAimpoint
        
        if method == "FireServer" and self.Name == "DataEvent" and SkinChanged then
            request = args[1]
            Team = request[2]
            Gun = request[3]
            Real = request[4][1]
            local ctfolder = Player.SkinFolder.CTFolder
            local tfolder = Player.SkinFolder.TFolder
            if Team == "CT" or Team == "Both" then 
                for a,b in pairs(ctfolder:GetChildren()) do
                    if b.Name == "Knife" and Gun == "Gut Knife" or Gun == "Butterfly Knife" or Gun == "Falchion Knife" or Gun == "Bayonet" or Gun == "Huntsman Knife" or Gun == "Karambit" or Gun == "Banana" or Gun == "Flip Knife" or Gun == "Bearded Axe" or Gun == "Sickle" or Gun == "Cleaver" then
                        local getskin = Real:split("_")
                        delay(1, function()
                            b.Value = getskin[2]
                        end)
                    elseif b.Name == Gun then
                        local getskin = Real:split("_")
                        delay(1, function()
                            b.Value = getskin[2]
                        end)
                    end
                end
            end
            if Team == "T" or Team == "Both" then 
                for c,d in pairs(tfolder:GetChildren()) do
                    if d.Name == "Knife" and Gun == "Gut Knife" or Gun == "Butterfly Knife" or Gun == "Falchion Knife" or Gun == "Bayonet" or Gun == "Huntsman Knife" or Gun == "Karambit" or Gun == "Banana" or Gun == "Flip Knife" or Gun == "Bearded Axe" or Gun == "Sickle" or Gun == "Cleaver" then
                        local getskin = Real:split("_")
                        delay(1, function()
                            d.Value = getskin[2]
                        end)
                    elseif d.Name == Gun then
                        local getskin = Real:split("_")
                        delay(1, function()
                            d.Value = getskin[2]
                        end)
                    end
                end
            end
        end

        if method == "InvokeServer" and self.Name == "Hugh" then
            return
        elseif method == "FireServer" and string.find(self.Name ,'{') then
            return
        end
        
        if method == "FireServer" and self.Name == "PlantC4" and AntidefuseT then
            args[1] = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0,-10,0)
            args[2] = ""
        end

        if method == "FindFirstChild" and args[1] == "Equipment2" and PickupCT and not picking and Environment.gun.Name ~= "C4" then
            return nil
        end

        if ta then
            if method == "FindPartOnRayWithIgnoreList" and ta[2] == "Raycast Hooking (HvH)" and args[2][7] and args[2][7].Name == "HumanoidRootPart" then
				local Goal = ta[1][2]
                local Start = getRealCameraVector(Player.Character)
                args[1] = Ray.new(Start, (Goal - Start).unit * 500)
			end
			if method == "FireServer" and self.Name == "HitPart" and ta[2] == "Hitpart Hooking (Rage)" then
				args[1] = ta[1][3]
                args[2] = ta[1][2]
			end
		end
		pcall(function()
			if method == "FireServer" and self.Name == "HitPart" then
				Beam(getRealCameraVector(Player.Character), args[2], getBSARGS())
				if ToSimplified[args[1].Name] then -- CHECK IF HIT
					lastHit = {
						Part = args[1], 
						Wallbang = args[10], 
						EstimatedDamage = args[8] * Environment.gun.DMG.Value,
						Position = args[2]
					}
				end
			end
		end)
		
		return namecall(self, unpack(args))
	end)
end

-- AIMBOT }

function FindTarget()
	local Results = {}
	for i,prefix in pairs({"Legit", "Rage"}) do
		local Target, Distance
		local DetectionMethod = Aimbots[prefix][1].value
		if DetectionMethod == "All Threats (360°)" then
			Target, Distance = GetThreat(prefix)
			if Target then
				Results[prefix] = {Target, Distance}
			end
		else
			Target, Distance = GetClosestToCrosshair(prefix)
			if Target then
				Results[prefix] = {Target, Distance}
			end
			if not Target and DetectionMethod == "Crosshair or Nearest (360°)" then
				Target, Distance = GetNearest(prefix)
				if Target then
					Results[prefix] = {Target, Distance}
				end
			end
		end
	end
	
	local Rage = Results["Rage"]
	local Legit = Results["Legit"]
	if Rage then
		return Rage[1], Rage[2], "Rage"
	elseif Legit then
		return Legit[1], Legit[2], "Legit"
	end
end

if not Studio then
	-- HOOK FIREBULLET
	firebullet = hookfunction(Environment.firebullet, function()
		-- TARGET SELECTION
		local Target, Distance, prefix = FindTarget()
		if not Target then 
			return firebullet()
		end
		
		Aimbots[prefix][2](Target, Distance)
		firebullet()
		TargetAimpoint = nil
    end)
    
    -- HOOK PICKUP
    pickup = hookfunction(Environment.pickup, function(...)
		picking = true
		pickup(...)
		picking = false
    end)
end

-- BEGIN AIMBOT LOOP
RS:Connect(function()
	Aimmarker.Parent = nil
	if not isAlive(Player) then return end
	-- TARGET SELECTION
	local Target, Distance, prefix = FindTarget()
	if not Target then return end
	
	Aimbots[prefix][3](Target, Distance)
end)
-- END AIMBOT LOOP

-- BEGIN BACKTRACK LOOP
local BSSTEPS = 0
RS:connect(function()
	if not isAlive(Player) then return end
	BSSTEPS = BSSTEPS + 1
	if not (BSSTEPS % 7 == 0) then return end
	Enemies(function(v)
		if not isAlive(v) then return end
		local status = GetStatus(v)
		Aimbots[status][4](v)
	end)
end)

-- END BACKTRACK LOOP

-- ANTIAIM {
do
	local Pitch2Deg = function(x) return (x*36)+180 end
	local Deg2Pitch = function(x) return (x-180)/36 end
	
	local Antiaim = Exploits:CreateTab("Antiaim")
	
	local Core = Antiaim:AddLocalTab("Core")
	local Enabled = Core:AddToggle("Enabled", false)
	local UntrustedPitch = Core:AddToggle("Allow Untrusted Pitch", false)
	
	local BasePitch = Core:AddSlider("Base Pitch", 360, 180)
	local BaseYaw = Core:AddSlider("Base Yaw", 360, 0)
	
	local Mode = Core:AddDropdown("Mode", 1, {"Manual", "Autodirection"})
	local Direction = ""
	local Defaults = {Left = Enum.KeyCode.Z, Back = Enum.KeyCode.X, Right = Enum.KeyCode.C}
	for i,name in pairs({"Left", "Back", "Right"}) do
		key = Defaults[name]
		Core:AddKeybind(name, key, function()
			if Mode.value == "Manual" then
				if Direction == name then
					Direction = ""
				else
					Direction = name
				end
			end
		end)
	end
	
	local Jitters = {}
	for i,v in pairs({"Pitch", "Yaw"}) do
		Jitters[v] = 0
		local JD = false
		local JR = false
		
		local Jitter = Antiaim:AddLocalTab(v.." Jitter")
		
		local JS = Jitter:AddSlider("Jitter Speed", 90, 2)
		
		local JR = Jitter:AddSlider("Jitter Range", 360, 45)
		
		Jitter:AddKeybind("Inverse Direction", nil, function()
			JD = not JD
		end, false)
		
		Jitter:AddKeybind("Inverse Rotation", nil, function()
			JR = not JR
		end, false)
		
		-- __HEADER
		local abs = math.abs
		
		local PosJitter = 0
		RS:connect(function()
			if JD then
				PosJitter = (PosJitter - JS.value) % (JR.value+1)
			else
				PosJitter = (PosJitter + JS.value) % (JR.value+1)
			end
			if JR then
				Jitters[v] = -abs(PosJitter)
			else
				Jitters[v] = PosJitter
			end
		end)
	end
	
	do
		local _f
		local function Closure()
			if _f then
				_f()
			end
		end
		
		local ManualVis = Antiaim:AddLocalTab("Manual Visual Indicator")
		
		local Enabled = ManualVis:AddToggle("Enabled", false, Closure)
		local Color = ManualVis:AddCP("Color", Color3.new(1,0.5,0), Closure, 0.7)
		local Size = ManualVis:AddSlider("Arrow Size", 200, 50, Closure)
		local Bounds = ManualVis:AddSlider("Bounds", 1000, 400, Closure)
		
		local Arrow
		local Arrow
		local Changed = false
		
		_f = function()
			Changed = true
		end
		
		RS:connect(function()
			if not Enabled.state then 
				if Arrow then Arrow.Marker.ImageTransparency = 1 end
				return
			end
			
			if not isAlive(Player) then 
				if Arrow then Arrow.Marker.ImageTransparency = 1 end
				return
			end
			
			if not Arrow or Changed then
				if Arrow then
					Arrow:Destroy()
					Arrow = nil
				end
				Arrow = CreateArrows(Color.color, Color.alpha, Size.value, Bounds.value)
				Arrow.Parent = library.base
				Changed = false
			end
			
			if Direction == "" then
				if Arrow then Arrow.Marker.ImageTransparency = 1 end
			else
				Arrow.Marker.ImageTransparency = Color.alpha
				if Direction == "Right" then
					Arrow.Rotation = 90
				elseif Direction == "Back" then
					Arrow.Rotation = 180
				elseif Direction == "Left" then
					Arrow.Rotation = 270
				end
			end
		end)
	end
	
	local Visuals = Antiaim:AddLocalTab("Visuals")
		
	for i,v in pairs({"Pitch", "Yaw"}) do
		
		-- __HEADER
		local abs = math.abs
		local text = SkeetText(v.." Jitter", function()
			return abs(Jitters[v])/360
		end)
		Visuals:AddToggle(v.." Jitter Text", false, function(b)
			text:SetVisibility(b)
		end)
	end
	
	local Exploits = Antiaim:AddLocalTab("Exploits")
	Invisibility = Exploits:AddToggle("Become Invisible", false)
	DestroyHead = Exploits:AddToggle("Remove Head", false)
end 
-- ANTIAIM }

-- GAME CHEATS {
do 
	local GameCheats = Exploits:CreateTab("Game Cheats")
end
-- GAME CHEATS }

-- SKINS

local OldInventory = Environment.CurrentInventory
local Skin = {}
local SortedSkins = {}
do
    local addSkin = function(name, value)
        if not SortedSkins[name] then
            SortedSkins[name] = {value}
        else
            table.insert(SortedSkins[name], value)
        end
    end

    for i,v in pairs(Services.ReplicatedStorage.Skins:GetChildren()) do
        for a,b in pairs(v:GetChildren()) do
            table.insert(Skin, {v.Name.. "_".. b.Name})
            addSkin(v.Name, #Skin)
        end
    end

    for i,v in pairs(Services.ReplicatedStorage.Gloves:GetChildren()) do 
        if v:FindFirstChild("Type") then
            if v.Type.Value == "Wraps" then
                table.insert(Skin,{"Handwraps_"..v.Name})
            end
            if v.Type.Value == "Sports" then
                table.insert(Skin,{"Sports Glove_"..v.Name})
            end
            if v.Type.Value == "Fingerless" then
                table.insert(Skin,{"Fingerless Glove_"..v.Name})
            end
            if v.Type.Value == "Straps" then
                table.insert(Skin,{"Strapped Glove_"..v.Name})
            end
        end
    end

    table.insert(Skin,{"CTKnife_Stock"})
    table.insert(Skin,{"TKnife_Stock"})

    for i,v in pairs(Services.ReplicatedStorage.Skins:GetChildren()) do
        if v.Name ~= "Flip Knife" and v.Name ~= "Bayonet" and v.Name ~= "Falchion Knife" and v.Name ~= "Karambit" and v.Name ~= "Huntsman Knife" and v.Name ~= "Banana" and v.Name ~= "Butterfly Knife" then
            table.insert(Skin, {v.Name.. "_Stock"})
        end
    end
end

PickupCT = nil
AntidefuseT = nil
-- PLAYER CHEATS {
do 
    local PlayerCheats = Exploits:CreateTab("Player Cheats")
    local Bunnyhopping = PlayerCheats:AddLocalTab("Bunnyhopping")
    local Enabled = Bunnyhopping:AddToggle("Bunnyhopping", false)
    local Autohop = Bunnyhopping:AddToggle("Autohop", false)
    local Autostrafe = Bunnyhopping:AddToggle("Autostrafe", false)

    speedupdate = hookfunction(Environment.speedupdate, function(...)
        if Enabled.state then
            Environment.landing = false
        end
        local Humanoid = Player.Character.Humanoid
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) and Services.UserInputService:GetFocusedTextBox() == nil then
            if Autohop.state then
                Humanoid.Jump = true
            end
            if Autostrafe.state then
                Humanoid.WalkSpeed = Humanoid.WalkSpeed + 0.1
                return
            end
        end
        return speedupdate(...)
    end)

    local Bomb = PlayerCheats:AddLocalTab("Bomb")
    Bomb:AddToggle("Pick up Bomb as CT", false, function(b)
        PickupCT = b
    end)
    local Instaplant = Bomb:AddToggle("Instaplant", false)
    Bomb:AddToggle("Plant bomb into ground", false, function(b)
        AntidefuseT = b
    end)
    local FakeDefuse = Bomb:AddToggle("Fake defuse", false)

    spawn(function()
        while wait() do
            if FakeDefuse.state and Player.Status.Team.Value == "CT" then
                local C4 = workspace:FindFirstChild("C4")
                local RoundOver = workspace.Status.RoundOver
                repeat wait() until RoundOver.Value or not isAlive(Player) or (C4.Handle.Position - Player.Character.UpperTorso.Position).magnitude <= 6
                if not RoundOver.Value and isAlive(Player) then
                    local DTime = 10
                    if Player.Character:FindFirstChild("DKit") then
						DTime = 5
                    end
                    repeat 
                        Player.Backpack.PressDefuse:FireServer()
                        wait(DTime - 1)
                        Player.Backpack.ReleaseDefuse:FireServer()
                        wait()
                    until RoundOver.Value or not isAlive(Player)
                end
            end
        end
    end)
end
-- PLAYER CHEATS }

Visuals = library:CreateWindow("Visuals", nil, Vector2.new(540, 40))

function Beam(v1, v2, Enabled, Color, Thickness1, Thickness2, Transparency, Lifetime)
    if not Enabled then return end
	local b1 = Instance.new("Part", workspace["Ray_Ignore"])
	b1.Size = Vector3.new(0.0001,0.0001,0.0001)
	b1.Transparency = 1
	b1.CanCollide = false
	b1.CFrame = CFrame.new(v1)
	b1.Anchored = true
	local a1 = Instance.new("Attachment", b1)
	local b2 = Instance.new("Part", workspace["Ray_Ignore"])
	b2.Size = Vector3.new(0.0001,0.0001,0.0001)
	b2.Transparency = 1
	b2.CanCollide = false
	b2.CFrame = CFrame.new(v2)
	b2.Anchored = true
	local a2 = Instance.new("Attachment", b2)
	local b = Instance.new("Beam", b1)
	b.FaceCamera = true
	b.Attachment0 = a1
	b.Attachment1 = a2
	b.LightEmission = 1
	b.LightInfluence = 0
	b.Color = ColorSequence.new(Color)
	b.Width0 = Thickness1 * 0.01
	b.Width1 = Thickness2 * 0.01
	b.Transparency = NumberSequence.new(Transparency)
	delay(Lifetime/1000, function()
		for i = Transparency,1,0.02 do
			wait()
			b.Transparency = NumberSequence.new(i)
		end
		b1:Destroy()
		b2:Destroy()
	end)
end

getBSARGS = nil
ZoomScope = nil

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

-- VISUALS {
do
    local UI = Visuals:CreateTab("Visuals")
    do
        local Tab = UI:AddLocalTab("Bullet Tracers")
        local Enabled = Tab:AddToggle("Enabled", true)
        local Thickness1 = Tab:AddSlider("Starting Thickness", 10, 2)
        local Thickness2 = Tab:AddSlider("Ending Thickness", 10, 5)
        local Color = Tab:AddCP("Color", Color3.new(1, 0.5, 0), nil, 0.7)
        local Lifetime = Tab:AddSlider("Lifetime", 1000, 250)

        getBSARGS = function()
            return Enabled.state, Color.color, Thickness1.value, Thickness2.value, Color.alpha, Lifetime.value
        end
    end

    do
        local Tab = UI:AddLocalTab("Skin Unlocker (NOT FE)")
        Tab:AddToggle("Enabled", false, function(b)
            SkinChanged = b
            if b then
                Environment.CurrentInventory = Skin
            else
                Environment.CurrentInventory = OldInventory
            end
        end)
        Tab:AddButton("Randomize Skins", function()
            if SkinChanged then
                local oldUpdate = Environment.GeneratePage
                Environment.GeneratePage = function() end
                for i,t in pairs({"T", "CT"}) do
                    for w,v in pairs(SortedSkins) do
                        local s = math.random(1, #v)
                        Environment.equipitem(v[s], t)
                    end
                end
                Environment.GeneratePage = oldUpdate
            end
        end)
    end

	do
		local _f
		local UpdateScope = function()
			if _f then
				_f()
			end
		end
		
		local Scope = UI:AddLocalTab("Scope")
        Scope:AddToggle("Don't Zoom In", false, function(b)
            ZoomScope = b
        end)
		local ScopeDropdown = Scope:AddDropdown("Scope", 1, {"Default", "Remove All Black", "Stretch Scope"}, UpdateScope)
		
		_f = function()
			local bruh = Player.PlayerGui.GUI.Crosshairs
			if ScopeDropdown.value == "Remove All Black" then
				for i = 1,4 do
					bruh["Frame"..i].BackgroundTransparency = 1
				end
				bruh.Scope.ImageTransparency = 1
			else
				for i = 1,4 do
					bruh["Frame"..i].BackgroundTransparency = 0
				end
				bruh.Scope.ImageTransparency = 0
			end
		end
	end
	
	do
		local Hitsounds = {
			None = 0,
			TF2 = 3455144981,
			TF2_Squasher = 3466981613,
			TF2_Retro = 3466984142,
			TF2_Beepo = 3466987025,
			TF2_Percussion = 3466985670,
			TF2_Space = 3466982899,
			TF2_Vortex = 3466980212,
			TF2_Electro = 3458224686,
			TF2_Note = 3466988045,
			TF2_Panhit = 3431749479,
			Body = 3213738472,
			Body2 = 2729036768,
			Thud = 3213739706,
			Clink = 1347140027,
			Skeet = 3124869783
		}
		
		local HitsoundsTable = {
			"None",
			"Skeet",
			"TF2",
			"TF2_Squasher",
			"TF2_Retro",
			"TF2_Beepo",
			"TF2_Percussion",
			"TF2_Space",
			"TF2_Vortex",
			"TF2_Electro",
			"TF2_Note",
			"TF2_Panhit",
			"Body",
			"Body2",
			"Thud",
			"Clink"
		}
		
		local Hit = UI:AddLocalTab("On hit")
		local Hitmarker = Hit:AddToggle("Hitmarker", true)
		local FollowHit = Hit:AddToggle("Hitmarker follow hit", false)
		local Hitsound = Hit:AddDropdown("Hitsound", 1, HitsoundsTable)
        local Hitlogs = Hit:AddToggle("Hitlogs", true)
        local FontSize = Hit:AddSlider("Hitlog Font Size", 8, 2, nil)
        local TextColor = Hit:AddCP("Hitlog Text Color", Color3.new(1,1,1), nil, 0)
        local StrokeColor = Hit:AddCP("Hitlog Text Stroke Color", Color3.new(0,0,0), nil, 0)

        HitFunctions.Hitsound = function()
            local s = Instance.new("Sound")
            s.Parent = workspace
            s.SoundId = "rbxassetid://"..Hitsounds[Hitsound.value]
            s.Volume = 4
            s.PlayOnRemove = true
            s:Destroy()
        end

        HitFunctions.Hitmarker = function()
            if not Hitmarker.state then return end
            local Line = Drawing.new("Line")
            local Line2 = Drawing.new("Line")
            local Line3 = Drawing.new("Line")
            local Line4 = Drawing.new("Line")

            local Color = Color3.new(1,1,1)--CurrentConfig().Hitmarker.Color()
            local x, y
            local pos = lastHit.Position
            if FollowHit.state then
                local vector, onScreen = Camera:WorldToViewportPoint(pos)
                x, y = vector.X, vector.Y
            else
                local Size = Camera.ViewportSize
                x, y = Size.X/2, Size.Y/2
            end
            
            Line.From = Vector2.new(x + 4, y + 4)
            Line.To = Vector2.new(x + 10, y + 10)
            Line.Color = Color
            Line.Visible = true 

            Line2.From = Vector2.new(x + 4, y - 4)
            Line2.To = Vector2.new(x + 10, y - 10)
            Line2.Color = Color
            Line2.Visible = true 

            Line3.From = Vector2.new(x - 4, y - 4)
            Line3.To = Vector2.new(x - 10, y - 10)
            Line3.Color = Color
            Line3.Visible = true 

            Line4.From = Vector2.new(x - 4, y + 4)
            Line4.To = Vector2.new(x - 10, y + 10)
            Line4.Color = Color
            Line4.Visible = true

            Line.Transparency = 1
            Line2.Transparency = 1
            Line3.Transparency = 1
            Line4.Transparency = 1

            Line.Thickness = 1
            Line2.Thickness = 1
            Line3.Thickness = 1
            Line4.Thickness = 1

            spawn(function()
                while Line ~= nil and FollowHit.state do
                    wait()
                    local vector, onScreen = Camera:WorldToViewportPoint(pos)
                    x, y = vector.X, vector.Y

                    Line.From = Vector2.new(x + 4, y + 4)
                    Line.To = Vector2.new(x + 10, y + 10)
                    Line.Color = Color
                    Line.Visible = true 

                    Line2.From = Vector2.new(x + 4, y - 4)
                    Line2.To = Vector2.new(x + 10, y - 10)
                    Line2.Color = Color
                    Line2.Visible = true 

                    Line3.From = Vector2.new(x - 4, y - 4)
                    Line3.To = Vector2.new(x - 10, y - 10)
                    Line3.Color = Color
                    Line3.Visible = true 

                    Line4.From = Vector2.new(x - 4, y + 4)
                    Line4.To = Vector2.new(x - 10, y + 10)
                    Line4.Color = Color
                    Line4.Visible = true

                    if not onScreen then
                        Line.Transparency = 0
                        Line2.Transparency = 0
                        Line3.Transparency = 0
                        Line4.Transparency = 0
                    end
                end
            end)

            wait(.3)
            for i = 1,0,-.1 do
                wait()
                Line.Transparency = i 
                Line2.Transparency = i
                Line3.Transparency = i
                Line4.Transparency = i
            end
            Line:Remove()
            Line2:Remove()
            Line3:Remove()
            Line4:Remove()
        end
        
        HitFunctions.Hitlog = function(name, damage)
            if not Hitlogs.state then return end
            local additive = ""
            if lastHit then
                additive = " at "..lastHit.Part.Name
                if lastHit.Wallbang then
                    additive = additive.." through a wall"
                end
                local magnitude = (Mouse.Hit.p - lastHit.Position).magnitude
                local accuracy = math.ceil(500/magnitude)
                additive = additive.." ("..accuracy.."%)"
            end

            local TextLabel = Instance.new("TextLabel")
            TextLabel.Parent = HitlogFrame
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Size = UDim2.new(0, 302, 0, 20)
            TextLabel.Font = Enum.Font.Code
            TextLabel.Text = "Hit "..name.." for "..damage..additive
            TextLabel.TextColor3 = TextColor.color
            TextLabel.TextTransparency = TextColor.alpha
            TextLabel.TextSize = 12 + FontSize.value
            TextLabel.TextStrokeColor3 = StrokeColor.color
            TextLabel.TextStrokeTransparency = StrokeColor.alpha
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            delay(5, function()
                for i = 0,1,0.01 do
                    wait()
                    TextLabel.TextTransparency = TextColor.alpha + i
                    TextLabel.TextStrokeTransparency = StrokeColor.alpha + i
                end
                TextLabel:Destroy()
            end)
        end
	end
end
-- VISUALS }

-- BASE ESP {
local Materials = {"None", "ForceField","Plastic","Wood","Slate","Concrete","CorrodedMetal","DiamondPlate","Foil","Grass","Ice","Marble","Granite","Brick","Pebble","Sand","Fabric","SmoothPlastic","Metal","WoodPlanks","Cobblestone","Neon","Glass"}
for i,v in pairs({"Enemy", "Ally"}) do
	local Group = (v == "Enemy" and Enemies) or Allies
	local Verification = (v == "Enemy" and IsEnemy) or IsAlly
	local ESP = Visuals:CreateTab(v.." ESP", UDim2.new(0,0,1.8,0))
	
	for i,category in pairs({"Wallhack", "Physical Model"}) do
		local _f
		local function Closure()
			if _f then
				for i,bruh in pairs(_f) do
					bruh()
				end
			end
		end
		
		local Performance
		local Tab = ESP:AddLocalTab(category)
		local Enabled = Tab:AddToggle("Enabled", false, Closure)
		if category == "Wallhack" then
			Performance = Tab:AddToggle("Performance Mode", true)
		end
		local RemoveAccessories = Tab:AddToggle("Remove "..v.." Accessories", false, Closure)
		local RemoveFaces = Tab:AddToggle("Remove "..v.." Faces", false, Closure)
		local RemoveArms = Tab:AddToggle("Remove "..v.." Arms", false, Closure)
		local Material = Tab:AddDropdown("Material", 1, Materials, Closure)
		local ChangeColor = Tab:AddToggle("Change Color", false, Closure)
		local ChangeTransparency = Tab:AddToggle("Change Transparency", false, Closure)
		local Color = Tab:AddCP("Color", Color3.new(1,0.5,0), Closure, 0)
		
		local function Modify(char)
			for i,p in pairs(char:GetDescendants()) do
				ModifyItem(p)
			end
		end
		
		local function ModifyItem(p)
			if RemoveFaces.state and p.Name == "face" then
				p:Destroy()
			end
			if RemoveAccessories.state and (p:IsA("Accessory") or p:IsA("Clothing")) then
				p:Destroy()
			end
			if p:IsA("BasePart") then
				if Material.value ~= "None" then
					p.Material = Enum.Material[Material.value]
				end
				if ChangeColor.state then
					p.Color = Color.color
				end
				if ChangeTransparency.state and p.Name ~= "HumanoidRootPart" and p.Name ~= "Head" and p.Name ~= "HeadHB" then
					p.Transparency = Color.alpha
				end
				if RemoveArms.state and (p.Name:find("Arm") or p.Name:find("Hand")) then 
					p.Transparency = 1
				end
			end
		end
		
		local Changed = false
		
		_f = {}
		table.insert(_f, function()
			if not Enabled.state then return end
			if category == "Physical Model" then
				Group(function(v)
					if isAlive(v) then
						Modify(v.Character)
					end
				end)
			else
				Changed = true
			end
		end)
		
		if category == "Physical Model" then
			Players(function(v)
				v.CharacterAdded:connect(function(c)
					if not Verification(v) then return end
					if Enabled.state then  
						Modify(c)
					end
					c.DescendantAdded:connect(function(p)
						if not Enabled.state then return end
						ModifyItem(p)
					end)
				end)
			end, true)
		else
			Players(function(v)
				local Steps = 0
				local FakeCharacter
				local Changed
				
				table.insert(_f, function()
					Changed = true
				end)
				
				RS:connect(function()
					if not Verification(v) then
						if FakeCharacter then FakeCharacter:Destroy() FakeCharacter = nil end
						return
					end
					
					if not Enabled.state then 
						if FakeCharacter then FakeCharacter:Destroy() FakeCharacter = nil end
						return
					end
					
					Steps = Steps + 1
					if not Performance.state and Steps % 2 ~= 0 then 
						return
					end
					
					if not isAlive(v) then 
						if FakeCharacter then FakeCharacter:Destroy() FakeCharacter = nil end
						return
					end
					
					local function CopyPosition(Fake, Real)
						for i,Part in pairs(Fake:GetChildren()) do
							if (Real:FindFirstChild(Part.Name)) then
								if Part:IsA("BasePart") then
									Part.CFrame = (Real:FindFirstChild(Part.Name).CFrame) or CFrame.new()
								end
								CopyPosition(Fake[Part.Name], Real[Part.Name])
							end
						end
					end
					
					local Character = v.Character
					Character.Archivable = true
					--Detect if visible
					local Points = {Camera.CFrame.Position, Character.Head.Position}
					local Ignore = {Camera, Character, Player.Character}
					local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(Character.Head.Position)
					local Visible = #Camera:GetPartsObscuringTarget(Points, Ignore) > 0
					
					if Visible and OnScreen then
						if not FakeCharacter or Changed then
							if FakeCharacter then
								FakeCharacter = nil
							end
							FakeCharacter = Character:Clone()
							FakeCharacter.Parent = ViewportFrame
							Modify(FakeCharacter)
							Changed = false
						else
							CopyPosition(FakeCharacter, Character)
						end
					elseif FakeCharacter then
						FakeCharacter:Destroy()
						FakeCharacter = nil
					end
				end)
			end, true)
		end
	end
	
	do		
		local LookBeams = ESP:AddLocalTab("Look Beams")
		local Enabled = LookBeams:AddToggle("Enabled", false, nil)
		local Performance = LookBeams:AddToggle("Performance Mode", false, nil)
		local Color = LookBeams:AddCP("Color", Color3.new(1,1,1), nil, 0)
		local DistanceLimit = LookBeams:AddSlider("Distance Limit", 50, 0, nil)
		local Thickness = LookBeams:AddSlider("Thickness", 5, 0.1, nil, 0.1)
				
		Players(function(v)
			local Steps = 0
			local Changed
			local Line = Drawing.new("Line")
				
			RS:connect(function()
				if not Verification(v) then
					Line.Visible = false
					return
				end
				
				if not Enabled.state then 
					Line.Visible = false
					return
				end
				
				Steps = Steps + 1
				if Performance.state and Steps % 2 ~= 0 then 
					return
				end
				
				if not isAlive(v) then 
					Line.Visible = false
					return
				end
				
				local CameraCF = v.CameraCF.Value
				local Distance = (DistanceLimit.value == 0 and 300) or DistanceLimit.value
				local ray = Ray.new(CameraCF.p, CameraCF.lookVector * Distance)
				local part, hitPosition = workspace:FindPartOnRay(ray, v.Character)
				local From, OnScreen1 = Camera:WorldToViewportPoint(CameraCF.p)
				local To, OnScreen2 = Camera:WorldToViewportPoint(hitPosition)
				if OnScreen1 and OnScreen2 then
					Line.Visible = true
					Line.Color = Color.color
					Line.Transparency = 1-Color.alpha
					Line.Thickness = Thickness.value
					Line.From = Vector2.new(From.X, From.Y)
					Line.To = Vector2.new(To.X, To.Y)
				else
					Line.Visible = false
				end
			end)
		end, true)
	end
	
	
	do
		local _f
		local function Closure()
			if _f then
				for i,bruh in pairs(_f) do
					bruh()
				end
			end
		end
		
		local FOVArrows = ESP:AddLocalTab("Out of FOV Arrow")
		local Enabled = FOVArrows:AddToggle("Enabled", false, Closure)
		local Performance = FOVArrows:AddToggle("Performance Mode", false, Closure)
		local DisableOffscreen = FOVArrows:AddToggle("Disable when Offscreen", true, Closure)
		local Color = FOVArrows:AddCP("Color", Color3.new(1,1,1), Closure, 0)
		local Size = FOVArrows:AddSlider("Arrow Size", 200, 50, Closure)
		local Bounds = FOVArrows:AddSlider("Bounds", 1000, 400, Closure)
		
		_f = {}
		local Changed = false
		
		
		Players(function(v)
			local Steps = 0
			local Arrow
			local Changed = false
			
			table.insert(_f, function()
				Changed = true
			end)
			
			RS:connect(function()
				if not Verification(v) then
					if Arrow then Arrow.Marker.ImageTransparency = 1 end
					return
				end
				
				if not Enabled.state then 
					if Arrow then Arrow.Marker.ImageTransparency = 1 end
					return
				end
				
				Steps = Steps + 1
				if not Performance.state and Steps % 2 ~= 0 then 
					return
				end
				
				if not isAlive(v) then 
					if Arrow then Arrow.Marker.ImageTransparency = 1 end
					return
				end
				
				if not Arrow or Changed then
					if Arrow then
						Arrow:Destroy()
						Arrow = nil
					end
					Arrow = CreateArrows(Color.color, Color.alpha, Size.value, Bounds.value)
					Arrow.Parent = library.base
					Changed = false
				end
				
				local vector, onScreen = Camera:WorldToScreenPoint(v.Character.Head.Position)
				if (DisableOffscreen.state and not onScreen) or not DisableOffscreen.state then
					Arrow.Marker.ImageTransparency = Color.alpha
					Arrow.Rotation = MathforArrows(vector, Arrow.AbsolutePosition)
				else
					Arrow.Marker.ImageTransparency = 1
				end
			end)
		end, true)
	end
	
	do
		local Location = {"Top", "Right", "Bottom"}
		local Fonts = {"UI", "System", "Plex", "Monospace"}
		local TextSettings = {}
		local Text = {
			{"Nametag", "Nametags"},
			{"Bomb", "Has Bomb"},
			{"Reload", "Reloading Indicator"},
		}

		for i,v in pairs(Text) do
			local TextTab = ESP:AddLocalTab(v[2])
			TextSettings[v[1]] = {
				Enabled = TextTab:AddToggle("Enabled", false, nil),
				Color = TextTab:AddCP("Text Color", Color3.new(1,0.5,0), nil, 0),
				Outline = TextTab:AddToggle("Outline", true, nil),
				OutlineColor = TextTab:AddCP("Outline Color", Color3.new(0,0,0), nil, 0),
				Size = TextTab:AddSlider("Size", 36, 14, nil),
				Font = TextTab:AddDropdown("Font", 3, Fonts, nil)
			}
		end

		local BoxESP = ESP:AddLocalTab("Box ESP")
		local BoxSettings = {
			Enabled = BoxESP:AddToggle("Enabled", false, nil),
			Performance = BoxESP:AddToggle("Performance Mode", false, nil),
        	Color = BoxESP:AddCP("Color", Color3.new(1,1,1), nil, 0),
        	Thickness = BoxESP:AddSlider("Thickness", 5, 0.1, nil, 0.1)
		}
		
		local getCorners = function(obj, size)
			local corners = {
				Vector3.new(obj.X+size.X/2, obj.Y+size.Y/2, obj.Z+size.Z/2);
				Vector3.new(obj.X-size.X/2, obj.Y+size.Y/2, obj.Z+size.Z/2);
				
				Vector3.new(obj.X-size.X/2, obj.Y-size.Y/2, obj.Z-size.Z/2);
				Vector3.new(obj.X+size.X/2, obj.Y-size.Y/2, obj.Z-size.Z/2);
				
				Vector3.new(obj.X-size.X/2, obj.Y+size.Y/2, obj.Z-size.Z/2);
				Vector3.new(obj.X+size.X/2, obj.Y+size.Y/2, obj.Z-size.Z/2);
				
				Vector3.new(obj.X-size.X/2, obj.Y-size.Y/2, obj.Z+size.Z/2);
				Vector3.new(obj.X+size.X/2, obj.Y-size.Y/2, obj.Z+size.Z/2);
			}
			return corners
		end
		
		Players(function(v)
			local Steps = 0
			local Changed
			local Box = Drawing.new("Square")
			
			local disable = function()
				Box.Visible = false
			end
			
			RS:connect(function()
				if not Verification(v) or not isAlive(v) then
					return disable()
				end
				
				Steps = Steps + 1
				if Steps % 2 ~= 0 then 
					return
				end
				
				local allCorners = {}
				for _,v in pairs(v.Character:GetChildren()) do
					if v:isA("BasePart") then
						local a = getCorners(v.CFrame, v.Size)
						for _,v in pairs(a) do
							table.insert(allCorners, v)
						end
					end
				end
	
				local xMin = Camera.ViewportSize.X
				local yMin = Camera.ViewportSize.Y
				local xMax = 0
				local yMax = 0
	
				for i,v in pairs(allCorners) do
					local pos, ons = Camera:WorldToViewportPoint(v)
					if not ons then
						return disable()
					end
					if pos.X > xMax then
						xMax = pos.X
					end
					if pos.X < xMin then
						xMin = pos.X
					end
					if pos.Y > yMax then
						yMax = pos.Y
					end
					if pos.Y < yMin then
						yMin = pos.Y
					end
				end

				if BoxSettings.Enabled.state then
					Box.Visible = true
					Box.Color = BoxSettings.Color.color
					Box.Transparency = 1-BoxSettings.Color.alpha
					Box.Thickness = BoxSettings.Thickness.value
					Box.Position = Vector2.new(xMin, yMin)
					Box.Size = Vector2.new(xMax-xMin, yMax-yMin)
				end
			end)
		end, true)
	end
	
	local ESPLocation = Instance.new("Folder", library.base)
	for i,ChamsType in pairs({"Inner", "Outer"}) do
		local _f
		local function Closure()
			if _f then
				_f()
			end
		end
		
		local Chams = {}
		local ChamsTab = ESP:AddLocalTab(ChamsType.." Chams")
		local Enabled = ChamsTab:AddToggle("Enabled", false, Closure)
		local Color = ChamsTab:AddCP("Color", (ChamsType == "Inner" and Color3.new(1,1,1)) or Color3.new(1,0.5,0), Closure)
		local TeamColor = ChamsTab:AddToggle("Use Team Color Instead", false, Closure)
		
		local Size = {value = 0}
		if ChamsType == "Outer" then
			Size = ChamsTab:AddSlider("Size", 5, 0.35, Closure, 0.01)
		end
		
		local function isPart(p)
			return p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" and p.Name ~= "Head" and p.Name ~= "Gun" and p.Name ~= "HeadHB"
		end
		
		local function ApplyPart(p, v)
			local Cham = Instance.new("BoxHandleAdornment", ESPLocation)
			Cham.Adornee = p
			Cham.AlwaysOnTop = true
			Cham.ZIndex = (ChamsType == "Inner" and 2) or 1
			if Enabled.state then
				Cham.Transparency = Color.alpha
			else
				Cham.Transparency = 1
			end
			Cham.Size = ((p.Name ~= "Head" and p.Size) or Vector3.new(1,1,1)) + Vector3.new(Size.value, Size.value, Size.value)
			Cham.Color3 = Color.color
			if TeamColor.state then
				Cham.Color3 = v.TeamColor.Color
			end
			
			table.insert(Chams[v.Name], Cham)
		end
		
		local function Apply(v)
			for i,p in pairs(v.Character:GetChildren()) do
				if isPart(p) then
					ApplyPart(p, v)
				end
			end
		end
		
		local function removeChams(v)
			for i,c in pairs(Chams[v.Name]) do
				c:Destroy()
			end
			Chams[v.Name] = {}
		end
		
		_f = function()
			Group(function(v)
				if isAlive(v) then
					removeChams(v)
					Apply(v)
				end
			end)
		end
		
		Players(function(v)
			Chams[v.Name] = {}
			v.CharacterAdded:connect(function(c)
				if not Verification(v) then return end
				if Enabled.state then
					removeChams(v)
					Apply(v)
				end
				c.DescendantAdded:connect(function(p)
					if not Enabled.state then return end
					if not isPart(p) then return end
					ApplyPart(p, v)
				end)
			end)
			if isAlive(v) then
				removeChams(v)
				Apply(v)
			end
			spawn(function()
				v:WaitForChild("Status"):WaitForChild("Alive"):GetPropertyChangedSignal("Value"):Connect(function()
					removeChams(v)
				end)
			end)
		end, true)
    end
    if v == "Enemy" then
        do
            local Tab = ESP:AddLocalTab("Hit History")
            local Enabled = Tab:AddToggle("Enabled", false, nil)
            local RemoveAccessories = Tab:AddToggle("Remove "..v.." Accessories", true, nil)
            local RemoveFaces = Tab:AddToggle("Remove "..v.." Faces", true, nil)
            local RemoveArms = Tab:AddToggle("Remove "..v.." Arms", false, nil)
            local Material = Tab:AddDropdown("Material", 2, Materials, nil)
            local ChangeColor = Tab:AddToggle("Change Color", true, nil)
            local ChangeTransparency = Tab:AddToggle("Change Transparency", false, nil)
            local Color = Tab:AddCP("Color", Color3.new(1,0.5,0), nil, 0)
            local Lifetime = Tab:AddSlider("Lifetime", 60, 5)
            
            local function ModifyItem(p)
                if RemoveFaces.state and p.Name == "face" then
                    p:Destroy()
                end
                if RemoveAccessories.state and (p:IsA("Accessory") or p:IsA("Clothing")) then
                    p:Destroy()
                end
                if p:IsA("BasePart") then
                    p.Anchored = true
                    p.CanCollide = false
                    if Material.value ~= "None" then
                        p.Material = Enum.Material[Material.value]
                    end
                    if ChangeColor.state then
                        p.Color = Color.color
                    end
                    if p.Name ~= "HumanoidRootPart" and p.Name ~= "Head" and p.Name ~= "HeadHB" then
                        if ChangeTransparency.state then
                            p.Transparency = Color.alpha
                        else
                            p.Transparency = 0
                        end
                    end
                    if RemoveArms.state and (p.Name:find("Arm") or p.Name:find("Hand")) then 
                        p.Transparency = 1
                    end
                end
            end

            local function Modify(char)
                for i,p in pairs(char:GetDescendants()) do
                    ModifyItem(p)
                end
            end

            HitFunctions.History = function(name)
                if not Enabled.state then return end
                local plr = Services.Players[name]

                plr.Character.Archivable = true
                local FakeCharacter = plr.Character:Clone()
                Modify(FakeCharacter)
                FakeCharacter.Name = "F"
                FakeCharacter.Parent = workspace
                Services.Debris:AddItem(FakeCharacter, Lifetime.value)
            end
        end
    end
end
-- BASE ESP }

-- SELF ESP {
do
	local Self = Visuals:CreateTab("Self ESP")
end
-- SELF ESP }

-- OTHER ESP {
do
	local function getSite(p)
		local SpawnPoints = workspace.Map.SpawnPoints
		local Pos = p.Position
	    if GetDistanceSq3(Pos, SpawnPoints.C4Plant.Position) <
	        GetDistanceSq3(Pos, SpawnPoints.C4Plant2.Position) then
	        return "B"
	    else
	        return "A"
	    end
	end
	local Other = Visuals:CreateTab("Other ESP")
	local Drop = Other:AddLocalTab("Dropped Weapons")
	local Bomb = Other:AddLocalTab("Armed Bomb")
	local Enabled = Bomb:AddToggle("BombGUI", false)
	local Cham = Bomb:AddToggle("Enable Cham", false)
	local Color = Bomb:AddCP("Color", Color3.new(1,0.5,0))
	local Rainbow = Bomb:AddToggle("Rainbow Cham", false)
	local Size = Bomb:AddSlider("Size", 5, 0, nil, 0.01)
	
	if not Studio then
		workspace.Status.RoundOver:GetPropertyChangedSignal("Value"):connect(function()
			if not Enabled.state then return end
			if not workspace.Status.RoundOver.Value then return end
			BombGUI.Visible = false
		end)
		workspace.Status.Armed:GetPropertyChangedSignal("Value"):connect(function()
			if not Enabled.state then return end
			if not workspace.Status.Armed.Value then return end
			BombGUI.Visible = true
			BombGUI.DT.Visible = false
			BombGUI.CT.Visible = false
			BombGUI.T.Size = UDim2.new(1,0,0,10)
			BombGUI.CT.Size = UDim2.new(1,0,0,10)
			local explode = tick()+38
			BombGUI.T:TweenSize(UDim2.new(0,0,0,10), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 38, true, function(complete)
				BombGUI.Visible = false
			end)
			spawn(function()
				repeat wait() BombGUI.ET.Text = "Explosion Time: "..string.format("%.2f", explode-tick()).." seconds" until tick() > explode
			end)
				
			local C4 = workspace:WaitForChild("C4")
		
			C4.ChildAdded:connect(function(p)
				if p.Name == "Defusing" then
					BombGUI.CT.Visible = true
					BombGUI.DT.Visible = true
					BombGUI.CT.Size = UDim2.new(1,0,0,10)
					repeat wait() until p.Value ~= nil
					local plr = p.Value
					local defusetime = 10
					if plr.Character:FindFirstChild("DKit") then
						defusetime = 5
					end
					local defuse = tick()+defusetime
					BombGUI.CT:TweenSize(UDim2.new(0,0,0,10), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, defusetime, true)
					repeat wait() BombGUI.DT.Text = "Defuse Time: "..string.format("%.2f", defuse-tick()).." seconds" until tick() > defuse or p.Parent == nil
					BombGUI.CT.Size = UDim2.new(1,0,0,10)
					BombGUI.CT.Visible = false
					BombGUI.DT.Visible = false
				end
			end)
			
			local Handle = C4:WaitForChild("Handle")
			BombGUI.Site.Text = getSite(Handle)
			if Cham.state then
				local Bomb = Instance.new("BoxHandleAdornment", library.base)
				Bomb.Adornee = Handle
				Bomb.AlwaysOnTop = true
				Bomb.ZIndex = 1
				if Enabled.state then
					Bomb.Transparency = Color.alpha
				else
					Bomb.Transparency = 1
				end
				Bomb.Size = Handle.Size + Vector3.new(Size.value, Size.value, Size.value)
				Bomb.Color3 = Color.color
				C4.AncestryChanged:connect(function()
					Bomb:Destroy()
				end)
				if Rainbow then
					repeat
						wait()
						Bomb.Color3 = Rainbow(3,1,1)
					until C4.Parent == nil
				end
			end
		end)
	end
end
-- OTHER ESP }

-- WORLD OPTIONS {

do
	local World = Visuals:CreateTab("World", UDim2.new(0,0,2,0))
	local Appearance = World:AddLocalTab("Appearance")
	
	local debounce = true
	local _f
	local Closure = function()
		if _f then
			_f()
		end
	end
	
	local Lighting = Services.Lighting
	
	Ambient = Appearance:AddCP("Ambient", Lighting.Ambient, Closure)
	Brightness = Appearance:AddSlider("Brightness", 10, Lighting.Brightness, Closure, 0.01)
	ColorShift_Bottom = Appearance:AddCP("ColorShift_Bottom", Lighting.ColorShift_Bottom, Closure)
	ColorShift_Top = Appearance:AddCP("ColorShift_Top", Lighting.ColorShift_Top, Closure)
	EnvironmentDiffuseScale = Appearance:AddSlider("EnvironmentDiffuseScale", 1, Lighting.EnvironmentDiffuseScale, Closure, 0.01)
	GlobalShadows = Appearance:AddToggle("GlobalShadows", Lighting.GlobalShadows, Closure)
	OutdoorAmbient = Appearance:AddCP("OutdoorAmbient", Lighting.OutdoorAmbient, Closure)
	
	local Data = World:AddLocalTab("Lighting Data")
	ClockTime = Data:AddSlider("Time of Day", 24, Lighting.ClockTime, Closure, 0.01)
	GeographicLatitude = Data:AddSlider("GeographicLatitude", 360, Lighting.GeographicLatitude, Closure)

	local Fog = World:AddLocalTab("Fog")
	FogColor = Fog:AddCP("FogColor", Lighting.FogColor, Closure)
	FogEnd = Fog:AddBox("FogEnd", Lighting.FogEnd, Closure)
	FogStart = Fog:AddBox("FogStart", Lighting.FogStart, Closure)
	
	local Bloom = World:AddLocalTab("Bloom")
	local BloomEffect = Instance.new("BloomEffect", Lighting)
	BloomEnabled = Bloom:AddToggle("Enabled", false, function(b) BloomEffect.Enabled = b end)
	BloomIntensity = Bloom:AddSlider("Intensity", 1, BloomEffect.Intensity, function(scale) BloomEffect.Intensity = scale end, 0.01)
	BloomSize = Bloom:AddSlider("Size", 56, BloomEffect.Size, function(scale) BloomEffect.Size = scale end)
	BloomThreshold = Bloom:AddSlider("Threshold", 1, BloomEffect.Threshold, function(scale) BloomEffect.Threshold = scale end, 0.01)
		
	local Blur = World:AddLocalTab("Blur")
	local BlurEffect = Instance.new("BlurEffect", Lighting)
	BlurEnabled = Blur:AddToggle("Enabled", false, function(b) BlurEffect.Enabled = b end)
	BlurSize = Blur:AddSlider("Size", 56, BlurEffect.Size, function(scale) BlurEffect.Size = scale end)
	
	local ColorCorrection = World:AddLocalTab("Color Correction")
	local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
	ColorCorrection:AddToggle("Enabled", false, function(b) ColorCorrectionEffect.Enabled = b end)
	ColorCorrectionSaturation = ColorCorrection:AddSlider("Saturation", 2, ColorCorrectionEffect.Saturation+1, function(scale) ColorCorrectionEffect.Saturation = scale-1 end, 0.01)
	ColorCorrectionBrightness = ColorCorrection:AddSlider("Brightness", 2, ColorCorrectionEffect.Brightness+1, function(scale) ColorCorrectionEffect.Brightness = scale-1 end, 0.01)
	ColorCorrectionContrast = ColorCorrection:AddSlider("Contrast", 2, ColorCorrectionEffect.Contrast+1, function(scale) ColorCorrectionEffect.Contrast = scale-1 end, 0.01)
	ColorCorrectionTintColor = ColorCorrection:AddCP("TintColor", ColorCorrectionEffect.TintColor, function(color) ColorCorrectionEffect.TintColor = color end)
		
	local DepthOfField = World:AddLocalTab("Depth of Field")
	local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect", Lighting)
	DepthOfFieldEnabled = DepthOfField:AddToggle("Enabled", false, function(b) DepthOfFieldEffect.Enabled = b end)
	DepthOfFieldFarIntensity = DepthOfField:AddSlider("FarIntensity", 1, DepthOfFieldEffect.FarIntensity, function(scale) DepthOfFieldEffect.FarIntensity = scale end, 0.01)
	DepthOfFieldFocusDistance = DepthOfField:AddSlider("FocusDistance", 200, DepthOfFieldEffect.FocusDistance, function(scale) DepthOfFieldEffect.FocusDistance = scale end)
	DepthOfFieldInFocusRadius = DepthOfField:AddSlider("InFocusRadius", 50, DepthOfFieldEffect.InFocusRadius, function(scale) DepthOfFieldEffect.InFocusRadius = scale end, 0.01)
	DepthOfFieldNearIntensity = DepthOfField:AddSlider("NearIntensity", 1, DepthOfFieldEffect.NearIntensity, function(scale) DepthOfFieldEffect.NearIntensity = scale end, 0.01)
		
	local SunRays = World:AddLocalTab("Sun Rays")
	local SunRaysEffect = Instance.new("SunRaysEffect", Lighting)
	SunRaysEnabled = SunRays:AddToggle("Enabled", false, function(b) SunRaysEffect.Enabled = b end)
	SunRaysIntensity = SunRays:AddSlider("Intensity", 1, SunRaysEffect.Intensity, function(scale) SunRaysEffect.Intensity = scale end, 0.01)
	SunRaysSpread = SunRays:AddSlider("Spread", 1, SunRaysEffect.Spread, function(scale) SunRaysEffect.Spread = scale end, 0.01)
	
	_f = function()
		if debounce then
			debounce = false
			Lighting.Ambient = Ambient.color
			Lighting.Brightness = Brightness.value
			Lighting.ColorShift_Bottom = ColorShift_Bottom.color
			Lighting.ColorShift_Top = ColorShift_Top.color
			Lighting.EnvironmentDiffuseScale = EnvironmentDiffuseScale.value
			Lighting.GlobalShadows = GlobalShadows.state
			Lighting.OutdoorAmbient = OutdoorAmbient.color
			Lighting.ClockTime = ClockTime.value
			Lighting.GeographicLatitude = GeographicLatitude.value
			Lighting.FogColor = FogColor.color
			Lighting.FogEnd = tonumber(FogEnd.value)
			Lighting.FogStart = tonumber(FogStart.value)
			debounce = true
		end
	end
	
	Lighting.LightingChanged:Connect(_f)
end

-- WORLD OPTIONS }

HitboxPriority = library:CreateWindow("Hitbox Priorities", Vector2.new(280 + 20, 330 + 75), Vector2.new(40, 580))
for tab,prefix in pairs({"Legit", "Rage", "Override"}) do
	local Tab = HitboxPriority:CreateTab(prefix)
	local Control = HitboxPriorityControl:Clone()
	Control.Parent = Tab.main
	
	for i,v in pairs(Control:GetChildren()) do
		v.MouseButton1Click:connect(function()
			Priorities[prefix][v.Name] = (Priorities[prefix][v.Name] + 1) % 6
			v.Text = Priorities[prefix][v.Name] + 1
		end)
		v.Text = Priorities[prefix][v.Name] + 1
	end
end

WeaponMods = library:CreateWindow("Weapon Modifications", Vector2.new(450, 308), Vector2.new(1030, 40))
starting_debounce = false
for i,v in pairs(Weapons.Types) do
	local BulletOverride = false
	local tab = WeaponMods:CreateTab(v)
	local FR = tab:AddLocalTab("Firerate")
	FR:AddSlider("Firerate Multiplier", 5, 1, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Old = Weapons.Old[v]
				local Value = Weapon:FindFirstChild("FireRate")
				local OldValue = Old:FindFirstChild("FireRate")
				if Value and value then
					Value.Value = OldValue.Value / value
				elseif Value then
					Value.Value = OldValue.Value
				end
			end
		end
	end, 0.1)
	
	local RT = tab:AddLocalTab("Reload Time")
	RT:AddSlider("Reduce Reload Time", 5, 1, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Old = Weapons.Old[v]
				local Value = Weapon:FindFirstChild("ReloadTime")
				local OldValue = Old:FindFirstChild("ReloadTime")
				if Value then
					Value.Value = OldValue.Value / value
				elseif Value then
					Value.Value = OldValue.Value
				end
			end
		end
	end, 0.1)
	
	local IA = tab:AddLocalTab("Infinite Ammo")
	IA:AddToggle("Infinite Ammo", false, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Old = Weapons.Old[v]
				local Value1 = Weapon:FindFirstChild("StoredAmmo")
				local OldValue1 = Old:FindFirstChild("StoredAmmo")
				local Value2 = Weapon:FindFirstChild("Ammo")
				local OldValue2 = Old:FindFirstChild("Ammo")
				if value then
					if Value1 then
						Value1.Value = 9e12
					end
					if Value2 then
						Value2.Value = 9e9
					end
				else
					if Value1 then
						Value1.Value = OldValue1.Value
					end
					if Value2 then
						Value2.Value = OldValue2.Value
					end
				end
			end
		end
	end)
	
	local FA = tab:AddLocalTab("Force Auto")
	FA:AddToggle("Force Auto", false, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Value = Weapon:FindFirstChild("Auto")
				if Value then
					Value.Value = value
				end
			end
		end
	end)
	
	local RT = tab:AddLocalTab("Force Shotgun")
	RT:AddToggle("Enable Bullet Override", false, function(value)
		if starting_debounce then
			BulletOverride = value
			if not value then
				for i,v in pairs(Weapons[v]) do
					local Weapon = Weapons.Path[v]
					local Old = Weapons.Old[v]
					local Value = Weapon:FindFirstChild("Bullets")
					local OldValue = Old:FindFirstChild("Bullets")
					if Value then
						Value.Value = OldValue.Value
					end
				end
			end
		end
	end)
	
	RT:AddSlider("Bullets to shoot", 100, 1, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Old = Weapons.Old[v]
				local Value = Weapon:FindFirstChild("Bullets")
				local OldValue = Old:FindFirstChild("Bullets")
				if Value and BulletOverride and Value:FindFirstChild("Value") then
					Value.Value = value
				else
					Value.Value = OldValue.Value
				end
			end
		end
	end)
	
	local IE = tab:AddLocalTab("Instant Equip")
	IE:AddToggle("Instant Equip", false, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Old = Weapons.Old[v]
				local Value = Weapon:FindFirstChild("EquipTime")
				local OldValue = Old:FindFirstChild("EquipTime")
				if Value and value then
					Value.Value = 0
				elseif Value then
					Value.Value = OldValue.Value
				end
			end
		end
	end)
	
	local RT = tab:AddLocalTab("RCS and Spread")
	--[[
	RT:AddSlider("Reduce Spread", 1, 0, function(value)
		if starting_debounce then
			for i,v in pairs(Weapons[v]) do
				local Weapon = Weapons.Path[v]
				local Old = Weapons.Old[v]
				local Value = Weapon:FindFirstChild("Spread")
				local OldValue = Old:FindFirstChild("Spread")
				if Value then
					Value.Value = OldValue.Value * (1-value)
					for _,children in pairs(Value:GetChildren()) do
						children.Value = OldValue[children.Name].Value * (1-value)
					end
				end
			end
		end
	end, 0.01)]]
	
	RT:AddSlider("Reduce Recoil", 1, 0, function(value)
		for i,v in pairs(Weapons[v]) do
			--Storage[v] = (1-value)
		end
	end, 0.01)
end

-- "laff" - bloxxite 2020