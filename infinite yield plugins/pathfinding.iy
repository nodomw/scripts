--[[
    IY Plugin written by tostring
    Stealing credit and or releasing without credit can have consequences
    You are free to edit and release an edited version with credits
--]]
local ps = game:GetService("PathfindingService")
local plrs = game:GetService("Players")
local rs = game:GetService("RunService")
local plr = plrs.LocalPlayer
local vectorlist = {}
local vectorfolder = Instance.new("Folder",workspace)
local function FileReadAllLines(filename)
	local lines = {}
	for line in readfile(filename):gmatch("[^\r\n]+") do
		table.insert(lines,line)
	end
	return lines
end
local function nearestplayer(rp, dist)
	local nearest = nil
	for _,v in next, plrs:GetPlayers() do
		if v ~= plr and v.Character then
			while not v.Character:FindFirstChild("HumanoidRootPart") do
				rs.Stepped:Wait()
			end
			local distance = (v.Character.HumanoidRootPart.Position - rp.Position).Magnitude
			if distance < dist and distance > 0 then
				dist = distance
				nearest = v.Character.HumanoidRootPart
			end
		end
	end
	return nearest, dist
end
local function pathfindpos(pos)
    local waypointparts = Instance.new("Folder",plr.Character)
    local path = ps:CreatePath()
	path.Blocked:Connect(function()
		plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
	path:ComputeAsync(plr.Character.HumanoidRootPart.Position, pos)
	if path.Status ~= Enum.PathStatus.Success then
		return false
	end
	local waypoints = path:GetWaypoints()
	for _,waypoint in next, waypoints do
		local part = Instance.new("Part",waypointparts)
		local sha = Instance.new("SphereHandleAdornment",part)
		part.Shape = "Ball"
		part.Material = "Neon"
		part.Size = Vector3.new(1, 1, 1)
		part.Transparency = .8
		part.Color = Color3.fromRGB(0, 255, 255)
		part.Position = waypoint.Position
		part.Anchored = true
		part.CanCollide = false
		sha.Adornee = part
		sha.AlwaysOnTop = true
		sha.ZIndex = 1
		sha.Radius = .5
		sha.Transparency = part.Transparency
		sha.Color3 = part.Color
	end
	for _,waypoint in next, waypoints do
		plr.Character.Humanoid:MoveTo(waypoint.Position)
		if waypoint.Action == Enum.PathWaypointAction.Jump then
			plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
		plr.Character.Humanoid.MoveToFinished:Wait()
	end
	waypointparts:Destroy()
end
local function pathfindlist(list)
	local waypointparts = Instance.new("Folder",plr.Character)
	local vectorpoints = Instance.new("Folder",plr.Character)
	for _,v in next, list do
		local part = Instance.new("Part")
		local split = string.split(v,",")
		part.Shape = "Ball"
		part.Material = "Neon"
		part.Size = Vector3.new(1, 1, 1)
		part.Transparency = .8
		part.Color = Color3.fromRGB(0, 255, 0)
		part.Position = Vector3.new(split[1], split[2], split[3])
		part.Anchored = true
		part.CanCollide = false
		part.Parent = vectorpoints
	end
	for _,v in next, list do
		local split = string.split(v,",")
		local path = ps:CreatePath()
		path.Blocked:Connect(function()
			plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
		path:ComputeAsync(plr.Character.HumanoidRootPart.Position, Vector3.new(split[1], split[2], split[3]))
		if path.Status ~= Enum.PathStatus.Success then
			return false
		end
		local waypoints = path:GetWaypoints()
		for _,waypoint in next, waypoints do
			local part = Instance.new("Part",waypointparts)
			local sha = Instance.new("SphereHandleAdornment",part)
			part.Shape = "Ball"
			part.Material = "Neon"
			part.Size = Vector3.new(1, 1, 1)
			part.Transparency = .8
			part.Color = Color3.fromRGB(0, 255, 255)
			part.Position = waypoint.Position
			part.Anchored = true
			part.CanCollide = false
			sha.Adornee = part
			sha.AlwaysOnTop = true
			sha.ZIndex = 1
			sha.Radius = .5
			sha.Transparency = part.Transparency
			sha.Color3 = part.Color
		end
		for _,waypoint in next, waypoints do
			plr.Character.Humanoid:MoveTo(waypoint.Position)
			if waypoint.Action == Enum.PathWaypointAction.Jump then
				plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
			plr.Character.Humanoid.MoveToFinished:Wait()
		end
		for _,v in next, waypointparts:GetChildren() do
			v:Destroy()
		end
	end
	vectorpoints:Destroy()
end
local function pathfindtonearestplr(maxdistance)
	local waypointparts = Instance.new("Folder",plr.Character)
	local near, dist = nearestplayer(plr.Character.HumanoidRootPart,maxdistance)
	if dist < maxdistance then
		local path = ps:CreatePath()
		path.Blocked:Connect(function()
			plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
		path:ComputeAsync(plr.Character.HumanoidRootPart.Position, near.Position)
		if path.Status ~= Enum.PathStatus.Success then
			return false
		end
		local waypoints = path:GetWaypoints()
		for _,waypoint in next, waypoints do
			local part = Instance.new("Part",waypointparts)
			local sha = Instance.new("SphereHandleAdornment",part)
			part.Shape = "Ball"
			part.Material = "Neon"
			part.Size = Vector3.new(1, 1, 1)
			part.Transparency = .8
			part.Color = Color3.fromRGB(0, 255, 255)
			part.Position = waypoint.Position
			part.Anchored = true
			part.CanCollide = false
			sha.Adornee = part
			sha.AlwaysOnTop = true
			sha.ZIndex = 1
			sha.Radius = .5
			sha.Transparency = part.Transparency
			sha.Color3 = part.Color
		end
		for _,waypoint in next, waypoints do
			plr.Character.Humanoid:MoveTo(waypoint.Position)
			if waypoint.Action == Enum.PathWaypointAction.Jump then
				plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
			plr.Character.Humanoid.MoveToFinished:Wait()
		end
		waypointparts:Destroy()
	end
end

local Plugin = {
    ["PluginName"] = "Pathfinding",
    ["PluginDescription"] = "Can be used to create paths for a walkbot or walk to paths or nearest player.",
    ["Commands"] = {
        ["pfnearest"] = {
            ["ListName"] = "pfnearest [Max Distance]",
            ["Description"] = "Automatically gets path to nearest player and walks over to them.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                pathfindtonearestplr(tonumber(getstring(1)))
            end
        },
        ["pfpos"] = {
            ["ListName"] = "pfpos [X Y Z]",
            ["Description"] = "Automatically gets path to position and walks to it.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                pathfindpos(Vector3.new(tonumber(args[1]),tonumber(args[2]),tonumber(args[3])))
            end
        },
        ["pflist"] = {
            ["ListName"] = "pflist [filename]",
            ["Description"] = "Automatically follows all the paths inside of the file.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                pathfindlist(FileReadAllLines(getstring(1)))
            end
        },
        ["markpos"] = {
            ["ListName"] = "markpos",
            ["Description"] = "Marks your position and adds it to a table which can saved.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                local part = Instance.new("Part",vectorfolder)
                part.Shape = "Ball"
                part.Material = "Neon"
                part.Size = Vector3.new(1, 1, 1)
                part.Transparency = .8
                part.Color = Color3.fromRGB(0, 255, 0)
                part.Position = plr.Character.HumanoidRootPart.Position
                part.Anchored = true
                part.CanCollide = false
                table.insert(vectorlist,plr.Character.HumanoidRootPart.Position)
            end
        },
        ["savelist"] = {
            ["ListName"] = "savelist [FileName]",
            ["Description"] = "Saves all the positions you have marked into a file.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                local combine = ""
                for _,v in next, vectorlist do
                    combine = combine .. tostring(v) .. "\n"
                end
                writefile(getstring(1),combine)
                notify("Pathfinding","List saved to " .. getstring(1))
            end
        },
        ["clearlist"] = {
            ["ListName"] = "clearlist",
            ["Description"] = "Clears your marked positions so you can start over.",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                vectorfolder:Destroy()
                vectorfolder = Instance.new("Folder",workspace)
                vectorlist = {}
                notify("Pathfinding", "List cleared.")
            end
        }
     }
}

return Plugin