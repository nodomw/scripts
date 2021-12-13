local gui=Instance.new("ScreenGui",game.CoreGui)gui.Name=''
local fr=Instance.new("Frame",gui)
local TextButton=Instance.new("TextButton",fr)
local TextBox=Instance.new("TextBox",fr)
local Scrollingfr=Instance.new("ScrollingFrame",fr)
local TextLabel=Instance.new("TextLabel",fr)
function tween(instance,speed,properties)
	game:GetService("TweenService"):Create(instance,TweenInfo.new(speed),properties):Play()
end
function pressEffect(btn)
    local old = btn.BackgroundColor3
    local r,g,b=old.R*255,old.G*255,old.B*255
    local diff=50
	spawn(function()
		tween(btn,.1,{BackgroundColor3=Color3.fromRGB(r-diff,g-diff,b-diff)})
	wait()
		tween(btn,.1,{BackgroundColor3=old})
	end)
end
tmplt='rbxassetid://'
sample=Instance.new("Sound",workspace)
sample.Name=''
sample.Volume=1

fr.BackgroundColor3=Color3.fromRGB(155,81,81)
fr.BorderColor3=Color3.fromRGB(1,1,1)
fr.Size=UDim2.new(0,304,0,183)
fr.BorderSizePixel=2
fr.Position=UDim2.new(-1, 0, .5, -(fr.Size.Y.Offset/2))
fr.Draggable=true
fr.Active=true
fr.Name=''
TextButton.BackgroundColor3=Color3.fromRGB(155,0,0)
TextButton.BorderColor3=Color3.fromRGB(1,1,1)
TextButton.BorderSizePixel=0
TextButton.Position=UDim2.new(1,-18,0,0)
TextButton.Size=UDim2.new(0,18,0,18)
TextButton.Font=Enum.Font.SourceSans
TextButton.Text=""
TextButton.Name=''
TextButton.TextColor3=Color3.fromRGB(0,0,0)
TextButton.TextSize=14
TextButton.AutoButtonColor=false
TextButton.MouseButton1Click:connect(function()
    tween(fr,.25,{Position = UDim2.new(-.5, 0, fr.Position.Y.Scale, fr.Position.Y.Offset)})
    sample:Destroy()
    wait(.25)
	gui:destroy()
end)
stop=TextButton:clone()
stop.Parent=fr
stop.Text='S'
stop.Font='SourceSansSemibold'
stop.BackgroundColor3=Color3.fromRGB(175,123,123)
stop.Position=UDim2.new(1,-36,0,0)
stop.MouseButton1Click:connect(function()
    sample.Playing=false 
    pressEffect(stop)
end)
TextBox.BackgroundColor3=Color3.fromRGB(255,255,255)
TextBox.BackgroundTransparency=0.900
TextBox.BorderColor3=Color3.fromRGB(1,1,1)
TextBox.Position=UDim2.new(0,0,0.0983606577,0)
TextBox.Size=UDim2.new(1,0,0,18)
TextBox.Font=Enum.Font.SourceSansItalic
TextBox.PlaceholderColor3=Color3.fromRGB(0,0,0)
TextBox.PlaceholderText="Audio Search"
TextBox.Text=""
TextBox.TextColor3=Color3.fromRGB(0,0,0)
TextBox.TextSize=14
TextBox.ClearTextOnFocus=false
TextBox.TextWrapped=true
TextBox.Font='SourceSansSemibold'
TextBox.Name=''
Scrollingfr.Active=true
Scrollingfr.BackgroundColor3=Color3.fromRGB(0,0,0)
Scrollingfr.BackgroundTransparency=0.900
Scrollingfr.BorderColor3=Color3.fromRGB(0,0,0)
Scrollingfr.Position=UDim2.new(0,0,0.196721315,0)
Scrollingfr.Size=UDim2.new(1,0,0,147)
Scrollingfr.ScrollBarThickness=8
Scrollingfr.BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png"
Scrollingfr.TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png"
Scrollingfr.ScrollBarImageColor3=Color3.new(0,0,0)
Scrollingfr.CanvasSize=UDim2.new(0,0,0,0)
Scrollingfr.Name=''
TextLabel.BackgroundColor3=Color3.fromRGB(255,255,255)
TextLabel.Name=''
TextLabel.BackgroundTransparency=1
TextLabel.BorderSizePixel=0
TextLabel.Size=UDim2.new(0,386,0,18)
TextLabel.Font='SourceSansBold'
TextLabel.Text="  Made by xxCloudd | LMB = Preview | RMB = Set to clipboard"
TextLabel.TextColor3=Color3.fromRGB(0,0,0)
TextLabel.TextSize=12
TextLabel.TextXAlignment=Enum.TextXAlignment.Left
function createNew(txt,id)
	local btn=Instance.new("TextButton")
	btn.Text="  "..txt
	btn.Size=UDim2.new(1,0,0,20)
	btn.TextWrapped=true
	btn.Position=UDim2.new(0,0,0,#Scrollingfr:GetChildren()*20)
	btn.Parent=Scrollingfr
	btn.BackgroundTransparency=.75
	btn.TextColor3=Color3.new(0,0,0)
	btn.AutoButtonColor=false
	btn.TextSize=16
	btn.Name=''
	btn.TextXAlignment='Left'
	btn.Font='SourceSansSemibold'
	btn.BorderColor3=Color3.new(0,0,0)
	return btn.MouseButton1Click:connect(function()
		pressEffect(btn)
		if sample.Playing then sample.Playing=false end
		sample.TimePosition=0
		sample.SoundId=tmplt..id
		sample.Playing=true
	end),btn.MouseButton2Click:connect(function()
		pressEffect(btn)
		btn.Text='  Set to clipboard'
		setclipboard(id)
		wait(.3)
		btn.Text="  "..txt
	end)
end
-- not mine
local UserInputService = game:GetService("UserInputService")
local dragging,dragInput,dragStart,startPos
local function update(input)local delta = input.Position - dragStart
fr.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end fr.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true dragStart = input.Position startPos = fr.Position
input.Changed:Connect(function()if input.UserInputState == Enum.UserInputState.End then dragging = false
end end)end end)fr.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input end end)UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then update(input)end end)
--
loading=false
TextBox.FocusLost:connect(function()
    local check,_check = 'abcdefghijklmnopqrstuvwxyz_01234567889',false for i=1,#check do if string.find(TextBox.Text, check:sub(i,i)) then _check = true break end end if not _check then return end
	Scrollingfr:ClearAllChildren()
	Scrollingfr.CanvasSize=UDim2.new(0,0,0,0)
	sample.Playing=false
	if loading then return end
	local search=TextBox.Text
	loading = true
	TextBox.Text='Loading "'..search..'"..'
	TextBox.TextEditable=false
	local results=game:GetService("HttpService"):JSONDecode(game:HttpGet("https://rprxy.xyz/proxy/api/searchmusic/"..search:lower()))
	for i,v in pairs(results) do
		if not (v.Name:find("#")) then
			local name=v.Name
		    local id=v.AssetId
		    createNew(name,id)
			Scrollingfr.CanvasSize=Scrollingfr.CanvasSize+UDim2.new(0,0,0,20)
		end
	end
	TextBox.Text=""
	loading=false
	TextBox.TextEditable=true
end)
tween(fr,.25,{Position = UDim2.new(.2, -(fr.Size.X.Offset/2), .5, -(fr.Size.Y.Offset/2))})
print'\n\nMade by xxCloudd\nLMB = Preview\nRMB = Set to clipboard\nS = Stop Audio Preview'
