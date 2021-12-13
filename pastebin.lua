print(pcall(function()
local req = request or (syn and syn.request)
local function kick(v)
    game.Players.LocalPlayer:Kick((v and 'Max pastebin requests reached, cloudfare ate ur ass')or'Only synapse bitch')
end

local head = {
    ['Referer']= 'https://pastebin.com/',
    ['sec-ch-ua']= "Microsoft Edge",
    ['User-Agent']= 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36 Edg/91.0.864.48'
}

if not req then kick() return end
local f,e = pcall(req,{Method='GET',Headers=head,Url='https://pastebin.com/raw/4B8iSyiU'})
if not f then kick(1) end
if string.find(e.Body,'captcha') then kick(1) end

local ScreenGui = Instance.new("ScreenGui")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Frame_3 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Frame_4 = Instance.new("Frame")
local ImageButton = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_5 = Instance.new("UICorner")
local Frame_5 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 46, 56)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.340339541, 0, 0.131886482, 0)
Frame.Size = UDim2.new(0, 343, 0, 415)

-- pasted drag script lol fuck u i dont care
local UserInputService = game:GetService("UserInputService")

        local gui = Frame

        local dragging
        local dragInput
        local dragStart
        local startPos

        local function update(input)
        	local delta = input.Position - dragStart
        	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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

UICorner.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(56, 59, 71)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(1, 0, 0, 46)

UICorner_2.Parent = Frame_2

Frame_3.Parent = Frame_2
Frame_3.BackgroundColor3 = Color3.fromRGB(56, 59, 71)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0, 0, 0, 32)
Frame_3.Size = UDim2.new(1, 0, 0, 12)

UICorner_3.Parent = Frame_3

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0553935878, 0, 0.239130437, 0)
TextLabel.Size = UDim2.new(0, 127, 0, 23)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "dick<font color=\"#FFA500\">bin</font>"
TextLabel.RichText = true
TextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Frame_4.Parent = Frame_2
Frame_4.BackgroundColor3 = Color3.fromRGB(92, 88, 109)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(0.897959173, 0, 0.239130437, 0)
Frame_4.Size = UDim2.new(0, 2, 0, 23)

ImageButton.Name = "search"
ImageButton.Parent = Frame_2
ImageButton.BackgroundColor3 = Color3.fromRGB(48, 45, 56)
ImageButton.BorderSizePixel = 0
ImageButton.LayoutOrder = 1
ImageButton.Position = UDim2.new(0.899416924, 0, 0.239130437, 0)
ImageButton.Size = UDim2.new(0, 22, 0, 23)
ImageButton.ZIndex = 2
ImageButton.Image = "rbxassetid://3926305904"
ImageButton.ImageRectOffset = Vector2.new(964, 324)
ImageButton.ImageRectSize = Vector2.new(36, 36)

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = ImageButton

TextBox.Parent = Frame_2
TextBox.BackgroundColor3 = Color3.fromRGB(48, 45, 56)
TextBox.Position = UDim2.new(0, 173, 0, 11)
TextBox.Size = UDim2.new(0, 136, 0, 23)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Search"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(220, 220, 220)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = TextBox

Frame_5.Parent = Frame
Frame_5.BackgroundColor3 = Color3.fromRGB(74, 78, 94)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(0, 0, 0, 43)
Frame_5.Size = UDim2.new(1, 0, 0, 2)

UICorner_6.Parent = Frame_5

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0262390673, 0, 0.130120486, 0)
ScrollingFrame.Size = UDim2.new(0, 324, 0, 351)
ScrollingFrame.ScrollBarThickness = 4

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

local a = TextBox
a.Text = '   Search'

a:GetPropertyChangedSignal('Text'):Connect(function()
	local t = a.Text
	if #t <= 3 and t ~= '   ' then
		a.Text = '   '
		a.CursorPosition = 4
	end
end)

a.FocusLost:Connect(function()
	local t = a.Text
	if t == '   ' then
		a.Text = ''
	end
end)

a.Focused:Connect(function()
	a.Text = '   '
	a.CursorPosition = 4
end)

