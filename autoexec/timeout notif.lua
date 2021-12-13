local autoreconnect = false

local gui = Instance.new("ScreenGui")
local text = Instance.new("TextLabel")

text.BackgroundColor3 = Color3.fromRGB(41,41,41)
text.BorderSizePixel = 0
text.BackgroundTransparency = .2
text.Position = UDim2.new(0, 0, .2, 0)
text.Size = UDim2.new(1, 0, .075, -36)
text.Text = "Server not responding... 0.00"
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextScaled = true

text.Parent = gui
gui.Enabled = false
syn.protect_gui(gui)
gui.Parent = game:GetService("CoreGui")

local count = 0
while wait() do
	-- count++
	if count >= 10 / .03 or game:IsLoaded() then
		break
	end
end

local new, last
while wait() do
	new = game:GetService("Stats").DataReceiveKbps
	if new == last and new ~= 0 then
		gui.Enabled = tonumber(string.sub(text.Text, -4, -1)) + .03 >= 1 and true or false
		text.Text = "Server not responding... " .. string.format("%0.2f", tonumber(string.sub(text.Text, -4, -1)) + .03)
	elseif new == last and autoreconnect then
		gui.Enabled = true
		text.Text = "Reconnecting in  5.00 seconds."
		while wait() do
			text.Text = "Reconnecting in " .. string.format("%0.2f", tonumber(string.sub(text.Text, -13, -10)) - .03) .. " seconds."
			if tonumber(string.format("%0.2f", tonumber(string.sub(text.Text, -13, -10)) - .03)) < 0 then
				break
			end
		end
		text.Text = "Reconnecting..."
		while true do
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
			wait(5)
		end
	else
		text.Text = "Server not responding... 0.00"
		gui.Enabled = false
	end
	last = new
end