function LoadLibrary(a)
	return loadstring(game:HttpGet("https://pastebin.com/raw/UfzKgS6T", true))()
end
loadstring(game:GetObjects("rbxassetid://4480871791")[1].Source)()

--[wip]--

--[[ The Brutal Furry (DEMO .1), by SezHu and Nebula_Zorua ]]--
--[[ Animation work by SezHu, attacks by Nebula_Zorua ]]--

--[[ I also made some things less stiff ~Nebula ]]--

wait(1 / 60)
Effects = { }
local Player = game:service'Players'.localPlayer
local Mouse = Player:GetMouse()
local Character = game.Workspace.CloneCharacter
local Humanoid = Character.Humanoid
local Head = Character.Head
local RootPart = Character.HumanoidRootPart
local Torso = Character.Torso
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Camera = game.Workspace.CurrentCamera
local RootJoint = RootPart.RootJoint
local Equipped = false
local Attack = false
local Anim = 'Idle'
local Idle = 0
local Combo = 1
local TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local Velocity = RootPart.Velocity.y
local Sine = 0
local Change = 1
local UIS = game:GetService("UserInputService") 

local Climbing = false
local ClimbPos;

spawn(function()
    while true do
	swait()
	Sine = Sine + Change
end
end)

local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

Humanoid.WalkSpeed = 35
Humanoid.JumpPower = 70
Humanoid.Animator.Parent = nil
Character.Animate.Parent = nil

local newMotor = function(part0, part1, c0, c1)
	local w = Create('Motor'){
		Parent = part0,
		Part0 = part0,
		Part1 = part1,
		C0 = c0,
		C1 = c1,
	}
	return w
end



function clerp(a, b, t)
	return a:lerp(b, t)
end

RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)

local RW = newMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0)) 
local LW = newMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
local RH = newMotor(Torso, RightLeg, CFrame.new(.5, -2, 0), CFrame.new(0, 0, 0))
local LH = newMotor(Torso, LeftLeg, CFrame.new(-.5, -2, 0), CFrame.new(0, 0, 0))
RootJoint.C1 = CFrame.new(0, 0, 0)
RootJoint.C0 = CFrame.new(0, 0, 0)
Torso.Neck.C1 = CFrame.new(0, 0, 0)
Torso.Neck.C0 = CFrame.new(0, 1.5, 0)

local rarmc1 = RW.C1
local larmc1 = LW.C1
local rlegc1 = RH.C1
local llegc1 = LH.C1

local resetc1 = false

function PlayAnimationFromTable(table, speed, bool)
	RootJoint.C0 = clerp(RootJoint.C0, table[1], speed) 
	Torso.Neck.C0 = clerp(Torso.Neck.C0, table[2], speed) 
	RW.C0 = clerp(RW.C0, table[3], speed) 
	LW.C0 = clerp(LW.C0, table[4], speed) 
	RH.C0 = clerp(RH.C0, table[5], speed) 
	LH.C0 = clerp(LH.C0, table[6], speed) 
	if bool == true then
		if resetc1 == false then
			resetc1 = true
			RootJoint.C1 = RootJoint.C1
			Torso.Neck.C1 = Torso.Neck.C1
			RW.C1 = rarmc1
			LW.C1 = larmc1
			RH.C1 = rlegc1
			LH.C1 = llegc1
		end
	end
end

ArtificialHB = Create("BindableEvent"){
	Parent = script,
	Name = "Heartbeat",
}

script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

local m = Create("Model"){
	Parent = Character,
	Name = "WeaponModel"
}



function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
	
CFuncs = {	
	Part = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			if Size == Vector3.new() then
				Part.Size = Vector3.new(0.2, 0.2, 0.2)
			else
				Part.Size = Size
			end
			return Part
		end;
	};
	
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};

	Weld = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	Sound = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = "rbxassetid://" .. id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};
	
	ParticleEmitter = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local Particle = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return Particle
		end;
	};
	
	CreateTemplate = {
		
	};
}


rCHandle2=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","CHandle2",Vector3.new(0.430001736, 0.679999948, 0.299999684))
rCHandle2Weld=CFuncs.Weld.Create(m,Character["Left Arm"],rCHandle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0650009513, -0.0299911499, 0.555044532, 0, 0, 1, 1, 0, 0, 0, 1, 0))
CHandle2=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","CHandle2",Vector3.new(0.430001736, 0.679999948, 0.299999684))
CHandle2Weld=CFuncs.Weld.Create(m,rCHandle2,CHandle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0650009513, -0.0299911499, 0.555044532, 0, 0, 1, 1, 0, 0, 0, 1, 0))
Claw2=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Claw2",Vector3.new(0.430001736, 0.829999924, 1.31999958))
Claw2Weld=CFuncs.Weld.Create(m,CHandle2,Claw2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.414048076, -0.0255355835, 0.581350505, 1, 0, 0, 0, -1, 0, 0, 0, -1))
CFuncs.Mesh.Create("SpecialMesh",Claw2,Enum.MeshType.FileMesh,"rbxassetid://10681506",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.800000012))


rCHandle1=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","CHandle1",Vector3.new(0.430001736, 0.679999948, 0.299999684))
rCHandle1Weld=CFuncs.Weld.Create(m,Character["Right Arm"],rCHandle1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0650009513, -0.00206756592, 0.555044532, 0, 0, 1, 1, 0, 0, 0, 1, 0))
CHandle1=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","CHandle1",Vector3.new(0.430001736, 0.679999948, 0.299999684))
CHandle1Weld=CFuncs.Weld.Create(m,rCHandle1,CHandle1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0650009513, -0.00206756592, 0.555044532, 0, 0, 1, 1, 0, 0, 0, 1, 0))
Claw1=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Claw1",Vector3.new(0.430001736, 0.829999924, 1.31999958))
Claw1Weld=CFuncs.Weld.Create(m,CHandle1,Claw1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.414048076, -0.0255355835, 0.581350505, 1, 0, 0, 0, -1, 0, 0, 0, -1))
CFuncs.Mesh.Create("SpecialMesh",Claw1,Enum.MeshType.FileMesh,"rbxassetid://10681506",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.800000012))

function RayCast(Position, Direction, Range, Ignore)
	return workspace:FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

function RayCastWithList(Position, Direction, Range, Ignore)
	return workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

function GetTorso(char)
	return char:FindFirstChild'Torso' or char:FindFirstChild'UpperTorso'
end

FindNearestTorso = function(pos,range)
	local torso,dist=nil,nil or range;
	for _,v in next, workspace:children() do
		if(v.Name ~= 'CKbackup' and v.Name ~= 'SezHu' and v.Name ~= 'Salvo_Starly' and v.Name ~= 'Nebula_Zorua' and v ~= Character and GetTorso(v) and v:FindFirstChildOfClass'Humanoid')then
			if v:FindFirstChildOfClass('Humanoid').Health > 0 then
			if((pos-GetTorso(v).Position).magnitude < dist)then
				torso = GetTorso(v)
				dist = (pos-GetTorso(v).Position).magnitude
			end
		end
	end