local function logpaste()
    local TextButton = Instance.new("TextButton")
    local UICorner_7 = Instance.new("UICorner")
    local TextLabel_2 = Instance.new("TextLabel")
    local TextLabel_3 = Instance.new("TextLabel")
    local TextLabel_4 = Instance.new("TextLabel")
    local TextLabel_5 = Instance.new("TextLabel")
    local visibility = Instance.new("ImageLabel")
    
    TextButton.Parent = ScrollingFrame
    TextButton.BackgroundColor3 = Color3.fromRGB(107, 107, 107)
    TextButton.BackgroundTransparency = 0.800
    TextButton.Position = UDim2.new(-0.141975313, 0, 0.025301205, 0)
    TextButton.Size = UDim2.new(0, 313, 0, 48)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000
    
    UICorner_7.CornerRadius = UDim.new(0, 4)
    UICorner_7.Parent = TextButton
    
    TextLabel_2.Name = 'pName'
    TextLabel_2.Parent = TextButton
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(0.0319488831, 0, 0.145833328, 0)
    TextLabel_2.Size = UDim2.new(0, 182, 0, 17)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text = ""
    TextLabel_2.TextColor3 = Color3.fromRGB(208, 208, 208)
    TextLabel_2.TextSize = 18.000
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
    
    TextLabel_3.Name = 'Date'
    TextLabel_3.Parent = TextButton
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.Position = UDim2.new(0.0319488831, 0, 0.645833313, 0)
    TextLabel_3.Size = UDim2.new(0, 127, 0, 10)
    TextLabel_3.Font = Enum.Font.SourceSans
    TextLabel_3.Text = ""
    TextLabel_3.TextColor3 = Color3.fromRGB(179, 179, 179)
    TextLabel_3.TextSize = 13.000
    TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
    
    TextLabel_4.Name = 'eSize'
    TextLabel_4.Parent = TextButton
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.BackgroundTransparency = 1.000
    TextLabel_4.Position = UDim2.new(0.830670953, 0, 0.645833313, 0)
    TextLabel_4.Size = UDim2.new(0, 47, 0, 10)
    TextLabel_4.Font = Enum.Font.SourceSans
    TextLabel_4.Text = ""
    TextLabel_4.TextColor3 = Color3.fromRGB(179, 179, 179)
    TextLabel_4.TextSize = 13.000
    TextLabel_4.TextXAlignment = Enum.TextXAlignment.Right
    
    TextLabel_5.Name = 'Views'
    TextLabel_5.Parent = TextButton
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.BackgroundTransparency = 1.000
    TextLabel_5.Position = UDim2.new(0.782747626, 0, 0.291666657, 0)
    TextLabel_5.Size = UDim2.new(0, 43, 0, 10)
    TextLabel_5.Font = Enum.Font.SourceSans
    TextLabel_5.Text = ""
    TextLabel_5.TextColor3 = Color3.fromRGB(179, 179, 179)
    TextLabel_5.TextSize = 13.000
    TextLabel_5.TextXAlignment = Enum.TextXAlignment.Right
    TextLabel_5.Visible = false
    
    visibility.Name = "visibility"
    visibility.Parent = TextButton
    visibility.BackgroundTransparency = 1.000
    visibility.LayoutOrder = 10
    visibility.Position = UDim2.new(0.9472844, 0, 0.291666687, 0)
    visibility.Size = UDim2.new(0, 10, 0, 10)
    visibility.ZIndex = 2
    visibility.Image = "rbxassetid://3926307971"
    visibility.ImageRectOffset = Vector2.new(84, 44)
    visibility.ImageRectSize = Vector2.new(36, 36)
    visibility.Visible = false
    
    ScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
    return TextButton
end

local function getviews(raw)
    local f1,f2 = string.find(raw,'<div class="visits" title="Unique visits to this paste">')
    raw = string.sub(raw,f2+1,#raw)
    local f1,f2 = string.find(raw,'</div>')
    raw = (string.gsub(string.sub(raw,1,f1-1),'%s+',''))
    raw = string.split(raw,' ')[1]
    return raw, string.gsub(raw,'%p+','')
end

local function getname(page)
    page = string.split(page,'<h1>')
    page = string.split(page[2],'</h1>')
    return page[1]
end

local lcserv = game:GetService('LocalizationService')
local http = game:GetService('HttpService')

local function comlog(v)
    local a = logpaste()
    local f,e = pcall(function()
        local page = req({Method='GET',Url='https://pastebin.com/'..v.id,Headers=head}).Body
        a.pName.Text = getname(page)
        
        local dt = DateTime.now()
        a.Date.Text = dt:FormatLocalTime("LL", lcserv.RobloxLocaleId)
        
        local raw = v.length
        local siz = (raw>=1e+6 and tostring(raw/1e+6)..' mb')
        or (raw>=1000 and tostring(raw/1000)..' kb') or raw
        
        a.eSize.Text = siz
        a.Views.Text = getviews(page)
        a.visibility.Visible = true
    end)
    if not f then a:Remove();warn(e) end
end

local amt = 0
local function search(v)
    local sts,res = pcall(game.HttpGet,game,'https://psbdmp.ws/api/v3/search/'..v)
    if sts then
        for i,v in pairs(http:JSONDecode(res).data) do
            comlog(v)
            amt = amt + 1
        end
    end
end

ImageButton.MouseButton1Click:Connect(function()
    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA('TextButton') then
            v:Remove()
        end
    end
    
    local t = string.sub(TextBox.Text,4,#TextBox.Text)
    search(t)
end)
end))
