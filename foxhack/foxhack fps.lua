wait(math.random( 5, 20 ))

local wex = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Time = Instance.new("TextLabel")
local Ping = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
local RenderFPS = Instance.new("TextLabel")
local PhysicsFPS = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")

wex.Name = "wex"
wex.Parent = game.CoreGui
syn.protect_gui(wex)
wex.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame.Parent = wex
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.600
Frame.BorderColor3 = Color3.fromRGB(177, 177, 177)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(-0.000400535762, 0, 0.832970917, 0)
Frame.Size = UDim2.new(0.175742552, 0, 0.16648531, 0)

Time.Name = "Time"
Time.Parent = Frame
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(-0.00305776438, 0, 0.850159287, 0)
Time.Size = UDim2.new(0, 150, 0, 22)
Time.Font = Enum.Font.Code
Time.Text = "time value"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.TextSize = 15.000
Time.TextStrokeTransparency = 0.000
Time.TextWrapped = true
Time.TextXAlignment = Enum.TextXAlignment.Left
Time.TextYAlignment = Enum.TextYAlignment.Top

Ping.Name = "Ping"
Ping.Parent = Frame
Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ping.BackgroundTransparency = 1.000
Ping.Position = UDim2.new(0.00280064344, 0, 0.704295456, 0)
Ping.Size = UDim2.new(0, 150, 0, 22)
Ping.Font = Enum.Font.Code
Ping.Text = "ping value (wip)"
Ping.TextColor3 = Color3.fromRGB(255, 255, 255)
Ping.TextScaled = true
Ping.TextSize = 15.000
Ping.TextStrokeTransparency = 0.000
Ping.TextWrapped = true
Ping.TextXAlignment = Enum.TextXAlignment.Left
Ping.TextYAlignment = Enum.TextYAlignment.Top

Name.Name = "Name"
Name.Parent = Frame
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00559762865, 0, 0.138083234, 0)
Name.Size = UDim2.new(0, 199, 0, 22)
Name.Font = Enum.Font.Code
Name.Text = "name value"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 15.000
Name.TextStrokeTransparency = 0.000
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
Name.TextYAlignment = Enum.TextYAlignment.Top

RenderFPS.Name = "Render FPS"
RenderFPS.Parent = Frame
RenderFPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RenderFPS.BackgroundTransparency = 1.000
RenderFPS.Position = UDim2.new(-0.00584833045, 0, 0.337632656, 0)
RenderFPS.Size = UDim2.new(0, 199, 0, 22)
RenderFPS.Font = Enum.Font.Code
RenderFPS.Text = "fps value"
RenderFPS.TextColor3 = Color3.fromRGB(255, 255, 255)
RenderFPS.TextScaled = true
RenderFPS.TextSize = 15.000
RenderFPS.TextStrokeTransparency = 0.000
RenderFPS.TextWrapped = true
RenderFPS.TextXAlignment = Enum.TextXAlignment.Left
RenderFPS.TextYAlignment = Enum.TextYAlignment.Top

PhysicsFPS.Name = "Physics FPS"
PhysicsFPS.Parent = Frame
PhysicsFPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PhysicsFPS.BackgroundTransparency = 1.000
PhysicsFPS.Position = UDim2.new(0.00471498305, 0, 0.479554415, 0)
PhysicsFPS.Size = UDim2.new(0, 147, 0, 22)
PhysicsFPS.Font = Enum.Font.Code
PhysicsFPS.Text = "phy fps value"
PhysicsFPS.TextColor3 = Color3.fromRGB(255, 255, 255)
PhysicsFPS.TextScaled = true
PhysicsFPS.TextSize = 15.000
PhysicsFPS.TextStrokeTransparency = 0.000
PhysicsFPS.TextWrapped = true
PhysicsFPS.TextXAlignment = Enum.TextXAlignment.Left
PhysicsFPS.TextYAlignment = Enum.TextYAlignment.Top

Version.Name = "Version"
Version.Parent = Frame
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.Position = UDim2.new(0.00456395745, 0, -0.0017092526, 0)
Version.Size = UDim2.new(0, 199, 0, 22)
Version.Font = Enum.Font.Code
Version.Text = "Foxhack indev (tm)"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextScaled = true
Version.TextSize = 15.000
Version.TextStrokeTransparency = 0.000
Version.TextWrapped = true
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.TextYAlignment = Enum.TextYAlignment.Top

local function FXCYRCH_fake_script() -- Time.LocalScript 
	local script = Instance.new('LocalScript', Time)

	while wait(1) do
	local TIME_ZONE = 1
	local text = script.Parent
	local date = os.date("!*t")
	local hour = (date.hour + TIME_ZONE)
	local ampm = hour < 12 and "" or "" --i know, i suck at lua
	local timestamp = string.format("%02i:%02i %s", ((hour - 1) % 24) + 1, date.min, ampm)
		text.Text = "Time: "..timestamp
	end
end
coroutine.wrap(FXCYRCH_fake_script)()
local function IOZIN_fake_script() -- Ping.LocalScript 
	local script = Instance.new('LocalScript', Ping)

	--coming soon i havent got a method to do it only on client side yet

end
coroutine.wrap(IOZIN_fake_script)()
local function LPSYYX_fake_script() -- Name.LocalScript 
	local script = Instance.new('LocalScript', Name)

	local player = game:GetService("Players").LocalPlayer.Name
	local text = script.Parent
	text.Text = "Welcome, "..player
end
coroutine.wrap(LPSYYX_fake_script)()
local function FHAZOW_fake_script() -- RenderFPS.LocalScript 
	local script = Instance.new('LocalScript', RenderFPS)

	while wait(1) do
		local fps = 1/game:GetService("RunService").RenderStepped:Wait()
		local roundfps = math.floor(fps)
		script.Parent.Text = "Render FPS "..roundfps
	end
	
end
coroutine.wrap(FHAZOW_fake_script)()
local function EJOQFLD_fake_script() -- PhysicsFPS.LocalScript 
	local script = Instance.new('LocalScript', PhysicsFPS)

	while wait(10) do
		script.Parent.Text = "Physics FPS "..game:GetService("Workspace"):GetRealPhysicsFPS()
	end
	
end
coroutine.wrap(EJOQFLD_fake_script)()
local function ZCUSDMB_fake_script() -- Version.LocalScript 
	local script = Instance.new('LocalScript', Version)

	while true do
		wait(1)
		script.Parent.TextColor3 = Color3.new(math.random(),math.random(),math.random())
		wait(1) 
		script.Parent.TextStrokeColor3 = Color3.new(math.random(),math.random(),math.random())
	end 
end
coroutine.wrap(ZCUSDMB_fake_script)()
local function DUVGPPC_fake_script() -- Frame.Draggable 
	local script = Instance.new('LocalScript', Frame)

	local frame = script.Parent
	
	frame.Draggable = true
	frame.Active = true
end
coroutine.wrap(DUVGPPC_fake_script)()