end
	return torso, dist
end

function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChild("Humanoid")
	for _, v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil then
			if hit.Parent.DebounceHit.Value == true then
				return
			end
		end
		local c = Create("ObjectValue"){
			Name = "creator",
			Value = game:service("Players").LocalPlayer,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
		if HitSound ~= nil and HitPitch ~= nil then
			CFuncs.Sound.Create(HitSound, hit, 1, HitPitch) 
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil then
			if block.className == "IntValue" then
				if block.Value > 0 then
					blocked = true
					block.Value = block.Value - 1
					print(block.Value)
				end
			end
		end
		if blocked == false then
			h.Health = h.Health - Damage
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, BrickColor.new("Really black").Color)
		else
			h.Health = h.Health - (Damage / 2)
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, BrickColor.new("Really black").Color)
		end
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = (hit.Position - (Property.Position + Vector3.new(0, 0, 0))).unit
			local bodvol = Create("BodyVelocity"){
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodvol, .5)
			game:GetService("Debris"):AddItem(rl, .5)
		elseif Type == "Normal" then
			local vp = Create("BodyVelocity"){
				P = 500,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05,
			}
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end

		elseif Type == "Up" then
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, .5)
		elseif Type == "DarkUp" then
			coroutine.resume(coroutine.create(function()
				for i = 0, 1, 0.1 do
					swait()
					Effects.Block.Create(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, .08, 1)
				end
			end))
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Snare" then
			local bp = Create("BodyPosition"){
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Freeze" then
			local BodPos = Create("BodyPosition"){
				P = 50000,
				D = 1000,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			local BodGy = Create("BodyGyro") {
				maxTorque = Vector3.new(4e+005, 4e+005, 4e+005) * math.huge ,
				P = 20e+003,
				Parent = hit.Parent.Torso,
				cf = hit.Parent.Torso.CFrame,
			}
			hit.Parent.Torso.Anchored = true
			coroutine.resume(coroutine.create(function(Part) 
				swait(1.5)
				Part.Anchored = false
			end), hit.Parent.Torso)
			game:GetService("Debris"):AddItem(BodPos, 3)
			game:GetService("Debris"):AddItem(BodGy, 3)
		end
		local debounce = Create("BoolValue"){
			Name = "DebounceHit",
			Parent = hit.Parent,
			Value = true,
		}
		game:GetService("Debris"):AddItem(debounce, Delay)
		c = Create("ObjectValue"){
			Name = "creator",
			Value = Player,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
	end
end

function ShowDamage(Pos, Text, Time, Color)
	local Rate = (1 / 30)
	local Pos = (Pos or Vector3.new(0, 0, 0))
	local Text = (Text or "")
	local Time = (Time or 2)
	local Color = (Color or Color3.new(1, 0, 1))
	local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui"){
		Size = UDim2.new(3, 0, 3, 0),
		Adornee = EffectPart,
		Parent = EffectPart,
	}
	local TextLabel = Create("TextLabel"){
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		Font = "SciFi",
		TextColor3 = Color,
		TextScaled = true,
		Parent = BillboardGui,
	}
	game.Debris:AddItem(EffectPart, (Time))
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		local Frames = (Time / Rate)
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = (Frame / Frames)
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end

function MagnitudeDamage(Part, Magnitude, MinimumDamage, MaximumDamage, KnockBack, Type, HitSound, HitPitch)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= Magnitude and c.Name ~= Player.Name then 
					Damage(head, head, MinimumDamage, MaximumDamage, KnockBack, Type, RootPart, .1, "rbxassetid://" .. HitSound, HitPitch)
				end
			end
		end
	end
end

EffectModel = Create("Model"){
	Parent = Character,
	Name = "EffectModel",
}

Effects = {
	Block = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type, Part)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			if Type == 1 or Type == nil then
				table.insert(Effects, {
					prt,
					"Block1",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 2 then
				table.insert(Effects, {
					prt,
					"Block2",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 3 then
				table.insert(Effects, {
					prt,
					"Block3",
					delay,
					x3,
					y3,
					z3,
					msh,
					Part
				})
			elseif Type == 4 then
				table.insert(Effects, {
					prt,
					"Block2Fire",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			end
		end
	};

	Sphere = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, parent)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			if parent == nil then
				prt.Parent = workspace
			else
				prt.Parent = parent
			end
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Blood = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Blood",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Blast = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Part)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "1323306", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Block4",
				delay,
				x3,
				y3,
				z3,
				msh,
				Part
			})
		end
	};

	Ring = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Cylinder = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Head = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Head", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Wave = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Break = {
		Create = function(brickcolor, cframe, x1, y1, z1)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
			game:GetService("Debris"):AddItem(prt, 10)
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			local num = math.random(10, 50) / 1000
			table.insert(Effects, {
				prt,
				"Shatter",
				num,
				prt.CFrame,
				math.random() - math.random(),
				0,
				math.random(50, 100) / 100
			})
		end
	};

	Elec = {
		Create = function(brickcolor, cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x * 100, x * 100) / 100, math.random(-y * 100, y * 100) / 100, math.random(-z * 100, z * 100) / 100)
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 10)
			xval = math.random() / 9
			yval = math.random() / 9
			zval = math.random() / 9
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			eul1 = math.random(-50, 50)
			eul2 = math.random(-50, 50)
			eul3 = math.random(-50, 50)
			euld = CFrame.fromEulerAnglesXYZ(eul1, eul2, eul3)
			euld2 = CFrame.fromEulerAnglesXYZ(-eul1, -eul2, -eul3)
			table.insert(Effects, {
				prt,
				"Elec",
				.05,
				x,
				y,
				z,
				xval,
				yval,
				zval,
				msh,
				euld,
				euld2
			})
		end
	};

	Elec2 = {
		Create = function(brickcolor, cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x * 100, x * 100) / 100, math.random(-y * 100, y * 100) / 100, math.random(-z * 100, z * 100) / 100)
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 10)
			xval = math.random() / 7
			yval = math.random() / 7
			zval = math.random() / 7
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			eul1 = math.random(-50, 50)
			eul2 = math.random(-50, 50)
			eul3 = math.random(-50, 50)
			euld = CFrame.fromEulerAnglesXYZ(eul1, eul2, eul3)
			euld2 = CFrame.fromEulerAnglesXYZ(-eul1, -eul2, -eul3)
			table.insert(Effects, {
				prt,
				"Elec",
				.1,
				x,
				y,
				z,
				xval,
				yval,
				zval,
				msh,
				euld,
				euld2
			})
		end
	};

	Clone = {
		Create = function() 
			for _, v in pairs(Torso.Parent:children()) do
				if v.className == "Part" and v.Name ~= "HumanoidRootPart" then
					local c = CFuncs.Part.Create(EffectModel, "Neon", 0, .5, BrickColor.new("Bright blue"), "Effect", v.Size)
					c.Anchored = true
					c.CFrame = v.CFrame
					game:GetService("Debris"):AddItem(c, 5)
					local cmsh = nil
					if v.Name == "Head" then
						cmsh = CFuncs.Mesh.Create("SpecialMesh", c, "Head", "", Vector3.new(0, 0, 0), v.Mesh.Scale)
					else
						cmsh = CFuncs.Mesh.Create("BlockMesh", c, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
					end
					table.insert(Effects, {
						c,
						"Cylinder",
						0.05,
						0.1,
						0.1,
						0.1,
						cmsh
					})
				end
			end
		end
	};

	EffectTemplate = {

	};
}

