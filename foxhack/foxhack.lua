--foxhack very p $$$$$$$$
-- Instances:

local wex = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local heartbeatms = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local RenderFPS = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local kbpsout = Instance.new("TextLabel")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local kbpsin = Instance.new("TextLabel")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local playercount = Instance.new("TextLabel")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local Time = Instance.new("TextLabel")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local Name = Instance.new("TextLabel")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local memory = Instance.new("TextLabel")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local Watermark = Instance.new("TextLabel")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
local Roundify = Instance.new("ImageLabel")
local Roundify_2 = Instance.new("ImageLabel")
local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
syn.protect_gui(wex)
--Properties:

wex.Name = "wex"
wex.Parent = game.CoreGui

Frame.Parent = wex
Frame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
Frame.BackgroundTransparency = 0.250
Frame.BorderColor3 = Color3.fromRGB(102, 255, 102)
Frame.Position = UDim2.new(0.0744629428, 0, 0.44727549, 0)
Frame.Size = UDim2.new(0.102304369, 0, 0.365607828, 0)
Frame.ZIndex = 2

heartbeatms.Name = "heartbeatms"
heartbeatms.Parent = Frame
heartbeatms.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
heartbeatms.BackgroundTransparency = 1.000
heartbeatms.BorderColor3 = Color3.fromRGB(130, 203, 255)
heartbeatms.Position = UDim2.new(0.0323914103, 0, 0.531666577, 0)
heartbeatms.Size = UDim2.new(0, 150, 0, 21)
heartbeatms.ZIndex = 5
heartbeatms.Font = Enum.Font.Arial
heartbeatms.Text = "heartbeatms"
heartbeatms.TextColor3 = Color3.fromRGB(175, 255, 255)
heartbeatms.TextScaled = true
heartbeatms.TextSize = 15.000
heartbeatms.TextStrokeColor3 = Color3.fromRGB(163, 106, 199)
heartbeatms.TextStrokeTransparency = 0.500
heartbeatms.TextWrapped = true
heartbeatms.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint.Parent = heartbeatms
UIAspectRatioConstraint.AspectRatio = 7.143

RenderFPS.Name = "Render FPS"
RenderFPS.Parent = Frame
RenderFPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RenderFPS.BackgroundTransparency = 1.000
RenderFPS.BorderColor3 = Color3.fromRGB(130, 203, 255)
RenderFPS.Position = UDim2.new(0.0323914103, 0, 0.23388885, 0)
RenderFPS.Size = UDim2.new(0, 150, 0, 21)
RenderFPS.ZIndex = 5
RenderFPS.Font = Enum.Font.Arial
RenderFPS.Text = "fps"
RenderFPS.TextColor3 = Color3.fromRGB(175, 255, 255)
RenderFPS.TextScaled = true
RenderFPS.TextSize = 15.000
RenderFPS.TextStrokeColor3 = Color3.fromRGB(204, 52, 43)
RenderFPS.TextStrokeTransparency = 0.500
RenderFPS.TextWrapped = true
RenderFPS.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_2.Parent = RenderFPS
UIAspectRatioConstraint_2.AspectRatio = 7.143

kbpsout.Name = "kbpsout"
kbpsout.Parent = Frame
kbpsout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
kbpsout.BackgroundTransparency = 1.000
kbpsout.BorderColor3 = Color3.fromRGB(130, 203, 255)
kbpsout.Position = UDim2.new(0.0323914103, 0, 0.384888858, 0)
kbpsout.Size = UDim2.new(0, 150, 0, 21)
kbpsout.ZIndex = 5
kbpsout.Font = Enum.Font.Arial
kbpsout.Text = "kbps"
kbpsout.TextColor3 = Color3.fromRGB(175, 255, 255)
kbpsout.TextScaled = true
kbpsout.TextSize = 15.000
kbpsout.TextStrokeColor3 = Color3.fromRGB(251, 169, 34)
kbpsout.TextStrokeTransparency = 0.500
kbpsout.TextWrapped = true
kbpsout.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_3.Parent = kbpsout
UIAspectRatioConstraint_3.AspectRatio = 7.143

kbpsin.Name = "kbpsin"
kbpsin.Parent = Frame
kbpsin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
kbpsin.BackgroundTransparency = 1.000
kbpsin.BorderColor3 = Color3.fromRGB(130, 203, 255)
kbpsin.Position = UDim2.new(0.0323914103, 0, 0.448888868, 0)
kbpsin.Size = UDim2.new(0, 150, 0, 21)
kbpsin.ZIndex = 5
kbpsin.Font = Enum.Font.Arial
kbpsin.Text = "kbps"
kbpsin.TextColor3 = Color3.fromRGB(175, 255, 255)
kbpsin.TextScaled = true
kbpsin.TextSize = 15.000
kbpsin.TextStrokeColor3 = Color3.fromRGB(57, 113, 237)
kbpsin.TextStrokeTransparency = 0.500
kbpsin.TextWrapped = true
kbpsin.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_4.Parent = kbpsin
UIAspectRatioConstraint_4.AspectRatio = 7.143

