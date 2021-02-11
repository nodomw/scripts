-- Gui to Lua
-- Version: 3.2

-- Instances:
syn.protect.gui(wex)

local wex = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Version = Instance.new("TextLabel")
local PhysicsFPS = Instance.new("TextLabel")
local RenderFPS = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
local Time = Instance.new("TextLabel")
local playercount = Instance.new("TextLabel")

--Properties:

wex.Name = "wex"
wex.Parent = game.CoreGui
wex.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = wex
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderColor3 = Color3.fromRGB(255, 170, 127)
Frame.Position = UDim2.new(0.213089556, 0, 0.0223071277, 0)
Frame.Size = UDim2.new(0.573019922, 0, 0.0435255729, 0)

Version.Name = "Version"
Version.Parent = Frame
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.Position = UDim2.new(-0.000835609622, 0, -0.026709253, 0)
Version.Size = UDim2.new(0, 199, 0, 22)
Version.Font = Enum.Font.Code
Version.Text = "Foxhack indev (tm)"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextScaled = true
Version.TextSize = 15.000
Version.TextStrokeTransparency = 0.000
Version.TextWrapped = true

PhysicsFPS.Name = "Physics FPS"
PhysicsFPS.Parent = Frame
PhysicsFPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PhysicsFPS.BackgroundTransparency = 1.000
PhysicsFPS.Position = UDim2.new(0.359159827, 0, 0, 0)
PhysicsFPS.Size = UDim2.new(0, 136, 0, 40)
PhysicsFPS.Font = Enum.Font.Code
PhysicsFPS.Text = "pfps"
PhysicsFPS.TextColor3 = Color3.fromRGB(255, 255, 255)
PhysicsFPS.TextScaled = true
PhysicsFPS.TextSize = 15.000
PhysicsFPS.TextStrokeTransparency = 0.000
PhysicsFPS.TextWrapped = true
PhysicsFPS.TextYAlignment = Enum.TextYAlignment.Top

RenderFPS.Name = "Render FPS"
RenderFPS.Parent = Frame
RenderFPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RenderFPS.BackgroundTransparency = 1.000
RenderFPS.Position = UDim2.new(0.215159833, 0, 0, 0)
RenderFPS.Size = UDim2.new(0, 136, 0, 40)
RenderFPS.Font = Enum.Font.Code
RenderFPS.Text = "fps"
RenderFPS.TextColor3 = Color3.fromRGB(255, 255, 255)
RenderFPS.TextScaled = true
RenderFPS.TextSize = 15.000
RenderFPS.TextStrokeTransparency = 0.000
RenderFPS.TextWrapped = true
RenderFPS.TextYAlignment = Enum.TextYAlignment.Top

Name.Name = "Name"
Name.Parent = Frame
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00127795339, 0, 0.438083172, 0)
Name.Size = UDim2.new(0, 199, 0, 22)
Name.Font = Enum.Font.Code
Name.Text = "name"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 15.000
Name.TextStrokeTransparency = 0.000
Name.TextWrapped = true

Time.Name = "Time"
Time.Parent = Frame
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(0.854159832, 0, 0, 0)
Time.Size = UDim2.new(0, 136, 0, 40)
Time.Font = Enum.Font.Code
Time.Text = "time"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.TextSize = 15.000
Time.TextStrokeTransparency = 0.000
Time.TextWrapped = true
Time.TextYAlignment = Enum.TextYAlignment.Top

playercount.Name = "player count"
playercount.Parent = Frame
playercount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playercount.BackgroundTransparency = 1.000
playercount.Position = UDim2.new(0.50565654, 0, 0, 0)
playercount.Size = UDim2.new(0, 136, 0, 40)
playercount.Font = Enum.Font.Code
playercount.Text = "players"
playercount.TextColor3 = Color3.fromRGB(255, 255, 255)
playercount.TextScaled = true
playercount.TextSize = 15.000
playercount.TextStrokeTransparency = 0.000
playercount.TextWrapped = true
playercount.TextYAlignment = Enum.TextYAlignment.Top

-- Scripts:

local function YUJEIZ_fake_script() -- Frame.Draggable 
	local script = Instance.new('LocalScript', Frame)

	local frame = script.Parent
	
	frame.Draggable = true
	frame.Active = true
end
coroutine.wrap(YUJEIZ_fake_script)()
local function RSPX_fake_script() -- Version.LocalScript 
	local script = Instance.new('LocalScript', Version)

	while true do
		wait(1)
		script.Parent.TextColor3 = Color3.new(math.random(),math.random(),math.random())
		wait() 
		script.Parent.TextStrokeColor3 = Color3.new(math.random(),math.random(),math.random())
	end 
end
coroutine.wrap(RSPX_fake_script)()
local function CSXK_fake_script() -- PhysicsFPS.LocalScript 
	local script = Instance.new('LocalScript', PhysicsFPS)

	while wait(10) do
		script.Parent.Text = "Physics FPS\n"..game:GetService("Workspace"):GetRealPhysicsFPS()
	end
	
end
coroutine.wrap(CSXK_fake_script)()
local function CLAJX_fake_script() -- RenderFPS.LocalScript 
	local script = Instance.new('LocalScript', RenderFPS)

	while wait(1) do
		local fps = 1/game:GetService("RunService").RenderStepped:Wait()
		local roundfps = math.floor(fps)
		script.Parent.Text = "Render FPS\n"..roundfps
	end
	
end
coroutine.wrap(CLAJX_fake_script)()
local function KWVLQ_fake_script() -- Name.LocalScript 
	local script = Instance.new('LocalScript', Name)

	local player = game:GetService("Players").LocalPlayer.Name
	local text = script.Parent
	text.Text = "Welcome, "..player
end
coroutine.wrap(KWVLQ_fake_script)()
local function NQFMJ_fake_script() -- Time.LocalScript 
	local script = Instance.new('LocalScript', Time)

	while wait(1) do
	local TIME_ZONE = 1
	local text = script.Parent
	local date = os.date("!*t")
	local hour = (date.hour + TIME_ZONE)
	--i know, i suck at lua
	local ampm = hour < 12 and "" or ""
	local timestamp = string.format("%02i:%02i %s", ((hour - 1) % 24) + 1, date.min, ampm)
		text.Text = "Time\n"..timestamp
	end
end
coroutine.wrap(NQFMJ_fake_script)()
local function XAYAQY_fake_script() -- playercount.LocalScript 
	local script = Instance.new('LocalScript', playercount)

	while wait(1) do
		local playerCount = #game.Players:GetPlayers()
		script.Parent.Text = "Players:\n"..playerCount
	end
end
coroutine.wrap(XAYAQY_fake_script)()