function Attackone()
	Attack = true
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0, 0, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0, 1.5, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			CFrame.new(1.5, 0, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			CFrame.new(-1.5, 0, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			CFrame.new(0.5, -2, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.5, -2, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Attack = false
end

Humanoid.WalkSpeed = 0
Humanoid.JumpPower = 0

--Intro bit
	ripntear=Instance.new("Sound", Torso)
	ripntear.SoundId = "rbxassetid://1289912324"
	ripntear.TimePosition = 9.2
	ripntear.Looped = true
	ripntear:Play()
if(not game:GetService('RunService'):IsStudio() )then
		for i = 0, 15, 0.1 do
			swait()
			PlayAnimationFromTable({
	         CFrame.new(-0, -0.05818367, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0 + .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0, 1.55817556, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(1.61094332, 0.142581686, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849, 0, 0, 0, 1) * CFrame.new(0, 0 + .03 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-1.61001778, 0.148382559, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849, 0, -0, 0, 1) * CFrame.new(0, 0 + .03 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.593397617, -1.93364203, 0, 0.996194661, -0.087155968, 0, 0.087155968, 0.996194661, 0, 0, 0, 1) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.535535276, -1.93870413, 0, 0.996194661, 0.087155968, 0, -0.087155968, 0.996194661, 0, -0, 0, 1) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
			rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end
		CFuncs.Sound.Create("1499494641", CHandle1, 1, 1)
		for i = 0, 3, 0.1 do
			swait()
			PlayAnimationFromTable({
	         CFrame.new(8.69583914e-07, -0.0581835881, 9.53695611e-09, 1.00000954, 1.44541673e-06, -8.33538607e-08, 1.44541673e-06, 1.00000024, -1.63912858e-07, -8.33538607e-08, -1.63912858e-07, 1) * CFrame.new(0, 0 + .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.116701782, 1.56846416, -0.0424783528, 0.935734272, -0.321394563, 0.145314857, 0.296198726, 0.939692676, 0.17100963, -0.191512048, -0.116977088, 0.974494457) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.817323148, 0.233033627, -0.785861373, 0.185918838, 0.948464036, 0.256631851, -0.054367777, 0.270715863, -0.96112299, -0.981059968, 0.164737463, 0.101896688) * CFrame.new(0, 0 + .1 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.729675174, 0.474314064, -0.926509023, 0.0858333781, -0.981064856, -0.173649207, -0.0151340002, 0.172986239, -0.984808147, 0.996194661, 0.0871570408, 7.3356756e-07) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.593403578, -1.9336412, 9.73475267e-07, 0.996204436, -0.0871553719, -8.33538607e-08, 0.0871574283, 0.99619478, -1.63912858e-07, -1.08093566e-07, -1.53640599e-07, 1) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.53555274, -1.93870628, 5.9665399e-07, 0.996204019, 0.087158218, -8.33538607e-08, -0.0871545449, 0.996194959, -1.63912858e-07, -6.140138e-08, -1.69793566e-07, 1) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
			}, .2, false)
			rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
			rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end
		CFuncs.Sound.Create("1499494641", CHandle2, 1, .9)
		for i = 0, 3, 0.1 do
			swait()
			PlayAnimationFromTable({
	         CFrame.new(-0, -0.05818367, -0, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0 + .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(5.96046448e-07, 1.5581758, 8.94069672e-08, 0.813797593, 0.296197921, -0.500000417, -0.342019856, 0.939692736, 1.5155652e-07, 0.469846755, 0.171009943, 0.866025269) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.817315936, 0.23303245, -0.785861254, 0.185915083, 0.891520321, -0.41307044, -0.0543710254, -0.410421133, -0.91027379, -0.981060445, 0.19169265, -0.0278306026) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.895561576, 0.130057484, -0.917444825, 0.08583197, -0.981286108, 0.172367394, -0.0151339946, -0.174270019, -0.98458159, 0.996194661, 0.0818999708, -0.029808715) * CFrame.new(0, 0 + .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.593397737, -1.93364227, 0, 0.996194661, -0.087155968, 0, 0.087155968, 0.996194661, 0, 0, 0, 1) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.535535693, -1.93870425, 0, 0.996194661, 0.087155968, 0, -0.087155968, 0.996194661, 0, -0, 0, 1) * CFrame.new(0, 0 - .05 * math.cos(Sine/20), 0) * CFrame.Angles(0, 0, 0), 
			}, .2, false)
			rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
			rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end
	
		for i = 0, 2, 0.1 do
			swait()
			PlayAnimationFromTable({
	         CFrame.new(1.18533473e-15, -0.0581837296, 0, 1, -2.03722706e-14, -1.03739239e-11, -2.03722706e-14, 1, 0, -1.03739239e-11, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.044387538, 1.57391107, -0.046982944, 0.999063015, 0.000371292757, -0.043279916, 0.00926879048, 0.974929214, 0.222322285, 0.0422773995, -0.222515106, 0.974012196) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.961016774, 0.457461864, -0.771075964, 0.185922489, 0.633421421, -0.751139224, -0.0543839224, -0.756662488, -0.651540041, -0.9810583, 0.161985859, -0.106232598) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.729675055, 0.474317312, -0.926513851, 0.230951563, -0.530287445, 0.815755367, 0.197466299, -0.795426488, -0.572978079, 0.95271641, 0.293414325, -0.0789910555) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.593410492, -1.93365169, 2.15977366e-07, 0.99619478, -0.0871552229, 3.30831256e-08, 0.0871552229, 0.99619472, -1.44655488e-09, -3.28516023e-08, 4.32621761e-09, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.535539329, -1.93871331, -2.33122776e-07, 0.99619472, 0.0871552229, 1.4071702e-08, -0.0871552229, 0.99619472, -1.1611867e-09, -1.41399426e-08, -7.14521775e-11, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
			rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end
	CFuncs.Sound.Create("834658541", Torso, 5, .8)	
			for i = 0, 1, 0.1 do
			swait()
			PlayAnimationFromTable({
	         CFrame.new(1.18533473e-15, -0.0581837296, 0, 1, -2.03722706e-14, -1.03739239e-11, -2.03722706e-14, 1, 0, -1.03739239e-11, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.044387538, 1.57391107, -0.046982944, 0.999063015, 0.000371292757, -0.043279916, 0.00926879048, 0.974929214, 0.222322285, 0.0422773995, -0.222515106, 0.974012196) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.961016774, 0.457461864, -0.771075964, 0.185922489, 0.633421421, -0.751139224, -0.0543839224, -0.756662488, -0.651540041, -0.9810583, 0.161985859, -0.106232598) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.729675055, 0.474317312, -0.926513851, 0.230951563, -0.530287445, 0.815755367, 0.197466299, -0.795426488, -0.572978079, 0.95271641, 0.293414325, -0.0789910555) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.593410492, -1.93365169, 2.15977366e-07, 0.99619478, -0.0871552229, 3.30831256e-08, 0.0871552229, 0.99619472, -1.44655488e-09, -3.28516023e-08, 4.32621761e-09, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.535539329, -1.93871331, -2.33122776e-07, 0.99619472, 0.0871552229, 1.4071702e-08, -0.0871552229, 0.99619472, -1.1611867e-09, -1.41399426e-08, -7.14521775e-11, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
			rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, 0, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end
	
		for i = 0, 20, 0.1 do
			swait()
			PlayAnimationFromTable({
	         CFrame.new(4.59512179e-08, -0.0581841692, -5.25265932e-07, 1, -4.84756754e-07, -7.39878601e-07, 7.8975097e-07, 0.866025388, 0.500000298, 3.98364676e-07, -0.500000298, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.0125848781, 1.5465194, 0.0267901421, 0.999062896, 0.00414320733, -0.0430841409, -0.0131131858, 0.977599382, -0.210065722, 0.0412486866, 0.210433811, 0.976737618) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(1.82518578, 0.223591149, 0.169353649, 0.508977115, -0.858815074, 0.0581299476, 0.772701919, 0.426095456, -0.47050482, 0.379307687, 0.284393311, 0.880480766) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-1.73227763, 0.286245912, 0.248502895, 0.480647117, 0.87672931, 0.0180043653, -0.732817888, 0.412857741, -0.540857434, -0.481618822, 0.246767595, 0.84092176) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(0.681391835, -1.88535416, -0.586378455, 0.996194661, -0.087155968, 0, 0.0754792839, 0.862729847, -0.500000238, 0.0435780063, 0.498097569, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
	         CFrame.new(-0.606260061, -1.88110352, -0.606883287, 0.996194661, 0.0871560127, 4.12446752e-07, -0.0754791126, 0.862729847, -0.500000298, -0.04357839, 0.498097569, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), .3)
			rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), .3)
		end

