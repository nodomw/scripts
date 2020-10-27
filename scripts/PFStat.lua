-- made by detourious xddddddd
-- fixed by wally
print'PFS LOADED'
local PFS = Instance.new("ScreenGui") do
	local Frame = Instance.new("Frame")
	local Experience = Instance.new("TextLabel")
	local Rank = Instance.new("TextLabel")
	local Kills = Instance.new("TextLabel")
	local Progress = Instance.new("TextLabel")
	local Money = Instance.new("TextLabel")
	local Details = Instance.new("TextLabel")
	local Bar = Instance.new("Frame")
	local Filler = Instance.new("Frame")
	
	PFS.Name = "PFS"
	PFS.Parent = game:GetService'CoreGui';
	PFS.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	PFS.ResetOnSpawn = false
	
	Frame.Parent = PFS
	Frame.AnchorPoint = Vector2.new(1, 0.5)
	Frame.BackgroundColor3 = Color3.new(1, 1, 1)
	Frame.BackgroundTransparency = 1
	Frame.Position = UDim2.new(1, -5, 0.5, 0)
	Frame.Size = UDim2.new(0, 200, 0, 100)
	
	Experience.Name = "Experience"
	Experience.Parent = Frame
	Experience.BackgroundColor3 = Color3.new(1, 1, 1)
	Experience.BackgroundTransparency = 1
	Experience.Position = UDim2.new(0, 0, 0, 15)
	Experience.Size = UDim2.new(0, 200, 0, 15)
	Experience.Font = Enum.Font.Code
	Experience.Text = "Experience: 3503283"
	Experience.TextColor3 = Color3.new(1, 1, 1)
	Experience.TextSize = 14
	Experience.TextStrokeTransparency = 0.69999998807907
	Experience.TextXAlignment = Enum.TextXAlignment.Right
	
	Rank.Name = "Rank"
	Rank.Parent = Frame
	Rank.BackgroundColor3 = Color3.new(1, 1, 1)
	Rank.BackgroundTransparency = 1
	Rank.Size = UDim2.new(0, 200, 0, 15)
	Rank.Font = Enum.Font.Code
	Rank.Text = "Rank: 84"
	Rank.TextColor3 = Color3.new(1, 1, 1)
	Rank.TextSize = 14
	Rank.TextStrokeTransparency = 0.69999998807907
	Rank.TextXAlignment = Enum.TextXAlignment.Right
	
	Kills.Name = "Kills"
	Kills.Parent = Frame
	Kills.BackgroundColor3 = Color3.new(1, 1, 1)
	Kills.BackgroundTransparency = 1
	Kills.Position = UDim2.new(0, 0, 0, 30)
	Kills.Size = UDim2.new(0, 200, 0, 15)
	Kills.Font = Enum.Font.Code
	Kills.Text = "Kills: 20012"
	Kills.TextColor3 = Color3.new(1, 1, 1)
	Kills.TextSize = 14
	Kills.TextStrokeTransparency = 0.69999998807907
	Kills.TextXAlignment = Enum.TextXAlignment.Right
	
	Progress.Name = "Progress"
	Progress.Parent = Frame
	Progress.BackgroundColor3 = Color3.new(1, 1, 1)
	Progress.BackgroundTransparency = 1
	Progress.Position = UDim2.new(0, 0, 0, 75)
	Progress.Size = UDim2.new(0, 200, 0, 15)
	Progress.Font = Enum.Font.Code
	Progress.Text = "Progress"
	Progress.TextColor3 = Color3.new(1, 1, 1)
	Progress.TextSize = 14
	Progress.TextStrokeTransparency = 0.69999998807907
	Progress.TextXAlignment = Enum.TextXAlignment.Right
	
	Money.Name = "Money"
	Money.Parent = Frame
	Money.BackgroundColor3 = Color3.new(1, 1, 1)
	Money.BackgroundTransparency = 1
	Money.Position = UDim2.new(0, 0, 0, 45)
	Money.Size = UDim2.new(0, 200, 0, 15)
	Money.Font = Enum.Font.Code
	Money.Text = "Credits: 3503283"
	Money.TextColor3 = Color3.new(1, 1, 1)
	Money.TextSize = 14
	Money.TextStrokeTransparency = 0.69999998807907
	Money.TextXAlignment = Enum.TextXAlignment.Right
	
	Details.Name = "Details"
	Details.Parent = Frame
	Details.BackgroundColor3 = Color3.new(1, 1, 1)
	Details.BackgroundTransparency = 1
	Details.Position = UDim2.new(0, 0, 0, 90)
	Details.Size = UDim2.new(0, 200, 0, 15)
	Details.Font = Enum.Font.Code
	Details.Text = "24385/85000 XP"
	Details.TextColor3 = Color3.new(1, 1, 1)
	Details.TextSize = 14
	Details.TextStrokeTransparency = 0.69999998807907
	Details.TextXAlignment = Enum.TextXAlignment.Right
	
	Bar.Name = "Bar"
	Bar.Parent = Frame
	Bar.BackgroundColor3 = Color3.new(0.266667, 0.266667, 0.266667)
	Bar.BorderSizePixel = 0
	Bar.Position = UDim2.new(0, 0, 0, 63)
	Bar.Size = UDim2.new(1, 0, 0, 10)
	
	Filler.Name = "Filler"
	Filler.Parent = Bar
	Filler.AnchorPoint = Vector2.new(1, 0)
	Filler.BackgroundColor3 = Color3.new(1, 1, 1)
	Filler.BorderSizePixel = 0
	Filler.Position = UDim2.new(1, 0, 0, 0)
	Filler.Size = UDim2.new(0, 0, 0, 10)
end

local localPlayer = game:GetService("Players").LocalPlayer

local function calculateRank(points)
	points=points or 0
	return math.floor((1/4+points/500)^0.5-1/2)
end

local function calculateExp(rank)
	rank=rank or 0
	return math.floor(500*((rank+1/2)^2-1/4))
end

local ui = PFS.Frame
local ts = game:GetService("TweenService")

local stats = nil;
for i, v in next, getgc(true) do
	if type(v) == 'table' then
		if rawget(v, 'settings') and rawget(v, 'unlocks') then
			stats = v.stats;
			break;
		end
	end
end

if stats then
	while game:GetService('RunService').Heartbeat:wait() do
		local exp = stats.experience;
		local kills = stats.totalkills
		local money = stats.money

		local expHave = exp - calculateExp(calculateRank(exp))
		local expNeed = calculateExp(calculateRank(exp) + 1) - calculateExp(calculateRank(exp))

		ui.Experience.Text = "Experience: " .. exp
		ui.Rank.Text = "Rank: ".. calculateRank(exp)
		ui.Kills.Text = "Kills: ".. kills
		ui.Money.Text = "Credits: ".. money
		ui.Details.Text = expHave .. " / " .. expNeed .. " EXP"

		ui.Bar.Filler.Size = ui.Bar.Filler.Size:lerp(UDim2.new(expHave / expNeed, 0, 0, 10), 0.02)
		ui.Bar.Filler.BackgroundColor3 = ui.Bar.Filler.BackgroundColor3:lerp(Color3.fromHSV(expHave / expNeed * 0.4, 0.75, 1), 0.02)
	end
end
