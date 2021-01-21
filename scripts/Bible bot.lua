--https://v3rmillion.net/showthread.php?tid=986482
--https://v3rmillion.net/showthread.php?tid=986645

local timerbb = 30;
local ads_toggle = true;
local greet_toggle = true;

--skidded stuff lolololol
math.randomseed(tick()) --idk I guess yeah I am dumb lol
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
-- Instances:

local BibleBotsynapsed = Instance.new("ScreenGui")
local main = Instance.new("ImageLabel")
local label = Instance.new("TextLabel")
local timer = Instance.new("TextBox")
local timeLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local ads = Instance.new("TextLabel")
local ads_on = Instance.new("TextButton")
local ads_off = Instance.new("TextButton")
local mid = Instance.new("Frame")
local greet = Instance.new("TextLabel")
local greet_on = Instance.new("TextButton")
local greet_off = Instance.new("TextButton")

--Properties:

BibleBotsynapsed.Name = "BibleBot synapsed"
BibleBotsynapsed.Parent = game.CoreGui

main.Name = "main"
main.Parent = BibleBotsynapsed
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BackgroundTransparency = 1.000
main.Position = UDim2.new(0.49999997, 0, 0.5, 0)
main.Size = UDim2.new(0, 500, 0, 300)
main.Image = "rbxassetid://3570695787"
main.ImageColor3 = Color3.fromRGB(15, 15, 15)
main.ScaleType = Enum.ScaleType.Slice
main.SliceCenter = Rect.new(100, 100, 100, 100)
main.SliceScale = 0.250
main.Active = true

label.Name = "label"
label.Parent = main
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1.000
label.BorderSizePixel = 0
label.Position = UDim2.new(0.300000012, 0, 0, 0)
label.Size = UDim2.new(0, 200, 0, 25)
label.Font = Enum.Font.SourceSansLight
label.Text = "BibleBot Synapsed"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.TextSize = 14.000
label.TextWrapped = true

timer.Name = "timer"
timer.Parent = main
timer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
timer.BorderSizePixel = 0
timer.Position = UDim2.new(0.0799999982, 0, 0.13333334, 0)
timer.Size = UDim2.new(0, 60, 0, 30)
timer.Font = Enum.Font.SourceSansLight
timer.Text = "30"
timer.TextColor3 = Color3.fromRGB(255, 255, 255)
timer.TextScaled = true
timer.TextSize = 14.000
timer.TextWrapped = true

timeLabel.Name = "timeLabel"
timeLabel.Parent = timer
timeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
timeLabel.BackgroundTransparency = 1.000
timeLabel.BorderSizePixel = 0
timeLabel.Position = UDim2.new(1.41666663, 0, 0, 0)
timeLabel.Size = UDim2.new(0, 375, 0, 30)
timeLabel.Font = Enum.Font.SourceSansLight
timeLabel.Text = "Delay between each ad."
timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeLabel.TextScaled = true
timeLabel.TextSize = 14.000
timeLabel.TextWrapped = true
timeLabel.TextXAlignment = Enum.TextXAlignment.Left

TextButton.Parent = timer
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(5.5999999, 0, 0, 0)
TextButton.Size = UDim2.new(0, 100, 0, 30)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.Text = "Apply"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
    timerbb = tonumber(timer)
end)


ads.Name = "ads"
ads.Parent = main
ads.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ads.BackgroundTransparency = 1.000
ads.BorderSizePixel = 0
ads.Position = UDim2.new(0.150000021, 0, 0.333333343, 0)
ads.Size = UDim2.new(0, 100, 0, 30)
ads.Font = Enum.Font.SourceSansLight
ads.Text = "Ads (default on)"
ads.TextColor3 = Color3.fromRGB(255, 255, 255)
ads.TextScaled = true
ads.TextSize = 14.000
ads.TextWrapped = true

ads_on.Name = "ads_on"
ads_on.Parent = ads
ads_on.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ads_on.BorderSizePixel = 0
ads_on.Position = UDim2.new(-0.5, 0, 1.16666663, 0)
ads_on.Size = UDim2.new(0, 75, 0, 30)
ads_on.Font = Enum.Font.SourceSansLight
ads_on.Text = "On"
ads_on.TextColor3 = Color3.fromRGB(255, 255, 255)
ads_on.TextScaled = true
ads_on.TextSize = 14.000
ads_on.TextWrapped = true
ads_on.MouseButton1Click:Connect(function()
    ads_toggle = true
end)