end
	
Humanoid.WalkSpeed = 35
Humanoid.JumpPower = 70

--Start neccessary functions here

function TraceThing(COLOR,PLACE2) -- thanks shack dadi
	local FADE = EffectModel
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA'BasePart' and c ~= RootPart then
			local DIST = (c.Position-PLACE2).magnitude
			local FADER = c:Clone()
			FADER.Color = COLOR
			FADER.Size = Vector3.new(FADER.Size.X,FADER.Size.Y,DIST)
			FADER.CFrame = CFrame.new(c.Position,PLACE2) * CFrame.new(0,0,-DIST/2)
			FADER.Parent = FADE
			FADER.Anchored = true
			FADER.Transparency = 0.25
			FADER:BreakJoints()
			FADER.Material = "Glass"
			FADER.CanCollide = false
			FADER:ClearAllChildren()
			
			if FADER.Name == "Head" then
				FADER.Size = Vector3.new(1,1,1)
			end
			table.insert(Effects,{FADER,'Disappear',.01})
		end
	end

end



function Shadowdash()
	local target = Mouse.Target;
	if(target and target.Parent and GetTorso(target.Parent))then
		local torso = GetTorso(target.Parent)
		target = target.Parent;
		
		Attack = true
		for _, c in pairs(Character:children()) do
			if c.ClassName == "Part" and c ~= RootPart then
				c.Transparency = 1
			elseif(c:FindFirstChild'Handle')then
				c.Handle.Transparency = 1
			end
		end
		Claw1.Transparency = 1
		Claw2.Transparency = 1
		
		
		TraceThing(Color3.new(0,0,0),torso.Position)
		
		for i = 0, 1, 0.1 do
			swait()
			PlayAnimationFromTable({
				CFrame.new(0, 0, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0, 1.5, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
				CFrame.new(1.5, 0, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
				CFrame.new(-1.5, 0, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
				CFrame.new(0.5, -2, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -2, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
		end
		Attack = false
	end
end

function bulgelocated()
	Attack = true
		for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-1.08663478e-07, -0.206274316, -0.136812046, 1.00000417, 3.29175322e-07, 4.04612052e-07, 7.4505806e-07, 0.642787039, 0.766044915, -8.52160156e-08, -0.766045034, 0.64278692) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.55548012, 0.123723119, 1, 0, 0, 0, 0.965925813, -0.258819401, 0, 0.258819401, 0.965925813) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.57330072, 0.258584112, 0.288092852, 0.984807849, -0.0996005088, -0.142243534, 0.157378256, 0.858128428, 0.488720447, 0.0733864158, -0.503681719, 0.860766649) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.59246635, 0.145089045, 0.275537103, 0.984809101, 0.0995962769, 0.142238334, -0.157372132, 0.85812825, 0.488722742, -0.0733837485, -0.503682971, 0.860766172) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.593403816, -1.75248098, -0.817190289, 0.996194661, -0.0841870308, -0.0225579366, 0.0789908618, 0.981476307, -0.174541742, 0.0368342325, 0.172095656, 0.984391332) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.53553468, -1.75706613, -0.81932497, 0.996194899, 0.0858291388, 0.0151346531, -0.0789874196, 0.96252948, -0.259418607, -0.0368332267, 0.257236063, 0.965646386) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		end
		local Grabbed,Root,RootWeld,GrabWeld;
	Torso.Velocity = RootPart.CFrame.lookVector * 150
	for i = 0, 3, 0.1 do
		swait()
		if(not Grabbed)then 
			Grabbed = FindNearestTorso(Torso.Position,5)
			if(Grabbed)then
				print'owo'
				local torso = Grabbed
				Grabbed=Grabbed.Parent
				local Root = Grabbed:FindFirstChild'HumanoidRootPart'
				local RootWeld
				GrabWeld = Create("Weld"){Parent=torso,Part0=torso,Part1=Torso,C0=CFrame.new(0, -.8, -2) * CFrame.Angles(math.rad(0), math.rad(180), math.rad(0),0)}
				--GrabWeld.C0 = clerp(GrabWeld.C0, CFrame.new(0, -.8, 2) * CFrame.Angles(math.rad(40), math.rad(0), math.rad(0)), 1)
				if(Root)then 
					Root.Parent = nil
					RootWeld = (function()
						for _,v in next, Grabbed:GetDescendants() do
							if(v:IsA'JointInstance' and (v.Part0 == Root or v.Part1 == Root))then
								return {v,v.Part0,v.Part1,v.Parent}
							end;
						end
					end)()
					
				end
			end
		end
		PlayAnimationFromTable({
         CFrame.new(-1.73916547e-07, -0.333895028, 0.0282058977, 1.00000417, -7.91624188e-09, 5.21540642e-07, 7.4505806e-07, 6.70552254e-08, 1, -8.52160156e-08, -1, -7.63684511e-08) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45356226, 0.517724574, 1, 0, 0, 0, 0.422620863, -0.906306684, 0, 0.906306684, 0.422620863) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.34678912, 1.80891263, 0.00318957865, -0.984810352, 0.142212093, -0.0996212065, -0.157350063, -0.973534882, 0.165743217, -0.0734140277, 0.178901002, 0.981124341) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.35190487, 1.71961701, 0.127221942, -0.973497868, -0.150360048, 0.172318682, 0.163750991, -0.984274864, 0.0662473366, 0.159647986, 0.0927089974, 0.982811153) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.593404055, -1.7524848, -0.817189932, 0.996194661, -0.0841871127, -0.0225576442, 0.0789909735, 0.981476247, -0.174542084, 0.0368339866, 0.172096044, 0.984391332) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.488922983, -1.54355264, -0.0163928568, 0.996195018, 0.0667625517, 0.0560212247, -0.0789870024, 0.963284433, 0.256601483, -0.0368329994, -0.260050058, 0.964892447) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	end
	if(Grabbed)then
		Humanoid.AutoRotate = false
		Humanoid.WalkSpeed = 0
		Humanoid.JumpPower = 0
		local torso = GetTorso(Grabbed)
		repeat swait() local hit, pos = RayCastWithList(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, {Character,Grabbed}) until hit

		Torso.Velocity = RootPart.CFrame.upVector * 0
		RootPart.Anchored = true
		
	for i = 0, 4, 0.1 do
		swait()
		GrabWeld.C0 = GrabWeld.C0:lerp(CFrame.new(0, -.8, -1.4) * CFrame.Angles(math.rad(0), math.rad(180), math.rad(0),0),.2)	
		PlayAnimationFromTable({
         CFrame.new(-9.70123892e-07, -1.45215521, -0.52420032, 1.00000417, -7.91624188e-09, 5.21540642e-07, 7.4505806e-07, 6.70552254e-08, 1, -8.52160156e-08, -1, -7.63684511e-08) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.73141003, 0.08559376, 1, 0, 0, 0, 0.906306684, -0.422620863, 0, 0.422620863, 0.906306684) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.52372789, 0.87177819, -0.912220836, -0.984809101, -0.0734127834, -0.157358661, -0.150361016, -0.0927229673, 0.984273374, -0.086849004, 0.99298197, 0.0802759901) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.61212981, 0.866454244, -0.944487214, -0.973499656, 0.158554643, 0.164799243, 0.149206936, -0.105748929, 0.983134985, 0.17330794, 0.981670916, 0.0792890862) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.489993542, -1.28771627, -1.02503252, 0.999861896, -0.016504975, -0.0019627281, 0.0164339989, 0.999355972, -0.0319016613, 0.00248799985, 0.0318650007, 0.999489129) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.522175074, -1.35971284, -1.0364182, 0.998982906, -0.0116342641, 0.0435651727, 0.0117169991, 0.999930024, -0.00164423091, -0.043542996, 0.0021530115, 0.999049246) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	end	
		
		GetTorso(Grabbed).Anchored = true	
	--if(Root)then Root.Parent = Grabbed if(RootWeld)then RootWeld[1].Parent = RootWeld[4] RootWeld[1].Part0 = RootWeld[2] RootWeld[1].Part1 = RootWeld[3] end end
	if(GrabWeld)then GrabWeld:destroy() end
	for i = 0, 2, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-9.70122869e-07, -1.4521533, -0.524203837, 1.00000417, 3.2917589e-07, 4.04611598e-07, 7.4505806e-07, 0.642788112, 0.76604408, -8.52160156e-08, -0.766044199, 0.642787993) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.57221174, 0.216903687, 1, 0, 0, 0, 0.906307459, -0.422618926, 0, 0.422618926, 0.906307459) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.52372789, 0.081455946, -1.25917006, -0.984809101, -0.0734127834, -0.157358661, -0.171008676, 0.567247033, 0.805597305, 0.0301200971, 0.820269227, -0.571184218) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.40030229, 0.0340056717, -1.28360021, -0.994232476, 0.0721763074, 0.0793256387, 0.106234752, 0.561393857, 0.820701718, 0.0147023089, 0.824395418, -0.565823495) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.489993542, -1.64532626, 0.0425084829, 0.999861896, -0.016504975, -0.0019627281, 0.0141884256, 0.786033213, 0.618021607, -0.00865766034, -0.617964089, 0.7861588) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.522175074, -1.70779729, 0.0800650716, 0.998982906, -0.0116342641, 0.0435651727, -0.0190131795, 0.767374456, 0.640917361, -0.0408874042, -0.641093731, 0.76637274) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	end