playercount.Name = "player count"
playercount.Parent = Frame
playercount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playercount.BackgroundTransparency = 1.000
playercount.BorderColor3 = Color3.fromRGB(130, 203, 255)
playercount.BorderSizePixel = 2
playercount.Position = UDim2.new(0.449999988, 0, 0.921999991, 0)
playercount.Size = UDim2.new(0, 83, 0, 21)
playercount.ZIndex = 5
playercount.Font = Enum.Font.Arial
playercount.Text = "players"
playercount.TextColor3 = Color3.fromRGB(59, 59, 59)
playercount.TextScaled = true
playercount.TextSize = 15.000
playercount.TextStrokeColor3 = Color3.fromRGB(181, 216, 246)
playercount.TextStrokeTransparency = 0.500
playercount.TextWrapped = true
playercount.TextXAlignment = Enum.TextXAlignment.Right
playercount.TextYAlignment = Enum.TextYAlignment.Bottom

UIAspectRatioConstraint_5.Parent = playercount
UIAspectRatioConstraint_5.AspectRatio = 3.952

Time.Name = "Time"
Time.Parent = Frame
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.BorderColor3 = Color3.fromRGB(130, 203, 255)
Time.BorderSizePixel = 2
Time.Position = UDim2.new(0, 5, 0.921999991, 0)
Time.Size = UDim2.new(0, 58, 0, 20)
Time.ZIndex = 5
Time.Font = Enum.Font.Arial
Time.Text = "time"
Time.TextColor3 = Color3.fromRGB(0, 0, 0)
Time.TextScaled = true
Time.TextSize = 15.000
Time.TextStrokeColor3 = Color3.fromRGB(176, 47, 48)
Time.TextStrokeTransparency = 0.500
Time.TextWrapped = true
Time.TextXAlignment = Enum.TextXAlignment.Left
Time.TextYAlignment = Enum.TextYAlignment.Bottom

UIAspectRatioConstraint_6.Parent = Time
UIAspectRatioConstraint_6.AspectRatio = 2.900