ads_off.Name = "ads_off"
ads_off.Parent = ads
ads_off.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ads_off.BorderSizePixel = 0
ads_off.Position = UDim2.new(0.75000006, 0, 1.16666663, 0)
ads_off.Size = UDim2.new(0, 75, 0, 30)
ads_off.Font = Enum.Font.SourceSansLight
ads_off.Text = "Off"
ads_off.TextColor3 = Color3.fromRGB(255, 255, 255)
ads_off.TextScaled = true
ads_off.TextSize = 14.000
ads_off.TextWrapped = true
ads_off.MouseButton1Click:Connect(function()
    ads_toggle = false
end)

mid.Name = "mid"
mid.Parent = main
mid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mid.Position = UDim2.new(0.49000001, 0, 0.233333334, 0)
mid.Size = UDim2.new(0, 10, 0, 230)

greet.Name = "greet"
greet.Parent = main
greet.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
greet.BackgroundTransparency = 1.000
greet.BorderSizePixel = 0
greet.Position = UDim2.new(0.649999976, 0, 0.333333343, 0)
greet.Size = UDim2.new(0, 100, 0, 30)
greet.Font = Enum.Font.SourceSansLight
greet.Text = "Greeting (default on)"
greet.TextColor3 = Color3.fromRGB(255, 255, 255)
greet.TextScaled = true
greet.TextSize = 14.000
greet.TextWrapped = true

greet_on.Name = "greet_on"
greet_on.Parent = greet
greet_on.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
greet_on.BorderSizePixel = 0
greet_on.Position = UDim2.new(-0.5, 0, 1.16666663, 0)
greet_on.Size = UDim2.new(0, 75, 0, 30)
greet_on.Font = Enum.Font.SourceSansLight
greet_on.Text = "On"
greet_on.TextColor3 = Color3.fromRGB(255, 255, 255)
greet_on.TextScaled = true
greet_on.TextSize = 14.000
greet_on.TextWrapped = true
greet_on.MouseButton1Click:Connect(function()
    greet_toggle = true
end)

greet_off.Name = "greet_off"
greet_off.Parent = greet
greet_off.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
greet_off.BorderSizePixel = 0
greet_off.Position = UDim2.new(0.75000006, 0, 1.16666663, 0)
greet_off.Size = UDim2.new(0, 75, 0, 30)
greet_off.Font = Enum.Font.SourceSansLight
greet_off.Text = "Off"
greet_off.TextColor3 = Color3.fromRGB(255, 255, 255)
greet_off.TextScaled = true
greet_off.TextSize = 14.000
greet_off.TextWrapped = true
greet_off.MouseButton1Click:Connect(function()
    greet_toggle = false
end)


--dragging Api made by me (P3rZ3r0 lol)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local gui = main
local speed = 0.1

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	local goal = {}
	goal.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	local tweenInfo = TweenInfo.new(speed)
	local tween = TweenService:Create(gui, tweenInfo, goal)
	tween:Play()
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
--End

--skidded from bbot itself okk
local is_agaisnt_furry = true
is_furry = function(Player)
    if not is_agaisnt_furry then return false end
    local furry_hat = {"rbxassetid://3908012443";"rbxassetid//188699722"}
    for _,v in pairs(Player.Character:GetChildren()) do
        if v.ClassName == "Accessory" then
            pcall(function()
                if v.Handle.SpecialMesh.MeshId == furry_hat[1] or furry_hat[2] then
                    return true
                else
                    return false
                end
            end)
        end
    end
end

--again skidded lmao
endpoint = "http://labs.bible.org/api/?passage=random&type=json"
getVerse = function()
    local response = HttpService:JSONDecode(game:HttpGet(endpoint))
    return
        response[1].bookname .. ": " .. response[1].chapter .. ":" .. response[1].verse .. " " .. response[1].text
end

--skidded again not sure why there is tick but I am too much not smart
local t = tick()
chat = function(content)
    if t - tick() < 0.70 then
        wait(1)
    end
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(content, "All")
    t = tick()
end

commands = {};
 
commands.verse = function()
    local bible = getVerse()
    if string.len(bible) > 200 then
        repeat
            game:GetService("RunService").Heartbeat:Wait()
            bible = getVerse()
        until string.len(bible) < 200
    end
    chat(bible)
end
 