local gag=Instance.new("Sound", Torso)
gag.SoundId = "rbxassetid://418658161"
gag.TimePosition = 2.5
gag.Pitch = .7
gag:Play()
CFuncs.Sound.Create("429400881", GetTorso(Grabbed), .5, 1)
		local gib=CFuncs.Part.Create(Torso, "Plastic", 0, .9, BrickColor.new("Crimson"), "gib", Vector3.new(.8,.1,.1))	
	gib.Anchored=true
    gib.CanCollide=true
	local smonk2 = Instance.new("ParticleEmitter",gib)
			smonk2.LightEmission = .1
			smonk2.Size = NumberSequence.new(0.2)
			smonk2.Texture = "http://www.roblox.com/asset/?ID=256293532"
			aaa2 = NumberSequence.new({NumberSequenceKeypoint.new(0, .6),NumberSequenceKeypoint.new(1, 1)})
			bbb2 = NumberSequence.new({NumberSequenceKeypoint.new(0, .5),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk2.Transparency = bbb2
			smonk2.Size = aaa2
			smonk2.ZOffset = 0
			smonk2.Acceleration = Vector3.new(0, 5, 0)
			smonk2.LockedToPart = false
			smonk2.EmissionDirection = "Back"
			smonk2.Lifetime = NumberRange.new(.2, .5)
			smonk2.Rate = 50
			smonk2.Rotation = NumberRange.new(-50, 50)
			smonk2.RotSpeed = NumberRange.new(-50, 50)
			smonk2.Speed = NumberRange.new(5)
			smonk2.VelocitySpread = 50
			smonk2.Enabled=true
			game:GetService("Debris"):AddItem(smonk2, 1)
local smonk = Instance.new("ParticleEmitter",gib)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .5),NumberSequenceKeypoint.new(1, 1)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .5),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 0
			smonk.Acceleration = Vector3.new(0, 0, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.5, .5)
			smonk.Rate = 50
			smonk.Rotation = NumberRange.new(-50, 50)
			smonk.RotSpeed = NumberRange.new(-50, 50)
			smonk.Speed = NumberRange.new(0)
			smonk.VelocitySpread = 0
			smonk.Enabled=true
	for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-1.39723795e-06, -2.26530323, -0.906234562, 1.00000417, -7.91624188e-09, 5.21540642e-07, 7.4505806e-07, 6.70552254e-08, 1, -8.52160156e-08, -1, -7.63684511e-08) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.1869829, 1.45231867, -0.342143714, 0.766043186, -0.556672871, -0.321392655, 0.582564116, 0.812565804, -0.0188681856, 0.271656066, -0.172777966, 0.946758091) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.54931295, 0.522058249, -0.445071995, -0.984809101, -0.0734127834, -0.157358661, -0.150361016, -0.0927229673, 0.984273374, -0.086849004, 0.99298197, 0.0802759901) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.42533684, 0.503732979, -0.492479533, -0.994232476, 0.0721763074, 0.0793256387, 0.0719300359, -0.0998590589, 0.992398202, 0.0795490369, 0.992380381, 0.0940914676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.490656108, -1.65896344, -0.550197124, 0.999861896, -0.016504975, -0.0019627281, 0.0164339989, 0.999355972, -0.0319016613, 0.00248799985, 0.0318650007, 0.999489129) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.537289202, -1.74116123, -0.569836617, 0.998982906, -0.0116342641, 0.0435651727, 0.0117169991, 0.999930024, -0.00164423091, -0.043542996, 0.0021530115, 0.999049246) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
		gib.CFrame = Head.CFrame * CFrame.new(0,-.2,-.65)
	end
	Grabbed:FindFirstChild'Head':BreakJoints()
		for i = 0, 2, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0646195412, -2.14434299, -0.804755151, 0.866028905, -6.39425798e-06, -0.500002384, 0.38303867, 0.642760158, 0.663431108, 0.321375936, -0.766067684, 0.55664885) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.165143013, 1.56247377, -0.141641736, 0.69066757, -0.423842132, -0.585949183, 0.329746336, 0.905689478, -0.266446948, 0.643619418, -0.00918829441, 0.765290678) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.990657806, 0.313646466, -1.20178688, -0.837813437, 0.346571505, -0.421849668, -0.171003163, 0.567217588, 0.80561924, 0.518485129, 0.747096121, -0.4159576) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.71981192, 0.0693554878, 0.00111401081, -0.853676558, 0.474718243, -0.214194372, 0.106240898, 0.56136322, 0.820721865, 0.509852469, 0.677874684, -0.529656947) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.612413466, -1.6245271, 0.208686799, 0.861576974, -0.323257267, 0.391395003, 0.014182019, 0.786055923, 0.617992878, -0.507428944, -0.526897609, 0.681832016) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.291646302, -1.85773659, 0.554903328, 0.904961646, -0.330603123, 0.267854929, 0.0925588906, 0.767398, 0.634455264, -0.415304095, -0.549365103, 0.725065827) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		gib.CFrame = Head.CFrame * CFrame.new(0,-.2,-.65)
		end
		gag:Destroy()
		CFuncs.Sound.Create("350906125", Head, 2, 1)
		gib.Velocity = Head.CFrame.lookVector * 30
		gib.Anchored=false
		game:GetService("Debris"):AddItem(gib, 2)
			for i = 0, 2, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0646212101, -2.14434872, -0.804751337, 0.852872849, 0.150377154, -0.500003099, 0.265605658, 0.699510276, 0.663429797, 0.449520022, -0.698622048, 0.556649804) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0920849219, 1.52588749, -0.308856517, 0.622915268, -0.232293427, -0.747005165, 0.444671035, 0.890768468, 0.0938047767, 0.643618345, -0.390603781, 0.658167362) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.24259305, 0.193697155, -0.882544816, -0.79538995, 0.0908054039, -0.599257469, -0.313889712, 0.784080684, 0.5354352, 0.5184865, 0.613980532, -0.595146894) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.6633426, -0.157583565, 0.0787617415, -0.859155536, 0.370026827, -0.353457391, -0.0436116196, 0.63526994, 0.771057844, 0.509853005, 0.677873433, -0.529658079) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.885205626, -1.49350178, 0.208688766, 0.846024811, -0.4548437, 0.278135866, 0.163576931, 0.717979968, 0.676570356, -0.507429719, -0.526898563, 0.681830764) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0353773236, -1.88015628, 0.554906487, 0.875140369, -0.458838046, 0.15361397, 0.248296916, 0.698329866, 0.671330154, -0.415305018, -0.549366057, 0.725064695) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
			end
		torso.Anchored = false	
	end
	Humanoid.WalkSpeed = 35
	Humanoid.JumpPower = 70
	Humanoid.AutoRotate = true
	Attack = false
