if not game:IsLoaded() then
	game.Loaded:Wait()
end
--Set FPS Element
local FPSText = Drawing.new("Text")
FPSText.Font = 2
FPSText.Size = 13
FPSText.Visible = true
FPSText.Center = true
FPSText.Outline = true
FPSText.OutlineColor = Color3.fromRGB(0, 0, 0)
--Set Ping element
local PingText = Drawing.new("Text")
PingText.Font = 2
PingText.Size = 13
PingText.Visible = true
PingText.Center = false
PingText.Outline = true
PingText.OutlineColor = Color3.fromRGB(0, 0, 0)
--set locals
-- local GameName = (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)).Name
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local TimeFunction = RunService:IsRunning() and time or os.clock
local LastIteration, Start
local FrameUpdateTable = {}
--fps function
local function FramerateUpd()
	LastIteration = TimeFunction()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local fps = math.floor(
		TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)
	)
	FPSText.Position = Vector2.new(camera.ViewportSize.X - FPSText.TextBounds.X - 2, 2)
	-- if fps is under *x* then set text color to *y*
	if fps <= 30 then
		FPSText.Color = Color3.fromRGB(255, 0, 0)
	elseif fps <= 60 then
		FPSText.Color = Color3.fromRGB(255, 217, 0)
	elseif fps <= 144 then
		FPSText.Color = Color3.fromRGB(0, 255, 0)
	else
		FPSText.Color = Color3.fromRGB(255, 255, 255)
	end
	FPSText.Text = fps .. " fps" --.. GameName
end
local function PingUpd()
	PingText.Position = Vector2.new(camera.ViewportSize.X - FPSText.TextBounds.X - 2, 15)
	local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("[^.]+"))
	if ping <= 60 then
		PingText.Color = Color3.fromRGB(255, 255, 255)
	elseif ping <= 100 then
		PingText.Color = Color3.fromRGB(0, 255, 0)
	elseif ping <= 300 then
		PingText.Color = Color3.fromRGB(255, 217, 0)
	else
		PingText.Color = Color3.fromRGB(255, 0, 0)
	end
	PingText.Text = ping .. "ms"
end
Start = TimeFunction()
RunService.Heartbeat:Connect(FramerateUpd)
RunService.Heartbeat:Connect(PingUpd)