commands.askgod = function()
    local ans = {
        "Yes"; "No"; "Yes my son"; "."; "I-"; "I am ashamed of you";
        "You should be ashamed of what you are asking"; "Perhaps"; "Standing still is the answer";
        "Keep praying";"Be patient my son";"Sufference may be tought but you will be able to over come it.";
        "hol up soemthing is wrong with what you are saying";"hol up";
    }
    chat(ans[math.random(#ans)])
end
 
commands.help = function()
    chat("!ask god [question] - Ask your lord a question | !verse - Study the holy bible | !help - Show this help menu | !confess [confession], confess something to god | !pray [pray] pray for something")
    wait(0.5)
end
 
commands.confesion = function(Player,message)
 
    local ans = {"You sin have been forgiven.";"I-";".";"Warning 1 - Comitting a sin";"Warning 2- Comitting a sin agaist the bible";
                 "Warning 3 - Comitting a sin - This is your last warning";"Warning 2 - Comitting a sin";"Satan, please show " .. Player.Name ..
                " the way to hell as " .. Player.Name .. " got the maximum number of warning"};
    chat(ans[math.random(#ans)])
end
 
commands.pray = function(Player,message)

    local possibleAns = {"...";":O";".";"I-";"Ok"}
    chat(possibleAns[math.random(#possibleAns)])
end
 

--too lazy to add blacklist add it maybe urself kkk
onPlayerChat = function(chat_type,recipient,message)
    message = string.lower(message)
    chat_type = nil
    if message:match(".*!ask.-god.*") then
        commands:askgod()
    elseif message:match(".*!verse.*") then
        commands:verse()
    elseif message:match(".*!help.*") then
        commands:help()
    elseif message:match(".*!pray.*") then
        commands.pray(recipient,message)
    elseif message:match(".*!confess.*") then
        commands.confesion(recipient,message)
    end
end

Players.PlayerChatted:Connect(onPlayerChat)


--don't mind if I do
Players.PlayerAdded:Connect(function(NewPlayer)
    local welcomeSentence = {
        "Hello my son, study the bible by chatting !verse";
        "Welcome " .. NewPlayer.Name .. "! May you study the bible with chatting !verse";
        "Welcome to the most christian roblox place " .. NewPlayer.Name .. ". Study the bible by chatting !verse";
        "Feel free to ask any question to god by chatting !ask god";
        "Welcome to my christian roblox place " .. NewPlayer.Name;
        function()
            if os.date("*t").hour > 12 and os.date("*t").hour < 18 then
                return "Welcome " .. NewPlayer.Name .. " to the afternoon bible study session. Open your bible by chatting !verse"
            elseif os.date("*t").hour > 18  or os.date("*t").hour < 5 then
                return "Welcome " .. NewPlayer.Name .. " to the night bible study session. Open your bible by chatting !verse"
            elseif os.date("*t").hour > 5  and os.date("*t").hour < 12 then
                return "Welcome " .. NewPlayer.Name .. " to the morning bible study session. Open your bible by chatting !verse"
            end
        end;
        function()
            if os.date("*t").hour > 12 and os.date("*t").hour < 18 then
                return "You are late to to the afternoon bible study session. Open your bible by chatting !verse quickly!!"
            elseif os.date("*t").hour > 18  or os.date("*t").hour < 5 then
                return "I can't believe you are *THIS* late to the night bible study! Open the bible asap(chat !verse)"
            elseif os.date("*t").hour > 5  and os.date("*t").hour < 12 then
                return "Oh lord! You are late to the morning bible study session! Chat !verse to open the bible"
            end
        end;
        function()
            if os.date("*t").hour > 12 and os.date("*t").hour < 18 then
                return "God will not forgive you for making him wait " .. os.date("*t") - 18 .. " to listen your question(Chat !ask god to ask question) DONT MAKE GOD WASTE HIS TIME"
            elseif os.date("*t").hour > 18  or os.date("*t").hour < 5 then
                return "God will not forgive you for making him wait " .. os.date("*t") - 5 .. " to listen your question(Chat !ask god to ask question) DONT MAKE GOD WASTE HIS TIME"
            elseif os.date("*t").hour > 5  and os.date("*t").hour < 12 then
                return "God will not forgive you for making him wait " .. os.date("*t") - 5 .. " to listen your question(Chat !ask god to ask question) DONT MAKE GOD WASTE HIS TIME"
            end
        end;
    }
    for cycle,sentence in next,welcomeSentence do
        if greet_toggle == true then
            if cycle == math.random(#welcomeSentence) then
                if type(sentence) == "function" then
                    chat(sentence())
                else
                    chat(sentence)
                end
                break
            end
        end
    end
end)

ad = {
    "Hi, I am bible bot, I am helping people to study their bible. Chat !help to know the available commands";
    "I am helping the Vatican converting people to the christian religion. Chat !help to know the available commands";
    "Don't commit sins or you will end up in hell! Chat !help to know the availaible commands for bible bot";
    "Remember to pray god. Chat !help to know the commands";
    "Keep studying the bible by chatting !verse to study the verse of the bible. There is also others commands. Chat !help to know others commands";
    "Chat !help to know all the availaible command of bible bot"
}

coroutine.resume(coroutine.create(function()
    while wait() do
 
        if ads_toggle == true then
            chat(ad[math.random(#ad)])
            wait(timerbb)
        end
    end
end))