end



function backhop()
				Attack = true
				RootPart.Anchored = false
			CFuncs.Sound.Create("158149887", Torso, 1, 1)
			Torso.Velocity=RootPart.CFrame.upVector*130
				for i = 0, .5, 0.1 do
		swait()
					PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
					}, .3, false)
				end
			Torso.Velocity=RootPart.CFrame.lookVector*-100
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.0724115372, 0.127895057, 0.313171744, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0169060901, 1.6077503, -0.180746168, 0.995960236, -0.0868240073, -0.0229110774, 0.089483425, 0.938373208, 0.333839238, -0.00748612173, -0.334540784, 0.94235158) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.70837259, 0.360651702, -0.922262371, 0.97732687, -0.133022964, 0.16473335, 0.196574748, 0.280932844, -0.939380288, 0.0786801279, 0.95046401, 0.300712109) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.48861361, 0.317329109, -0.925790071, 0.994410336, -0.000923748419, -0.105581462, -0.100659929, 0.293561995, -0.950625718, 0.0318728462, 0.955939651, 0.291828096) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.604445279, -1.94474173, -0.43701914, 0.94886601, -0.0119064255, -0.315454632, -0.0935085714, 0.943841219, -0.316891491, 0.301512092, 0.330185235, 0.894465506) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.577895403, -1.96714401, -0.475817055, 0.982055664, -0.0277231932, 0.186542824, 0.0885364786, 0.941134036, -0.326233506, -0.166517526, 0.336895287, 0.926700354) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .4, false)
	end
	Attack = false	