Name.Name = "Name"
Name.Parent = Frame
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(130, 203, 255)
Name.BorderSizePixel = 2
Name.Position = UDim2.new(0.0297738425, 0, 0.0997031555, 0)
Name.Size = UDim2.new(0, 148, 0, 30)
Name.ZIndex = 5
Name.Font = Enum.Font.Arial
Name.Text = "Name"
Name.TextColor3 = Color3.fromRGB(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Name.TextStrokeTransparency = 0.500
Name.TextWrapped = true
Name.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_7.Parent = Name
UIAspectRatioConstraint_7.AspectRatio = 4.933

memory.Name = "memory"
memory.Parent = Frame
memory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
memory.BackgroundTransparency = 1.000
memory.BorderColor3 = Color3.fromRGB(130, 203, 255)
memory.Position = UDim2.new(0.0324809961, 0, 0.30056867, 0)
memory.Size = UDim2.new(0, 150, 0, 21)
memory.ZIndex = 5
memory.Font = Enum.Font.Arial
memory.Text = "mem"
memory.TextColor3 = Color3.fromRGB(175, 255, 255)
memory.TextScaled = true
memory.TextSize = 15.000
memory.TextStrokeColor3 = Color3.fromRGB(25, 136, 68)
memory.TextStrokeTransparency = 0.500
memory.TextWrapped = true
memory.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_8.Parent = memory
UIAspectRatioConstraint_8.AspectRatio = 7.143

Watermark.Name = "Watermark"
Watermark.Parent = Frame
Watermark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Watermark.BackgroundTransparency = 1.000
Watermark.BorderColor3 = Color3.fromRGB(130, 203, 255)
Watermark.BorderSizePixel = 2
Watermark.Position = UDim2.new(0.231838256, 0, 0.0340661369, 0)
Watermark.Size = UDim2.new(0, 86, 0, 22)
Watermark.ZIndex = 5
Watermark.Font = Enum.Font.Arial
Watermark.Text = "Foxhack"
Watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
Watermark.TextScaled = true
Watermark.TextSize = 16.000
Watermark.TextStrokeColor3 = Color3.fromRGB(169, 209, 223)
Watermark.TextStrokeTransparency = 0.500
Watermark.TextWrapped = true
Watermark.TextYAlignment = Enum.TextYAlignment.Top

UIAspectRatioConstraint_9.Parent = Watermark
UIAspectRatioConstraint_9.AspectRatio = 3.909

Roundify.Name = "Roundify"
Roundify.Parent = Frame
Roundify.Active = true
Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
Roundify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Roundify.BackgroundTransparency = 1.000
Roundify.BorderSizePixel = 0
Roundify.Position = UDim2.new(0.4880023, 0, 0.5, 0)
Roundify.Size = UDim2.new(1, 24, 1, 24)
Roundify.Image = "rbxassetid://3570695787"
Roundify.ImageColor3 = Color3.fromRGB(16, 16, 16)
Roundify.ImageTransparency = 0.100
Roundify.ScaleType = Enum.ScaleType.Slice
Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
Roundify.SliceScale = 0.120

Roundify_2.Name = "Roundify"
Roundify_2.Parent = Roundify
Roundify_2.AnchorPoint = Vector2.new(0.5, 0.5)
Roundify_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Roundify_2.BackgroundTransparency = 1.000
Roundify_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Roundify_2.Size = UDim2.new(0.882000029, 24, 0.940999985, 24)
Roundify_2.ZIndex = 0
Roundify_2.Image = "rbxassetid://3570695787"
Roundify_2.ImageColor3 = Color3.fromRGB(102, 255, 102)
Roundify_2.ImageTransparency = 0.150
Roundify_2.ScaleType = Enum.ScaleType.Slice
Roundify_2.SliceCenter = Rect.new(100, 100, 100, 100)
Roundify_2.SliceScale = 0.120

UIAspectRatioConstraint_10.Parent = Frame
UIAspectRatioConstraint_10.AspectRatio = 0.480

-- Scripts:

local function VXFKH_fake_script() -- heartbeatms.LocalScript 
	local script = Instance.new('LocalScript', heartbeatms)

	while wait(1) do
		local Stats = game:GetService("Stats")
		local heartbeatms = math.floor(Stats.HeartbeatTimeMs)
		script.Parent.Text = "HeartMS - "..heartbeatms
	end
	
end
coroutine.wrap(VXFKH_fake_script)()
local function YGKDIHE_fake_script() -- RenderFPS.LocalScript 
	local script = Instance.new('LocalScript', RenderFPS)

	while wait(1) do
		local fps = 1/game:GetService("RunService").RenderStepped:Wait()
		local roundfps = math.floor(fps)
		script.Parent.Text = "FPS - "..roundfps
	end
	
end
coroutine.wrap(YGKDIHE_fake_script)()
local function XOEFEY_fake_script() -- kbpsout.LocalScript 
	local script = Instance.new('LocalScript', kbpsout)

	while wait(1) do
		local Stats = game:GetService("Stats")
		local kbpsin = math.floor(Stats.DataSendKbps)
		script.Parent.Text = "UP - "..kbpsin
	end
	
end
coroutine.wrap(XOEFEY_fake_script)()
local function AFZNFL_fake_script() -- kbpsin.LocalScript 
	local script = Instance.new('LocalScript', kbpsin)

	while wait(1) do
		local Stats = game:GetService("Stats")
		local kbpsin = math.floor(Stats.DataReceiveKbps)
		script.Parent.Text = "DOWN - "..kbpsin
	end
	
end
coroutine.wrap(AFZNFL_fake_script)()
local function KRHG_fake_script() -- playercount.LocalScript 
	local script = Instance.new('LocalScript', playercount)

	while wait(1) do
		local playerCount = #game.Players:GetPlayers()
		script.Parent.Text = playerCount
	end
end
coroutine.wrap(KRHG_fake_script)()
local function HEAD_fake_script() -- Time.LocalScript 
	local script = Instance.new('LocalScript', Time)

	while wait(1) do
	local TIME_ZONE = 1
	local text = script.Parent
	local date = os.date("!*t")
	local hour = (date.hour + TIME_ZONE)
	--i know, i suck at lua
	local ampm = hour < 12 and "" or ""
	local timestamp = string.format("%02i:%02i %s", ((hour - 1) % 24) + 1, date.min, ampm)
		text.Text = timestamp
	end
end
coroutine.wrap(HEAD_fake_script)()
local function WEFSXPN_fake_script() -- Name.LocalScript 
	local script = Instance.new('LocalScript', Name)

	local player = game:GetService("Players").LocalPlayer.Name
	local text = script.Parent
	text.Text = "Welcome, "..player.."!"
end
coroutine.wrap(WEFSXPN_fake_script)()
local function BHHATK_fake_script() -- memory.LocalScript 
	local script = Instance.new('LocalScript', memory)

	while wait(1) do
		local Stats = game:GetService("Stats")
		local memory = math.floor(Stats:GetTotalMemoryUsageMb())
		script.Parent.Text = "MEM - "..memory.."MB"
	end
	
end
coroutine.wrap(BHHATK_fake_script)()
local function SSQQP_fake_script() -- Watermark.LocalScript 
	local script = Instance.new('LocalScript', Watermark)

	while true do
		wait(1)
		script.Parent.TextColor3 = Color3.new(math.random(),math.random(),math.random())
		wait() 
		script.Parent.TextStrokeColor3 = Color3.new(math.random(),math.random(),math.random())
	end 
end
coroutine.wrap(SSQQP_fake_script)()
local function FYBTNOP_fake_script() -- Frame.Draggable 
	local script = Instance.new('LocalScript', Frame)

	local frame = script.Parent
	frame.Draggable = true
	frame.Active = true
end
coroutine.wrap(FYBTNOP_fake_script)()