end

function righthop()
				Attack = true
			CFuncs.Sound.Create("158149887", Torso, 1, 1)
			Humanoid.Jump = true
			Torso.Velocity=RootPart.CFrame.upVector*130
				for i = 0, .5, 0.1 do
		swait()
					PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
					}, .3, false)
				end
			Torso.Velocity=RootPart.CFrame.rightVector*100
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.708232701, 0.127894983, 0.246774122, 0.76604414, -0.111618884, 0.633022666, 0, 0.984807849, 0.173648044, -0.642788053, -0.13302207, 0.754406214) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0324593484, 1.43977821, -0.119624585, 0.995960355, -0.0868238062, -0.0229113102, 0.0894833133, 0.938373625, 0.333838284, -0.00748568773, -0.334539831, 0.942351937) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.69410944, 0.329396009, -0.667013586, 0.977326989, -0.133022755, 0.164733544, 0.196574897, 0.280932605, -0.939380229, 0.0786799788, 0.95046401, 0.30071193) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.50714529, 0.0157378055, -0.431941032, 0.884520769, 0.235685706, -0.402585804, -0.362369925, 0.890611291, -0.274772465, 0.29378742, 0.388926923, 0.873169541) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.618915975, -1.85825384, -0.515439391, 0.98480773, 0.173648864, -1.81794167e-06, -0.17101045, 0.969846725, 0.173646331, 0.0301553011, -0.171007901, 0.984808087) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.523646474, -1.39458823, -0.171092927, 0.939692676, 0.342020273, 3.57627869e-07, -0.262003183, 0.719847083, 0.642786682, 0.219845772, -0.604022026, 0.766045213) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .4, false)
	end
	Attack = false	
end


function lefthop()
			Attack = true
			Humanoid.Jump = true
			CFuncs.Sound.Create("158149887", Torso, 1, 1)
			Torso.Velocity=RootPart.CFrame.upVector*130
				for i = 0, .5, 0.1 do
		swait()
					PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
					}, .3, false)
				end
			Torso.Velocity=RootPart.CFrame.rightVector*-100
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.0850991905, 0.127894506, -0.50492847, 0.866025388, 0.0868241936, -0.492404073, 0, 0.98480773, 0.173648342, 0.500000238, -0.150383845, 0.852868438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0324628651, 1.43977714, -0.119621098, 0.928060651, -0.0868241191, -0.362167478, 0.198266238, 0.938373506, 0.283100247, 0.315268338, -0.334539741, 0.888081789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.82837343, 0.425938904, -0.29435727, 0.642787039, -0.663414657, 0.383022308, 0.754407167, 0.635036588, -0.166127652, -0.133021653, 0.395739436, 0.908677995) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.822531939, 0.843190134, -1.47252464, 0.884521008, -0.355543315, -0.30201298, -0.362369865, -0.115946069, -0.924794376, 0.293787181, 0.927440405, -0.231394917) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.63746208, -1.78279781, -0.693231404, 0.984807849, -0.173648208, -1.1920929e-07, 0.171010107, 0.969846427, 0.173647493, -0.0301534832, -0.171009362, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.471737981, -1.40906096, -0.158949912, 1.00000012, 7.15255737e-07, -5.96046448e-07, -1.56462193e-07, 0.766044557, 0.642787457, 8.64267349e-07, -0.642787457, 0.766044617) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .4, false)
	end
	Attack = false	
end


Mouse.KeyDown:connect(function(Key)
	Key = Key:lower()
		if Attack == false and Key == 'z' then
		bulgelocated()
		elseif Attack == false and Key == 'v' then
		Shadowdash()
		
		elseif UIS:IsKeyDown(Enum.KeyCode.Space) and Attack == false and hit2 ~= nil then
	    backhop()
		elseif UIS:IsKeyDown(Enum.KeyCode.Space) and Attack == false and hit4 ~= nil then
	    righthop()
		elseif UIS:IsKeyDown(Enum.KeyCode.Space) and Attack == false and hit3 ~= nil then
	    lefthop()
end
end)




while true do
	swait()
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Part") then
			v.Material = "SmoothPlastic"
		elseif v:IsA("Accessory") then
			v:WaitForChild("Handle").Material = "SmoothPlastic"
		end
	end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA'Model' then
			for _, c in pairs(v:GetChildren()) do
				if c:IsA'Part' then
					c.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
				end
			end
		end
	end
	TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
	Velocity = RootPart.Velocity.y
	hit2, pos2 = RayCast(RootPart.Position, RootPart.CFrame.lookVector, 2.5, Character)
	hit3, pos3 = RayCast(RootPart.Position, RootPart.CFrame.rightVector, 2.5, Character)
	hit4, pos4 = RayCast(RootPart.Position, RootPart.CFrame.rightVector*-1, 2.5, Character)
	local hit, pos = RayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, Character)
	if RootPart.Velocity.y > 1 and hit == nil then 
		Anim = "Jump"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .1, false)
		rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end	
	elseif RootPart.Velocity.y < -1 and hit == nil then 
		Anim = "Fall"
	 if Attack == false then
		PlayAnimationFromTable({
         CFrame.new(-2.52783309e-07, -0.458231509, -0.301980734, 1.00000429, 4.77244157e-07, 2.760749e-07, 7.4505806e-07, 0.866025507, 0.500000238, -9.0803951e-08, -0.500000298, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.58647513, 0.183157548, 1, 0, 0, 0, 0.999881387, -0.0154127777, 0, 0.0154127777, 0.999881387) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.5891608, 0.361017317, -0.212302506, 0.984807849, -0.173521757, 0.0066198064, 0.150383562, 0.83318758, -0.532149851, 0.0868240371, 0.525060833, 0.846624494) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.60230875, 0.275375485, -0.212160379, 0.984799087, 0.173571184, 0.00662776129, -0.150421292, 0.871290267, -0.467147648, -0.0868580788, 0.459049612, 0.884154558) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.561567485, -1.34639406, -0.926938355, 0.996194661, -0.0871569663, 0, 0.0754801482, 0.862729847, -0.500000238, 0.0435785055, 0.498097569, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.52978605, -1.61792982, 0.214719117, 0.996196747, 0.0413986593, 0.0766689852, -0.0754585043, 0.849865317, 0.521569967, -0.0435660109, -0.525371671, 0.849756956) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
		rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
	end
	elseif TorsoVelocity < 1 and hit ~= nil then
		Anim = "Idle"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-5.67257132e-07, -0.45822984+.1*math.cos(Sine/8), -0.301978469, 1.00000858, 1.24809378e-06, 3.60371928e-07, 1.29640421e-06, 0.939693034, 0.342019886, -9.0338709e-08, -0.342020005, 0.939692616) * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0 + 5 * math.cos(Sine/8)), 0, 0), 
         CFrame.new(7.63999651e-07, 1.46904099, 0.0165809691, 1.00000429, 5.49886977e-07, 4.0045915e-08, 7.30156898e-07, 0.961822271, -0.273675978, 1.71363354e-07, 0.273675948, 0.961821973) * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0 - 10 * math.cos(Sine/8)), 0, 0), 
         CFrame.new(1.62868655, 0.111030877+.1*math.cos(Sine/8), -0.35657984, 0.9848122, -0.173521966, 0.00661981478, 0.163176492, 0.911705673, -0.377050072, 0.0593912303, 0.372401953, 0.926169157) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.64265788, 0.0163868144+.1*math.cos(Sine/8), -0.326656789, 0.9848032, 0.173572466, 0.00662781065, -0.163218126, 0.93776685, -0.306518316, -0.0594178699, 0.300777197, 0.951841593) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.561572433, -1.5318737-.1*math.cos(Sine/8), -0.555493951+math.rad(0 + 5 * math.cos(Sine/8)), 0.996203482, -0.0868237838, -0.00759620313, 0.0819010884, 0.962364078, -0.259130269, 0.0298094228, 0.257522076, 0.965812385) * CFrame.Angles(math.rad(0 - 5 * math.cos(Sine/8)), 0, 0), 
         CFrame.new(-0.554138422, -1.84922051-.1*math.cos(Sine/8)+math.rad(0 + 5 * math.cos(Sine/8)), 0.483894289+math.rad(0 + 5 * math.cos(Sine/8)), 0.996200979, 0.0651250109, 0.0578867495, -0.0818765685, 0.926896632, 0.366277635, -0.0298006982, -0.369623899, 0.928703368) * CFrame.Angles(math.rad(0 - 5 * math.cos(Sine/8)), 0, 0), 
		}, .2, false)
		rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		end
	elseif TorsoVelocity > 2 and hit ~= nil then
		Anim = "Walk"
            if Attack == false then
		PlayAnimationFromTable({
         CFrame.new(2.77100942e-09, 0.00148168206, -0.301976591, 1.00000024, 2.79512946e-08, 5.46405587e-10, 2.23517453e-08, 0.939692974, 0.342020005, -1.49011612e-08, -0.342019856, 0.939692736) * CFrame.new(0, 0+.1*math.cos(Sine/4), 0) * CFrame.Angles(0, 0 + .2 * math.cos(Sine/8), 0), 
         CFrame.new(4.8082363e-08, 1.5315367, 0.0343731791, 1.00000024, 3.09263193e-08, -5.39672307e-09, 2.79512946e-08, 0.984808028, -0.173648089, 5.46405587e-10, 0.173648283, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0 - 2 * math.cos(Sine/15)), 0, 0), 
         CFrame.new(1.66816366, 0.125450149, 0.167713135, 0.975411952, -0.217704624, -0.0342991352, 0.22028406, 0.9678877, 0.12111339, 0.0068307519, -0.125690982, 0.992045999) * CFrame.new(0, .1, 0 - 2 * math.cos(Sine/8)/2) * CFrame.Angles(math.rad(0 + 160 * math.cos(Sine/8)/2), 0, 0), 
         CFrame.new(-1.58983934, 0.0268005617, -0.146883398, 0.986049891, 0.166255936, -0.00805497169, -0.16625604, 0.981399775, -0.0959867239, -0.00805321336, 0.0959868878, 0.995350063) * CFrame.new(0, .1, 0 + 2 * math.cos(Sine/8)/2) * CFrame.Angles(math.rad(0 - 160 * math.cos(Sine/8)/2), 0, 0),
		 CFrame.new(.5, -1.64 - 1 * math.cos(Sine / 6) / 2 -.1*math.cos(Sine/4), 0 + 3 *  math.sin(Sine / 6) / 3) * CFrame.Angles(math.rad(-90 *  math.sin(Sine / 6)), math.rad(-3), math.rad(0)),
		 CFrame.new(-.5, -1.64 + 1 * math.cos(Sine / 6) / 2 -.1*math.cos(Sine/4), 0 -  3 * math.sin(Sine / 6) / 3) * CFrame.Angles(math.rad(90 *  math.sin(Sine / 6)), math.rad(3), math.rad(0)),}, .2, false)
		rCHandle2Weld.C0 = clerp(rCHandle2Weld.C0, CFrame.new(0, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
		rCHandle1Weld.C0 = clerp(rCHandle1Weld.C0, CFrame.new(.1, -1.5, .5) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 1)
end
end
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Ice" then
							if Thing[6] <= Thing[5] then
								Thing[6] = Thing[6] + .05
								Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, .4, 0)
							else
								Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							end
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block4" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.new(0, -Thing[7].Scale.Y, 0) * CFrame.fromEulerAnglesXYZ(3.14, 0, 0)
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2Fire" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							if Thing[1].Transparency >= .3 then
								Thing[1].BrickColor = BrickColor.new("Bright red")
							else
								Thing[1].BrickColor = BrickColor.new("Bright yellow")
							end
						elseif Thing[2] == "Cylinder" then
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, -.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							Mesh = Thing[10]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[1].CFrame = Thing[1].CFrame * Thing[11] * CFrame.new(0, 0, .2)
							Thing[1].Rotation = Vector3.new(0, 0, 0)
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end	
Humanoid.Health = math.huge
	if Attack == false and hit == nil and hit2 ~= nil then
		Torso.Velocity=RootPart.CFrame.upVector*55
		--[[RootPart.Anchored = true
		Humanoid.AutoRotate = false
		local nPos = RootPart.CFrame
		if(UIS:IsKeyDown(Enum.KeyCode.W))then
			nPos = nPos * CFrame.new(0,.5,0)
		end
		if(UIS:IsKeyDown(Enum.KeyCode.A))then
			nPos = nPos * CFrame.new(-.5,0,0)
		end
		if(UIS:IsKeyDown(Enum.KeyCode.S))then
			nPos = nPos * CFrame.new(0,-.5,0)
		end
		if(UIS:IsKeyDown(Enum.KeyCode.D))then
			nPos = nPos * CFrame.new(.5,0,0)
		end
		if(nPos == RootPart.CFrame)then
			nPos = nPos * CFrame.new(0,-.05,0)
		end
		RootPart.CFrame = nPos
		Humanoid.Jump = false]]
	elseif Attack == false and hit == nil and hit3 ~= nil or hit4 ~= nil then 
		Torso.Velocity=RootPart.CFrame.lookVector*35
		Humanoid.Jump = false
	elseif Attack == false then
		Humanoid.AutoRotate = true
		RootPart.Anchored = false
	end	
end