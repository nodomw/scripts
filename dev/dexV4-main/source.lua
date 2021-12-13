local Services = setmetatable({}, {
	__index = function(self, ind)
		if ypcall(function()
			game:GetService(ind)
		end) then
			return game:GetService(ind)
		else
			return nil
		end
	end,
})

Services.StarterGui:SetCore("SendNotification", {
	Title = "Loading instances",
	Text = "usually takes 4s",
	Duration = 0.2,
	Button1 = "Screen freeze is normal",
})
wait(0.5)

local run = Services.RunService.RenderStepped
local plr = Services.Players.LocalPlayer
local scrframe

function CreateInstance(cls, props)
	local inst = Instance.new(cls)
	for i, v in pairs(props) do
		inst[i] = v
	end
	return inst
end

local function protectedGui()
	local DexGui = Services.CoreGui:FindFirstChildOfClass("ScreenGui")
		or CreateInstance("ScreenGui", { DisplayOrder = 0, Enabled = true, ResetOnSpawn = true })
	if syn and syn.protect_gui or protect_gui then
		(syn.protect_gui or protect_gui)(DexGui)
	else
		if getconnections then
			local function cleancons(v)
				for i, v in pairs(getconnections(v)) do
					v:Disconnect()
				end
			end
			cleancons(DexGui.DescendantAdded)
			cleancons(DexGui.ChildAdded)
			cleancons(Services.CoreGui.DescendantAdded)
			cleancons(game.DescendantAdded)
		end
	end
	return DexGui
end

do
	function showCode(i, nm)
		local Frame = Instance.new("Frame")
		local top = Instance.new("Frame")
		local name = Instance.new("TextLabel")
		local clear = Instance.new("ImageButton")
		local list = Instance.new("ScrollingFrame")
		local lay = Instance.new("UIListLayout")
		local sp = Instance.new("Frame")
		local num = Instance.new("TextLabel")
		local cod = Instance.new("TextLabel")
		local Globals_ = Instance.new("TextLabel")
		local Keywords_ = Instance.new("TextLabel")
		local Numbers_ = Instance.new("TextLabel")
		local RemoteHighlight_ = Instance.new("TextLabel")
		local Strings_ = Instance.new("TextLabel")
		local Tokens_ = Instance.new("TextLabel")
		local Comments_ = Instance.new("TextLabel")
		local ResizeBtn = Instance.new("ImageButton")

		local did = (shared.did or 0) + 1
		shared.did = did

		Frame.Parent = protectedGui()
		Frame.BackgroundColor3 = Color3.fromRGB(42, 44, 49)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.1, did * 100, 0.01, did * 80)
		Frame.Size = UDim2.new(0, 510, 0, 427)
		Frame.Visible = false

		top.Name = "top"
		top.Parent = Frame
		top.BackgroundColor3 = Color3.fromRGB(62, 65, 72)
		top.BorderSizePixel = 0
		top.Size = UDim2.new(1, 0, 0, 29)

		name.Name = "name"
		name.Parent = top
		name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		name.BackgroundTransparency = 1.000
		name.Position = UDim2.new(0.021568628, 0, 0, 0)
		name.Size = UDim2.new(0, 189, 0, 29)
		name.Font = Enum.Font.Code
		name.Text = "LocalScript"
		name.TextColor3 = Color3.fromRGB(227, 227, 227)
		name.TextSize = 14.000
		name.TextXAlignment = Enum.TextXAlignment.Left

		clear.Name = "clear"
		clear.Parent = top
		clear.BackgroundTransparency = 1.000
		clear.Position = UDim2.new(1, -25, 0, 5)
		clear.Size = UDim2.new(0, 20, 0, 20)
		clear.ZIndex = 2
		clear.Image = "rbxassetid://3926305904"
		clear.ImageColor3 = Color3.fromRGB(239, 239, 239)
		clear.ImageRectOffset = Vector2.new(924, 724)
		clear.ImageRectSize = Vector2.new(36, 36)
		clear.MouseButton1Click:connect(function()
			Frame.Visible = not Frame.Visible
			shared.did = did - 1
		end)

		list.Name = "list"
		list.Parent = Frame
		list.Active = true
		list.BackgroundColor3 = Color3.fromRGB(42, 44, 49)
		list.BorderSizePixel = 0
		list.Position = UDim2.new(0, 4, 0, 33)
		list.Size = UDim2.new(1, -8, 1, -36)
		list.ScrollBarThickness = 4
		list.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

		lay.Name = "lay"
		lay.Parent = list
		lay.SortOrder = Enum.SortOrder.LayoutOrder

		sp.Name = "sp"
		sp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sp.BackgroundTransparency = 1.000
		sp.BorderSizePixel = 0
		sp.Size = UDim2.new(0, 492, 0, 20)

		num.Name = "num"
		num.Parent = sp
		num.BackgroundColor3 = Color3.fromRGB(53, 54, 61)
		num.BorderSizePixel = 0
		num.Size = UDim2.new(0, 30, 0, 20)
		num.Font = Enum.Font.Code
		num.Text = "1"
		num.TextColor3 = Color3.fromRGB(226, 226, 226)
		num.TextSize = 16.000
		num.TextStrokeColor3 = Color3.fromRGB(226, 226, 226)

		cod.Name = "cod"
		cod.Parent = sp
		cod.BackgroundColor3 = Color3.fromRGB(53, 54, 61)
		cod.BackgroundTransparency = 1.000
		cod.BorderSizePixel = 0
		cod.Position = UDim2.new(0, 30, 0, 0)
		cod.Size = UDim2.new(0, 464, 0, 20)
		cod.Font = Enum.Font.Code
		cod.Text = ""
		cod.TextColor3 = Color3.fromRGB(203, 203, 203)
		cod.TextSize = 16.000
		cod.TextStrokeColor3 = Color3.fromRGB(226, 226, 226)
		cod.TextXAlignment = Enum.TextXAlignment.Left

		Globals_.Name = "Globals_"
		Globals_.Parent = cod
		Globals_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Globals_.BackgroundTransparency = 1.000
		Globals_.Size = UDim2.new(1, 0, 1, 0)
		Globals_.ZIndex = 5
		Globals_.Font = Enum.Font.Code
		Globals_.Text = ""
		Globals_.TextColor3 = Color3.fromRGB(102, 153, 204)
		Globals_.TextSize = 16.000
		Globals_.TextXAlignment = Enum.TextXAlignment.Left

		Keywords_.Name = "Keywords_"
		Keywords_.Parent = cod
		Keywords_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Keywords_.BackgroundTransparency = 1.000
		Keywords_.Size = UDim2.new(1, 0, 1, 0)
		Keywords_.ZIndex = 5
		Keywords_.Font = Enum.Font.Code
		Keywords_.Text = ""
		Keywords_.TextColor3 = Color3.fromRGB(204, 153, 204)
		Keywords_.TextSize = 16.000
		Keywords_.TextXAlignment = Enum.TextXAlignment.Left

		Numbers_.Name = "Numbers_"
		Numbers_.Parent = cod
		Numbers_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Numbers_.BackgroundTransparency = 1.000
		Numbers_.Size = UDim2.new(1, 0, 1, 0)
		Numbers_.ZIndex = 4
		Numbers_.Font = Enum.Font.Code
		Numbers_.Text = ""
		Numbers_.TextColor3 = Color3.fromRGB(210, 210, 210)
		Numbers_.TextSize = 16.000
		Numbers_.TextXAlignment = Enum.TextXAlignment.Left

		RemoteHighlight_.Name = "RemoteHighlight_"
		RemoteHighlight_.Parent = cod
		RemoteHighlight_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		RemoteHighlight_.BackgroundTransparency = 1.000
		RemoteHighlight_.Size = UDim2.new(1, 0, 1, 0)
		RemoteHighlight_.ZIndex = 5
		RemoteHighlight_.Font = Enum.Font.Code
		RemoteHighlight_.Text = ""
		RemoteHighlight_.TextColor3 = Color3.fromRGB(0, 144, 255)
		RemoteHighlight_.TextSize = 16.000
		RemoteHighlight_.TextXAlignment = Enum.TextXAlignment.Left

		Strings_.Name = "Strings_"
		Strings_.Parent = cod
		Strings_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Strings_.BackgroundTransparency = 1.000
		Strings_.Size = UDim2.new(1, 0, 1, 0)
		Strings_.ZIndex = 5
		Strings_.Font = Enum.Font.Code
		Strings_.Text = ""
		Strings_.TextColor3 = Color3.fromRGB(153, 204, 153)
		Strings_.TextSize = 16.000
		Strings_.TextXAlignment = Enum.TextXAlignment.Left

		Tokens_.Name = "Tokens_"
		Tokens_.Parent = cod
		Tokens_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tokens_.BackgroundTransparency = 1.000
		Tokens_.Size = UDim2.new(1, 0, 1, 0)
		Tokens_.ZIndex = 5
		Tokens_.Font = Enum.Font.Code
		Tokens_.Text = ""
		Tokens_.TextColor3 = Color3.fromRGB(102, 204, 204)
		Tokens_.TextSize = 16.000
		Tokens_.TextXAlignment = Enum.TextXAlignment.Left

		Comments_.Name = "Comments_"
		Comments_.Parent = cod
		Comments_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Comments_.BackgroundTransparency = 1.000
		Comments_.Size = UDim2.new(1, 0, 1, 0)
		Comments_.ZIndex = 5
		Comments_.Font = Enum.Font.Code
		Comments_.Text = ""
		Comments_.TextColor3 = Color3.fromRGB(59, 200, 59)
		Comments_.TextSize = 16.000
		Comments_.TextXAlignment = Enum.TextXAlignment.Left

		ResizeBtn.Name = "ResizeBtn"
		ResizeBtn.Parent = Frame
		ResizeBtn.BackgroundTransparency = 1.000
		ResizeBtn.Position = UDim2.new(1, -25, 1, -25)
		ResizeBtn.Rotation = -35.000
		ResizeBtn.Size = UDim2.new(0, 25, 0, 25)
		ResizeBtn.ZIndex = 2
		ResizeBtn.Image = "rbxassetid://3926305904"
		ResizeBtn.ImageRectOffset = Vector2.new(564, 284)
		ResizeBtn.ImageRectSize = Vector2.new(36, 36)

		local a = Frame
		local b = sp
		local c = list
		local d = lay
		local w = game:GetService("TextService")
		local e = {
			["local"] = "204,153,204",
			["return"] = "204,153,204",
			["if"] = "204,153,204",
			["elseif"] = "204,153,204",
			["then"] = "204,153,204",
			["function"] = "204,153,204",
			["end"] = "204,153,204",
			["or"] = "204,153,204",
			["and"] = "204,153,204",
			["self"] = "242,119,122",
			["="] = "102,204,204",
			['"'] = "146,194,146",
		}
		local function f(g, v)
			local h = b:Clone()
			h.num.Text = g
			h.cod.Text = " " .. v
			h.Size = UDim2.new(0, #v * 9, 0, 20)
			h.Parent = c
			return h
		end

		name.Text = "Decompiling..."
		Frame.Visible = true
		i = decompile(i)
		local j = {
			"and",
			"break",
			"do",
			"else",
			"elseif",
			"end",
			"false",
			"for",
			"function",
			"goto",
			"if",
			"in",
			"local",
			"nil",
			"not",
			"or",
			"repeat",
			"return",
			"then",
			"true",
			"until",
			"while",
		}
		local k = {
			"getrawmetatable",
			"game",
			"workspace",
			"script",
			"math",
			"string",
			"table",
			"print",
			"wait",
			"BrickColor",
			"Color3",
			"next",
			"pairs",
			"ipairs",
			"select",
			"unpack",
			"Instance",
			"Vector2",
			"Vector3",
			"CFrame",
			"Ray",
			"UDim2",
			"Enum",
			"assert",
			"error",
			"warn",
			"tick",
			"loadstring",
			"_G",
			"shared",
			"getfenv",
			"setfenv",
			"newproxy",
			"setmetatable",
			"getmetatable",
			"os",
			"debug",
			"pcall",
			"ypcall",
			"xpcall",
			"rawequal",
			"rawset",
			"rawget",
			"tonumber",
			"tostring",
			"type",
			"typeof",
			"_VERSION",
			"coroutine",
			"delay",
			"require",
			"spawn",
			"LoadLibrary",
			"settings",
			"stats",
			"time",
			"UserSettings",
			"version",
			"Axes",
			"ColorSequence",
			"Faces",
			"ColorSequenceKeypoint",
			"NumberRange",
			"NumberSequence",
			"NumberSequenceKeypoint",
			"gcinfo",
			"elapsedTime",
			"collectgarbage",
			"PhysicalProperties",
			"Rect",
			"Region3",
			"Region3int16",
			"UDim",
			"Vector2int16",
			"Vector3int16",
		}
		local l = function(m, n)
			local o = {}
			local p = m
			local q = {
				["="] = true,
				["."] = true,
				[","] = true,
				["("] = true,
				[")"] = true,
				["["] = true,
				["]"] = true,
				["{"] = true,
				["}"] = true,
				[":"] = true,
				["*"] = true,
				["/"] = true,
				["+"] = true,
				["-"] = true,
				["%"] = true,
				[";"] = true,
				["~"] = true,
			}
			for g, v in pairs(n) do
				o[v] = true
			end
			p = p:gsub(".", function(h)
				if q[h] ~= nil then
					return "\32"
				else
					return h
				end
			end)
			p = p:gsub("%S+", function(h)
				if o[h] ~= nil then
					return h
				else
					return (" "):rep(#h)
				end
			end)
			return p
		end
		local r = function(m)
			local q = {
				["="] = true,
				["."] = true,
				[","] = true,
				["("] = true,
				[")"] = true,
				["["] = true,
				["]"] = true,
				["{"] = true,
				["}"] = true,
				[":"] = true,
				["*"] = true,
				["/"] = true,
				["+"] = true,
				["-"] = true,
				["%"] = true,
				[";"] = true,
				["~"] = true,
			}
			local s = ""
			m:gsub(".", function(h)
				if q[h] ~= nil then
					s = s .. h
				elseif h == "\n" then
					s = s .. "\n"
				elseif h == "\t" then
					s = s .. "\t"
				else
					s = s .. "\32"
				end
			end)
			return s
		end
		local t = function(m)
			local u = ""
			local w = false
			m:gsub(".", function(h)
				if w == false and h == '"' then
					w = true
				elseif w == true and h == '"' then
					w = false
				end
				if w == false and h == '"' then
					u = u .. '"'
				elseif h == "\n" then
					u = u .. "\n"
				elseif h == "\t" then
					u = u .. "\t"
				elseif w == true then
					u = u .. h
				elseif w == false then
					u = u .. "\32"
				end
			end)
			return u
		end
		local x = function(m)
			local y = ""
			m:gsub("[^\r\n]+", function(h)
				local z = false
				local g = 0
				h:gsub(".", function(A)
					g = g + 1
					if h:sub(g, g + 1) == "--" then
						z = true
					end
					if z == true then
						y = y .. A
					else
						y = y .. "\32"
					end
				end)
				y = y
			end)
			return y
		end
		local B = function(m)
			local s = ""
			m:gsub(".", function(h)
				if tonumber(h) ~= nil then
					s = s .. h
				elseif h == "\n" then
					s = s .. "\n"
				elseif h == "\t" then
					s = s .. "\t"
				else
					s = s .. "\32"
				end
			end)
			return s
		end
		local C = function(D, E)
			if D == "Text" then
				E.Text = " " .. E.Text:gsub("\13", ""):gsub("\t", "      ")
				local F = E.Text
				E.Keywords_.Text = l(F, j)
				E.Globals_.Text = l(F, k)
				E.RemoteHighlight_.Text = l(F, { "FireServer", "fireServer", "InvokeServer", "invokeServer" })
				E.Tokens_.Text = r(F)
				E.Numbers_.Text = B(F)
				E.Strings_.Text = t(F)
			end
		end
		for g, v in pairs(i:split("\n")) do
			C("Text", f(g, v).cod)
		end

		local v = d.AbsoluteContentSize
		c.CanvasSize = UDim2.new(0, v.X, 0, v.Y)
		name.Text = nm

		local b = ResizeBtn
		local mouse = game.Players.LocalPlayer:GetMouse()
		local Pressing = false

		local RecordedLastX = nil
		local RecordedLastY = nil

		local NowPositionX = nil
		local NowPositionY = nil

		local Hovered = false

		b.InputBegan:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				Pressing = true
				RecordedLastX = mouse.X
				RecordedLastY = mouse.Y
				b.InputEnded:connect(function(key2)
					if key == key2 then
						Pressing = false
					end
				end)
			end
		end)

		b.MouseEnter:connect(function()
			crr = true
			Hovered = true
			b.MouseLeave:connect(function()
				RecordedLastX = mouse.X
				RecordedLastY = mouse.Y
				wait(0.3)
				if crr then
					crr = false
					return
				end
				Hovered = false
			end)
		end)

		mouse.Move:connect(function()
			if Pressing and Hovered then
				NowPositionX = mouse.x
				NowPositionY = mouse.y

				local ChangeX = NowPositionX - RecordedLastX
				local ChangeY = NowPositionY - RecordedLastY

				RecordedLastX = mouse.X
				RecordedLastY = mouse.Y

				Frame.Size = UDim2.new(0, Frame.Size.X.Offset + ChangeX, 0, Frame.Size.Y.Offset + ChangeY)
			end
		end)

		local Object = Frame
		local Min = Object.Size.X.Offset * 0.6
		local Max = Min * 2.6

		Object.Changed:connect(function()
			if Object.Size.X.Offset < Min and Object.Size.Y.Offset < Min then
				Object.Size = UDim2.new(0, Min, 0, Min)
			elseif Object.Size.X.Offset < Min then
				Object.Size = UDim2.new(0, Min, 0, Object.Size.Y.Offset)
			elseif Object.Size.Y.Offset < Min then
				Object.Size = UDim2.new(0, Object.Size.X.Offset, 0, Min)
			end
			if Object.Size.X.Offset > Max and Object.Size.Y.Offset > Max then
				Object.Size = UDim2.new(0, Max, 0, Max)
			elseif Object.Size.X.Offset > Max then
				Object.Size = UDim2.new(0, Max, 0, Object.Size.Y.Offset)
			elseif Object.Size.Y.Offset > Max then
				Object.Size = UDim2.new(0, Object.Size.X.Offset, 0, Max)
			end
		end)

		local UserInputService = Services.UserInputService
		local gui = Frame

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end

		gui.InputBegan:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
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
			if
				input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch
			then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end
end

function createDexGui()
	local DexGui = protectedGui()

	local DexGui2 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -300, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 300, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ContentFrameR",
			Parent = DexGui,
		}
	)
	local DexGui3 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, -300, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 300, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ContentFrameL",
			Parent = DexGui,
		}
	)
	local DexGui4 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.11764706671238, 0.11764706671238, 0.11764706671238),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.5, -150, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 300, 0, 36),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 10,
			Name = "TopMenu",
			Parent = DexGui,
		}
	)
	local DexGui5 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "1.1.0",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = true,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 16),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 30, 0, 18),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Version",
			Parent = DexGui4,
		}
	)
	local DexGui6 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://474172996",
			ImageColor3 = Color3.new(0.11764706671238, 0.11764706671238, 0.11764706671238),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -9, 0, 9),
			Rotation = 90,
			Selectable = false,
			Size = UDim2.new(0, 36, 0, 18),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Slant",
			Parent = DexGui4,
		}
	)
	local DexGui7 = CreateInstance(
		"TextLabel",
		{
			Font = 4,
			FontSize = 5,
			Text = "DEX",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = true,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 2),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 30, 0, 18),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Title",
			Parent = DexGui4,
		}
	)
	local DexGui8 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 120, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 120, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Content",
			Parent = DexGui4,
		}
	)
	local DexGui9 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 7,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 24,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = false,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.039215687662363, 0.039215687662363, 0.039215687662363),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.19607844948769, 0.19607844948769, 0.19607844948769),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 30, 0, 4),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 112, 0, 28),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "SlideSelect",
			Parent = DexGui4,
		}
	)
	local DexGui10 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Window Views",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = true,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 20, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -28, 0, 28),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "SlideName",
			Parent = DexGui9,
		}
	)
	local DexGui11 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "V",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = true,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.11764706671238, 0.11764706671238, 0.11764706671238),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -8, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 8, 0, 28),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "DropDown",
			Parent = DexGui9,
		}
	)
	local DexGui12 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://588745174",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 6),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 0, 16),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Icon",
			Parent = DexGui9,
		}
	)
	local DexGui13 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://474172996",
			ImageColor3 = Color3.new(0.11764706671238, 0.11764706671238, 0.11764706671238),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, -18, 0, 0),
			Rotation = 180,
			Selectable = false,
			Size = UDim2.new(0, 18, 0, 36),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Slant",
			Parent = DexGui4,
		}
	)
	local DexGui14 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 7,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 24,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = false,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -30, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 30, 0, 36),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "About",
			Parent = DexGui4,
		}
	)
	local DexGui15 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://476354004",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 3, 0, 6),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 24, 0, 24),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 10,
			Name = "Icon",
			Parent = DexGui14,
		}
	)
	local DexGui16 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 100, 0, 100),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 1,
			Name = "Resources",
			Parent = DexGui,
		}
	)
	local DexGui17 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = false,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.37647062540054, 0.54901963472366, 0.82745105028152),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 1, 0, 2),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, -18, 0, 18),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Entry",
			Parent = DexGui16,
		}
	)
	local DexGui18 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.14509804546833, 0.20784315466881, 0.21176472306252),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 18, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -18, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Indent",
			Parent = DexGui17,
		}
	)
	local DexGui19 = CreateInstance(
		"ImageButton",
		{
			Image = "",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, -16, 0.5, -8),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 16, 0, 16),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Expand",
			Parent = DexGui18,
		}
	)
	local DexGui20 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://529659138",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(-12.562000274658, 0, -12.562000274658, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(16, 0, 16, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Icon",
			Parent = DexGui19,
		}
	)
	local DexGui21 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Item",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 22, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -22, 0, 18),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "EntryName",
			Parent = DexGui18,
		}
	)
	local DexGui22 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, 2, 0.5, -8),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 0, 16),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "IconFrame",
			Parent = DexGui18,
		}
	)
	local DexGui23 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://529659138",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(-5.811999797821, 0, -1.3120000362396, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(16, 0, 16, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Icon",
			Parent = DexGui22,
		}
	)
	local DexGui24 = CreateInstance("Folder", { Name = "PropControls", Parent = DexGui16 })
	local DexGui25 = CreateInstance(
		"TextBox",
		{
			ClearTextOnFocus = true,
			Font = 3,
			FontSize = 5,
			MultiLine = false,
			Text = "0",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, -4, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "String",
			Parent = DexGui24,
		}
	)
	local DexGui26 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.56470590829849, 0.56470590829849, 0.56470590829849),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -4, 1, 0),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 1,
			Name = "ReadOnly",
			Parent = DexGui25,
		}
	)
	local DexGui27 = CreateInstance(
		"TextBox",
		{
			ClearTextOnFocus = true,
			Font = 3,
			FontSize = 5,
			MultiLine = false,
			Text = "0",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, -2, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Number",
			Parent = DexGui24,
		}
	)
	local DexGui28 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -16, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ArrowFrame",
			Parent = DexGui27,
		}
	)
	local DexGui29 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 3),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, 0, 0, 8),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Up",
			Parent = DexGui28,
		}
	)
	local DexGui30 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.63921570777893, 0.63529413938522, 0.64705884456635),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 0, 8),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Arrow",
			Parent = DexGui29,
		}
	)
	local DexGui31 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 8, 0, 3),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 1, 0, 1),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Frame",
			Parent = DexGui30,
		}
	)
	local DexGui32 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 7, 0, 4),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 3, 0, 1),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Frame",
			Parent = DexGui30,
		}
	)
	local DexGui33 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 6, 0, 5),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 5, 0, 1),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Frame",
			Parent = DexGui30,
		}
	)
	local DexGui34 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 11),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, 0, 0, 8),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Down",
			Parent = DexGui28,
		}
	)
	local DexGui35 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.63921570777893, 0.63529413938522, 0.64705884456635),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 0, 8),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Arrow",
			Parent = DexGui34,
		}
	)
	local DexGui36 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 8, 0, 5),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 1, 0, 1),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Frame",
			Parent = DexGui35,
		}
	)
	local DexGui37 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 7, 0, 4),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 3, 0, 1),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Frame",
			Parent = DexGui35,
		}
	)
	local DexGui38 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.86274510622025, 0.86274510622025, 0.86274510622025),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 6, 0, 3),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 5, 0, 1),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Frame",
			Parent = DexGui35,
		}
	)
	local DexGui39 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0.5, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 300, 0.5, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "PropertiesPanel",
			Parent = DexGui16,
		}
	)
	local DexGui40 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.14509804546833, 0.20784315466881, 0.21176472306252),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 1, 0, 50),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -2, 1, -50),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Content",
			Parent = DexGui39,
		}
	)
	local DexGui41 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.20784315466881, 0.27058824896812, 0.27450981736183),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.14509804546833, 0.20784315466881, 0.21176472306252),
			BorderSizePixel = 1,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "List",
			Parent = DexGui40,
		}
	)
	local DexGui42 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.18823531270027, 0.18823531270027, 0.18823531270027),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, 50),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "TopBar",
			Parent = DexGui39,
		}
	)
	local DexGui43 = CreateInstance(
		"TextButton",
		{
			Font = 4,
			FontSize = 5,
			Text = "X",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -27, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 25, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Close",
			Parent = DexGui42,
		}
	)
	local DexGui44 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Properties",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 25, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -50, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "WindowTitle",
			Parent = DexGui42,
		}
	)
	local DexGui45 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.21960785984993, 0.21960785984993, 0.21960785984993),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -25, 0, 25),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 25, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Settings",
			Parent = DexGui42,
		}
	)
	local DexGui46 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://530240903",
			ImageColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 5, 0, 5),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 1, -10),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ImageLabel",
			Parent = DexGui45,
		}
	)
	local DexGui47 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.4588235616684, 0.52156865596771, 0.52549022436142),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 45),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -27, 0, 2),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "SearchFrame",
			Parent = DexGui42,
		}
	)
	local DexGui48 = CreateInstance(
		"TextBox",
		{
			ClearTextOnFocus = false,
			Font = 3,
			FontSize = 5,
			MultiLine = false,
			Text = "",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.47058826684952, 0.47058826684952, 0.47058826684952),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, -20),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, -4, 1, 20),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Search",
			Parent = DexGui47,
		}
	)
	local DexGui49 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Search Properties",
			TextColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Empty",
			Parent = DexGui48,
		}
	)
	local DexGui50 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://527318112",
			ImageColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, 4, 0, -15),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 0, 16),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 1,
			Name = "ImageLabel",
			Parent = DexGui47,
		}
	)
	local DexGui51 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.13333334028721, 0.65490198135376, 0.94117653369904),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.5, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 0, 0, 2),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Entering",
			Parent = DexGui47,
		}
	)
	local DexGui52 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.39215689897537, 0.39215689897537, 0.39215689897537),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 300, 0.5, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ExplorerPanel",
			Parent = DexGui16,
		}
	)
	local DexGui53 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.14509804546833, 0.20784315466881, 0.21176472306252),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 1, 0, 50),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -2, 1, -50),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Content",
			Parent = DexGui52,
		}
	)
	local DexGui54 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.20784315466881, 0.27058824896812, 0.27450981736183),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.14509804546833, 0.20784315466881, 0.21176472306252),
			BorderSizePixel = 1,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "List",
			Parent = DexGui53,
		}
	)
	local DexGui55 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.18823531270027, 0.18823531270027, 0.18823531270027),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, 50),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "TopBar",
			Parent = DexGui52,
		}
	)
	local DexGui56 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.4588235616684, 0.52156865596771, 0.52549022436142),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 45),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -27, 0, 2),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "SearchFrame",
			Parent = DexGui55,
		}
	)
	local DexGui57 = CreateInstance(
		"TextBox",
		{
			ClearTextOnFocus = false,
			Font = 3,
			FontSize = 5,
			MultiLine = false,
			Text = "",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.47058826684952, 0.47058826684952, 0.47058826684952),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, -20),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, -4, 1, 20),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Search",
			Parent = DexGui56,
		}
	)
	local DexGui58 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Search Workspace",
			TextColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Empty",
			Parent = DexGui57,
		}
	)
	local DexGui59 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://527318112",
			ImageColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, 4, 0, -15),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 16, 0, 16),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 1,
			Name = "ImageLabel",
			Parent = DexGui56,
		}
	)
	local DexGui60 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.13333334028721, 0.65490198135376, 0.94117653369904),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.5, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 0, 0, 2),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Entering",
			Parent = DexGui56,
		}
	)
	local DexGui61 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Explorer",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 25, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -50, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "WindowTitle",
			Parent = DexGui55,
		}
	)
	local DexGui62 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.21960785984993, 0.21960785984993, 0.21960785984993),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -25, 0, 25),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 25, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Settings",
			Parent = DexGui55,
		}
	)
	local DexGui63 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://530240903",
			ImageColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 5, 0, 5),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 1, -10),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ImageLabel",
			Parent = DexGui62,
		}
	)
	local DexGui64 = CreateInstance(
		"TextButton",
		{
			Font = 4,
			FontSize = 5,
			Text = "X",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -27, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 25, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Close",
			Parent = DexGui55,
		}
	)
	local DexGui65 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = false,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.28235295414925, 0.28235295414925, 0.28235295414925),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 1, 0, 134),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 300, 0, 22),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "PEntry",
			Parent = DexGui16,
		}
	)
	local DexGui66 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.37647062540054, 0.54901963472366, 0.82745105028152),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 18, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -18, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Indent",
			Parent = DexGui65,
		}
	)
	local DexGui67 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Name",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -2, 0, 22),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "EntryName",
			Parent = DexGui66,
		}
	)
	local DexGui68 = CreateInstance(
		"TextButton",
		{
			Font = 3,
			FontSize = 5,
			Text = "",
			TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			AutoButtonColor = true,
			Modal = false,
			Selected = false,
			Style = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, -16, 0.5, -8),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 16, 0, 16),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 1,
			Name = "Expand",
			Parent = DexGui66,
		}
	)
	local DexGui69 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://529659138",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(-13.6875, 0, -12.5625, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(16, 0, 16, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Icon",
			Parent = DexGui68,
		}
	)
	local DexGui70 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.43921571969986, 0.43921571969986, 0.43921571969986),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.5, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0.5, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Control",
			Parent = DexGui66,
		}
	)
	local DexGui71 = CreateInstance(
		"TextBox",
		{
			ClearTextOnFocus = true,
			Font = 3,
			FontSize = 5,
			MultiLine = false,
			Text = "0",
			TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = true,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 2, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(1, -4, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "String",
			Parent = DexGui70,
		}
	)
	local DexGui72 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.37647062540054, 0.37647062540054, 0.37647062540054),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.5, -1, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 1, 0, 22),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Sep",
			Parent = DexGui66,
		}
	)
	local DexGui73 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.5, -250, 0.5, -150),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 500, 0, 300),
			SizeConstraint = 0,
			Visible = false,
			ZIndex = 1,
			Name = "WelcomeFrame",
			Parent = DexGui,
		}
	)
	local DexGui74 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://503289231",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 1,
			SliceCenter = Rect.new(20, 20, 460, 260),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, -20, 0, -20),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 540, 0, 340),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Outline",
			Parent = DexGui73,
		}
	)
	local DexGui75 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Content",
			Parent = DexGui73,
		}
	)
	local DexGui76 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.18823531270027, 0.18823531270027, 0.18823531270027),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0.60000002384186, 0, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Main",
			Parent = DexGui75,
		}
	)
	local DexGui77 = CreateInstance(
		"TextLabel",
		{
			Font = 4,
			FontSize = 9,
			Text = "DEX",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 48,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, 100),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Title",
			Parent = DexGui76,
		}
	)
	local DexGui78 = CreateInstance(
		"TextLabel",
		{
			Font = 4,
			FontSize = 6,
			Text = "V1.1.0 ALPHA",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 18,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 1,
			TextYAlignment = 2,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(1, -105, 1, -20),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 100, 0, 20),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Version",
			Parent = DexGui76,
		}
	)
	local DexGui79 = CreateInstance(
		"TextLabel",
		{
			Font = 4,
			FontSize = 6,
			Text = "Made by Moon & Courtney",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 18,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 2,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 5, 1, -20),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 100, 0, 20),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Creator",
			Parent = DexGui76,
		}
	)
	local DexGui80 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.039215687662363, 0.039215687662363, 0.039215687662363),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 50, 0, 120),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 200, 0, 80),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Progress",
			Parent = DexGui76,
		}
	)
	local DexGui81 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 2, 1, 0),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Line",
			Parent = DexGui80,
		}
	)
	local DexGui82 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Fetching latest API...",
			TextColor3 = Color3.new(0.78431379795074, 0.78431379795074, 0.78431379795074),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 10, 0, 0),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 0, 15),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Progress1",
			Parent = DexGui80,
		}
	)
	local DexGui83 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Fetching latest Reflection Metadata...",
			TextColor3 = Color3.new(0.78431379795074, 0.78431379795074, 0.78431379795074),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 10, 0, 15),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 0, 15),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Progress2",
			Parent = DexGui80,
		}
	)
	local DexGui84 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Importing DexStorage items...",
			TextColor3 = Color3.new(0.78431379795074, 0.78431379795074, 0.78431379795074),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 10, 0, 30),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 0, 15),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Progress3",
			Parent = DexGui80,
		}
	)
	local DexGui85 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Indexing tree list...",
			TextColor3 = Color3.new(0.78431379795074, 0.78431379795074, 0.78431379795074),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 10, 0, 45),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 0, 15),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Progress4",
			Parent = DexGui80,
		}
	)
	local DexGui86 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 5,
			Text = "Starting up...",
			TextColor3 = Color3.new(0.78431379795074, 0.78431379795074, 0.78431379795074),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 10, 0, 60),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -10, 0, 15),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Progress5",
			Parent = DexGui80,
		}
	)
	local DexGui88 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.60000002384186, 0, 1, -50),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0.40000000596046, 0, 0, 50),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Bottom",
			Parent = DexGui75,
		}
	)
	local DexGui89 = CreateInstance(
		"ImageLabel",
		{
			Image = "rbxassetid://493608750",
			ImageColor3 = Color3.new(1, 1, 1),
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
			ImageTransparency = 0,
			ScaleType = 0,
			SliceCenter = Rect.new(0, 0, 0, 0),
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 5, 0, 5),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0, 40, 0, 40),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Logo",
			Parent = DexGui88,
		}
	)
	local DexGui90 = CreateInstance(
		"TextLabel",
		{
			Font = 3,
			FontSize = 6,
			Text = "Powerful and light",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 18,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = true,
			TextXAlignment = 0,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 50, 0, 5),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -55, 0, 25),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Desc",
			Parent = DexGui88,
		}
	)
	local DexGui91 = CreateInstance(
		"TextLabel",
		{
			Font = 4,
			FontSize = 4,
			Text = "Image by KrystalTeam",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 12,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 0,
			TextYAlignment = 2,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 50, 1, -20),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, -55, 0, 15),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Credit",
			Parent = DexGui88,
		}
	)
	local DexGui92 = CreateInstance(
		"Frame",
		{
			Style = 0,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.25098040699959, 0.25098040699959, 0.25098040699959),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.43921571969986, 0.43921571969986, 0.43921571969986),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0.60000002384186, 5, 0, 20),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(0.40000000596046, -10, 1, -75),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Changelog",
			Parent = DexGui75,
		}
	)
	local DexGui93 = CreateInstance(
		"TextLabel",
		{
			Font = 10,
			FontSize = 5,
			Text = "Changelog",
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = false,
			TextSize = 14,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 1,
			TextTransparency = 0,
			TextWrapped = false,
			TextXAlignment = 2,
			TextYAlignment = 1,
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
			BorderSizePixel = 1,
			ClipsDescendants = false,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, -20),
			Rotation = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 0, 20),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "Title",
			Parent = DexGui92,
		}
	)

	return DexGui
end

do
	function createReqGui()
		local Frame = Instance.new("Frame", protectedGui())
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local TextLabel = Instance.new("TextLabel")

		Frame.Visible = false
		Frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.285367817, 0, 0.126878127, 0)
		Frame.Size = UDim2.new(0, 476, 0, 388)
		Frame.ZIndex = 5

		local UserInputService = Services.UserInputService

		local gui = Frame

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end

		gui.InputBegan:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
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
			if
				input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch
			then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)

		ScrollingFrame.Parent = Frame
		ScrollingFrame.Active = true
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0, 9, 0, 7)
		ScrollingFrame.Size = UDim2.new(0, 458, 0, 321)
		ScrollingFrame.ScrollBarThickness = 4

		UIListLayout.Parent = ScrollingFrame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		TextLabel.Parent = ScrollingFrame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(0, 446, 0, 322)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.TextColor3 = Color3.fromRGB(218, 218, 218)
		TextLabel.TextSize = 14.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.TextYAlignment = Enum.TextYAlignment.Top
		TextLabel.RichText = true

		local TextButton = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local TextButton_2 = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")

		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.787815154, 0, 0.865825772, 0)
		TextButton.Size = UDim2.new(0, 92, 0, 43)
		TextButton.Font = Enum.Font.Gotham
		TextButton.Text = "Close"
		TextButton.TextColor3 = Color3.fromRGB(230, 230, 230)
		TextButton.TextSize = 14.000
		TextButton.MouseButton1Click:Connect(function()
			Frame:Destroy()
		end)

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = TextButton

		TextButton_2.Parent = Frame
		TextButton_2.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
		TextButton_2.BorderSizePixel = 0
		TextButton_2.Position = UDim2.new(0.579831958, 0, 0.865825772, 0)
		TextButton_2.Size = UDim2.new(0, 92, 0, 43)
		TextButton_2.Font = Enum.Font.Gotham
		TextButton_2.Text = "Copy"
		TextButton_2.TextColor3 = Color3.fromRGB(230, 230, 230)
		TextButton_2.TextSize = 14.000
		TextButton_2.MouseButton1Click:Connect(function()
			if not crrObj then
				wait(0.1)
			end
			if crrObj then
				setclipboard("require(game." .. crrObj:GetFullName() .. ")")
			end
		end)

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = TextButton_2

		local TextLabel_2 = Instance.new("TextLabel")

		TextLabel_2.Parent = Frame
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Position = UDim2.new(0.0315126069, 0, 0.914329906, 0)
		TextLabel_2.Size = UDim2.new(0, 201, 0, 31)
		TextLabel_2.Font = Enum.Font.Gotham
		TextLabel_2.TextColor3 = Color3.fromRGB(218, 218, 218)
		TextLabel_2.TextSize = 12.000
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_2.RichText = true

		local function st(e, adcti)
			local tl, sp = "{\n", adcti

			local function lp(e)
				for i, v in pairs(e) do
					local t = type(v)
					if t == "table" then
						tl = tl .. (sp .. ' <font size="15">' .. i .. "</font>  {") .. "\n\n"
						sp = sp .. adcti
						lp(v)
						sp = sp:sub(0, #sp - #adcti)
						tl = tl .. "\n"
					else
						if type(i) == "number" then
							tl = tl
								.. (sp .. ' <b>[<font color="rgb(170,170,170)">' .. i .. '</font>]</b> = <font color="rgb(170,170,170)">' .. v .. "</font>")
								.. "\n"
						elseif t == "string" then
							tl = tl
								.. (sp .. " <b>" .. i .. '</b> = "<font color="rgb(170,170,170)">' .. v .. '</font>"')
								.. "\n"
						end
					end
				end
			end
			lp(e)
			return tl .. "}"
		end

		return function(obj)
			Frame.Visible = false
			TextLabel_2.Text = 'Module: <font color="rgb(170,170,170)">' .. obj.Name .. "</font>"
			TextLabel.RichText = false
			TextLabel.Text = st(require(obj), "     ")
			TextLabel.Size = UDim2.new(0, 446, 0, TextLabel.TextBounds.Y)
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
			crrObj = obj
			TextLabel.RichText = true
			Frame.Visible = true
		end
	end
end

-- Main Gui References
local gui = createDexGui()
for i, v in pairs(gui:GetChildren()) do
	pcall(function()
		v.ZIndex = 4
	end)
end
if not gui.Parent then
	gui.Parent = Services.CoreGui
end
local contentL = gui:WaitForChild("ContentFrameL")
local contentR = gui:WaitForChild("ContentFrameR")
local resources = gui:WaitForChild("Resources")

-- Explorer Stuff
local explorerTree = nil
local updateDebounce = false
local rightClickContext = nil
local rightEntry = nil
local clipboard = {}
local lastSearch = 0
local nodeWidth = 0

-- Properties Stuff
local propertiesTree = nil
local propWidth = 0

-- Settings
local explorerSettings = {
	LPaneWidth = 300,
	RPaneWidth = 300,
}

-- JSON Stuff
local API
local RMD

-- Main Variables
local mouse = Services.Players.LocalPlayer:GetMouse()
local mouseWindow = nil
local LPaneItems = {}
local RPaneItems = {}
local setPane = "None"
local activeWindows = {}
local f = {}
local API = {}
local RMD = {}

-- ScrollBar
function f.buttonArrows(size, num, dir)
	local max = num
	local arrowFrame = CreateInstance("Frame", {
		BackgroundTransparency = 1,
		Name = "Arrow",
		Size = UDim2.new(0, size, 0, size),
	})
	if dir == "up" then
		for i = 1, num do
			local newLine = CreateInstance("Frame", {
				BackgroundColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255),
				BorderSizePixel = 0,
				Position = UDim2.new(
					0,
					math.floor(size / 2) - (i - 1),
					0,
					math.floor(size / 2) + i - math.floor(max / 2) - 1
				),
				Size = UDim2.new(0, i + (i - 1), 0, 1),
				Parent = arrowFrame,
			})
		end
		return arrowFrame
	elseif dir == "down" then
		for i = 1, num do
			local newLine = CreateInstance("Frame", {
				BackgroundColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255),
				BorderSizePixel = 0,
				Position = UDim2.new(
					0,
					math.floor(size / 2) - (i - 1),
					0,
					math.floor(size / 2) - i + math.floor(max / 2) + 1
				),
				Size = UDim2.new(0, i + (i - 1), 0, 1),
				Parent = arrowFrame,
			})
		end
		return arrowFrame
	elseif dir == "left" then
		for i = 1, num do
			local newLine = CreateInstance("Frame", {
				BackgroundColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255),
				BorderSizePixel = 0,
				Position = UDim2.new(
					0,
					math.floor(size / 2) + i - math.floor(max / 2) - 1,
					0,
					math.floor(size / 2) - (i - 1)
				),
				Size = UDim2.new(0, 1, 0, i + (i - 1)),
				Parent = arrowFrame,
			})
		end
		return arrowFrame
	elseif dir == "right" then
		for i = 1, num do
			local newLine = CreateInstance("Frame", {
				BackgroundColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255),
				BorderSizePixel = 0,
				Position = UDim2.new(
					0,
					math.floor(size / 2) - i + math.floor(max / 2) + 1,
					0,
					math.floor(size / 2) - (i - 1)
				),
				Size = UDim2.new(0, 1, 0, i + (i - 1)),
				Parent = arrowFrame,
			})
		end
		return arrowFrame
	end
	error("r u ok")
end

local ScrollBar
do
	ScrollBar = {}

	local user = game:GetService("UserInputService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()

	ScrollMt = {
		__index = {
			AddMarker = function(self, ind, color)
				self.Markers[ind] = color or Color3.new(0, 0, 0)
			end,
			ScrollTo = function(self, ind)
				self.Index = ind
				self:Update()
			end,
			ScrollUp = function(self)
				self.Index = self.Index - self.Increment
				self:Update()
			end,
			ScrollDown = function(self)
				self.Index = self.Index + self.Increment
				self:Update()
			end,
			CanScrollUp = function(self)
				return self.Index > 0
			end,
			CanScrollDown = function(self)
				return self.Index + self.VisibleSpace < self.TotalSpace
			end,
			GetScrollPercent = function(self)
				return self.Index / (self.TotalSpace - self.VisibleSpace)
			end,
			SetScrollPercent = function(self, perc)
				self.Index = math.floor(perc * (self.TotalSpace - self.VisibleSpace))
				self:Update()
			end,
		},
	}

	function ScrollBar.new(hor)
		local newFrame = CreateInstance(
			"Frame",
			{
				Style = 0,
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(0.35294118523598, 0.35294118523598, 0.35294118523598),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(1, -16, 0, 0),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(0, 16, 1, 0),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "ScrollBar",
			}
		)
		local button1 = nil
		local button2 = nil

		local lastTotalSpace = 0

		if hor then
			newFrame.Size = UDim2.new(1, 0, 0, 16)
			button1 = CreateInstance("ImageButton", {
				Parent = newFrame,
				Name = "Left",
				Size = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
			})
			f.buttonArrows(16, 4, "left").Parent = button1
			button2 = CreateInstance("ImageButton", {
				Parent = newFrame,
				Name = "Right",
				Position = UDim2.new(1, -16, 0, 0),
				Size = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
			})
			f.buttonArrows(16, 4, "right").Parent = button2
		else
			newFrame.Size = UDim2.new(0, 16, 1, 0)
			button1 = CreateInstance("ImageButton", {
				Parent = newFrame,
				Name = "Up",
				Size = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
			})
			f.buttonArrows(16, 4, "up").Parent = button1
			button2 = CreateInstance("ImageButton", {
				Parent = newFrame,
				Name = "Down",
				Position = UDim2.new(0, 0, 1, -16),
				Size = UDim2.new(0, 16, 0, 16),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
			})
			f.buttonArrows(16, 4, "down").Parent = button2
		end

		local scrollThumbFrame = CreateInstance("Frame", {
			BackgroundTransparency = 1,
			Parent = newFrame,
		})
		if hor then
			scrollThumbFrame.Position = UDim2.new(0, 16, 0, 0)
			scrollThumbFrame.Size = UDim2.new(1, -32, 1, 0)
		else
			scrollThumbFrame.Position = UDim2.new(0, 0, 0, 16)
			scrollThumbFrame.Size = UDim2.new(1, 0, 1, -32)
		end

		local scrollThumb = CreateInstance("Frame", {
			BackgroundColor3 = Color3.new(120 / 255, 120 / 255, 120 / 255),
			BorderSizePixel = 0,
			Parent = scrollThumbFrame,
		})

		local markerFrame = CreateInstance("Frame", {
			BackgroundTransparency = 1,
			Name = "Markers",
			Size = UDim2.new(1, 0, 1, 0),
			Parent = scrollThumbFrame,
		})

		local newMt = setmetatable({
			Gui = newFrame,
			Index = 0,
			VisibleSpace = 0,
			TotalSpace = 0,
			Increment = 1,
			Markers = {},
		}, ScrollMt)

		local function drawThumb()
			local total = newMt.TotalSpace
			local visible = newMt.VisibleSpace
			local index = newMt.Index

			if not (newMt:CanScrollUp() or newMt:CanScrollDown()) then
				scrollThumb.Visible = false
			else
				scrollThumb.Visible = true
			end

			if hor then
				scrollThumb.Size = UDim2.new(visible / total, 0, 1, 0)
				if scrollThumb.AbsoluteSize.X < 16 then
					scrollThumb.Size = UDim2.new(0, 16, 1, 0)
				end
				local fs = scrollThumbFrame.AbsoluteSize.X
				local bs = scrollThumb.AbsoluteSize.X
				scrollThumb.Position = UDim2.new(newMt:GetScrollPercent() * (fs - bs) / fs, 0, 0, 0)
			else
				scrollThumb.Size = UDim2.new(1, 0, visible / total, 0)
				if scrollThumb.AbsoluteSize.Y < 16 then
					scrollThumb.Size = UDim2.new(1, 0, 0, 16)
				end
				local fs = scrollThumbFrame.AbsoluteSize.Y
				local bs = scrollThumb.AbsoluteSize.Y
				scrollThumb.Position = UDim2.new(0, 0, newMt:GetScrollPercent() * (fs - bs) / fs, 0)
			end
		end

		local function updateMarkers()
			markerFrame:ClearAllChildren()

			for i, v in pairs(newMt.Markers) do
				if i < newMt.TotalSpace then
					CreateInstance("Frame", {
						BackgroundTransparency = 0,
						BackgroundColor3 = v,
						BorderSizePixel = 0,
						Position = hor and UDim2.new(i / newMt.TotalSpace, 0, 1, -6) or UDim2.new(
							1,
							-6,
							i / newMt.TotalSpace,
							0
						),
						Size = hor and UDim2.new(0, 1, 0, 6) or UDim2.new(0, 6, 0, 1),
						Name = "Marker" .. tostring(i),
						Parent = markerFrame,
					})
				end
			end
		end
		newMt.UpdateMarkers = updateMarkers

		local function update()
			local total = newMt.TotalSpace
			local visible = newMt.VisibleSpace
			local index = newMt.Index

			if visible <= total then
				if index > 0 then
					if index + visible > total then
						newMt.Index = total - visible
					end
				else
					newMt.Index = 0
				end
			else
				newMt.Index = 0
			end

			if lastTotalSpace ~= newMt.TotalSpace then
				lastTotalSpace = newMt.TotalSpace
				updateMarkers()
			end

			if newMt.OnUpdate then
				newMt:OnUpdate()
			end

			if newMt:CanScrollUp() then
				for i, v in pairs(button1.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			else
				button1.BackgroundTransparency = 1
				for i, v in pairs(button1.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0.5
				end
			end
			if newMt:CanScrollDown() then
				for i, v in pairs(button2.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			else
				button2.BackgroundTransparency = 1
				for i, v in pairs(button2.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0.5
				end
			end

			drawThumb()
		end

		local buttonPress = false
		local thumbPress = false
		local thumbFramePress = false

		local thumbColor = Color3.new(120 / 255, 120 / 255, 120 / 255)
		local thumbSelectColor = Color3.new(140 / 255, 140 / 255, 140 / 255)
		button1.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress and newMt:CanScrollUp() then
				button1.BackgroundTransparency = 0.8
			end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 or not newMt:CanScrollUp() then
				return
			end
			buttonPress = true
			button1.BackgroundTransparency = 0.5
			if newMt:CanScrollUp() then
				newMt:ScrollUp()
			end
			local buttonTick = tick()
			local releaseEvent
			releaseEvent = user.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
					return
				end
				releaseEvent:Disconnect()
				if f.checkMouseInGui(button1) and newMt:CanScrollUp() then
					button1.BackgroundTransparency = 0.8
				else
					button1.BackgroundTransparency = 1
				end
				buttonPress = false
			end)
			while buttonPress do
				if tick() - buttonTick >= 0.3 and newMt:CanScrollUp() then
					newMt:ScrollUp()
				end
				wait()
			end
		end)
		button1.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress then
				button1.BackgroundTransparency = 1
			end
		end)
		button2.InputBegan:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement
				and not buttonPress
				and newMt:CanScrollDown()
			then
				button2.BackgroundTransparency = 0.8
			end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 or not newMt:CanScrollDown() then
				return
			end
			buttonPress = true
			button2.BackgroundTransparency = 0.5
			if newMt:CanScrollDown() then
				newMt:ScrollDown()
			end
			local buttonTick = tick()
			local releaseEvent
			releaseEvent = user.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
					return
				end
				releaseEvent:Disconnect()
				if f.checkMouseInGui(button2) and newMt:CanScrollDown() then
					button2.BackgroundTransparency = 0.8
				else
					button2.BackgroundTransparency = 1
				end
				buttonPress = false
			end)
			while buttonPress do
				if tick() - buttonTick >= 0.3 and newMt:CanScrollDown() then
					newMt:ScrollDown()
				end
				wait()
			end
		end)
		button2.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and not buttonPress then
				button2.BackgroundTransparency = 1
			end
		end)

		scrollThumb.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and not thumbPress then
				scrollThumb.BackgroundTransparency = 0.2
				scrollThumb.BackgroundColor3 = thumbSelectColor
			end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end

			local dir = hor and "X" or "Y"
			local lastThumbPos = nil

			buttonPress = false
			thumbFramePress = false
			thumbPress = true
			scrollThumb.BackgroundTransparency = 0
			local mouseOffset = mouse[dir] - scrollThumb.AbsolutePosition[dir]
			local mouseStart = mouse[dir]
			local releaseEvent
			local mouseEvent
			releaseEvent = user.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
					return
				end
				releaseEvent:Disconnect()
				if mouseEvent then
					mouseEvent:Disconnect()
				end
				if f.checkMouseInGui(scrollThumb) then
					scrollThumb.BackgroundTransparency = 0.2
				else
					scrollThumb.BackgroundTransparency = 0
					scrollThumb.BackgroundColor3 = thumbColor
				end
				thumbPress = false
			end)
			newMt:Update()
			--while math.abs(mouse[dir] - mouseStart) == 0 do wait() end
			mouseEvent = user.InputChanged:Connect(function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement
					and thumbPress
					and releaseEvent.Connected
				then
					local thumbFrameSize = scrollThumbFrame.AbsoluteSize[dir] - scrollThumb.AbsoluteSize[dir]
					local pos = mouse[dir] - scrollThumbFrame.AbsolutePosition[dir] - mouseOffset
					if pos > thumbFrameSize then
						pos = thumbFrameSize
					elseif pos < 0 then
						pos = 0
					end
					if lastThumbPos ~= pos then
						lastThumbPos = pos
						newMt:ScrollTo(math.floor(pos / thumbFrameSize * (newMt.TotalSpace - newMt.VisibleSpace)))
					end
					wait()
				end
			end)
		end)
		scrollThumb.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and not thumbPress then
				scrollThumb.BackgroundTransparency = 0
				scrollThumb.BackgroundColor3 = thumbColor
			end
		end)
		scrollThumbFrame.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 or f.checkMouseInGui(scrollThumb) then
				return
			end

			local dir = hor and "X" or "Y"

			local function doTick()
				local thumbFrameSize = scrollThumbFrame.AbsoluteSize[dir] - scrollThumb.AbsoluteSize[dir]
				local thumbFrameDist = scrollThumb.AbsolutePosition[dir] - scrollThumbFrame.AbsolutePosition[dir]
				local pos = thumbFrameDist
					+ (
						mouse[dir]
								< scrollThumb.AbsolutePosition[dir] + math.floor(scrollThumb.AbsoluteSize[dir] / 2)
							and -50
						or 50
					)
				if pos > thumbFrameSize then
					pos = thumbFrameSize
				elseif pos < 0 then
					pos = 0
				end
				if
					pos < thumbFrameDist
					and scrollThumbFrame.AbsolutePosition[dir]
							+ pos
							+ math.floor(scrollThumb.AbsoluteSize[dir] / 2)
						<= mouse[dir]
				then
					pos = mouse[dir]
						- scrollThumbFrame.AbsolutePosition[dir]
						- math.floor(scrollThumb.AbsoluteSize[dir] / 2)
				elseif
					pos > thumbFrameDist
					and scrollThumbFrame.AbsolutePosition[dir]
							+ pos
							+ math.floor(scrollThumb.AbsoluteSize[dir] / 2)
						>= mouse[dir]
				then
					pos = mouse[dir]
						- scrollThumbFrame.AbsolutePosition[dir]
						- math.floor(scrollThumb.AbsoluteSize[dir] / 2)
				end
				newMt:ScrollTo(math.floor(pos / thumbFrameSize * (newMt.TotalSpace - newMt.VisibleSpace)))
			end

			thumbPress = false
			thumbFramePress = true
			doTick()
			local thumbFrameTick = tick()
			local releaseEvent
			releaseEvent = user.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
					return
				end
				releaseEvent:Disconnect()
				thumbFramePress = false
			end)
			while thumbFramePress and not f.checkMouseInGui(scrollThumb) do
				if tick() - thumbFrameTick >= 0.3 then
					doTick()
				end
				wait()
			end
		end)

		local function texture(self, data)
			thumbColor = data.ThumbColor or Color3.new(0, 0, 0)
			thumbSelectColor = data.ThumbSelectColor or Color3.new(0, 0, 0)
			scrollThumb.BackgroundColor3 = data.ThumbColor or Color3.new(0, 0, 0)
			newFrame.BackgroundColor3 = data.FrameColor or Color3.new(0, 0, 0)
			button1.BackgroundColor3 = data.ButtonColor or Color3.new(0, 0, 0)
			button2.BackgroundColor3 = data.ButtonColor or Color3.new(0, 0, 0)
			for i, v in pairs(button1.Arrow:GetChildren()) do
				v.BackgroundColor3 = data.ArrowColor or Color3.new(0, 0, 0)
			end
			for i, v in pairs(button2.Arrow:GetChildren()) do
				v.BackgroundColor3 = data.ArrowColor or Color3.new(0, 0, 0)
			end
		end
		newMt.Texture = texture

		local wheelIncrement = 1
		local scrollOverlay = Instance.new("ScrollingFrame")
		scrollOverlay.BackgroundTransparency = 1
		scrollOverlay.Size = UDim2.new(1, 0, 1, 0)
		scrollOverlay.ScrollBarThickness = 0
		scrollOverlay.CanvasSize = UDim2.new(0, 0, 0, 0)
		local scrollOverlayFrame = Instance.new("Frame", scrollOverlay)
		scrollOverlayFrame.BackgroundTransparency = 1
		scrollOverlayFrame.Size = UDim2.new(1, 0, 1, 0)
		scrollOverlayFrame.MouseWheelForward:Connect(function()
			newMt:ScrollTo(newMt.Index - wheelIncrement)
		end)
		scrollOverlayFrame.MouseWheelBackward:Connect(function()
			newMt:ScrollTo(newMt.Index + wheelIncrement)
		end)

		local scrollUpEvent, scrollDownEvent

		local function setScrollFrame(self, frame, inc)
			wheelIncrement = inc or self.Increment
			if scrollUpEvent then
				scrollUpEvent:Disconnect()
				scrollUpEvent = nil
			end
			if scrollDownEvent then
				scrollDownEvent:Disconnect()
				scrollDownEvent = nil
			end
			scrollUpEvent = frame.MouseWheelForward:Connect(function()
				newMt:ScrollTo(newMt.Index - wheelIncrement)
			end)
			scrollDownEvent = frame.MouseWheelBackward:Connect(function()
				newMt:ScrollTo(newMt.Index + wheelIncrement)
			end)
			--scrollOverlay.Parent = frame
		end
		newMt.SetScrollFrame = setScrollFrame

		newMt.Update = update

		update()
		return newMt
	end
end

local TreeView
do
	TreeView = {}

	local treeMt = {
		__index = {
			Length = function(self)
				return #self.Tree
			end,
		},
	}

	function TreeView.new()
		local function createDNodeTemplate()
			local DNodeTemplate = CreateInstance(
				"TextButton",
				{
					Font = 3,
					FontSize = 5,
					Text = "",
					TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					TextScaled = false,
					TextSize = 14,
					TextStrokeColor3 = Color3.new(0, 0, 0),
					TextStrokeTransparency = 1,
					TextTransparency = 0,
					TextWrapped = false,
					TextXAlignment = 2,
					TextYAlignment = 1,
					AutoButtonColor = false,
					Modal = false,
					Selected = false,
					Style = 0,
					Active = true,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(0.37647062540054, 0.54901963472366, 0.82745105028152),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161),
					BorderSizePixel = 1,
					ClipsDescendants = false,
					Draggable = false,
					Position = UDim2.new(0, 1, 0, 2),
					Rotation = 0,
					Selectable = true,
					Size = UDim2.new(1, -18, 0, 18),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "Entry",
				}
			)
			local DNodeTemplate2 = CreateInstance(
				"Frame",
				{
					Style = 0,
					Active = false,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.14509804546833, 0.20784315466881, 0.21176472306252),
					BorderSizePixel = 1,
					ClipsDescendants = false,
					Draggable = false,
					Position = UDim2.new(0, 18, 0, 0),
					Rotation = 0,
					Selectable = false,
					Size = UDim2.new(1, -18, 1, 0),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "Indent",
					Parent = DNodeTemplate,
				}
			)
			local DNodeTemplate3 = CreateInstance(
				"TextLabel",
				{
					Font = 3,
					FontSize = 5,
					Text = "Item",
					TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
					TextScaled = false,
					TextSize = 14,
					TextStrokeColor3 = Color3.new(0, 0, 0),
					TextStrokeTransparency = 1,
					TextTransparency = 0,
					TextWrapped = false,
					TextXAlignment = 0,
					TextYAlignment = 1,
					Active = false,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					BorderSizePixel = 1,
					ClipsDescendants = false,
					Draggable = false,
					Position = UDim2.new(0, 22, 0, 0),
					Rotation = 0,
					Selectable = false,
					Size = UDim2.new(1, -22, 0, 18),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "EntryName",
					Parent = DNodeTemplate2,
				}
			)
			local DNodeTemplate4 = CreateInstance(
				"Frame",
				{
					Style = 0,
					Active = false,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					BorderSizePixel = 1,
					ClipsDescendants = true,
					Draggable = false,
					Position = UDim2.new(0, 2, 0.5, -8),
					Rotation = 0,
					Selectable = false,
					Size = UDim2.new(0, 16, 0, 16),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "IconFrame",
					Parent = DNodeTemplate2,
				}
			)
			local DNodeTemplate5 = CreateInstance(
				"ImageLabel",
				{
					Image = "rbxassetid://529659138",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageRectOffset = Vector2.new(0, 0),
					ImageRectSize = Vector2.new(0, 0),
					ImageTransparency = 0,
					ScaleType = 0,
					SliceCenter = Rect.new(0, 0, 0, 0),
					Active = false,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					BorderSizePixel = 1,
					ClipsDescendants = false,
					Draggable = false,
					Position = UDim2.new(-5.811999797821, 0, -1.3120000362396, 0),
					Rotation = 0,
					Selectable = false,
					Size = UDim2.new(16, 0, 16, 0),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "Icon",
					Parent = DNodeTemplate4,
				}
			)
			local DNodeTemplate6 = CreateInstance(
				"TextButton",
				{
					Font = 3,
					FontSize = 5,
					Text = "",
					TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					TextScaled = false,
					TextSize = 14,
					TextStrokeColor3 = Color3.new(0, 0, 0),
					TextStrokeTransparency = 1,
					TextTransparency = 0,
					TextWrapped = false,
					TextXAlignment = 2,
					TextYAlignment = 1,
					AutoButtonColor = true,
					Modal = false,
					Selected = false,
					Style = 0,
					Active = true,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					BorderSizePixel = 1,
					ClipsDescendants = true,
					Draggable = false,
					Position = UDim2.new(0, -16, 0.5, -8),
					Rotation = 0,
					Selectable = true,
					Size = UDim2.new(0, 16, 0, 16),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "Expand",
					Parent = DNodeTemplate2,
				}
			)
			local DNodeTemplate7 = CreateInstance(
				"ImageLabel",
				{
					Image = "rbxassetid://529659138",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageRectOffset = Vector2.new(0, 0),
					ImageRectSize = Vector2.new(0, 0),
					ImageTransparency = 0,
					ScaleType = 0,
					SliceCenter = Rect.new(0, 0, 0, 0),
					Active = false,
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
					BorderSizePixel = 1,
					ClipsDescendants = false,
					Draggable = false,
					Position = UDim2.new(-12.562000274658, 0, -12.562000274658, 0),
					Rotation = 0,
					Selectable = false,
					Size = UDim2.new(16, 0, 16, 0),
					SizeConstraint = 0,
					Visible = true,
					ZIndex = 1,
					Name = "Icon",
					Parent = DNodeTemplate6,
				}
			)
			return DNodeTemplate
		end
		local dNodeTemplate = createDNodeTemplate()

		local newMt = setmetatable({
			Index = 0,
			Tree = {},
			Expanded = {},
			NodeTemplate = dNodeTemplate,
			DisplayFrame = nil,
			Entries = {},
			Height = 18,
			OffX = 1,
			OffY = 1,
		}, treeMt)

		local function refresh(self)
			if not self.DisplayFrame then
				warn("Tree: No Display Frame")
				return
			end

			if self.PreUpdate then
				self:PreUpdate()
			end

			local displayFrame = self.DisplayFrame
			local entrySpace = math.ceil(displayFrame.AbsoluteSize.Y / (self.Height + 1))

			for i = 1, entrySpace do
				local node = self.Tree[i + self.Index]
				if node then
					local entry = self.Entries[i]
					if not entry then
						entry = self.NodeTemplate:Clone()
						entry.Position = UDim2.new(
							0,
							self.OffX,
							0,
							self.OffY + (self.Height + 1) * #displayFrame:GetChildren()
						)
						entry.Parent = displayFrame
						self.Entries[i] = entry
						if self.NodeCreate then
							self:NodeCreate(entry, i)
						end
					end
					entry.Visible = true
					if self.NodeDraw then
						self:NodeDraw(entry, node)
					end
				else
					local entry = self.Entries[i]
					if entry then
						entry.Visible = false
					end
				end
			end

			for i = entrySpace + 1, #self.Entries do
				if self.Entries[i] then
					self.Entries[i]:Destroy()
					self.Entries[i] = nil
				end
			end

			if self.OnUpdate then
				self:OnUpdate()
			end
			if self.RefreshNeeded then
				self.RefreshNeeded = false
				self:Refresh()
			end
		end
		newMt.Refresh = refresh

		local function expand(self, item)
			self.Expanded[item] = not self.Expanded[item]
			if self.TreeUpdate then
				self:TreeUpdate()
			end
			self:Refresh()
		end
		newMt.Expand = expand

		local Selection
		do
			Selection = {
				List = {},
				Selected = {},
			}

			function Selection:Add(obj)
				if Selection.Selected[obj] then
					return
				end

				Selection.Selected[obj] = true
				table.insert(Selection.List, obj)
			end

			function Selection:Set(objs)
				for i, v in pairs(Selection.List) do
					Selection.Selected[v] = nil
				end
				Selection.List = {}

				for i, v in pairs(objs) do
					if not Selection.Selected[v] then
						Selection.Selected[v] = true
						table.insert(Selection.List, v)
					end
				end
			end

			function Selection:Remove(obj)
				if not Selection.Selected[obj] then
					return
				end

				Selection.Selected[obj] = false
				for i, v in pairs(Selection.List) do
					if v == obj then
						table.remove(Selection.List, i)
						break
					end
				end
			end
		end
		newMt.Selection = Selection

		return newMt
	end
end

local ContextMenu
do
	ContextMenu = {}

	local function createContextEntry()
		local ContextEntry = CreateInstance(
			"TextButton",
			{
				Font = 3,
				FontSize = 5,
				Text = "",
				TextColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				TextScaled = false,
				TextSize = 14,
				TextStrokeColor3 = Color3.new(0, 0, 0),
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextWrapped = false,
				TextXAlignment = 2,
				TextYAlignment = 1,
				AutoButtonColor = false,
				Modal = false,
				Selected = false,
				Style = 0,
				Active = true,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(0.37647062540054, 0.54901963472366, 0.82745105028152),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.33725491166115, 0.49019610881805, 0.73725491762161),
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(0, 0, 0, 2),
				Rotation = 0,
				Selectable = true,
				Size = UDim2.new(1, 0, 0, 20),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "Entry",
			}
		)
		local ContextEntry2 = CreateInstance(
			"Frame",
			{
				Style = 0,
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 1,
				ClipsDescendants = true,
				Draggable = false,
				Position = UDim2.new(0, 2, 0.5, -8),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(0, 16, 0, 16),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "IconFrame",
				Parent = ContextEntry,
			}
		)
		local ContextEntry3 = CreateInstance(
			"ImageLabel",
			{
				Image = "rbxassetid://529659138",
				ImageColor3 = Color3.new(1, 1, 1),
				ImageRectOffset = Vector2.new(0, 0),
				ImageRectSize = Vector2.new(0, 0),
				ImageTransparency = 0,
				ScaleType = 0,
				SliceCenter = Rect.new(0, 0, 0, 0),
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 1,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(0, 0, 0, 0),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(0, 16, 0, 16),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "Icon",
				Parent = ContextEntry2,
			}
		)
		local ContextEntry4 = CreateInstance(
			"TextLabel",
			{
				Font = 3,
				FontSize = 5,
				Text = "Item",
				TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
				TextScaled = false,
				TextSize = 14,
				TextStrokeColor3 = Color3.new(0, 0, 0),
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextWrapped = false,
				TextXAlignment = 0,
				TextYAlignment = 1,
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 1,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(0, 24, 0, 0),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(1, -24, 0, 20),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "EntryName",
				Parent = ContextEntry,
			}
		)
		local ContextEntry5 = CreateInstance(
			"TextLabel",
			{
				Font = 3,
				FontSize = 5,
				Text = "Ctrl+C",
				TextColor3 = Color3.new(0.86274516582489, 0.86274516582489, 0.86274516582489),
				TextScaled = false,
				TextSize = 14,
				TextStrokeColor3 = Color3.new(0, 0, 0),
				TextStrokeTransparency = 1,
				TextTransparency = 0,
				TextWrapped = false,
				TextXAlignment = 1,
				TextYAlignment = 1,
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 1,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(0, 24, 0, 0),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(1, -30, 0, 20),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "Shortcut",
				Parent = ContextEntry,
			}
		)
		return ContextEntry
	end

	local function createContextDivider()
		local ContextDivider = CreateInstance(
			"Frame",
			{
				Style = 0,
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(0.18823531270027, 0.18823531270027, 0.18823531270027),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(0, 0, 0, 20),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, 12),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "Divider",
			}
		)
		local ContextDivider2 = CreateInstance(
			"Frame",
			{
				Style = 0,
				Active = false,
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.new(0.43921571969986, 0.43921571969986, 0.43921571969986),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.new(0.10588236153126, 0.16470588743687, 0.20784315466881),
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Draggable = false,
				Position = UDim2.new(0, 2, 0, 5),
				Rotation = 0,
				Selectable = false,
				Size = UDim2.new(1, -4, 0, 1),
				SizeConstraint = 0,
				Visible = true,
				ZIndex = 1,
				Name = "Line",
				Parent = ContextDivider,
			}
		)
		return ContextDivider
	end

	local contextFrame = CreateInstance(
		"ScrollingFrame",
		{
			BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
			CanvasPosition = Vector2.new(0, 0),
			CanvasSize = UDim2.new(0, 0, 2, 0),
			MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
			ScrollBarThickness = 0,
			ScrollingEnabled = true,
			TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
			Active = false,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Color3.new(0.3137255012989, 0.3137255012989, 0.3137255012989),
			BackgroundTransparency = 0,
			BorderColor3 = Color3.new(0.43921571969986, 0.43921571969986, 0.43921571969986),
			BorderSizePixel = 1,
			ClipsDescendants = true,
			Draggable = false,
			Position = UDim2.new(0, 0, 0, 0),
			Rotation = 0,
			Selectable = true,
			Size = UDim2.new(0, 200, 0, 100),
			SizeConstraint = 0,
			Visible = true,
			ZIndex = 1,
			Name = "ContextFrame",
		}
	)
	local contextEntry = createContextEntry()
	local contextDivider = createContextDivider()

	function ContextMenu.new()
		local newMt = setmetatable({
			Width = 200,
			Height = 20,
			Items = {},
			Frame = contextFrame:Clone(),
		}, {})

		local mainFrame = newMt.Frame
		mainFrame.ZIndex = 5
		local entryFrame = contextEntry:Clone()
		local dividerFrame = contextDivider:Clone()

		mainFrame.ScrollingEnabled = false

		local function add(self, item)
			local newItem = {
				Name = item.Name or "Item",
				Icon = item.Icon or "",
				Shortcut = item.Shortcut or "",
				OnClick = item.OnClick,
				OnHover = item.OnHover,
				Disabled = item.Disabled or false,
				DisabledIcon = item.DisabledIcon or "",
			}
			table.insert(self.Items, newItem)
		end
		newMt.Add = add

		local function addDivider(self)
			table.insert(self.Items, "Divider")
		end
		newMt.AddDivider = addDivider

		local function clear(self)
			self.Items = {}
		end
		newMt.Clear = clear

		local function refresh(self)
			mainFrame:ClearAllChildren()

			local currentPos = 2
			for _, item in pairs(self.Items) do
				if item == "Divider" then
					local newDivider = dividerFrame:Clone()
					newDivider.Position = UDim2.new(0, 0, 0, currentPos)
					newDivider.Parent = mainFrame
					currentPos = currentPos + 12
				else
					local newEntry = entryFrame:Clone()
					newEntry.Position = UDim2.new(0, 0, 0, currentPos)
					newEntry.EntryName.Text = item.Name
					newEntry.Shortcut.Text = item.Shortcut
					if item.Disabled then
						newEntry.EntryName.TextColor3 = Color3.new(150 / 255, 150 / 255, 150 / 255)
						newEntry.Shortcut.TextColor3 = Color3.new(150 / 255, 150 / 255, 150 / 255)
					end

					local useIcon = item.Disabled and item.DisabledIcon or item.Icon
					if type(useIcon) == "string" then
						newEntry.IconFrame.Icon.Image = useIcon
					else
						newEntry.IconFrame:Destroy()
						local newIcon = useIcon:Clone()
						newIcon.Position = UDim2.new(0, 2, 0.5, -8)
						newIcon.Parent = newEntry
					end

					if item.OnClick and not item.Disabled then
						newEntry.MouseButton1Click:Connect(item.OnClick)
					end

					newEntry.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							newEntry.BackgroundTransparency = 0.5
						end
					end)

					newEntry.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							newEntry.BackgroundTransparency = 1
						end
					end)

					newEntry.Parent = mainFrame
					currentPos = currentPos + self.Height
				end
			end

			mainFrame.Size = UDim2.new(0, self.Width, 0, currentPos + 2)
		end
		newMt.Refresh = refresh

		local function show(self, displayFrame, x, y)
			local toSize = mainFrame.Size.Y.Offset
			local reverseY = false

			local maxX, maxY = gui.AbsoluteSize.X, gui.AbsoluteSize.Y

			if x + self.Width > maxX then
				x = x - self.Width
			end
			if y + toSize > maxY then
				reverseY = true
			end

			mainFrame.Position = UDim2.new(0, x, 0, y)
			mainFrame.Size = UDim2.new(0, self.Width, 0, 0)
			mainFrame.Parent = displayFrame

			local closeEvent = Services.UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
					return
				end

				if not f.checkMouseInGui(mainFrame) then
					self:Hide()
				end
			end)

			if reverseY then
				if y - toSize < 0 then
					y = toSize
				end
				mainFrame:TweenSizeAndPosition(
					UDim2.new(0, self.Width, 0, toSize),
					UDim2.new(0, x, 0, y - toSize),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					0.2,
					true
				)
			else
				mainFrame:TweenSize(
					UDim2.new(0, self.Width, 0, toSize),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					0.2,
					true
				)
			end
		end
		newMt.Show = show

		local function hide(self)
			mainFrame.Parent = nil
		end
		newMt.Hide = hide

		return newMt
	end
end

-- Explorer
local workspaces = {
	["Default"] = {
		Data = { "Default" },
		IsDefault = true,
	},
}
local nodes = {}

local explorerPanel
local propertiesPanel

local entryTemplate = resources:WaitForChild("Entry")

local iconMap = "rbxassetid://765660635"
local iconIndex = {
	-- Core
	NodeCollapsed = 165,
	NodeExpanded = 166,
	NodeCollapsedOver = 179,
	NodeExpandedOver = 180,

	-- Buttons
	CUT_ICON = 174,
	COPY_ICON = 175,
	PASTE_ICON = 176,
	DELETE_ICON = 177,
	GROUP_ICON = 150,
	UNGROUP_ICON = 151,
	SELECTCHILDREN_ICON = 152,

	CUT_D_ICON = 160,
	COPY_D_ICON = 161,
	PASTE_D_ICON = 162,
	DELETE_D_ICON = 163,
	GROUP_D_ICON = 136,
	UNGROUP_D_ICON = 137,
	SELECTCHILDREN_D_ICON = 138,

	-- Classes
	["Accessory"] = 32,
	["Accoutrement"] = 32,
	["AdvancedDragger"] = 41,
	["AdService"] = 73,
	["AlignOrientation"] = 110,
	["AlignPosition"] = 111,
	["Animation"] = 60,
	["AnimationController"] = 60,
	["AnimationTrack"] = 60,
	["Animator"] = 60,
	["ArcHandles"] = 56,
	["AssetService"] = 72,
	["Attachment"] = 92,
	["Backpack"] = 20,
	["BadgeService"] = 75,
	["BallSocketConstraint"] = 97,
	["BillboardGui"] = 64,
	["BinaryStringValue"] = 4,
	["BindableEvent"] = 67,
	["BindableFunction"] = 66,
	["BlockMesh"] = 8,
	["BloomEffect"] = 90,
	["BlurEffect"] = 90,
	["BodyAngularVelocity"] = 14,
	["BodyForce"] = 14,
	["BodyGyro"] = 14,
	["BodyPosition"] = 14,
	["BodyThrust"] = 14,
	["BodyVelocity"] = 14,
	["BoolValue"] = 4,
	["BoxHandleAdornment"] = 54,
	["BrickColorValue"] = 4,
	["Camera"] = 5,
	["CFrameValue"] = 4,
	["ChangeHistoryService"] = 118,
	["CharacterMesh"] = 60,
	["Chat"] = 33,
	["ClickDetector"] = 41,
	["CollectionService"] = 30,
	["Color3Value"] = 4,
	["ColorCorrectionEffect"] = 90,
	["ConeHandleAdornment"] = 54,
	["Configuration"] = 58,
	["ContentProvider"] = 72,
	["ContextActionService"] = 41,
	["ControllerService"] = 84,
	["CookiesService"] = 119,
	["CoreGui"] = 46,
	["CoreScript"] = 91,
	["CornerWedgePart"] = 1,
	["CustomEvent"] = 4,
	["CustomEventReceiver"] = 4,
	["CylinderHandleAdornment"] = 54,
	["CylinderMesh"] = 8,
	["CylindricalConstraint"] = 89,
	["Debris"] = 30,
	["Decal"] = 7,
	["Dialog"] = 62,
	["DialogChoice"] = 63,
	["DoubleConstrainedValue"] = 4,
	["Explosion"] = 36,
	["FileMesh"] = 8,
	["Fire"] = 61,
	["Flag"] = 38,
	["FlagStand"] = 39,
	["FloorWire"] = 4,
	["Folder"] = 70,
	["ForceField"] = 37,
	["Frame"] = 48,
	["FriendService"] = 121,
	["GamepadService"] = 84,
	["GamePassService"] = 19,
	["Geometry"] = 120,
	["Glue"] = 34,
	["GuiButton"] = 52,
	["GuiMain"] = 47,
	["GuiService"] = 47,
	["Handles"] = 53,
	["HapticService"] = 84,
	["Hat"] = 45,
	["HingeConstraint"] = 89,
	["Hint"] = 33,
	["HopperBin"] = 22,
	["HttpRbxApiService"] = 76,
	["HttpService"] = 76,
	["Humanoid"] = 9,
	["HumanoidController"] = 9,
	["ImageButton"] = 52,
	["ImageLabel"] = 49,
	["InsertService"] = 72,
	["IntConstrainedValue"] = 4,
	["IntValue"] = 4,
	["JointInstance"] = 34,
	["JointsService"] = 34,
	["Keyframe"] = 60,
	["KeyframeSequence"] = 60,
	["KeyframeSequenceProvider"] = 60,
	["Lighting"] = 13,
	["LineForce"] = 112,
	["LineHandleAdornment"] = 54,
	["LocalScript"] = 18,
	["LogService"] = 87,
	["LuaWebService"] = 91,
	["MarketplaceService"] = 106,
	["MeshContentProvider"] = 8,
	["MeshPart"] = 77,
	["Message"] = 33,
	["Model"] = 2,
	["ModuleScript"] = 71,
	["Motor"] = 34,
	["Motor6D"] = 34,
	["MoveToConstraint"] = 89,
	["NegateOperation"] = 78,
	["NetworkClient"] = 16,
	["NetworkReplicator"] = 29,
	["NetworkServer"] = 15,
	["NotificationService"] = 117,
	["NumberValue"] = 4,
	["ObjectValue"] = 4,
	["Pants"] = 44,
	["ParallelRampPart"] = 1,
	["Part"] = 1,
	["ParticleEmitter"] = 69,
	["PartPairLasso"] = 57,
	["PathfindingService"] = 37,
	["PersonalServerService"] = 121,
	["PhysicsService"] = 30,
	["Platform"] = 35,
	["Player"] = 12,
	["PlayerGui"] = 46,
	["Players"] = 21,
	["PlayerScripts"] = 82,
	["PointLight"] = 13,
	["PointsService"] = 83,
	["Pose"] = 60,
	["PrismaticConstraint"] = 89,
	["PrismPart"] = 1,
	["PyramidPart"] = 1,
	["RayValue"] = 4,
	["ReflectionMetadata"] = 86,
	["ReflectionMetadataCallbacks"] = 86,
	["ReflectionMetadataClass"] = 86,
	["ReflectionMetadataClasses"] = 86,
	["ReflectionMetadataEnum"] = 86,
	["ReflectionMetadataEnumItem"] = 86,
	["ReflectionMetadataEnums"] = 86,
	["ReflectionMetadataEvents"] = 86,
	["ReflectionMetadataFunctions"] = 86,
	["ReflectionMetadataMember"] = 86,
	["ReflectionMetadataProperties"] = 86,
	["ReflectionMetadataYieldFunctions"] = 86,
	["RemoteEvent"] = 80,
	["RemoteFunction"] = 79,
	["RenderHooksService"] = 122,
	["ReplicatedFirst"] = 72,
	["ReplicatedStorage"] = 72,
	["RightAngleRampPart"] = 1,
	["RocketPropulsion"] = 14,
	["RodConstraint"] = 89,
	["RopeConstraint"] = 89,
	["Rotate"] = 34,
	["RotateP"] = 34,
	["RotateV"] = 34,
	["RunService"] = 124,
	["RuntimeScriptService"] = 91,
	["ScreenGui"] = 47,
	["Script"] = 6,
	["ScriptContext"] = 82,
	["ScriptService"] = 91,
	["ScrollingFrame"] = 48,
	["Seat"] = 35,
	["Selection"] = 55,
	["SelectionBox"] = 54,
	["SelectionPartLasso"] = 57,
	["SelectionPointLasso"] = 57,
	["SelectionSphere"] = 54,
	["ServerScriptService"] = 115,
	["ServerStorage"] = 74,
	["Shirt"] = 43,
	["ShirtGraphic"] = 40,
	["SkateboardPlatform"] = 35,
	["Sky"] = 28,
	["SlidingBallConstraint"] = 89,
	["Smoke"] = 59,
	["Snap"] = 34,
	["SolidModelContentProvider"] = 77,
	["Sound"] = 11,
	["SoundGroup"] = 93,
	["SoundService"] = 31,
	["Sparkles"] = 42,
	["SpawnLocation"] = 25,
	["SpecialMesh"] = 8,
	["SphereHandleAdornment"] = 54,
	["SpotLight"] = 13,
	["SpringConstraint"] = 89,
	["StarterCharacterScripts"] = 82,
	["StarterGear"] = 20,
	["StarterGui"] = 46,
	["StarterPack"] = 20,
	["StarterPlayer"] = 88,
	["StarterPlayerScripts"] = 82,
	["Status"] = 2,
	["StringValue"] = 4,
	["SunRaysEffect"] = 90,
	["SurfaceGui"] = 64,
	["SurfaceLight"] = 13,
	["SurfaceSelection"] = 55,
	["Team"] = 24,
	["Teams"] = 23,
	["TeleportService"] = 81,
	["Terrain"] = 65,
	["TerrainRegion"] = 65,
	["TestService"] = 68,
	["TextBox"] = 51,
	["TextButton"] = 51,
	["TextLabel"] = 50,
	["TextService"] = 50,
	["Texture"] = 10,
	["TextureTrail"] = 4,
	["TimerService"] = 118,
	["Tool"] = 17,
	["Torque"] = 113,
	["TouchInputService"] = 84,
	["TouchTransmitter"] = 37,
	["TrussPart"] = 1,
	["TweenService"] = 109,
	["UnionOperation"] = 77,
	["UserInputService"] = 84,
	["Vector3Value"] = 4,
	["VehicleSeat"] = 35,
	["VelocityMotor"] = 34,
	["Visit"] = 123,
	["VRService"] = 95,
	["WedgePart"] = 1,
	["Weld"] = 34,
	["Workspace"] = 19,
	[""] = 116,
}

entryTemplate.Indent.IconFrame.Icon.Image = iconMap

-- Properties
local propCategories = {
	["Instance"] = {
		["Archivable"] = "Behavior",
		["ClassName"] = "Data",
		["DataCost"] = "Data",
		["Name"] = "Data",
		["Parent"] = "Data",
		["RobloxLocked"] = "Data",
	},
	["BasePart"] = {
		["Anchored"] = "Behavior",
		["BackParamA"] = "Surface Inputs",
		["BackParamB"] = "Surface Inputs",
		["BackSurface"] = "Surface",
		["BackSurfaceInput"] = "Surface Inputs",
		["BottomParamA"] = "Surface Inputs",
		["BottomParamB"] = "Surface Inputs",
		["BottomSurface"] = "Surface",
		["BottomSurfaceInput"] = "Surface Inputs",
		["BrickColor"] = "Appearance",
		["CFrame"] = "Data",
		["CanCollide"] = "Behavior",
		["CollisionGroupId"] = "Data",
		["CustomPhysicalProperties"] = "Part",
		["DraggingV1"] = "Behavior",
		["Elasticity"] = "Part",
		["Friction"] = "Part",
		["FrontParamA"] = "Surface Inputs",
		["FrontParamB"] = "Surface Inputs",
		["FrontSurface"] = "Surface",
		["FrontSurfaceInput"] = "Surface Inputs",
		["LeftParamA"] = "Surface Inputs",
		["LeftParamB"] = "Surface Inputs",
		["LeftSurface"] = "Surface",
		["LeftSurfaceInput"] = "Surface Inputs",
		["LocalTransparencyModifier"] = "Data",
		["Locked"] = "Behavior",
		["Material"] = "Appearance",
		["NetworkIsSleeping"] = "Data",
		["NetworkOwnerV3"] = "Data",
		["NetworkOwnershipRule"] = "Behavior",
		["NetworkOwnershipRuleBool"] = "Behavior",
		["Position"] = "Data",
		["ReceiveAge"] = "Part",
		["Reflectance"] = "Appearance",
		["ResizeIncrement"] = "Behavior",
		["ResizeableFaces"] = "Behavior",
		["RightParamA"] = "Surface Inputs",
		["RightParamB"] = "Surface Inputs",
		["RightSurface"] = "Surface",
		["RightSurfaceInput"] = "Surface Inputs",
		["RotVelocity"] = "Data",
		["Rotation"] = "Data",
		["Size"] = "Part",
		["TopParamA"] = "Surface Inputs",
		["TopParamB"] = "Surface Inputs",
		["TopSurface"] = "Surface",
		["TopSurfaceInput"] = "Surface Inputs",
		["Transparency"] = "Appearance",
		["Velocity"] = "Data",
	},
	["Part"] = {
		["Shape"] = "Part",
	},
	["Message"] = {
		["Text"] = "Appearance",
	},
	["Camera"] = {
		["CFrame"] = "Data",
		["CameraSubject"] = "Camera",
		["CameraType"] = "Camera",
		["FieldOfView"] = "Data",
		["Focus"] = "Data",
		["HeadLocked"] = "Data",
		["HeadScale"] = "Data",
		["ViewportSize"] = "Data",
	},
	["Animation"] = {
		["AnimationId"] = "Data",
		["Loop"] = "Data",
		["Priority"] = "Data",
	},
	["PVAdornment"] = {
		["Adornee"] = "Data",
	},
	["PartAdornment"] = {
		["Adornee"] = "Data",
	},
	["Decal"] = {
		["Color3"] = "Appearance",
		["LocalTransparencyModifier"] = "Appearance",
		["Shiny"] = "Appearance",
		["Specular"] = "Appearance",
		["Texture"] = "Appearance",
		["Transparency"] = "Appearance",
	},
	["Texture"] = {
		["StudsPerTileU"] = "Appearance",
		["StudsPerTileV"] = "Appearance",
	},
	["Feature"] = {
		["FaceId"] = "Data",
		["InOut"] = "Data",
		["LeftRight"] = "Data",
		["TopBottom"] = "Data",
	},
	["VelocityMotor"] = {
		["CurrentAngle"] = "Data",
		["DesiredAngle"] = "Data",
		["Hole"] = "Data",
		["MaxVelocity"] = "Data",
	},
	["JointInstance"] = {
		["C0"] = "Data",
		["C1"] = "Data",
		["Part0"] = "Data",
		["Part1"] = "Data",
	},
	["DynamicRotate"] = {
		["BaseAngle"] = "Data",
	},
	["Motor"] = {
		["CurrentAngle"] = "Data",
		["DesiredAngle"] = "Data",
		["MaxVelocity"] = "Data",
	},
	["Glue"] = {
		["F0"] = "Data",
		["F1"] = "Data",
		["F2"] = "Data",
		["F3"] = "Data",
	},
	["ManualSurfaceJointInstance"] = {
		["Surface0"] = "Data",
		["Surface1"] = "Data",
	},
	["Explosion"] = {
		["BlastPressure"] = "Data",
		["BlastRadius"] = "Data",
		["DestroyJointRadiusPercent"] = "Data",
		["ExplosionType"] = "Data",
		["Position"] = "Data",
		["Visible"] = "Data",
	},
	["Sparkles"] = {
		["Enabled"] = "Data",
		["SparkleColor"] = "Data",
	},
	["Fire"] = {
		["Color"] = "Data",
		["Enabled"] = "Data",
		["Heat"] = "Data",
		["SecondaryColor"] = "Data",
		["Size"] = "Data",
	},
	["Smoke"] = {
		["Color"] = "Data",
		["Enabled"] = "Data",
		["Opacity"] = "Data",
		["RiseVelocity"] = "Data",
		["Size"] = "Data",
	},
	["ParticleEmitter"] = {
		["Acceleration"] = "Motion",
		["Color"] = "Appearance",
		["Drag"] = "Particles",
		["EmissionDirection"] = "Emission",
		["Enabled"] = "Emission",
		["Lifetime"] = "Emission",
		["LightEmission"] = "Appearance",
		["LockedToPart"] = "Particles",
		["Rate"] = "Emission",
		["RotSpeed"] = "Emission",
		["Rotation"] = "Emission",
		["Size"] = "Appearance",
		["Speed"] = "Emission",
		["Texture"] = "Appearance",
		["Transparency"] = "Appearance",
		["VelocityInheritance"] = "Particles",
		["VelocitySpread"] = "Emission",
		["ZOffset"] = "Appearance",
	},
	["Sky"] = {
		["CelestialBodiesShown"] = "Appearance",
		["SkyboxBk"] = "Appearance",
		["SkyboxDn"] = "Appearance",
		["SkyboxFt"] = "Appearance",
		["SkyboxLf"] = "Appearance",
		["SkyboxRt"] = "Appearance",
		["SkyboxUp"] = "Appearance",
		["StarCount"] = "Appearance",
	},
	["Stats"] = {
		["MinReportInterval"] = "Reporting",
		["ReporterType"] = "Reporting",
	},
	["StarterPlayer"] = {
		["AutoJumpEnabled"] = "Mobile",
		["CameraMaxZoomDistance"] = "Camera",
		["CameraMinZoomDistance"] = "Camera",
		["CameraMode"] = "Camera",
		["DevCameraOcclusionMode"] = "Camera",
		["DevComputerCameraMovementMode"] = "Camera",
		["DevComputerMovementMode"] = "Controls",
		["DevTouchCameraMovementMode"] = "Camera",
		["DevTouchMovementMode"] = "Controls",
		["EnableMouseLockOption"] = "Controls",
		["HealthDisplayDistance"] = "Data",
		["LoadCharacterAppearance"] = "Character",
		["NameDisplayDistance"] = "Data",
		["ScreenOrientation"] = "Mobile",
	},
	["Lighting"] = {
		["Ambient"] = "Appearance",
		["Brightness"] = "Appearance",
		["ColorShift_Bottom"] = "Appearance",
		["ColorShift_Top"] = "Appearance",
		["FogColor"] = "Fog",
		["FogEnd"] = "Fog",
		["FogStart"] = "Fog",
		["GeographicLatitude"] = "Data",
		["GlobalShadows"] = "Appearance",
		["OutdoorAmbient"] = "Appearance",
		["Outlines"] = "Appearance",
		["TimeOfDay"] = "Data",
	},
	["LocalizationService"] = {
		["LocaleId"] = "Behavior",
		["PreferredLanguage"] = "Behavior",
	},
	["Light"] = {
		["Brightness"] = "Appearance",
		["Color"] = "Appearance",
		["Enabled"] = "Appearance",
		["Shadows"] = "Appearance",
	},
	["PointLight"] = {
		["Range"] = "Appearance",
	},
	["SpotLight"] = {
		["Angle"] = "Appearance",
		["Face"] = "Appearance",
		["Range"] = "Appearance",
	},
	["SurfaceLight"] = {
		["Angle"] = "Appearance",
		["Face"] = "Appearance",
		["Range"] = "Appearance",
	},
	["TrussPart"] = {
		["Style"] = "Part",
	},
	["Attachment"] = {
		["Axis"] = "Derived Data",
		["CFrame"] = "Data",
		["Position"] = "Data",
		["Rotation"] = "Data",
		["SecondaryAxis"] = "Derived Data",
		["Visible"] = "Appearance",
		["WorldAxis"] = "Derived Data",
		["WorldPosition"] = "Derived Data",
		["WorldRotation"] = "Derived Data",
		["WorldSecondaryAxis"] = "Derived Data",
	},
	["Humanoid"] = {
		["AutoJumpEnabled"] = "Control",
		["AutoRotate"] = "Control",
		["CameraMaxDistance"] = "Data",
		["CameraMinDistance"] = "Data",
		["CameraMode"] = "Data",
		["CameraOffset"] = "Data",
		["DisplayDistanceType"] = "Data",
		["Health"] = "Game",
		["HealthDisplayDistance"] = "Data",
		["Health_XML"] = "Game",
		["HipHeight"] = "Game",
		["Jump"] = "Control",
		["JumpPower"] = "Game",
		["JumpReplicate"] = "Control",
		["LeftLeg"] = "Data",
		["MaxHealth"] = "Game",
		["MaxSlopeAngle"] = "Game",
		["MoveDirection"] = "Control",
		["MoveDirectionInternal"] = "Control",
		["NameDisplayDistance"] = "Data",
		["NameOcclusion"] = "Data",
		["PlatformStand"] = "Control",
		["RigType"] = "Data",
		["RightLeg"] = "Data",
		["SeatPart"] = "Control",
		["Sit"] = "Control",
		["Strafe"] = "Control",
		["TargetPoint"] = "Control",
		["Torso"] = "Data",
		["WalkAngleError"] = "Control",
		["WalkDirection"] = "Control",
		["WalkSpeed"] = "Game",
		["WalkToPart"] = "Control",
		["WalkToPoint"] = "Control",
	},
}

local categoryOrder = {
	["Appearance"] = 1,
	["Data"] = 2,
	["Goals"] = 3,
	["Thrust"] = 4,
	["Turn"] = 5,
	["Camera"] = 6,
	["Behavior"] = 7,
	["Compliance"] = 8,
	["AlignOrientation"] = 9,
	["AlignPosition"] = 10,
	["Derived"] = 11,
	["LineForce"] = 12,
	["Rod"] = 13,
	["Constraint"] = 14,
	["Spring"] = 15,
	["Torque"] = 16,
	["VectorForce"] = 17,
	["Attachments"] = 18,
	["Axes"] = 19,
	["Image"] = 20,
	["Text"] = 21,
	["Scrolling"] = 22,
	["State"] = 23,
	["Control"] = 24,
	["Game"] = 25,
	["Fog"] = 26,
	["Settings"] = 27,
	["Physics"] = 28,
	["Teams"] = 29,
	["Forcefield"] = 30,
	["Part"] = 31,
	["Surface Inputs"] = 32,
	["Surface"] = 33,
	["Motion"] = 34,
	["Particles"] = 35,
	["Emission"] = 36,
	["Reflection"] = 37,
	["Mobile"] = 38,
	["Controls"] = 39,
	["Character"] = 40,
	["Results"] = 41,
	["Other"] = 42,
}

-- Gui Functions
local function getResource(name)
	return resources:WaitForChild(name):Clone()
end

function f.prevProportions(t, ind)
	local count = 0
	for i = ind, 1, -1 do
		count = count + t[i].Proportion
	end
	return count
end

function f.buildPanes()
	for i, v in pairs(RPaneItems) do
		v.Window:TweenSizeAndPosition(
			UDim2.new(0, explorerSettings.RPaneWidth, v.Proportion, 0),
			UDim2.new(0, 0, f.prevProportions(RPaneItems, i - 1), 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quart,
			0.5,
			true
		)
	end
end

function f.distance(x1, y1, x2, y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function f.checkMouseInGui(gui)
	if gui == nil then
		return false
	end
	local guiPosition = gui.AbsolutePosition
	local guiSize = gui.AbsoluteSize

	if
		mouse.X >= guiPosition.x
		and mouse.X <= guiPosition.x + guiSize.x
		and mouse.Y >= guiPosition.y
		and mouse.Y <= guiPosition.y + guiSize.y
	then
		return true
	else
		return false
	end
end

function f.addToPane(window, pane)
	if pane == "Right" then
		for i, v in pairs(RPaneItems) do
			if v.Window == window then
				return
			end
		end
		for i, v in pairs(RPaneItems) do
			RPaneItems[i].Proportion = v.Proportion / 100 * 80
		end
		window.Parent = contentR
		if #RPaneItems == 0 then
			table.insert(RPaneItems, { Window = window, Proportion = 1 })
		else
			table.insert(RPaneItems, { Window = window, Proportion = 0.2 })
		end
	end
	f.buildPanes()
end

function f.removeFromPane(window)
	local pane
	local windowIndex

	for i, v in pairs(LPaneItems) do
		if v.Window == window then
			pane = LPaneItems
			windowIndex = i
		end
	end
	for i, v in pairs(RPaneItems) do
		if v.Window == window then
			pane = RPaneItems
			windowIndex = i
		end
	end

	if pane and #pane > 0 then
		local weightTop, weightBottom, weightTopN, weightBottomN = 0, 0

		for i = windowIndex - 1, 1, -1 do
			weightTop = weightTop + RPaneItems[i].Proportion
		end
		for i = windowIndex + 1, #RPaneItems do
			weightBottom = weightBottom + RPaneItems[i].Proportion
		end

		if weightTop > 0 and weightBottom == 0 then
			weightTopN = weightTop + RPaneItems[windowIndex].Proportion
		elseif weightTop == 0 and weightBottom > 0 then
			weightBottomN = weightBottom + RPaneItems[windowIndex].Proportion
		else
			weightTopN = weightTop + RPaneItems[windowIndex].Proportion / 2
			weightBottomN = weightBottom + RPaneItems[windowIndex].Proportion / 2
		end

		for i = 1, windowIndex - 1 do
			RPaneItems[i].Proportion = RPaneItems[i].Proportion / weightTop * weightTopN
		end
		for i = windowIndex + 1, #RPaneItems do
			RPaneItems[i].Proportion = RPaneItems[i].Proportion / weightBottom * weightBottomN
		end

		table.remove(RPaneItems, windowIndex)
		f.buildPanes()
	end
end

function f.resizePaneItem(window, pane, size)
	local windowIndex = 0
	local sizeWeight = 0
	size = math.max(0.2, size)
	if pane == "Right" then
		for i, v in pairs(RPaneItems) do
			if v.Window == window then
				windowIndex = i
				break
			end
		end

		for i = windowIndex + 1, #RPaneItems do
			sizeWeight = sizeWeight + RPaneItems[i].Proportion
		end

		local oldSize = 1 - (sizeWeight + RPaneItems[windowIndex].Proportion)

		RPaneItems[windowIndex].Proportion = size

		for i = 1, windowIndex - 1 do
			RPaneItems[i].Proportion = RPaneItems[i].Proportion / oldSize * (1 - (sizeWeight + size))
		end
	end
	f.buildPanes()
end

f.fetchAPI = function()
	local classes, enums, rawAPI =
		{},
		{},
		[==[[{"Superclass":null,"type":"Class","Name":"Instance","tags":["notbrowsable"]},{"ValueType":"bool","type":"Property","Name":"Archivable","tags":[],"Class":"Instance"},{"ValueType":"string","type":"Property","Name":"ClassName","tags":["readonly"],"Class":"Instance"},{"ValueType":"int","type":"Property","Name":"DataCost","tags":["LocalUserSecurity","readonly"],"Class":"Instance"},{"ValueType":"string","type":"Property","Name":"Name","tags":[],"Class":"Instance"},{"ValueType":"Object","type":"Property","Name":"Parent","tags":[],"Class":"Instance"},{"ValueType":"bool","type":"Property","Name":"RobloxLocked","tags":["PluginSecurity"],"Class":"Instance"},{"ValueType":"bool","type":"Property","Name":"archivable","tags":["deprecated","hidden"],"Class":"Instance"},{"ValueType":"string","type":"Property","Name":"className","tags":["deprecated","readonly"],"Class":"Instance"},{"ReturnType":"void","Arguments":[],"Name":"ClearAllChildren","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"Clone","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Destroy","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"FindFirstAncestor","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"FindFirstAncestorOfClass","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"FindFirstAncestorWhichIsA","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"bool","Name":"recursive","Default":"false"}],"Name":"FindFirstChild","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"FindFirstChildOfClass","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null},{"Type":"bool","Name":"recursive","Default":"false"}],"Name":"FindFirstChildWhichIsA","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetChildren","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"scopeLength","Default":"4"}],"Name":"GetDebugId","tags":["PluginSecurity","notbrowsable"],"Class":"Instance","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetDescendants","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetFullName","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"EventInstance","Arguments":[{"Type":"string","Name":"property","Default":null}],"Name":"GetPropertyChangedSignal","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"IsA","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"descendant","Default":null}],"Name":"IsAncestorOf","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"ancestor","Default":null}],"Name":"IsDescendantOf","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Remove","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"childName","Default":null},{"Type":"double","Name":"timeOut","Default":null}],"Name":"WaitForChild","tags":[],"Class":"Instance","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"children","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"clone","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"destroy","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"bool","Name":"recursive","Default":"false"}],"Name":"findFirstChild","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"getChildren","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"isA","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"ancestor","Default":null}],"Name":"isDescendantOf","tags":["deprecated"],"Class":"Instance","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"remove","tags":["deprecated"],"Class":"Instance","type":"Function"},{"Arguments":[{"Name":"child","Type":"Instance"},{"Name":"parent","Type":"Instance"}],"Name":"AncestryChanged","tags":[],"Class":"Instance","type":"Event"},{"Arguments":[{"Name":"property","Type":"Property"}],"Name":"Changed","tags":[],"Class":"Instance","type":"Event"},{"Arguments":[{"Name":"child","Type":"Instance"}],"Name":"ChildAdded","tags":[],"Class":"Instance","type":"Event"},{"Arguments":[{"Name":"child","Type":"Instance"}],"Name":"ChildRemoved","tags":[],"Class":"Instance","type":"Event"},{"Arguments":[{"Name":"descendant","Type":"Instance"}],"Name":"DescendantAdded","tags":[],"Class":"Instance","type":"Event"},{"Arguments":[{"Name":"descendant","Type":"Instance"}],"Name":"DescendantRemoving","tags":[],"Class":"Instance","type":"Event"},{"Arguments":[{"Name":"child","Type":"Instance"}],"Name":"childAdded","tags":["deprecated"],"Class":"Instance","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Accoutrement","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"AttachmentForward","tags":[],"Class":"Accoutrement"},{"ValueType":"CoordinateFrame","type":"Property","Name":"AttachmentPoint","tags":[],"Class":"Accoutrement"},{"ValueType":"Vector3","type":"Property","Name":"AttachmentPos","tags":[],"Class":"Accoutrement"},{"ValueType":"Vector3","type":"Property","Name":"AttachmentRight","tags":[],"Class":"Accoutrement"},{"ValueType":"Vector3","type":"Property","Name":"AttachmentUp","tags":[],"Class":"Accoutrement"},{"Superclass":"Accoutrement","type":"Class","Name":"Accessory","tags":[]},{"Superclass":"Accoutrement","type":"Class","Name":"Hat","tags":["deprecated"]},{"Superclass":"Instance","type":"Class","Name":"AdService","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[],"Name":"ShowVideoAd","tags":["deprecated"],"Class":"AdService","type":"Function"},{"Arguments":[{"Name":"adShown","Type":"bool"}],"Name":"VideoAdClosed","tags":["deprecated"],"Class":"AdService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"AdvancedDragger","tags":[]},{"Superclass":"Instance","type":"Class","Name":"AnalyticsService","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"counterName","Default":null},{"Type":"int","Name":"amount","Default":"1"}],"Name":"ReportCounter","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"seriesName","Default":null},{"Type":"Dictionary","Name":"points","Default":null},{"Type":"int","Name":"throttlingPercentage","Default":null}],"Name":"ReportInfluxSeries","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"category","Default":null},{"Type":"float","Name":"value","Default":null}],"Name":"ReportStats","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"target","Default":null},{"Type":"string","Name":"eventContext","Default":null},{"Type":"string","Name":"eventName","Default":null},{"Type":"Dictionary","Name":"additionalArgs","Default":null}],"Name":"SetRBXEvent","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"target","Default":null},{"Type":"string","Name":"eventContext","Default":null},{"Type":"string","Name":"eventName","Default":null},{"Type":"Dictionary","Name":"additionalArgs","Default":null}],"Name":"SetRBXEventStream","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"category","Default":null},{"Type":"string","Name":"action","Default":null},{"Type":"string","Name":"label","Default":null}],"Name":"TrackEvent","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Dictionary","Name":"args","Default":null}],"Name":"UpdateHeartbeatObject","tags":["RobloxScriptSecurity"],"Class":"AnalyticsService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Animation","tags":[]},{"ValueType":"Content","type":"Property","Name":"AnimationId","tags":[],"Class":"Animation"},{"Superclass":"Instance","type":"Class","Name":"AnimationController","tags":[]},{"ReturnType":"Array","Arguments":[],"Name":"GetPlayingAnimationTracks","tags":[],"Class":"AnimationController","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"animation","Default":null}],"Name":"LoadAnimation","tags":[],"Class":"AnimationController","type":"Function"},{"Arguments":[{"Name":"animationTrack","Type":"Instance"}],"Name":"AnimationPlayed","tags":[],"Class":"AnimationController","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"AnimationTrack","tags":[]},{"ValueType":"Object","type":"Property","Name":"Animation","tags":["readonly"],"Class":"AnimationTrack"},{"ValueType":"bool","type":"Property","Name":"IsPlaying","tags":["readonly"],"Class":"AnimationTrack"},{"ValueType":"float","type":"Property","Name":"Length","tags":["readonly"],"Class":"AnimationTrack"},{"ValueType":"bool","type":"Property","Name":"Looped","tags":[],"Class":"AnimationTrack"},{"ValueType":"AnimationPriority","type":"Property","Name":"Priority","tags":[],"Class":"AnimationTrack"},{"ValueType":"float","type":"Property","Name":"Speed","tags":["readonly"],"Class":"AnimationTrack"},{"ValueType":"float","type":"Property","Name":"TimePosition","tags":[],"Class":"AnimationTrack"},{"ValueType":"float","type":"Property","Name":"WeightCurrent","tags":["readonly"],"Class":"AnimationTrack"},{"ValueType":"float","type":"Property","Name":"WeightTarget","tags":["readonly"],"Class":"AnimationTrack"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"speed","Default":"1"}],"Name":"AdjustSpeed","tags":[],"Class":"AnimationTrack","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"weight","Default":"1"},{"Type":"float","Name":"fadeTime","Default":"0.100000001"}],"Name":"AdjustWeight","tags":[],"Class":"AnimationTrack","type":"Function"},{"ReturnType":"double","Arguments":[{"Type":"string","Name":"keyframeName","Default":null}],"Name":"GetTimeOfKeyframe","tags":[],"Class":"AnimationTrack","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"fadeTime","Default":"0.100000001"},{"Type":"float","Name":"weight","Default":"1"},{"Type":"float","Name":"speed","Default":"1"}],"Name":"Play","tags":[],"Class":"AnimationTrack","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"fadeTime","Default":"0.100000001"}],"Name":"Stop","tags":[],"Class":"AnimationTrack","type":"Function"},{"Arguments":[],"Name":"DidLoop","tags":[],"Class":"AnimationTrack","type":"Event"},{"Arguments":[{"Name":"keyframeName","Type":"string"}],"Name":"KeyframeReached","tags":[],"Class":"AnimationTrack","type":"Event"},{"Arguments":[],"Name":"Stopped","tags":[],"Class":"AnimationTrack","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Animator","tags":[]},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"animation","Default":null}],"Name":"LoadAnimation","tags":[],"Class":"Animator","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"deltaTime","Default":null}],"Name":"StepAnimations","tags":["PluginSecurity"],"Class":"Animator","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"AssetService","tags":[]},{"ReturnType":"int","Arguments":[{"Type":"string","Name":"placeName","Default":null},{"Type":"int64","Name":"templatePlaceID","Default":null},{"Type":"string","Name":"description","Default":""}],"Name":"CreatePlaceAsync","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"string","Name":"placeName","Default":null},{"Type":"int64","Name":"templatePlaceID","Default":null},{"Type":"string","Name":"description","Default":""}],"Name":"CreatePlaceInPlayerInventoryAsync","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"int64","Name":"packageAssetId","Default":null}],"Name":"GetAssetIdsForPackage","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"Tuple","Arguments":[{"Type":"int64","Name":"assetId","Default":null},{"Type":"Vector2","Name":"thumbnailSize","Default":null},{"Type":"int","Name":"assetType","Default":"0"}],"Name":"GetAssetThumbnailAsync","tags":["RobloxScriptSecurity"],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"Dictionary","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"int","Name":"pageNum","Default":"1"}],"Name":"GetAssetVersions","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"int","Name":"creationID","Default":null}],"Name":"GetCreatorAssetID","tags":["deprecated"],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[],"Name":"GetGamePlacesAsync","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"Dictionary","Arguments":[{"Type":"int","Name":"placeId","Default":null}],"Name":"GetPlacePermissions","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"int","Name":"versionNumber","Default":null}],"Name":"RevertAsset","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"void","Arguments":[],"Name":"SavePlaceAsync","tags":[],"Class":"AssetService","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"AccessType","Name":"accessType","Default":"Everyone"},{"Type":"Array","Name":"inviteList","Default":"{}"}],"Name":"SetPlacePermissions","tags":[],"Class":"AssetService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"Attachment","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"Axis","tags":[],"Class":"Attachment"},{"ValueType":"CoordinateFrame","type":"Property","Name":"CFrame","tags":[],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"Orientation","tags":[],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"Position","tags":[],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"Rotation","tags":[],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"SecondaryAxis","tags":[],"Class":"Attachment"},{"ValueType":"bool","type":"Property","Name":"Visible","tags":[],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"WorldAxis","tags":["readonly"],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"WorldOrientation","tags":["readonly"],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"WorldPosition","tags":["readonly"],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"WorldRotation","tags":["deprecated","readonly"],"Class":"Attachment"},{"ValueType":"Vector3","type":"Property","Name":"WorldSecondaryAxis","tags":["readonly"],"Class":"Attachment"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetAxis","tags":[],"Class":"Attachment","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetSecondaryAxis","tags":[],"Class":"Attachment","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"axis","Default":null}],"Name":"SetAxis","tags":[],"Class":"Attachment","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"axis","Default":null}],"Name":"SetSecondaryAxis","tags":[],"Class":"Attachment","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"BadgeService","tags":["notCreatable"]},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"int","Name":"badgeId","Default":null}],"Name":"AwardBadge","tags":[],"Class":"BadgeService","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"badgeId","Default":null}],"Name":"IsDisabled","tags":[],"Class":"BadgeService","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"badgeId","Default":null}],"Name":"IsLegal","tags":[],"Class":"BadgeService","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"int","Name":"badgeId","Default":null}],"Name":"UserHasBadge","tags":[],"Class":"BadgeService","type":"YieldFunction"},{"Arguments":[{"Name":"message","Type":"string"},{"Name":"userId","Type":"int"},{"Name":"badgeId","Type":"int"}],"Name":"BadgeAwarded","tags":["RobloxScriptSecurity"],"Class":"BadgeService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"BasePlayerGui","tags":[]},{"Superclass":"BasePlayerGui","type":"Class","Name":"CoreGui","tags":["notCreatable"]},{"ValueType":"Object","type":"Property","Name":"SelectionImageObject","tags":["RobloxScriptSecurity"],"Class":"CoreGui"},{"ValueType":"int","type":"Property","Name":"Version","tags":["readonly"],"Class":"CoreGui"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"enabled","Default":null},{"Type":"Instance","Name":"guiAdornee","Default":null},{"Type":"NormalId","Name":"faceId","Default":null}],"Name":"SetUserGuiRendering","tags":["RobloxScriptSecurity"],"Class":"CoreGui","type":"Function"},{"Superclass":"BasePlayerGui","type":"Class","Name":"PlayerGui","tags":["notCreatable"]},{"ValueType":"ScreenOrientation","type":"Property","Name":"CurrentScreenOrientation","tags":["readonly"],"Class":"PlayerGui"},{"ValueType":"ScreenOrientation","type":"Property","Name":"ScreenOrientation","tags":[],"Class":"PlayerGui"},{"ValueType":"Object","type":"Property","Name":"SelectionImageObject","tags":[],"Class":"PlayerGui"},{"ReturnType":"float","Arguments":[],"Name":"GetTopbarTransparency","tags":[],"Class":"PlayerGui","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"transparency","Default":null}],"Name":"SetTopbarTransparency","tags":[],"Class":"PlayerGui","type":"Function"},{"Arguments":[{"Name":"transparency","Type":"float"}],"Name":"TopbarTransparencyChangedSignal","tags":[],"Class":"PlayerGui","type":"Event"},{"Superclass":"BasePlayerGui","type":"Class","Name":"StarterGui","tags":[]},{"ValueType":"bool","type":"Property","Name":"ResetPlayerGuiOnSpawn","tags":["deprecated"],"Class":"StarterGui"},{"ValueType":"ScreenOrientation","type":"Property","Name":"ScreenOrientation","tags":[],"Class":"StarterGui"},{"ValueType":"bool","type":"Property","Name":"ShowDevelopmentGui","tags":[],"Class":"StarterGui"},{"ReturnType":"bool","Arguments":[{"Type":"CoreGuiType","Name":"coreGuiType","Default":null}],"Name":"GetCoreGuiEnabled","tags":[],"Class":"StarterGui","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"parameterName","Default":null},{"Type":"Function","Name":"getFunction","Default":null}],"Name":"RegisterGetCore","tags":["RobloxScriptSecurity"],"Class":"StarterGui","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"parameterName","Default":null},{"Type":"Function","Name":"setFunction","Default":null}],"Name":"RegisterSetCore","tags":["RobloxScriptSecurity"],"Class":"StarterGui","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"parameterName","Default":null},{"Type":"Variant","Name":"value","Default":null}],"Name":"SetCore","tags":[],"Class":"StarterGui","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"CoreGuiType","Name":"coreGuiType","Default":null},{"Type":"bool","Name":"enabled","Default":null}],"Name":"SetCoreGuiEnabled","tags":[],"Class":"StarterGui","type":"Function"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"parameterName","Default":null}],"Name":"GetCore","tags":[],"Class":"StarterGui","type":"YieldFunction"},{"Arguments":[{"Name":"coreGuiType","Type":"CoreGuiType"},{"Name":"enabled","Type":"bool"}],"Name":"CoreGuiChangedSignal","tags":["RobloxScriptSecurity"],"Class":"StarterGui","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Beam","tags":[]},{"ValueType":"Object","type":"Property","Name":"Attachment0","tags":[],"Class":"Beam"},{"ValueType":"Object","type":"Property","Name":"Attachment1","tags":[],"Class":"Beam"},{"ValueType":"ColorSequence","type":"Property","Name":"Color","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"CurveSize0","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"CurveSize1","tags":[],"Class":"Beam"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Beam"},{"ValueType":"bool","type":"Property","Name":"FaceCamera","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"LightEmission","tags":[],"Class":"Beam"},{"ValueType":"int","type":"Property","Name":"Segments","tags":[],"Class":"Beam"},{"ValueType":"Content","type":"Property","Name":"Texture","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"TextureLength","tags":[],"Class":"Beam"},{"ValueType":"TextureMode","type":"Property","Name":"TextureMode","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"TextureSpeed","tags":[],"Class":"Beam"},{"ValueType":"NumberSequence","type":"Property","Name":"Transparency","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"Width0","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"Width1","tags":[],"Class":"Beam"},{"ValueType":"float","type":"Property","Name":"ZOffset","tags":[],"Class":"Beam"},{"Superclass":"Instance","type":"Class","Name":"BinaryStringValue","tags":[]},{"Arguments":[{"Name":"value","Type":"BinaryString"}],"Name":"Changed","tags":[],"Class":"BinaryStringValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"BindableEvent","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"Fire","tags":[],"Class":"BindableEvent","type":"Function"},{"Arguments":[{"Name":"arguments","Type":"Tuple"}],"Name":"Event","tags":[],"Class":"BindableEvent","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"BindableFunction","tags":[]},{"ReturnType":"Tuple","Arguments":[{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"Invoke","tags":[],"Class":"BindableFunction","type":"YieldFunction"},{"ReturnType":"Tuple","Arguments":[{"Name":"arguments","Type":"Tuple"}],"Name":"OnInvoke","tags":[],"Class":"BindableFunction","type":"Callback"},{"Superclass":"Instance","type":"Class","Name":"BodyMover","tags":[]},{"Superclass":"BodyMover","type":"Class","Name":"BodyAngularVelocity","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"AngularVelocity","tags":[],"Class":"BodyAngularVelocity"},{"ValueType":"Vector3","type":"Property","Name":"MaxTorque","tags":[],"Class":"BodyAngularVelocity"},{"ValueType":"float","type":"Property","Name":"P","tags":[],"Class":"BodyAngularVelocity"},{"ValueType":"Vector3","type":"Property","Name":"angularvelocity","tags":["deprecated"],"Class":"BodyAngularVelocity"},{"ValueType":"Vector3","type":"Property","Name":"maxTorque","tags":["deprecated"],"Class":"BodyAngularVelocity"},{"Superclass":"BodyMover","type":"Class","Name":"BodyForce","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"Force","tags":[],"Class":"BodyForce"},{"ValueType":"Vector3","type":"Property","Name":"force","tags":["deprecated"],"Class":"BodyForce"},{"Superclass":"BodyMover","type":"Class","Name":"BodyGyro","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"CFrame","tags":[],"Class":"BodyGyro"},{"ValueType":"float","type":"Property","Name":"D","tags":[],"Class":"BodyGyro"},{"ValueType":"Vector3","type":"Property","Name":"MaxTorque","tags":[],"Class":"BodyGyro"},{"ValueType":"float","type":"Property","Name":"P","tags":[],"Class":"BodyGyro"},{"ValueType":"CoordinateFrame","type":"Property","Name":"cframe","tags":["deprecated"],"Class":"BodyGyro"},{"ValueType":"Vector3","type":"Property","Name":"maxTorque","tags":["deprecated"],"Class":"BodyGyro"},{"Superclass":"BodyMover","type":"Class","Name":"BodyPosition","tags":[]},{"ValueType":"float","type":"Property","Name":"D","tags":[],"Class":"BodyPosition"},{"ValueType":"Vector3","type":"Property","Name":"MaxForce","tags":[],"Class":"BodyPosition"},{"ValueType":"float","type":"Property","Name":"P","tags":[],"Class":"BodyPosition"},{"ValueType":"Vector3","type":"Property","Name":"Position","tags":[],"Class":"BodyPosition"},{"ValueType":"Vector3","type":"Property","Name":"maxForce","tags":["deprecated"],"Class":"BodyPosition"},{"ValueType":"Vector3","type":"Property","Name":"position","tags":["deprecated"],"Class":"BodyPosition"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetLastForce","tags":[],"Class":"BodyPosition","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"lastForce","tags":["deprecated"],"Class":"BodyPosition","type":"Function"},{"Arguments":[],"Name":"ReachedTarget","tags":[],"Class":"BodyPosition","type":"Event"},{"Superclass":"BodyMover","type":"Class","Name":"BodyThrust","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"Force","tags":[],"Class":"BodyThrust"},{"ValueType":"Vector3","type":"Property","Name":"Location","tags":[],"Class":"BodyThrust"},{"ValueType":"Vector3","type":"Property","Name":"force","tags":["deprecated"],"Class":"BodyThrust"},{"ValueType":"Vector3","type":"Property","Name":"location","tags":["deprecated"],"Class":"BodyThrust"},{"Superclass":"BodyMover","type":"Class","Name":"BodyVelocity","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"MaxForce","tags":[],"Class":"BodyVelocity"},{"ValueType":"float","type":"Property","Name":"P","tags":[],"Class":"BodyVelocity"},{"ValueType":"Vector3","type":"Property","Name":"Velocity","tags":[],"Class":"BodyVelocity"},{"ValueType":"Vector3","type":"Property","Name":"maxForce","tags":["deprecated"],"Class":"BodyVelocity"},{"ValueType":"Vector3","type":"Property","Name":"velocity","tags":["deprecated"],"Class":"BodyVelocity"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetLastForce","tags":[],"Class":"BodyVelocity","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"lastForce","tags":[],"Class":"BodyVelocity","type":"Function"},{"Superclass":"BodyMover","type":"Class","Name":"RocketPropulsion","tags":[]},{"ValueType":"float","type":"Property","Name":"CartoonFactor","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"MaxSpeed","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"MaxThrust","tags":[],"Class":"RocketPropulsion"},{"ValueType":"Vector3","type":"Property","Name":"MaxTorque","tags":[],"Class":"RocketPropulsion"},{"ValueType":"Object","type":"Property","Name":"Target","tags":[],"Class":"RocketPropulsion"},{"ValueType":"Vector3","type":"Property","Name":"TargetOffset","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"TargetRadius","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"ThrustD","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"ThrustP","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"TurnD","tags":[],"Class":"RocketPropulsion"},{"ValueType":"float","type":"Property","Name":"TurnP","tags":[],"Class":"RocketPropulsion"},{"ReturnType":"void","Arguments":[],"Name":"Abort","tags":[],"Class":"RocketPropulsion","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Fire","tags":[],"Class":"RocketPropulsion","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"fire","tags":["deprecated"],"Class":"RocketPropulsion","type":"Function"},{"Arguments":[],"Name":"ReachedTarget","tags":[],"Class":"RocketPropulsion","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"BoolValue","tags":[]},{"ValueType":"bool","type":"Property","Name":"Value","tags":[],"Class":"BoolValue"},{"Arguments":[{"Name":"value","Type":"bool"}],"Name":"Changed","tags":[],"Class":"BoolValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"bool"}],"Name":"changed","tags":["deprecated"],"Class":"BoolValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"BrickColorValue","tags":[]},{"ValueType":"BrickColor","type":"Property","Name":"Value","tags":[],"Class":"BrickColorValue"},{"Arguments":[{"Name":"value","Type":"BrickColor"}],"Name":"Changed","tags":[],"Class":"BrickColorValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"BrickColor"}],"Name":"changed","tags":["deprecated"],"Class":"BrickColorValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Button","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"active","Default":null}],"Name":"SetActive","tags":["PluginSecurity"],"Class":"Button","type":"Function"},{"Arguments":[],"Name":"Click","tags":["PluginSecurity"],"Class":"Button","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"CFrameValue","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"Value","tags":[],"Class":"CFrameValue"},{"Arguments":[{"Name":"value","Type":"CoordinateFrame"}],"Name":"Changed","tags":[],"Class":"CFrameValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"CoordinateFrame"}],"Name":"changed","tags":["deprecated"],"Class":"CFrameValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"CacheableContentProvider","tags":[]},{"Superclass":"CacheableContentProvider","type":"Class","Name":"MeshContentProvider","tags":[]},{"Superclass":"CacheableContentProvider","type":"Class","Name":"SolidModelContentProvider","tags":[]},{"Superclass":"Instance","type":"Class","Name":"Camera","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"CFrame","tags":[],"Class":"Camera"},{"ValueType":"Object","type":"Property","Name":"CameraSubject","tags":[],"Class":"Camera"},{"ValueType":"CameraType","type":"Property","Name":"CameraType","tags":[],"Class":"Camera"},{"ValueType":"CoordinateFrame","type":"Property","Name":"CoordinateFrame","tags":["deprecated","hidden"],"Class":"Camera"},{"ValueType":"float","type":"Property","Name":"FieldOfView","tags":[],"Class":"Camera"},{"ValueType":"CoordinateFrame","type":"Property","Name":"Focus","tags":[],"Class":"Camera"},{"ValueType":"bool","type":"Property","Name":"HeadLocked","tags":[],"Class":"Camera"},{"ValueType":"float","type":"Property","Name":"HeadScale","tags":[],"Class":"Camera"},{"ValueType":"Vector2","type":"Property","Name":"ViewportSize","tags":["readonly"],"Class":"Camera"},{"ValueType":"CoordinateFrame","type":"Property","Name":"focus","tags":["deprecated"],"Class":"Camera"},{"ReturnType":"float","Arguments":[{"Type":"Objects","Name":"ignoreList","Default":null}],"Name":"GetLargestCutoffDistance","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"float","Arguments":[],"Name":"GetPanSpeed","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Array","Name":"castPoints","Default":null},{"Type":"Objects","Name":"ignoreList","Default":null}],"Name":"GetPartsObscuringTarget","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"CoordinateFrame","Arguments":[],"Name":"GetRenderCFrame","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"float","Arguments":[],"Name":"GetRoll","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"float","Arguments":[],"Name":"GetTiltSpeed","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"CoordinateFrame","Name":"endPos","Default":null},{"Type":"CoordinateFrame","Name":"endFocus","Default":null},{"Type":"float","Name":"duration","Default":null}],"Name":"Interpolate","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"units","Default":null}],"Name":"PanUnits","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"Ray","Arguments":[{"Type":"float","Name":"x","Default":null},{"Type":"float","Name":"y","Default":null},{"Type":"float","Name":"depth","Default":"0"}],"Name":"ScreenPointToRay","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"CameraPanMode","Name":"mode","Default":"Classic"}],"Name":"SetCameraPanMode","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"rollAngle","Default":null}],"Name":"SetRoll","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"units","Default":null}],"Name":"TiltUnits","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"Ray","Arguments":[{"Type":"float","Name":"x","Default":null},{"Type":"float","Name":"y","Default":null},{"Type":"float","Name":"depth","Default":"0"}],"Name":"ViewportPointToRay","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Vector3","Name":"worldPoint","Default":null}],"Name":"WorldToScreenPoint","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Vector3","Name":"worldPoint","Default":null}],"Name":"WorldToViewportPoint","tags":[],"Class":"Camera","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"float","Name":"distance","Default":null}],"Name":"Zoom","tags":["RobloxScriptSecurity"],"Class":"Camera","type":"Function"},{"Arguments":[{"Name":"entering","Type":"bool"}],"Name":"FirstPersonTransition","tags":["LocalUserSecurity"],"Class":"Camera","type":"Event"},{"Arguments":[],"Name":"InterpolationFinished","tags":[],"Class":"Camera","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ChangeHistoryService","tags":["notCreatable"]},{"ReturnType":"Tuple","Arguments":[],"Name":"GetCanRedo","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"ReturnType":"Tuple","Arguments":[],"Name":"GetCanUndo","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Redo","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ResetWaypoints","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"state","Default":null}],"Name":"SetEnabled","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"SetWaypoint","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Undo","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Function"},{"Arguments":[{"Name":"waypoint","Type":"string"}],"Name":"OnRedo","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Event"},{"Arguments":[{"Name":"waypoint","Type":"string"}],"Name":"OnUndo","tags":["PluginSecurity"],"Class":"ChangeHistoryService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"CharacterAppearance","tags":[]},{"Superclass":"CharacterAppearance","type":"Class","Name":"BodyColors","tags":[]},{"ValueType":"BrickColor","type":"Property","Name":"HeadColor","tags":[],"Class":"BodyColors"},{"ValueType":"Color3","type":"Property","Name":"HeadColor3","tags":[],"Class":"BodyColors"},{"ValueType":"BrickColor","type":"Property","Name":"LeftArmColor","tags":[],"Class":"BodyColors"},{"ValueType":"Color3","type":"Property","Name":"LeftArmColor3","tags":[],"Class":"BodyColors"},{"ValueType":"BrickColor","type":"Property","Name":"LeftLegColor","tags":[],"Class":"BodyColors"},{"ValueType":"Color3","type":"Property","Name":"LeftLegColor3","tags":[],"Class":"BodyColors"},{"ValueType":"BrickColor","type":"Property","Name":"RightArmColor","tags":[],"Class":"BodyColors"},{"ValueType":"Color3","type":"Property","Name":"RightArmColor3","tags":[],"Class":"BodyColors"},{"ValueType":"BrickColor","type":"Property","Name":"RightLegColor","tags":[],"Class":"BodyColors"},{"ValueType":"Color3","type":"Property","Name":"RightLegColor3","tags":[],"Class":"BodyColors"},{"ValueType":"BrickColor","type":"Property","Name":"TorsoColor","tags":[],"Class":"BodyColors"},{"ValueType":"Color3","type":"Property","Name":"TorsoColor3","tags":[],"Class":"BodyColors"},{"Superclass":"CharacterAppearance","type":"Class","Name":"CharacterMesh","tags":[]},{"ValueType":"int","type":"Property","Name":"BaseTextureId","tags":[],"Class":"CharacterMesh"},{"ValueType":"BodyPart","type":"Property","Name":"BodyPart","tags":[],"Class":"CharacterMesh"},{"ValueType":"int","type":"Property","Name":"MeshId","tags":[],"Class":"CharacterMesh"},{"ValueType":"int","type":"Property","Name":"OverlayTextureId","tags":[],"Class":"CharacterMesh"},{"Superclass":"CharacterAppearance","type":"Class","Name":"Clothing","tags":[]},{"Superclass":"Clothing","type":"Class","Name":"Pants","tags":[]},{"ValueType":"Content","type":"Property","Name":"PantsTemplate","tags":[],"Class":"Pants"},{"Superclass":"Clothing","type":"Class","Name":"Shirt","tags":[]},{"ValueType":"Content","type":"Property","Name":"ShirtTemplate","tags":[],"Class":"Shirt"},{"Superclass":"CharacterAppearance","type":"Class","Name":"ShirtGraphic","tags":[]},{"ValueType":"Content","type":"Property","Name":"Graphic","tags":[],"Class":"ShirtGraphic"},{"Superclass":"CharacterAppearance","type":"Class","Name":"Skin","tags":["deprecated"]},{"ValueType":"BrickColor","type":"Property","Name":"SkinColor","tags":[],"Class":"Skin"},{"Superclass":"Instance","type":"Class","Name":"Chat","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"LoadDefaultChat","tags":["ScriptWriteRestricted: [NotAccessibleSecurity]"],"Class":"Chat"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"partOrCharacter","Default":null},{"Type":"string","Name":"message","Default":null},{"Type":"ChatColor","Name":"color","Default":"Blue"}],"Name":"Chat","tags":[],"Class":"Chat","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"partOrCharacter","Default":null},{"Type":"string","Name":"message","Default":null},{"Type":"ChatColor","Name":"color","Default":"Blue"}],"Name":"ChatLocal","tags":["RobloxScriptSecurity"],"Class":"Chat","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"GetShouldUseLuaChat","tags":["RobloxScriptSecurity"],"Class":"Chat","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"CanUserChatAsync","tags":[],"Class":"Chat","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userIdFrom","Default":null},{"Type":"int","Name":"userIdTo","Default":null}],"Name":"CanUsersChatAsync","tags":[],"Class":"Chat","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"stringToFilter","Default":null},{"Type":"Instance","Name":"playerFrom","Default":null},{"Type":"Instance","Name":"playerTo","Default":null}],"Name":"FilterStringAsync","tags":[],"Class":"Chat","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"stringToFilter","Default":null},{"Type":"Instance","Name":"playerFrom","Default":null}],"Name":"FilterStringForBroadcast","tags":[],"Class":"Chat","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"stringToFilter","Default":null},{"Type":"Instance","Name":"playerToFilterFor","Default":null}],"Name":"FilterStringForPlayerAsync","tags":["deprecated"],"Class":"Chat","type":"YieldFunction"},{"Arguments":[{"Name":"part","Type":"Instance"},{"Name":"message","Type":"string"},{"Name":"color","Type":"ChatColor"}],"Name":"Chatted","tags":[],"Class":"Chat","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ClickDetector","tags":[]},{"ValueType":"Content","type":"Property","Name":"CursorIcon","tags":[],"Class":"ClickDetector"},{"ValueType":"float","type":"Property","Name":"MaxActivationDistance","tags":[],"Class":"ClickDetector"},{"Arguments":[{"Name":"playerWhoClicked","Type":"Instance"}],"Name":"MouseClick","tags":[],"Class":"ClickDetector","type":"Event"},{"Arguments":[{"Name":"playerWhoHovered","Type":"Instance"}],"Name":"MouseHoverEnter","tags":[],"Class":"ClickDetector","type":"Event"},{"Arguments":[{"Name":"playerWhoHovered","Type":"Instance"}],"Name":"MouseHoverLeave","tags":[],"Class":"ClickDetector","type":"Event"},{"Arguments":[{"Name":"playerWhoClicked","Type":"Instance"}],"Name":"RightMouseClick","tags":[],"Class":"ClickDetector","type":"Event"},{"Arguments":[{"Name":"playerWhoClicked","Type":"Instance"}],"Name":"mouseClick","tags":["deprecated"],"Class":"ClickDetector","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"CollectionService","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"instance","Default":null},{"Type":"string","Name":"tag","Default":null}],"Name":"AddTag","tags":[],"Class":"CollectionService","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"string","Name":"class","Default":null}],"Name":"GetCollection","tags":["deprecated"],"Class":"CollectionService","type":"Function"},{"ReturnType":"EventInstance","Arguments":[{"Type":"string","Name":"tag","Default":null}],"Name":"GetInstanceAddedSignal","tags":[],"Class":"CollectionService","type":"Function"},{"ReturnType":"EventInstance","Arguments":[{"Type":"string","Name":"tag","Default":null}],"Name":"GetInstanceRemovedSignal","tags":[],"Class":"CollectionService","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"string","Name":"tag","Default":null}],"Name":"GetTagged","tags":[],"Class":"CollectionService","type":"Function"},{"ReturnType":"Array","Arguments":[{"Type":"Instance","Name":"instance","Default":null}],"Name":"GetTags","tags":[],"Class":"CollectionService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"instance","Default":null},{"Type":"string","Name":"tag","Default":null}],"Name":"HasTag","tags":[],"Class":"CollectionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"instance","Default":null},{"Type":"string","Name":"tag","Default":null}],"Name":"RemoveTag","tags":[],"Class":"CollectionService","type":"Function"},{"Arguments":[{"Name":"instance","Type":"Instance"}],"Name":"ItemAdded","tags":["deprecated"],"Class":"CollectionService","type":"Event"},{"Arguments":[{"Name":"instance","Type":"Instance"}],"Name":"ItemRemoved","tags":["deprecated"],"Class":"CollectionService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Color3Value","tags":[]},{"ValueType":"Color3","type":"Property","Name":"Value","tags":[],"Class":"Color3Value"},{"Arguments":[{"Name":"value","Type":"Color3"}],"Name":"Changed","tags":[],"Class":"Color3Value","type":"Event"},{"Arguments":[{"Name":"value","Type":"Color3"}],"Name":"changed","tags":["deprecated"],"Class":"Color3Value","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Configuration","tags":[]},{"Superclass":"Instance","type":"Class","Name":"Constraint","tags":[]},{"ValueType":"Object","type":"Property","Name":"Attachment0","tags":[],"Class":"Constraint"},{"ValueType":"Object","type":"Property","Name":"Attachment1","tags":[],"Class":"Constraint"},{"ValueType":"BrickColor","type":"Property","Name":"Color","tags":[],"Class":"Constraint"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Constraint"},{"ValueType":"bool","type":"Property","Name":"Visible","tags":[],"Class":"Constraint"},{"Superclass":"Constraint","type":"Class","Name":"AlignOrientation","tags":[]},{"ValueType":"float","type":"Property","Name":"MaxAngularVelocity","tags":[],"Class":"AlignOrientation"},{"ValueType":"float","type":"Property","Name":"MaxTorque","tags":[],"Class":"AlignOrientation"},{"ValueType":"bool","type":"Property","Name":"PrimaryAxisOnly","tags":[],"Class":"AlignOrientation"},{"ValueType":"bool","type":"Property","Name":"ReactionTorqueEnabled","tags":[],"Class":"AlignOrientation"},{"ValueType":"float","type":"Property","Name":"Responsiveness","tags":[],"Class":"AlignOrientation"},{"ValueType":"bool","type":"Property","Name":"RigidityEnabled","tags":[],"Class":"AlignOrientation"},{"Superclass":"Constraint","type":"Class","Name":"AlignPosition","tags":[]},{"ValueType":"bool","type":"Property","Name":"ApplyAtCenterOfMass","tags":[],"Class":"AlignPosition"},{"ValueType":"float","type":"Property","Name":"MaxForce","tags":[],"Class":"AlignPosition"},{"ValueType":"float","type":"Property","Name":"MaxVelocity","tags":[],"Class":"AlignPosition"},{"ValueType":"bool","type":"Property","Name":"ReactionForceEnabled","tags":[],"Class":"AlignPosition"},{"ValueType":"float","type":"Property","Name":"Responsiveness","tags":[],"Class":"AlignPosition"},{"ValueType":"bool","type":"Property","Name":"RigidityEnabled","tags":[],"Class":"AlignPosition"},{"Superclass":"Constraint","type":"Class","Name":"BallSocketConstraint","tags":[]},{"ValueType":"bool","type":"Property","Name":"LimitsEnabled","tags":[],"Class":"BallSocketConstraint"},{"ValueType":"float","type":"Property","Name":"Radius","tags":[],"Class":"BallSocketConstraint"},{"ValueType":"float","type":"Property","Name":"Restitution","tags":[],"Class":"BallSocketConstraint"},{"ValueType":"bool","type":"Property","Name":"TwistLimitsEnabled","tags":[],"Class":"BallSocketConstraint"},{"ValueType":"float","type":"Property","Name":"TwistLowerAngle","tags":[],"Class":"BallSocketConstraint"},{"ValueType":"float","type":"Property","Name":"TwistUpperAngle","tags":[],"Class":"BallSocketConstraint"},{"ValueType":"float","type":"Property","Name":"UpperAngle","tags":[],"Class":"BallSocketConstraint"},{"Superclass":"Constraint","type":"Class","Name":"HingeConstraint","tags":[]},{"ValueType":"ActuatorType","type":"Property","Name":"ActuatorType","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"AngularSpeed","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"AngularVelocity","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"CurrentAngle","tags":["readonly"],"Class":"HingeConstraint"},{"ValueType":"bool","type":"Property","Name":"LimitsEnabled","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"LowerAngle","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"MotorMaxAcceleration","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"MotorMaxTorque","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"Radius","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"Restitution","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"ServoMaxTorque","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"TargetAngle","tags":[],"Class":"HingeConstraint"},{"ValueType":"float","type":"Property","Name":"UpperAngle","tags":[],"Class":"HingeConstraint"},{"Superclass":"Constraint","type":"Class","Name":"LineForce","tags":[]},{"ValueType":"bool","type":"Property","Name":"ApplyAtCenterOfMass","tags":[],"Class":"LineForce"},{"ValueType":"bool","type":"Property","Name":"InverseSquareLaw","tags":[],"Class":"LineForce"},{"ValueType":"float","type":"Property","Name":"Magnitude","tags":[],"Class":"LineForce"},{"ValueType":"float","type":"Property","Name":"MaxForce","tags":[],"Class":"LineForce"},{"ValueType":"bool","type":"Property","Name":"ReactionForceEnabled","tags":[],"Class":"LineForce"},{"Superclass":"Constraint","type":"Class","Name":"RodConstraint","tags":[]},{"ValueType":"float","type":"Property","Name":"CurrentDistance","tags":["readonly"],"Class":"RodConstraint"},{"ValueType":"float","type":"Property","Name":"Length","tags":[],"Class":"RodConstraint"},{"ValueType":"float","type":"Property","Name":"Thickness","tags":[],"Class":"RodConstraint"},{"Superclass":"Constraint","type":"Class","Name":"RopeConstraint","tags":[]},{"ValueType":"float","type":"Property","Name":"CurrentDistance","tags":["readonly"],"Class":"RopeConstraint"},{"ValueType":"float","type":"Property","Name":"Length","tags":[],"Class":"RopeConstraint"},{"ValueType":"float","type":"Property","Name":"Restitution","tags":[],"Class":"RopeConstraint"},{"ValueType":"float","type":"Property","Name":"Thickness","tags":[],"Class":"RopeConstraint"},{"Superclass":"Constraint","type":"Class","Name":"SlidingBallConstraint","tags":[]},{"ValueType":"ActuatorType","type":"Property","Name":"ActuatorType","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"CurrentPosition","tags":["readonly"],"Class":"SlidingBallConstraint"},{"ValueType":"bool","type":"Property","Name":"LimitsEnabled","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"LowerLimit","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"MotorMaxAcceleration","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"MotorMaxForce","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"Restitution","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"ServoMaxForce","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"Size","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"Speed","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"TargetPosition","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"UpperLimit","tags":[],"Class":"SlidingBallConstraint"},{"ValueType":"float","type":"Property","Name":"Velocity","tags":[],"Class":"SlidingBallConstraint"},{"Superclass":"SlidingBallConstraint","type":"Class","Name":"CylindricalConstraint","tags":[]},{"ValueType":"ActuatorType","type":"Property","Name":"AngularActuatorType","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"bool","type":"Property","Name":"AngularLimitsEnabled","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"AngularRestitution","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"AngularSpeed","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"AngularVelocity","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"CurrentAngle","tags":["readonly"],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"InclinationAngle","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"LowerAngle","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"MotorMaxAngularAcceleration","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"MotorMaxTorque","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"bool","type":"Property","Name":"RotationAxisVisible","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"ServoMaxTorque","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"TargetAngle","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"float","type":"Property","Name":"UpperAngle","tags":[],"Class":"CylindricalConstraint"},{"ValueType":"Vector3","type":"Property","Name":"WorldRotationAxis","tags":["readonly"],"Class":"CylindricalConstraint"},{"Superclass":"SlidingBallConstraint","type":"Class","Name":"PrismaticConstraint","tags":[]},{"Superclass":"Constraint","type":"Class","Name":"SpringConstraint","tags":[]},{"ValueType":"float","type":"Property","Name":"Coils","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"CurrentLength","tags":["readonly"],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"Damping","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"FreeLength","tags":[],"Class":"SpringConstraint"},{"ValueType":"bool","type":"Property","Name":"LimitsEnabled","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"MaxForce","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"MaxLength","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"MinLength","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"Radius","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"Stiffness","tags":[],"Class":"SpringConstraint"},{"ValueType":"float","type":"Property","Name":"Thickness","tags":[],"Class":"SpringConstraint"},{"Superclass":"Constraint","type":"Class","Name":"Torque","tags":[]},{"ValueType":"ActuatorRelativeTo","type":"Property","Name":"RelativeTo","tags":[],"Class":"Torque"},{"ValueType":"Vector3","type":"Property","Name":"Torque","tags":[],"Class":"Torque"},{"Superclass":"Constraint","type":"Class","Name":"VectorForce","tags":[]},{"ValueType":"bool","type":"Property","Name":"ApplyAtCenterOfMass","tags":[],"Class":"VectorForce"},{"ValueType":"Vector3","type":"Property","Name":"Force","tags":[],"Class":"VectorForce"},{"ValueType":"ActuatorRelativeTo","type":"Property","Name":"RelativeTo","tags":[],"Class":"VectorForce"},{"Superclass":"Instance","type":"Class","Name":"ContentProvider","tags":[]},{"ValueType":"string","type":"Property","Name":"BaseUrl","tags":["readonly"],"Class":"ContentProvider"},{"ValueType":"int","type":"Property","Name":"RequestQueueSize","tags":["readonly"],"Class":"ContentProvider"},{"ReturnType":"void","Arguments":[{"Type":"Content","Name":"contentId","Default":null}],"Name":"Preload","tags":["deprecated"],"Class":"ContentProvider","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"url","Default":null}],"Name":"SetBaseUrl","tags":["LocalUserSecurity"],"Class":"ContentProvider","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Array","Name":"contentIdList","Default":null}],"Name":"PreloadAsync","tags":[],"Class":"ContentProvider","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"ContextActionService","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"Function","Name":"functionToBind","Default":null},{"Type":"bool","Name":"createTouchButton","Default":null},{"Type":"Tuple","Name":"inputTypes","Default":null}],"Name":"BindAction","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"Function","Name":"functionToBind","Default":null},{"Type":"bool","Name":"createTouchButton","Default":null},{"Type":"int","Name":"priorityLevel","Default":null},{"Type":"Tuple","Name":"inputTypes","Default":null}],"Name":"BindActionAtPriority","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"Function","Name":"functionToBind","Default":null},{"Type":"bool","Name":"createTouchButton","Default":null},{"Type":"Tuple","Name":"inputTypes","Default":null}],"Name":"BindActionToInputTypes","tags":["deprecated"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"UserInputType","Name":"userInputTypeForActivation","Default":null},{"Type":"KeyCode","Name":"keyCodeForActivation","Default":"Unknown"}],"Name":"BindActivate","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"Function","Name":"functionToBind","Default":null},{"Type":"bool","Name":"createTouchButton","Default":null},{"Type":"Tuple","Name":"inputTypes","Default":null}],"Name":"BindCoreAction","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"Function","Name":"functionToBind","Default":null},{"Type":"bool","Name":"createTouchButton","Default":null},{"Type":"int","Name":"priorityLevel","Default":null},{"Type":"Tuple","Name":"inputTypes","Default":null}],"Name":"BindCoreActionAtPriority","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"UserInputState","Name":"state","Default":null},{"Type":"Instance","Name":"inputObject","Default":null}],"Name":"CallFunction","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"Instance","Name":"actionButton","Default":null}],"Name":"FireActionButtonFoundSignal","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"Dictionary","Arguments":[],"Name":"GetAllBoundActionInfo","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"Dictionary","Arguments":[],"Name":"GetAllBoundCoreActionInfo","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"Dictionary","Arguments":[{"Type":"string","Name":"actionName","Default":null}],"Name":"GetBoundActionInfo","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"Dictionary","Arguments":[{"Type":"string","Name":"actionName","Default":null}],"Name":"GetBoundCoreActionInfo","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetCurrentLocalToolIcon","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"string","Name":"description","Default":null}],"Name":"SetDescription","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"string","Name":"image","Default":null}],"Name":"SetImage","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"UDim2","Name":"position","Default":null}],"Name":"SetPosition","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null},{"Type":"string","Name":"title","Default":null}],"Name":"SetTitle","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null}],"Name":"UnbindAction","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"UserInputType","Name":"userInputTypeForActivation","Default":null},{"Type":"KeyCode","Name":"keyCodeForActivation","Default":"Unknown"}],"Name":"UnbindActivate","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"UnbindAllActions","tags":[],"Class":"ContextActionService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"actionName","Default":null}],"Name":"UnbindCoreAction","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"actionName","Default":null}],"Name":"GetButton","tags":[],"Class":"ContextActionService","type":"YieldFunction"},{"Arguments":[{"Name":"actionAdded","Type":"string"},{"Name":"createTouchButton","Type":"bool"},{"Name":"functionInfoTable","Type":"Dictionary"},{"Name":"isCore","Type":"bool"}],"Name":"BoundActionAdded","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Event"},{"Arguments":[{"Name":"actionChanged","Type":"string"},{"Name":"changeName","Type":"string"},{"Name":"changeTable","Type":"Dictionary"}],"Name":"BoundActionChanged","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Event"},{"Arguments":[{"Name":"actionRemoved","Type":"string"},{"Name":"functionInfoTable","Type":"Dictionary"},{"Name":"isCore","Type":"bool"}],"Name":"BoundActionRemoved","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Event"},{"Arguments":[{"Name":"actionName","Type":"string"}],"Name":"GetActionButtonEvent","tags":["RobloxScriptSecurity"],"Class":"ContextActionService","type":"Event"},{"Arguments":[{"Name":"toolEquipped","Type":"Instance"}],"Name":"LocalToolEquipped","tags":[],"Class":"ContextActionService","type":"Event"},{"Arguments":[{"Name":"toolUnequipped","Type":"Instance"}],"Name":"LocalToolUnequipped","tags":[],"Class":"ContextActionService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Controller","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"Button","Name":"button","Default":null},{"Type":"string","Name":"caption","Default":null}],"Name":"BindButton","tags":[],"Class":"Controller","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Button","Name":"button","Default":null}],"Name":"GetButton","tags":[],"Class":"Controller","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Button","Name":"button","Default":null}],"Name":"UnbindButton","tags":[],"Class":"Controller","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Button","Name":"button","Default":null},{"Type":"string","Name":"caption","Default":null}],"Name":"bindButton","tags":["deprecated"],"Class":"Controller","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Button","Name":"button","Default":null}],"Name":"getButton","tags":["deprecated"],"Class":"Controller","type":"Function"},{"Arguments":[{"Name":"button","Type":"Button"}],"Name":"ButtonChanged","tags":[],"Class":"Controller","type":"Event"},{"Superclass":"Controller","type":"Class","Name":"HumanoidController","tags":[]},{"Superclass":"Controller","type":"Class","Name":"SkateboardController","tags":[]},{"ValueType":"float","type":"Property","Name":"Steer","tags":["readonly"],"Class":"SkateboardController"},{"ValueType":"float","type":"Property","Name":"Throttle","tags":["readonly"],"Class":"SkateboardController"},{"Arguments":[{"Name":"axis","Type":"string"}],"Name":"AxisChanged","tags":[],"Class":"SkateboardController","type":"Event"},{"Superclass":"Controller","type":"Class","Name":"VehicleController","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ControllerService","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"CookiesService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"CustomEvent","tags":["deprecated"]},{"ReturnType":"Objects","Arguments":[],"Name":"GetAttachedReceivers","tags":[],"Class":"CustomEvent","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"newValue","Default":null}],"Name":"SetValue","tags":[],"Class":"CustomEvent","type":"Function"},{"Arguments":[{"Name":"receiver","Type":"Instance"}],"Name":"ReceiverConnected","tags":[],"Class":"CustomEvent","type":"Event"},{"Arguments":[{"Name":"receiver","Type":"Instance"}],"Name":"ReceiverDisconnected","tags":[],"Class":"CustomEvent","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"CustomEventReceiver","tags":["deprecated"]},{"ValueType":"Object","type":"Property","Name":"Source","tags":[],"Class":"CustomEventReceiver"},{"ReturnType":"float","Arguments":[],"Name":"GetCurrentValue","tags":[],"Class":"CustomEventReceiver","type":"Function"},{"Arguments":[{"Name":"event","Type":"Instance"}],"Name":"EventConnected","tags":[],"Class":"CustomEventReceiver","type":"Event"},{"Arguments":[{"Name":"event","Type":"Instance"}],"Name":"EventDisconnected","tags":[],"Class":"CustomEventReceiver","type":"Event"},{"Arguments":[{"Name":"newValue","Type":"float"}],"Name":"SourceValueChanged","tags":[],"Class":"CustomEventReceiver","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"DataModelMesh","tags":["notbrowsable"]},{"ValueType":"Vector3","type":"Property","Name":"Offset","tags":[],"Class":"DataModelMesh"},{"ValueType":"Vector3","type":"Property","Name":"Scale","tags":[],"Class":"DataModelMesh"},{"ValueType":"Vector3","type":"Property","Name":"VertexColor","tags":[],"Class":"DataModelMesh"},{"Superclass":"DataModelMesh","type":"Class","Name":"BevelMesh","tags":["deprecated","notbrowsable"]},{"Superclass":"BevelMesh","type":"Class","Name":"BlockMesh","tags":[]},{"Superclass":"BevelMesh","type":"Class","Name":"CylinderMesh","tags":[]},{"Superclass":"DataModelMesh","type":"Class","Name":"FileMesh","tags":[]},{"ValueType":"Content","type":"Property","Name":"MeshId","tags":[],"Class":"FileMesh"},{"ValueType":"Content","type":"Property","Name":"TextureId","tags":[],"Class":"FileMesh"},{"Superclass":"FileMesh","type":"Class","Name":"SpecialMesh","tags":[]},{"ValueType":"MeshType","type":"Property","Name":"MeshType","tags":[],"Class":"SpecialMesh"},{"Superclass":"Instance","type":"Class","Name":"DataStoreService","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"AutomaticRetry","tags":["LocalUserSecurity"],"Class":"DataStoreService"},{"ValueType":"bool","type":"Property","Name":"LegacyNamingScheme","tags":["LocalUserSecurity","deprecated"],"Class":"DataStoreService"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"string","Name":"scope","Default":"global"}],"Name":"GetDataStore","tags":[],"Class":"DataStoreService","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetGlobalDataStore","tags":[],"Class":"DataStoreService","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"string","Name":"scope","Default":"global"}],"Name":"GetOrderedDataStore","tags":[],"Class":"DataStoreService","type":"Function"},{"ReturnType":"int","Arguments":[{"Type":"DataStoreRequestType","Name":"requestType","Default":null}],"Name":"GetRequestBudgetForRequestType","tags":[],"Class":"DataStoreService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Debris","tags":[]},{"ValueType":"int","type":"Property","Name":"MaxItems","tags":["deprecated"],"Class":"Debris"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"item","Default":null},{"Type":"double","Name":"lifetime","Default":"10"}],"Name":"AddItem","tags":[],"Class":"Debris","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"enabled","Default":null}],"Name":"SetLegacyMaxItems","tags":["LocalUserSecurity"],"Class":"Debris","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"item","Default":null},{"Type":"double","Name":"lifetime","Default":"10"}],"Name":"addItem","tags":["deprecated"],"Class":"Debris","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"DebugSettings","tags":["notbrowsable"]},{"ValueType":"int","type":"Property","Name":"DataModel","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"ErrorReporting","type":"Property","Name":"ErrorReporting","tags":[],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"GfxCard","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"int","type":"Property","Name":"InstanceCount","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"bool","type":"Property","Name":"IsFmodProfilingEnabled","tags":[],"Class":"DebugSettings"},{"ValueType":"bool","type":"Property","Name":"IsScriptStackTracingEnabled","tags":[],"Class":"DebugSettings"},{"ValueType":"int","type":"Property","Name":"JobCount","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"int","type":"Property","Name":"LuaRamLimit","tags":[],"Class":"DebugSettings"},{"ValueType":"bool","type":"Property","Name":"OsIs64Bit","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"OsPlatform","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"int","type":"Property","Name":"OsPlatformId","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"OsVer","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"int","type":"Property","Name":"PlayerCount","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"bool","type":"Property","Name":"ReportSoundWarnings","tags":[],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"RobloxProductName","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"RobloxVersion","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"SIMD","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"string","type":"Property","Name":"SystemProductName","tags":["readonly"],"Class":"DebugSettings"},{"ValueType":"TickCountSampleMethod","type":"Property","Name":"TickCountPreciseOverride","tags":[],"Class":"DebugSettings"},{"ValueType":"int","type":"Property","Name":"VideoMemory","tags":["readonly"],"Class":"DebugSettings"},{"Superclass":"Instance","type":"Class","Name":"DebuggerBreakpoint","tags":["notCreatable"]},{"ValueType":"string","type":"Property","Name":"Condition","tags":[],"Class":"DebuggerBreakpoint"},{"ValueType":"bool","type":"Property","Name":"IsEnabled","tags":[],"Class":"DebuggerBreakpoint"},{"ValueType":"int","type":"Property","Name":"Line","tags":["readonly"],"Class":"DebuggerBreakpoint"},{"Superclass":"Instance","type":"Class","Name":"DebuggerManager","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"DebuggingEnabled","tags":["readonly"],"Class":"DebuggerManager"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"script","Default":null}],"Name":"AddDebugger","tags":[],"Class":"DebuggerManager","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"EnableDebugging","tags":["LocalUserSecurity"],"Class":"DebuggerManager","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetDebuggers","tags":[],"Class":"DebuggerManager","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Resume","tags":[],"Class":"DebuggerManager","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StepIn","tags":[],"Class":"DebuggerManager","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StepOut","tags":[],"Class":"DebuggerManager","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StepOver","tags":[],"Class":"DebuggerManager","type":"Function"},{"Arguments":[{"Name":"debugger","Type":"Instance"}],"Name":"DebuggerAdded","tags":[],"Class":"DebuggerManager","type":"Event"},{"Arguments":[{"Name":"debugger","Type":"Instance"}],"Name":"DebuggerRemoved","tags":[],"Class":"DebuggerManager","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"DebuggerWatch","tags":[]},{"ValueType":"string","type":"Property","Name":"Expression","tags":[],"Class":"DebuggerWatch"},{"ReturnType":"void","Arguments":[],"Name":"CheckSyntax","tags":[],"Class":"DebuggerWatch","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Dialog","tags":[]},{"ValueType":"DialogBehaviorType","type":"Property","Name":"BehaviorType","tags":[],"Class":"Dialog"},{"ValueType":"float","type":"Property","Name":"ConversationDistance","tags":[],"Class":"Dialog"},{"ValueType":"bool","type":"Property","Name":"GoodbyeChoiceActive","tags":[],"Class":"Dialog"},{"ValueType":"string","type":"Property","Name":"GoodbyeDialog","tags":[],"Class":"Dialog"},{"ValueType":"bool","type":"Property","Name":"InUse","tags":[],"Class":"Dialog"},{"ValueType":"string","type":"Property","Name":"InitialPrompt","tags":[],"Class":"Dialog"},{"ValueType":"DialogPurpose","type":"Property","Name":"Purpose","tags":[],"Class":"Dialog"},{"ValueType":"DialogTone","type":"Property","Name":"Tone","tags":[],"Class":"Dialog"},{"ValueType":"float","type":"Property","Name":"TriggerDistance","tags":[],"Class":"Dialog"},{"ValueType":"Vector3","type":"Property","Name":"TriggerOffset","tags":[],"Class":"Dialog"},{"ReturnType":"Objects","Arguments":[],"Name":"GetCurrentPlayers","tags":[],"Class":"Dialog","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"bool","Name":"isUsing","Default":null}],"Name":"SetPlayerIsUsing","tags":["RobloxScriptSecurity"],"Class":"Dialog","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"Instance","Name":"dialogChoice","Default":null}],"Name":"SignalDialogChoiceSelected","tags":["RobloxScriptSecurity"],"Class":"Dialog","type":"Function"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"dialogChoice","Type":"Instance"}],"Name":"DialogChoiceSelected","tags":[],"Class":"Dialog","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"DialogChoice","tags":[]},{"ValueType":"bool","type":"Property","Name":"GoodbyeChoiceActive","tags":[],"Class":"DialogChoice"},{"ValueType":"string","type":"Property","Name":"GoodbyeDialog","tags":[],"Class":"DialogChoice"},{"ValueType":"string","type":"Property","Name":"ResponseDialog","tags":[],"Class":"DialogChoice"},{"ValueType":"string","type":"Property","Name":"UserDialog","tags":[],"Class":"DialogChoice"},{"Superclass":"Instance","type":"Class","Name":"DoubleConstrainedValue","tags":["deprecated"]},{"ValueType":"double","type":"Property","Name":"ConstrainedValue","tags":["hidden"],"Class":"DoubleConstrainedValue"},{"ValueType":"double","type":"Property","Name":"MaxValue","tags":[],"Class":"DoubleConstrainedValue"},{"ValueType":"double","type":"Property","Name":"MinValue","tags":[],"Class":"DoubleConstrainedValue"},{"ValueType":"double","type":"Property","Name":"Value","tags":[],"Class":"DoubleConstrainedValue"},{"Arguments":[{"Name":"value","Type":"double"}],"Name":"Changed","tags":[],"Class":"DoubleConstrainedValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"double"}],"Name":"changed","tags":["deprecated"],"Class":"DoubleConstrainedValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Dragger","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"Axis","Name":"axis","Default":"X"}],"Name":"AxisRotate","tags":[],"Class":"Dragger","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"mousePart","Default":null},{"Type":"Vector3","Name":"pointOnMousePart","Default":null},{"Type":"Objects","Name":"parts","Default":null}],"Name":"MouseDown","tags":[],"Class":"Dragger","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Ray","Name":"mouseRay","Default":null}],"Name":"MouseMove","tags":[],"Class":"Dragger","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"MouseUp","tags":[],"Class":"Dragger","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Explosion","tags":[]},{"ValueType":"float","type":"Property","Name":"BlastPressure","tags":[],"Class":"Explosion"},{"ValueType":"float","type":"Property","Name":"BlastRadius","tags":[],"Class":"Explosion"},{"ValueType":"float","type":"Property","Name":"DestroyJointRadiusPercent","tags":[],"Class":"Explosion"},{"ValueType":"ExplosionType","type":"Property","Name":"ExplosionType","tags":[],"Class":"Explosion"},{"ValueType":"Vector3","type":"Property","Name":"Position","tags":[],"Class":"Explosion"},{"ValueType":"bool","type":"Property","Name":"Visible","tags":[],"Class":"Explosion"},{"Arguments":[{"Name":"part","Type":"Instance"},{"Name":"distance","Type":"float"}],"Name":"Hit","tags":[],"Class":"Explosion","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"FaceInstance","tags":["notbrowsable"]},{"ValueType":"NormalId","type":"Property","Name":"Face","tags":[],"Class":"FaceInstance"},{"Superclass":"FaceInstance","type":"Class","Name":"Decal","tags":[]},{"ValueType":"Color3","type":"Property","Name":"Color3","tags":[],"Class":"Decal"},{"ValueType":"float","type":"Property","Name":"LocalTransparencyModifier","tags":["hidden"],"Class":"Decal"},{"ValueType":"float","type":"Property","Name":"Shiny","tags":["deprecated"],"Class":"Decal"},{"ValueType":"float","type":"Property","Name":"Specular","tags":["deprecated"],"Class":"Decal"},{"ValueType":"Content","type":"Property","Name":"Texture","tags":[],"Class":"Decal"},{"ValueType":"float","type":"Property","Name":"Transparency","tags":[],"Class":"Decal"},{"Superclass":"Decal","type":"Class","Name":"Texture","tags":[]},{"ValueType":"float","type":"Property","Name":"StudsPerTileU","tags":[],"Class":"Texture"},{"ValueType":"float","type":"Property","Name":"StudsPerTileV","tags":[],"Class":"Texture"},{"Superclass":"Instance","type":"Class","Name":"Feature","tags":[]},{"ValueType":"NormalId","type":"Property","Name":"FaceId","tags":[],"Class":"Feature"},{"ValueType":"InOut","type":"Property","Name":"InOut","tags":[],"Class":"Feature"},{"ValueType":"LeftRight","type":"Property","Name":"LeftRight","tags":[],"Class":"Feature"},{"ValueType":"TopBottom","type":"Property","Name":"TopBottom","tags":[],"Class":"Feature"},{"Superclass":"Feature","type":"Class","Name":"Hole","tags":["deprecated"]},{"Superclass":"Feature","type":"Class","Name":"MotorFeature","tags":["deprecated"]},{"Superclass":"Instance","type":"Class","Name":"Fire","tags":[]},{"ValueType":"Color3","type":"Property","Name":"Color","tags":[],"Class":"Fire"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Fire"},{"ValueType":"float","type":"Property","Name":"Heat","tags":[],"Class":"Fire"},{"ValueType":"Color3","type":"Property","Name":"SecondaryColor","tags":[],"Class":"Fire"},{"ValueType":"float","type":"Property","Name":"Size","tags":[],"Class":"Fire"},{"ValueType":"float","type":"Property","Name":"size","tags":["deprecated"],"Class":"Fire"},{"Superclass":"Instance","type":"Class","Name":"FlagStandService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"FlyweightService","tags":[]},{"Superclass":"FlyweightService","type":"Class","Name":"CSGDictionaryService","tags":[]},{"Superclass":"FlyweightService","type":"Class","Name":"NonReplicatedCSGDictionaryService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"Folder","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ForceField","tags":[]},{"ValueType":"bool","type":"Property","Name":"Visible","tags":[],"Class":"ForceField"},{"Superclass":"Instance","type":"Class","Name":"FriendService","tags":["notCreatable"]},{"ReturnType":"Array","Arguments":[],"Name":"GetPlatformFriends","tags":["RobloxScriptSecurity"],"Class":"FriendService","type":"YieldFunction"},{"Arguments":[{"Name":"friendData","Type":"Array"}],"Name":"FriendsUpdated","tags":["RobloxScriptSecurity"],"Class":"FriendService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"FunctionalTest","tags":["deprecated"]},{"ValueType":"string","type":"Property","Name":"Description","tags":[],"Class":"FunctionalTest"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":""}],"Name":"Error","tags":[],"Class":"FunctionalTest","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":""}],"Name":"Failed","tags":[],"Class":"FunctionalTest","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":""}],"Name":"Pass","tags":[],"Class":"FunctionalTest","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":""}],"Name":"Passed","tags":[],"Class":"FunctionalTest","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":""}],"Name":"Warn","tags":[],"Class":"FunctionalTest","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"GamePassService","tags":[]},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"gamePassId","Default":null}],"Name":"PlayerHasPass","tags":[],"Class":"GamePassService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"GameSettings","tags":["notbrowsable"]},{"ValueType":"string","type":"Property","Name":"AdditionalCoreIncludeDirs","tags":[],"Class":"GameSettings"},{"ValueType":"float","type":"Property","Name":"BubbleChatLifetime","tags":[],"Class":"GameSettings"},{"ValueType":"int","type":"Property","Name":"BubbleChatMaxBubbles","tags":[],"Class":"GameSettings"},{"ValueType":"int","type":"Property","Name":"ChatHistory","tags":[],"Class":"GameSettings"},{"ValueType":"int","type":"Property","Name":"ChatScrollLength","tags":[],"Class":"GameSettings"},{"ValueType":"bool","type":"Property","Name":"CollisionSoundEnabled","tags":["deprecated"],"Class":"GameSettings"},{"ValueType":"float","type":"Property","Name":"CollisionSoundVolume","tags":["deprecated"],"Class":"GameSettings"},{"ValueType":"bool","type":"Property","Name":"HardwareMouse","tags":[],"Class":"GameSettings"},{"ValueType":"int","type":"Property","Name":"MaxCollisionSounds","tags":["deprecated"],"Class":"GameSettings"},{"ValueType":"string","type":"Property","Name":"OverrideStarterScript","tags":[],"Class":"GameSettings"},{"ValueType":"int","type":"Property","Name":"ReportAbuseChatHistory","tags":[],"Class":"GameSettings"},{"ValueType":"bool","type":"Property","Name":"SoftwareSound","tags":[],"Class":"GameSettings"},{"ValueType":"bool","type":"Property","Name":"VideoCaptureEnabled","tags":[],"Class":"GameSettings"},{"ValueType":"VideoQualitySettings","type":"Property","Name":"VideoQuality","tags":[],"Class":"GameSettings"},{"Arguments":[{"Name":"recording","Type":"bool"}],"Name":"VideoRecordingChangeRequest","tags":["RobloxScriptSecurity"],"Class":"GameSettings","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"GamepadService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"Geometry","tags":[]},{"Superclass":"Instance","type":"Class","Name":"GlobalDataStore","tags":[]},{"ReturnType":"Connection","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"Function","Name":"callback","Default":null}],"Name":"OnUpdate","tags":[],"Class":"GlobalDataStore","type":"Function"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"GetAsync","tags":[],"Class":"GlobalDataStore","type":"YieldFunction"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"int","Name":"delta","Default":"1"}],"Name":"IncrementAsync","tags":[],"Class":"GlobalDataStore","type":"YieldFunction"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"RemoveAsync","tags":[],"Class":"GlobalDataStore","type":"YieldFunction"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"Variant","Name":"value","Default":null}],"Name":"SetAsync","tags":[],"Class":"GlobalDataStore","type":"YieldFunction"},{"ReturnType":"Tuple","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"Function","Name":"transformFunction","Default":null}],"Name":"UpdateAsync","tags":[],"Class":"GlobalDataStore","type":"YieldFunction"},{"Superclass":"GlobalDataStore","type":"Class","Name":"OrderedDataStore","tags":[]},{"ReturnType":"Instance","Arguments":[{"Type":"bool","Name":"ascending","Default":null},{"Type":"int","Name":"pagesize","Default":null},{"Type":"Variant","Name":"minValue","Default":null},{"Type":"Variant","Name":"maxValue","Default":null}],"Name":"GetSortedAsync","tags":[],"Class":"OrderedDataStore","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"GoogleAnalyticsConfiguration","tags":[]},{"Superclass":"Instance","type":"Class","Name":"GroupService","tags":["notCreatable"]},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"groupId","Default":null}],"Name":"GetAlliesAsync","tags":[],"Class":"GroupService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"groupId","Default":null}],"Name":"GetEnemiesAsync","tags":[],"Class":"GroupService","type":"YieldFunction"},{"ReturnType":"Variant","Arguments":[{"Type":"int","Name":"groupId","Default":null}],"Name":"GetGroupInfoAsync","tags":[],"Class":"GroupService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetGroupsAsync","tags":[],"Class":"GroupService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"GuiBase","tags":[]},{"Superclass":"GuiBase","type":"Class","Name":"GuiBase2d","tags":["notbrowsable"]},{"ValueType":"Vector2","type":"Property","Name":"AbsolutePosition","tags":["readonly"],"Class":"GuiBase2d"},{"ValueType":"float","type":"Property","Name":"AbsoluteRotation","tags":["readonly"],"Class":"GuiBase2d"},{"ValueType":"Vector2","type":"Property","Name":"AbsoluteSize","tags":["readonly"],"Class":"GuiBase2d"},{"ValueType":"bool","type":"Property","Name":"Localize","tags":["hidden"],"Class":"GuiBase2d"},{"Superclass":"GuiBase2d","type":"Class","Name":"GuiObject","tags":["notbrowsable"]},{"ValueType":"bool","type":"Property","Name":"Active","tags":[],"Class":"GuiObject"},{"ValueType":"Vector2","type":"Property","Name":"AnchorPoint","tags":[],"Class":"GuiObject"},{"ValueType":"BrickColor","type":"Property","Name":"BackgroundColor","tags":["deprecated","hidden"],"Class":"GuiObject"},{"ValueType":"Color3","type":"Property","Name":"BackgroundColor3","tags":[],"Class":"GuiObject"},{"ValueType":"float","type":"Property","Name":"BackgroundTransparency","tags":[],"Class":"GuiObject"},{"ValueType":"BrickColor","type":"Property","Name":"BorderColor","tags":["deprecated","hidden"],"Class":"GuiObject"},{"ValueType":"Color3","type":"Property","Name":"BorderColor3","tags":[],"Class":"GuiObject"},{"ValueType":"int","type":"Property","Name":"BorderSizePixel","tags":[],"Class":"GuiObject"},{"ValueType":"bool","type":"Property","Name":"ClipsDescendants","tags":[],"Class":"GuiObject"},{"ValueType":"bool","type":"Property","Name":"Draggable","tags":[],"Class":"GuiObject"},{"ValueType":"int","type":"Property","Name":"LayoutOrder","tags":[],"Class":"GuiObject"},{"ValueType":"Object","type":"Property","Name":"NextSelectionDown","tags":[],"Class":"GuiObject"},{"ValueType":"Object","type":"Property","Name":"NextSelectionLeft","tags":[],"Class":"GuiObject"},{"ValueType":"Object","type":"Property","Name":"NextSelectionRight","tags":[],"Class":"GuiObject"},{"ValueType":"Object","type":"Property","Name":"NextSelectionUp","tags":[],"Class":"GuiObject"},{"ValueType":"UDim2","type":"Property","Name":"Position","tags":[],"Class":"GuiObject"},{"ValueType":"float","type":"Property","Name":"Rotation","tags":[],"Class":"GuiObject"},{"ValueType":"bool","type":"Property","Name":"Selectable","tags":[],"Class":"GuiObject"},{"ValueType":"Object","type":"Property","Name":"SelectionImageObject","tags":[],"Class":"GuiObject"},{"ValueType":"UDim2","type":"Property","Name":"Size","tags":[],"Class":"GuiObject"},{"ValueType":"SizeConstraint","type":"Property","Name":"SizeConstraint","tags":[],"Class":"GuiObject"},{"ValueType":"bool","type":"Property","Name":"SizeFromContents","tags":[],"Class":"GuiObject"},{"ValueType":"float","type":"Property","Name":"Transparency","tags":["hidden"],"Class":"GuiObject"},{"ValueType":"bool","type":"Property","Name":"Visible","tags":[],"Class":"GuiObject"},{"ValueType":"int","type":"Property","Name":"ZIndex","tags":[],"Class":"GuiObject"},{"ReturnType":"bool","Arguments":[{"Type":"UDim2","Name":"endPosition","Default":null},{"Type":"EasingDirection","Name":"easingDirection","Default":"Out"},{"Type":"EasingStyle","Name":"easingStyle","Default":"Quad"},{"Type":"float","Name":"time","Default":"1"},{"Type":"bool","Name":"override","Default":"false"},{"Type":"Function","Name":"callback","Default":"nil"}],"Name":"TweenPosition","tags":[],"Class":"GuiObject","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UDim2","Name":"endSize","Default":null},{"Type":"EasingDirection","Name":"easingDirection","Default":"Out"},{"Type":"EasingStyle","Name":"easingStyle","Default":"Quad"},{"Type":"float","Name":"time","Default":"1"},{"Type":"bool","Name":"override","Default":"false"},{"Type":"Function","Name":"callback","Default":"nil"}],"Name":"TweenSize","tags":[],"Class":"GuiObject","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UDim2","Name":"endSize","Default":null},{"Type":"UDim2","Name":"endPosition","Default":null},{"Type":"EasingDirection","Name":"easingDirection","Default":"Out"},{"Type":"EasingStyle","Name":"easingStyle","Default":"Quad"},{"Type":"float","Name":"time","Default":"1"},{"Type":"bool","Name":"override","Default":"false"},{"Type":"Function","Name":"callback","Default":"nil"}],"Name":"TweenSizeAndPosition","tags":[],"Class":"GuiObject","type":"Function"},{"Arguments":[{"Name":"initialPosition","Type":"UDim2"}],"Name":"DragBegin","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"DragStopped","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"input","Type":"Instance"}],"Name":"InputBegan","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"input","Type":"Instance"}],"Name":"InputChanged","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"input","Type":"Instance"}],"Name":"InputEnded","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseEnter","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseLeave","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseMoved","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseWheelBackward","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseWheelForward","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[],"Name":"SelectionGained","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[],"Name":"SelectionLost","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"state","Type":"UserInputState"}],"Name":"TouchLongPress","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"totalTranslation","Type":"Vector2"},{"Name":"velocity","Type":"Vector2"},{"Name":"state","Type":"UserInputState"}],"Name":"TouchPan","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"scale","Type":"float"},{"Name":"velocity","Type":"float"},{"Name":"state","Type":"UserInputState"}],"Name":"TouchPinch","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"rotation","Type":"float"},{"Name":"velocity","Type":"float"},{"Name":"state","Type":"UserInputState"}],"Name":"TouchRotate","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"swipeDirection","Type":"SwipeDirection"},{"Name":"numberOfTouches","Type":"int"}],"Name":"TouchSwipe","tags":[],"Class":"GuiObject","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"}],"Name":"TouchTap","tags":[],"Class":"GuiObject","type":"Event"},{"Superclass":"GuiObject","type":"Class","Name":"Frame","tags":[]},{"ValueType":"FrameStyle","type":"Property","Name":"Style","tags":[],"Class":"Frame"},{"Superclass":"GuiObject","type":"Class","Name":"GuiButton","tags":["notbrowsable"]},{"ValueType":"bool","type":"Property","Name":"AutoButtonColor","tags":[],"Class":"GuiButton"},{"ValueType":"bool","type":"Property","Name":"Modal","tags":[],"Class":"GuiButton"},{"ValueType":"bool","type":"Property","Name":"Selected","tags":[],"Class":"GuiButton"},{"ValueType":"ButtonStyle","type":"Property","Name":"Style","tags":[],"Class":"GuiButton"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"verb","Default":null}],"Name":"SetVerb","tags":["RobloxScriptSecurity"],"Class":"GuiButton","type":"Function"},{"Arguments":[{"Name":"inputObject","Type":"Instance"}],"Name":"Activated","tags":[],"Class":"GuiButton","type":"Event"},{"Arguments":[],"Name":"MouseButton1Click","tags":[],"Class":"GuiButton","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseButton1Down","tags":[],"Class":"GuiButton","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseButton1Up","tags":[],"Class":"GuiButton","type":"Event"},{"Arguments":[],"Name":"MouseButton2Click","tags":[],"Class":"GuiButton","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseButton2Down","tags":[],"Class":"GuiButton","type":"Event"},{"Arguments":[{"Name":"x","Type":"int"},{"Name":"y","Type":"int"}],"Name":"MouseButton2Up","tags":[],"Class":"GuiButton","type":"Event"},{"Superclass":"GuiButton","type":"Class","Name":"ImageButton","tags":[]},{"ValueType":"Content","type":"Property","Name":"Image","tags":[],"Class":"ImageButton"},{"ValueType":"Color3","type":"Property","Name":"ImageColor3","tags":[],"Class":"ImageButton"},{"ValueType":"Vector2","type":"Property","Name":"ImageRectOffset","tags":[],"Class":"ImageButton"},{"ValueType":"Vector2","type":"Property","Name":"ImageRectSize","tags":[],"Class":"ImageButton"},{"ValueType":"float","type":"Property","Name":"ImageTransparency","tags":[],"Class":"ImageButton"},{"ValueType":"bool","type":"Property","Name":"IsLoaded","tags":["readonly"],"Class":"ImageButton"},{"ValueType":"ScaleType","type":"Property","Name":"ScaleType","tags":[],"Class":"ImageButton"},{"ValueType":"Rect2D","type":"Property","Name":"SliceCenter","tags":[],"Class":"ImageButton"},{"ValueType":"UDim2","type":"Property","Name":"TileSize","tags":[],"Class":"ImageButton"},{"Superclass":"GuiButton","type":"Class","Name":"TextButton","tags":[]},{"ValueType":"Font","type":"Property","Name":"Font","tags":[],"Class":"TextButton"},{"ValueType":"FontSize","type":"Property","Name":"FontSize","tags":["deprecated"],"Class":"TextButton"},{"ValueType":"float","type":"Property","Name":"LineHeight","tags":[],"Class":"TextButton"},{"ValueType":"string","type":"Property","Name":"LocalizedText","tags":["hidden","readonly"],"Class":"TextButton"},{"ValueType":"string","type":"Property","Name":"Text","tags":[],"Class":"TextButton"},{"ValueType":"Vector2","type":"Property","Name":"TextBounds","tags":["readonly"],"Class":"TextButton"},{"ValueType":"BrickColor","type":"Property","Name":"TextColor","tags":["deprecated","hidden"],"Class":"TextButton"},{"ValueType":"Color3","type":"Property","Name":"TextColor3","tags":[],"Class":"TextButton"},{"ValueType":"bool","type":"Property","Name":"TextFits","tags":["readonly"],"Class":"TextButton"},{"ValueType":"bool","type":"Property","Name":"TextScaled","tags":[],"Class":"TextButton"},{"ValueType":"float","type":"Property","Name":"TextSize","tags":[],"Class":"TextButton"},{"ValueType":"Color3","type":"Property","Name":"TextStrokeColor3","tags":[],"Class":"TextButton"},{"ValueType":"float","type":"Property","Name":"TextStrokeTransparency","tags":[],"Class":"TextButton"},{"ValueType":"float","type":"Property","Name":"TextTransparency","tags":[],"Class":"TextButton"},{"ValueType":"bool","type":"Property","Name":"TextWrap","tags":["deprecated"],"Class":"TextButton"},{"ValueType":"bool","type":"Property","Name":"TextWrapped","tags":[],"Class":"TextButton"},{"ValueType":"TextXAlignment","type":"Property","Name":"TextXAlignment","tags":[],"Class":"TextButton"},{"ValueType":"TextYAlignment","type":"Property","Name":"TextYAlignment","tags":[],"Class":"TextButton"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"text","Default":null}],"Name":"SetTextFromInput","tags":["RobloxScriptSecurity"],"Class":"TextButton","type":"Function"},{"Superclass":"GuiObject","type":"Class","Name":"GuiLabel","tags":[]},{"Superclass":"GuiLabel","type":"Class","Name":"ImageLabel","tags":[]},{"ValueType":"Content","type":"Property","Name":"Image","tags":[],"Class":"ImageLabel"},{"ValueType":"Color3","type":"Property","Name":"ImageColor3","tags":[],"Class":"ImageLabel"},{"ValueType":"Vector2","type":"Property","Name":"ImageRectOffset","tags":[],"Class":"ImageLabel"},{"ValueType":"Vector2","type":"Property","Name":"ImageRectSize","tags":[],"Class":"ImageLabel"},{"ValueType":"float","type":"Property","Name":"ImageTransparency","tags":[],"Class":"ImageLabel"},{"ValueType":"bool","type":"Property","Name":"IsLoaded","tags":["readonly"],"Class":"ImageLabel"},{"ValueType":"ScaleType","type":"Property","Name":"ScaleType","tags":[],"Class":"ImageLabel"},{"ValueType":"Rect2D","type":"Property","Name":"SliceCenter","tags":[],"Class":"ImageLabel"},{"ValueType":"UDim2","type":"Property","Name":"TileSize","tags":[],"Class":"ImageLabel"},{"Superclass":"GuiLabel","type":"Class","Name":"TextLabel","tags":[]},{"ValueType":"Font","type":"Property","Name":"Font","tags":[],"Class":"TextLabel"},{"ValueType":"FontSize","type":"Property","Name":"FontSize","tags":["deprecated"],"Class":"TextLabel"},{"ValueType":"float","type":"Property","Name":"LineHeight","tags":[],"Class":"TextLabel"},{"ValueType":"string","type":"Property","Name":"LocalizedText","tags":["hidden","readonly"],"Class":"TextLabel"},{"ValueType":"string","type":"Property","Name":"Text","tags":[],"Class":"TextLabel"},{"ValueType":"Vector2","type":"Property","Name":"TextBounds","tags":["readonly"],"Class":"TextLabel"},{"ValueType":"BrickColor","type":"Property","Name":"TextColor","tags":["deprecated","hidden"],"Class":"TextLabel"},{"ValueType":"Color3","type":"Property","Name":"TextColor3","tags":[],"Class":"TextLabel"},{"ValueType":"bool","type":"Property","Name":"TextFits","tags":["readonly"],"Class":"TextLabel"},{"ValueType":"bool","type":"Property","Name":"TextScaled","tags":[],"Class":"TextLabel"},{"ValueType":"float","type":"Property","Name":"TextSize","tags":[],"Class":"TextLabel"},{"ValueType":"Color3","type":"Property","Name":"TextStrokeColor3","tags":[],"Class":"TextLabel"},{"ValueType":"float","type":"Property","Name":"TextStrokeTransparency","tags":[],"Class":"TextLabel"},{"ValueType":"float","type":"Property","Name":"TextTransparency","tags":[],"Class":"TextLabel"},{"ValueType":"bool","type":"Property","Name":"TextWrap","tags":["deprecated"],"Class":"TextLabel"},{"ValueType":"bool","type":"Property","Name":"TextWrapped","tags":[],"Class":"TextLabel"},{"ValueType":"TextXAlignment","type":"Property","Name":"TextXAlignment","tags":[],"Class":"TextLabel"},{"ValueType":"TextYAlignment","type":"Property","Name":"TextYAlignment","tags":[],"Class":"TextLabel"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"text","Default":null}],"Name":"SetTextFromInput","tags":["RobloxScriptSecurity"],"Class":"TextLabel","type":"Function"},{"Superclass":"GuiObject","type":"Class","Name":"Scale9Frame","tags":[]},{"ValueType":"Vector2int16","type":"Property","Name":"ScaleEdgeSize","tags":[],"Class":"Scale9Frame"},{"ValueType":"string","type":"Property","Name":"SlicePrefix","tags":[],"Class":"Scale9Frame"},{"Superclass":"GuiObject","type":"Class","Name":"ScrollingFrame","tags":[]},{"ValueType":"Vector2","type":"Property","Name":"AbsoluteWindowSize","tags":["readonly"],"Class":"ScrollingFrame"},{"ValueType":"Content","type":"Property","Name":"BottomImage","tags":[],"Class":"ScrollingFrame"},{"ValueType":"Vector2","type":"Property","Name":"CanvasPosition","tags":[],"Class":"ScrollingFrame"},{"ValueType":"UDim2","type":"Property","Name":"CanvasSize","tags":[],"Class":"ScrollingFrame"},{"ValueType":"ScrollBarInset","type":"Property","Name":"HorizontalScrollBarInset","tags":[],"Class":"ScrollingFrame"},{"ValueType":"Content","type":"Property","Name":"MidImage","tags":[],"Class":"ScrollingFrame"},{"ValueType":"int","type":"Property","Name":"ScrollBarThickness","tags":[],"Class":"ScrollingFrame"},{"ValueType":"bool","type":"Property","Name":"ScrollingEnabled","tags":[],"Class":"ScrollingFrame"},{"ValueType":"Content","type":"Property","Name":"TopImage","tags":[],"Class":"ScrollingFrame"},{"ValueType":"ScrollBarInset","type":"Property","Name":"VerticalScrollBarInset","tags":[],"Class":"ScrollingFrame"},{"ValueType":"VerticalScrollBarPosition","type":"Property","Name":"VerticalScrollBarPosition","tags":[],"Class":"ScrollingFrame"},{"Superclass":"GuiObject","type":"Class","Name":"TextBox","tags":[]},{"ValueType":"bool","type":"Property","Name":"ClearTextOnFocus","tags":[],"Class":"TextBox"},{"ValueType":"Font","type":"Property","Name":"Font","tags":[],"Class":"TextBox"},{"ValueType":"FontSize","type":"Property","Name":"FontSize","tags":["deprecated"],"Class":"TextBox"},{"ValueType":"float","type":"Property","Name":"LineHeight","tags":[],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"ManualFocusRelease","tags":["RobloxScriptSecurity"],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"MultiLine","tags":[],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"OverlayNativeInput","tags":["RobloxScriptSecurity"],"Class":"TextBox"},{"ValueType":"Color3","type":"Property","Name":"PlaceholderColor3","tags":[],"Class":"TextBox"},{"ValueType":"string","type":"Property","Name":"PlaceholderText","tags":[],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"ShowNativeInput","tags":[],"Class":"TextBox"},{"ValueType":"string","type":"Property","Name":"Text","tags":[],"Class":"TextBox"},{"ValueType":"Vector2","type":"Property","Name":"TextBounds","tags":["readonly"],"Class":"TextBox"},{"ValueType":"BrickColor","type":"Property","Name":"TextColor","tags":["deprecated","hidden"],"Class":"TextBox"},{"ValueType":"Color3","type":"Property","Name":"TextColor3","tags":[],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"TextFits","tags":["readonly"],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"TextScaled","tags":[],"Class":"TextBox"},{"ValueType":"float","type":"Property","Name":"TextSize","tags":[],"Class":"TextBox"},{"ValueType":"Color3","type":"Property","Name":"TextStrokeColor3","tags":[],"Class":"TextBox"},{"ValueType":"float","type":"Property","Name":"TextStrokeTransparency","tags":[],"Class":"TextBox"},{"ValueType":"float","type":"Property","Name":"TextTransparency","tags":[],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"TextWrap","tags":["deprecated"],"Class":"TextBox"},{"ValueType":"bool","type":"Property","Name":"TextWrapped","tags":[],"Class":"TextBox"},{"ValueType":"TextXAlignment","type":"Property","Name":"TextXAlignment","tags":[],"Class":"TextBox"},{"ValueType":"TextYAlignment","type":"Property","Name":"TextYAlignment","tags":[],"Class":"TextBox"},{"ReturnType":"void","Arguments":[],"Name":"CaptureFocus","tags":[],"Class":"TextBox","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsFocused","tags":[],"Class":"TextBox","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"submitted","Default":"false"}],"Name":"ReleaseFocus","tags":[],"Class":"TextBox","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"text","Default":null}],"Name":"SetTextFromInput","tags":["RobloxScriptSecurity"],"Class":"TextBox","type":"Function"},{"Arguments":[{"Name":"enterPressed","Type":"bool"},{"Name":"inputThatCausedFocusLoss","Type":"Instance"}],"Name":"FocusLost","tags":[],"Class":"TextBox","type":"Event"},{"Arguments":[],"Name":"Focused","tags":[],"Class":"TextBox","type":"Event"},{"Superclass":"GuiBase2d","type":"Class","Name":"LayerCollector","tags":["notbrowsable"]},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"LayerCollector"},{"ValueType":"ZIndexBehavior","type":"Property","Name":"ZIndexBehavior","tags":[],"Class":"LayerCollector"},{"Superclass":"LayerCollector","type":"Class","Name":"BillboardGui","tags":[]},{"ValueType":"bool","type":"Property","Name":"Active","tags":[],"Class":"BillboardGui"},{"ValueType":"Object","type":"Property","Name":"Adornee","tags":[],"Class":"BillboardGui"},{"ValueType":"bool","type":"Property","Name":"AlwaysOnTop","tags":[],"Class":"BillboardGui"},{"ValueType":"Vector3","type":"Property","Name":"ExtentsOffset","tags":[],"Class":"BillboardGui"},{"ValueType":"Vector3","type":"Property","Name":"ExtentsOffsetWorldSpace","tags":[],"Class":"BillboardGui"},{"ValueType":"float","type":"Property","Name":"LightInfluence","tags":[],"Class":"BillboardGui"},{"ValueType":"float","type":"Property","Name":"MaxDistance","tags":[],"Class":"BillboardGui"},{"ValueType":"Object","type":"Property","Name":"PlayerToHideFrom","tags":[],"Class":"BillboardGui"},{"ValueType":"UDim2","type":"Property","Name":"Size","tags":[],"Class":"BillboardGui"},{"ValueType":"Vector2","type":"Property","Name":"SizeOffset","tags":[],"Class":"BillboardGui"},{"ValueType":"Vector3","type":"Property","Name":"StudsOffset","tags":[],"Class":"BillboardGui"},{"ValueType":"Vector3","type":"Property","Name":"StudsOffsetWorldSpace","tags":[],"Class":"BillboardGui"},{"Superclass":"LayerCollector","type":"Class","Name":"ScreenGui","tags":[]},{"ValueType":"int","type":"Property","Name":"DisplayOrder","tags":[],"Class":"ScreenGui"},{"ValueType":"bool","type":"Property","Name":"ResetOnSpawn","tags":[],"Class":"ScreenGui"},{"Superclass":"ScreenGui","type":"Class","Name":"GuiMain","tags":["deprecated"]},{"Superclass":"LayerCollector","type":"Class","Name":"SurfaceGui","tags":[]},{"ValueType":"bool","type":"Property","Name":"Active","tags":[],"Class":"SurfaceGui"},{"ValueType":"Object","type":"Property","Name":"Adornee","tags":[],"Class":"SurfaceGui"},{"ValueType":"bool","type":"Property","Name":"AlwaysOnTop","tags":[],"Class":"SurfaceGui"},{"ValueType":"Vector2","type":"Property","Name":"CanvasSize","tags":[],"Class":"SurfaceGui"},{"ValueType":"NormalId","type":"Property","Name":"Face","tags":[],"Class":"SurfaceGui"},{"ValueType":"float","type":"Property","Name":"LightInfluence","tags":[],"Class":"SurfaceGui"},{"ValueType":"float","type":"Property","Name":"ToolPunchThroughDistance","tags":[],"Class":"SurfaceGui"},{"ValueType":"float","type":"Property","Name":"ZOffset","tags":[],"Class":"SurfaceGui"},{"Superclass":"GuiBase","type":"Class","Name":"GuiBase3d","tags":[]},{"ValueType":"BrickColor","type":"Property","Name":"Color","tags":["deprecated","hidden"],"Class":"GuiBase3d"},{"ValueType":"Color3","type":"Property","Name":"Color3","tags":[],"Class":"GuiBase3d"},{"ValueType":"float","type":"Property","Name":"Transparency","tags":[],"Class":"GuiBase3d"},{"ValueType":"bool","type":"Property","Name":"Visible","tags":[],"Class":"GuiBase3d"},{"Superclass":"GuiBase3d","type":"Class","Name":"FloorWire","tags":["deprecated"]},{"ValueType":"float","type":"Property","Name":"CycleOffset","tags":[],"Class":"FloorWire"},{"ValueType":"Object","type":"Property","Name":"From","tags":[],"Class":"FloorWire"},{"ValueType":"float","type":"Property","Name":"StudsBetweenTextures","tags":[],"Class":"FloorWire"},{"ValueType":"Content","type":"Property","Name":"Texture","tags":[],"Class":"FloorWire"},{"ValueType":"Vector2","type":"Property","Name":"TextureSize","tags":[],"Class":"FloorWire"},{"ValueType":"Object","type":"Property","Name":"To","tags":[],"Class":"FloorWire"},{"ValueType":"float","type":"Property","Name":"Velocity","tags":[],"Class":"FloorWire"},{"ValueType":"float","type":"Property","Name":"WireRadius","tags":[],"Class":"FloorWire"},{"Superclass":"GuiBase3d","type":"Class","Name":"PVAdornment","tags":[]},{"ValueType":"Object","type":"Property","Name":"Adornee","tags":[],"Class":"PVAdornment"},{"Superclass":"PVAdornment","type":"Class","Name":"HandleAdornment","tags":[]},{"ValueType":"bool","type":"Property","Name":"AlwaysOnTop","tags":[],"Class":"HandleAdornment"},{"ValueType":"CoordinateFrame","type":"Property","Name":"CFrame","tags":[],"Class":"HandleAdornment"},{"ValueType":"Vector3","type":"Property","Name":"SizeRelativeOffset","tags":[],"Class":"HandleAdornment"},{"ValueType":"int","type":"Property","Name":"ZIndex","tags":[],"Class":"HandleAdornment"},{"Arguments":[],"Name":"MouseButton1Down","tags":[],"Class":"HandleAdornment","type":"Event"},{"Arguments":[],"Name":"MouseButton1Up","tags":[],"Class":"HandleAdornment","type":"Event"},{"Arguments":[],"Name":"MouseEnter","tags":[],"Class":"HandleAdornment","type":"Event"},{"Arguments":[],"Name":"MouseLeave","tags":[],"Class":"HandleAdornment","type":"Event"},{"Superclass":"HandleAdornment","type":"Class","Name":"BoxHandleAdornment","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"Size","tags":[],"Class":"BoxHandleAdornment"},{"Superclass":"HandleAdornment","type":"Class","Name":"ConeHandleAdornment","tags":[]},{"ValueType":"float","type":"Property","Name":"Height","tags":[],"Class":"ConeHandleAdornment"},{"ValueType":"float","type":"Property","Name":"Radius","tags":[],"Class":"ConeHandleAdornment"},{"Superclass":"HandleAdornment","type":"Class","Name":"CylinderHandleAdornment","tags":[]},{"ValueType":"float","type":"Property","Name":"Height","tags":[],"Class":"CylinderHandleAdornment"},{"ValueType":"float","type":"Property","Name":"Radius","tags":[],"Class":"CylinderHandleAdornment"},{"Superclass":"HandleAdornment","type":"Class","Name":"ImageHandleAdornment","tags":[]},{"ValueType":"Content","type":"Property","Name":"Image","tags":[],"Class":"ImageHandleAdornment"},{"ValueType":"Vector2","type":"Property","Name":"Size","tags":[],"Class":"ImageHandleAdornment"},{"Superclass":"HandleAdornment","type":"Class","Name":"LineHandleAdornment","tags":[]},{"ValueType":"float","type":"Property","Name":"Length","tags":[],"Class":"LineHandleAdornment"},{"ValueType":"float","type":"Property","Name":"Thickness","tags":[],"Class":"LineHandleAdornment"},{"Superclass":"HandleAdornment","type":"Class","Name":"SphereHandleAdornment","tags":[]},{"ValueType":"float","type":"Property","Name":"Radius","tags":[],"Class":"SphereHandleAdornment"},{"Superclass":"PVAdornment","type":"Class","Name":"ParabolaAdornment","tags":[]},{"ValueType":"float","type":"Property","Name":"A","tags":["RobloxScriptSecurity"],"Class":"ParabolaAdornment"},{"ValueType":"float","type":"Property","Name":"B","tags":["RobloxScriptSecurity"],"Class":"ParabolaAdornment"},{"ValueType":"float","type":"Property","Name":"C","tags":["RobloxScriptSecurity"],"Class":"ParabolaAdornment"},{"ValueType":"float","type":"Property","Name":"Range","tags":["RobloxScriptSecurity"],"Class":"ParabolaAdornment"},{"ValueType":"float","type":"Property","Name":"Thickness","tags":["RobloxScriptSecurity"],"Class":"ParabolaAdornment"},{"ReturnType":"Tuple","Arguments":[{"Type":"Objects","Name":"ignoreDescendentsTable","Default":null}],"Name":"FindPartOnParabola","tags":["RobloxScriptSecurity"],"Class":"ParabolaAdornment","type":"Function"},{"Superclass":"PVAdornment","type":"Class","Name":"SelectionBox","tags":[]},{"ValueType":"float","type":"Property","Name":"LineThickness","tags":[],"Class":"SelectionBox"},{"ValueType":"BrickColor","type":"Property","Name":"SurfaceColor","tags":["deprecated","hidden"],"Class":"SelectionBox"},{"ValueType":"Color3","type":"Property","Name":"SurfaceColor3","tags":[],"Class":"SelectionBox"},{"ValueType":"float","type":"Property","Name":"SurfaceTransparency","tags":[],"Class":"SelectionBox"},{"Superclass":"PVAdornment","type":"Class","Name":"SelectionSphere","tags":[]},{"ValueType":"BrickColor","type":"Property","Name":"SurfaceColor","tags":["deprecated","hidden"],"Class":"SelectionSphere"},{"ValueType":"Color3","type":"Property","Name":"SurfaceColor3","tags":[],"Class":"SelectionSphere"},{"ValueType":"float","type":"Property","Name":"SurfaceTransparency","tags":[],"Class":"SelectionSphere"},{"Superclass":"GuiBase3d","type":"Class","Name":"PartAdornment","tags":[]},{"ValueType":"Object","type":"Property","Name":"Adornee","tags":[],"Class":"PartAdornment"},{"Superclass":"PartAdornment","type":"Class","Name":"HandlesBase","tags":[]},{"Superclass":"HandlesBase","type":"Class","Name":"ArcHandles","tags":[]},{"ValueType":"Axes","type":"Property","Name":"Axes","tags":[],"Class":"ArcHandles"},{"Arguments":[{"Name":"axis","Type":"Axis"}],"Name":"MouseButton1Down","tags":[],"Class":"ArcHandles","type":"Event"},{"Arguments":[{"Name":"axis","Type":"Axis"}],"Name":"MouseButton1Up","tags":[],"Class":"ArcHandles","type":"Event"},{"Arguments":[{"Name":"axis","Type":"Axis"},{"Name":"relativeAngle","Type":"float"},{"Name":"deltaRadius","Type":"float"}],"Name":"MouseDrag","tags":[],"Class":"ArcHandles","type":"Event"},{"Arguments":[{"Name":"axis","Type":"Axis"}],"Name":"MouseEnter","tags":[],"Class":"ArcHandles","type":"Event"},{"Arguments":[{"Name":"axis","Type":"Axis"}],"Name":"MouseLeave","tags":[],"Class":"ArcHandles","type":"Event"},{"Superclass":"HandlesBase","type":"Class","Name":"Handles","tags":[]},{"ValueType":"Faces","type":"Property","Name":"Faces","tags":[],"Class":"Handles"},{"ValueType":"HandlesStyle","type":"Property","Name":"Style","tags":[],"Class":"Handles"},{"Arguments":[{"Name":"face","Type":"NormalId"}],"Name":"MouseButton1Down","tags":[],"Class":"Handles","type":"Event"},{"Arguments":[{"Name":"face","Type":"NormalId"}],"Name":"MouseButton1Up","tags":[],"Class":"Handles","type":"Event"},{"Arguments":[{"Name":"face","Type":"NormalId"},{"Name":"distance","Type":"float"}],"Name":"MouseDrag","tags":[],"Class":"Handles","type":"Event"},{"Arguments":[{"Name":"face","Type":"NormalId"}],"Name":"MouseEnter","tags":[],"Class":"Handles","type":"Event"},{"Arguments":[{"Name":"face","Type":"NormalId"}],"Name":"MouseLeave","tags":[],"Class":"Handles","type":"Event"},{"Superclass":"PartAdornment","type":"Class","Name":"SurfaceSelection","tags":[]},{"ValueType":"NormalId","type":"Property","Name":"TargetSurface","tags":[],"Class":"SurfaceSelection"},{"Superclass":"GuiBase3d","type":"Class","Name":"SelectionLasso","tags":[]},{"ValueType":"Object","type":"Property","Name":"Humanoid","tags":[],"Class":"SelectionLasso"},{"Superclass":"SelectionLasso","type":"Class","Name":"SelectionPartLasso","tags":["deprecated"]},{"ValueType":"Object","type":"Property","Name":"Part","tags":[],"Class":"SelectionPartLasso"},{"Superclass":"SelectionLasso","type":"Class","Name":"SelectionPointLasso","tags":["deprecated"]},{"ValueType":"Vector3","type":"Property","Name":"Point","tags":[],"Class":"SelectionPointLasso"},{"Superclass":"Instance","type":"Class","Name":"GuiItem","tags":[]},{"Superclass":"GuiItem","type":"Class","Name":"Backpack","tags":[]},{"Superclass":"GuiItem","type":"Class","Name":"BackpackItem","tags":[]},{"ValueType":"Content","type":"Property","Name":"TextureId","tags":[],"Class":"BackpackItem"},{"Superclass":"BackpackItem","type":"Class","Name":"HopperBin","tags":["deprecated"]},{"ValueType":"bool","type":"Property","Name":"Active","tags":[],"Class":"HopperBin"},{"ValueType":"BinType","type":"Property","Name":"BinType","tags":[],"Class":"HopperBin"},{"ReturnType":"void","Arguments":[],"Name":"Disable","tags":["RobloxScriptSecurity"],"Class":"HopperBin","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ToggleSelect","tags":["RobloxScriptSecurity"],"Class":"HopperBin","type":"Function"},{"Arguments":[],"Name":"Deselected","tags":[],"Class":"HopperBin","type":"Event"},{"Arguments":[{"Name":"mouse","Type":"Instance"}],"Name":"Selected","tags":[],"Class":"HopperBin","type":"Event"},{"Superclass":"BackpackItem","type":"Class","Name":"Tool","tags":[]},{"ValueType":"bool","type":"Property","Name":"CanBeDropped","tags":[],"Class":"Tool"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Tool"},{"ValueType":"CoordinateFrame","type":"Property","Name":"Grip","tags":[],"Class":"Tool"},{"ValueType":"Vector3","type":"Property","Name":"GripForward","tags":[],"Class":"Tool"},{"ValueType":"Vector3","type":"Property","Name":"GripPos","tags":[],"Class":"Tool"},{"ValueType":"Vector3","type":"Property","Name":"GripRight","tags":[],"Class":"Tool"},{"ValueType":"Vector3","type":"Property","Name":"GripUp","tags":[],"Class":"Tool"},{"ValueType":"bool","type":"Property","Name":"ManualActivationOnly","tags":[],"Class":"Tool"},{"ValueType":"bool","type":"Property","Name":"RequiresHandle","tags":[],"Class":"Tool"},{"ValueType":"string","type":"Property","Name":"ToolTip","tags":[],"Class":"Tool"},{"ReturnType":"void","Arguments":[],"Name":"Activate","tags":[],"Class":"Tool","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Deactivate","tags":[],"Class":"Tool","type":"Function"},{"Arguments":[],"Name":"Activated","tags":[],"Class":"Tool","type":"Event"},{"Arguments":[],"Name":"Deactivated","tags":[],"Class":"Tool","type":"Event"},{"Arguments":[{"Name":"mouse","Type":"Instance"}],"Name":"Equipped","tags":[],"Class":"Tool","type":"Event"},{"Arguments":[],"Name":"Unequipped","tags":[],"Class":"Tool","type":"Event"},{"Superclass":"Tool","type":"Class","Name":"Flag","tags":["deprecated"]},{"ValueType":"BrickColor","type":"Property","Name":"TeamColor","tags":[],"Class":"Flag"},{"Superclass":"GuiItem","type":"Class","Name":"ButtonBindingWidget","tags":[]},{"Superclass":"GuiItem","type":"Class","Name":"GuiRoot","tags":["notCreatable"]},{"Superclass":"GuiItem","type":"Class","Name":"Hopper","tags":["deprecated"]},{"Superclass":"GuiItem","type":"Class","Name":"StarterPack","tags":[]},{"Superclass":"Instance","type":"Class","Name":"GuiService","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"AutoSelectGuiEnabled","tags":[],"Class":"GuiService"},{"ValueType":"Object","type":"Property","Name":"CoreEffectFolder","tags":["RobloxScriptSecurity","hidden"],"Class":"GuiService"},{"ValueType":"Object","type":"Property","Name":"CoreGuiFolder","tags":["RobloxScriptSecurity","hidden"],"Class":"GuiService"},{"ValueType":"bool","type":"Property","Name":"CoreGuiNavigationEnabled","tags":[],"Class":"GuiService"},{"ValueType":"bool","type":"Property","Name":"GuiNavigationEnabled","tags":[],"Class":"GuiService"},{"ValueType":"bool","type":"Property","Name":"IsModalDialog","tags":["deprecated","readonly"],"Class":"GuiService"},{"ValueType":"bool","type":"Property","Name":"IsWindows","tags":["deprecated","readonly"],"Class":"GuiService"},{"ValueType":"bool","type":"Property","Name":"MenuIsOpen","tags":["readonly"],"Class":"GuiService"},{"ValueType":"Object","type":"Property","Name":"SelectedCoreObject","tags":["RobloxScriptSecurity"],"Class":"GuiService"},{"ValueType":"Object","type":"Property","Name":"SelectedObject","tags":[],"Class":"GuiService"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"dialog","Default":null},{"Type":"CenterDialogType","Name":"centerDialogType","Default":null},{"Type":"Function","Name":"showFunction","Default":null},{"Type":"Function","Name":"hideFunction","Default":null}],"Name":"AddCenterDialog","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"AddKey","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"selectionName","Default":null},{"Type":"Instance","Name":"selectionParent","Default":null}],"Name":"AddSelectionParent","tags":[],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"selectionName","Default":null},{"Type":"Tuple","Name":"selections","Default":null}],"Name":"AddSelectionTuple","tags":[],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"SpecialKey","Name":"key","Default":null}],"Name":"AddSpecialKey","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"data","Default":null},{"Type":"int","Name":"notificationType","Default":null}],"Name":"BroadcastNotification","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"input","Default":null}],"Name":"CloseStatsBasedOnInputString","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"GetBrickCount","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Vector3","Name":"position","Default":null}],"Name":"GetClosestDialogToPosition","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetErrorMessage","tags":["RobloxScriptSecurity","deprecated"],"Class":"GuiService","type":"Function"},{"ReturnType":"Tuple","Arguments":[],"Name":"GetGuiInset","tags":[],"Class":"GuiService","type":"Function"},{"ReturnType":"Dictionary","Arguments":[],"Name":"GetNotificationTypeList","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"GetResolutionScale","tags":["LocalUserSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetUiMessage","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsMemoryTrackerEnabled","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsTenFootInterface","tags":[],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"url","Default":null}],"Name":"OpenBrowserWindow","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"title","Default":null},{"Type":"string","Name":"url","Default":null}],"Name":"OpenNativeOverlay","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"dialog","Default":null}],"Name":"RemoveCenterDialog","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"RemoveKey","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"selectionName","Default":null}],"Name":"RemoveSelectionGroup","tags":[],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"SpecialKey","Name":"key","Default":null}],"Name":"RemoveSpecialKey","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"x1","Default":null},{"Type":"int","Name":"y1","Default":null},{"Type":"int","Name":"x2","Default":null},{"Type":"int","Name":"y2","Default":null}],"Name":"SetGlobalGuiInset","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"open","Default":null}],"Name":"SetMenuIsOpen","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"UiMessageType","Name":"msgType","Default":null},{"Type":"string","Name":"uiMessage","Default":null}],"Name":"SetUiMessage","tags":["LocalUserSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"input","Default":null}],"Name":"ShowStatsBasedOnInputString","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ToggleFullscreen","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Function"},{"ReturnType":"Vector2","Arguments":[],"Name":"GetScreenResolution","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"YieldFunction"},{"Arguments":[],"Name":"BrowserWindowClosed","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Event"},{"Arguments":[{"Name":"newErrorMessage","Type":"string"}],"Name":"ErrorMessageChanged","tags":["RobloxScriptSecurity","deprecated"],"Class":"GuiService","type":"Event"},{"Arguments":[{"Name":"key","Type":"string"},{"Name":"modifiers","Type":"string"}],"Name":"KeyPressed","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Event"},{"Arguments":[],"Name":"MenuClosed","tags":[],"Class":"GuiService","type":"Event"},{"Arguments":[],"Name":"MenuOpened","tags":[],"Class":"GuiService","type":"Event"},{"Arguments":[],"Name":"ShowLeaveConfirmation","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Event"},{"Arguments":[{"Name":"key","Type":"SpecialKey"},{"Name":"modifiers","Type":"string"}],"Name":"SpecialKeyPressed","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Event"},{"Arguments":[{"Name":"msgType","Type":"UiMessageType"},{"Name":"newUiMessage","Type":"string"}],"Name":"UiMessageChanged","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Event"},{"ReturnType":"void","Arguments":[{"Name":"title","Type":"string"},{"Name":"text","Type":"string"}],"Name":"SendCoreUiNotification","tags":["RobloxScriptSecurity"],"Class":"GuiService","type":"Callback"},{"Superclass":"Instance","type":"Class","Name":"GuidRegistryService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"HapticService","tags":["notCreatable"]},{"ReturnType":"Tuple","Arguments":[{"Type":"UserInputType","Name":"inputType","Default":null},{"Type":"VibrationMotor","Name":"vibrationMotor","Default":null}],"Name":"GetMotor","tags":[],"Class":"HapticService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UserInputType","Name":"inputType","Default":null},{"Type":"VibrationMotor","Name":"vibrationMotor","Default":null}],"Name":"IsMotorSupported","tags":[],"Class":"HapticService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UserInputType","Name":"inputType","Default":null}],"Name":"IsVibrationSupported","tags":[],"Class":"HapticService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"UserInputType","Name":"inputType","Default":null},{"Type":"VibrationMotor","Name":"vibrationMotor","Default":null},{"Type":"Tuple","Name":"vibrationValues","Default":null}],"Name":"SetMotor","tags":[],"Class":"HapticService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"HttpRbxApiService","tags":["notCreatable"]},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"apiUrlPath","Default":null},{"Type":"ThrottlingPriority","Name":"priority","Default":"Default"},{"Type":"HttpRequestType","Name":"httpRequestType","Default":"Default"},{"Type":"bool","Name":"doNotAllowDiabolicalMode","Default":"false"}],"Name":"GetAsync","tags":["RobloxScriptSecurity"],"Class":"HttpRbxApiService","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"apiUrlPath","Default":null},{"Type":"string","Name":"data","Default":null},{"Type":"ThrottlingPriority","Name":"priority","Default":"Default"},{"Type":"HttpContentType","Name":"content_type","Default":"ApplicationJson"},{"Type":"HttpRequestType","Name":"httpRequestType","Default":"Default"},{"Type":"bool","Name":"doNotAllowDiabolicalMode","Default":"false"}],"Name":"PostAsync","tags":["RobloxScriptSecurity"],"Class":"HttpRbxApiService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"HttpService","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"HttpEnabled","tags":["LocalUserSecurity"],"Class":"HttpService"},{"ReturnType":"string","Arguments":[{"Type":"bool","Name":"wrapInCurlyBraces","Default":"true"}],"Name":"GenerateGUID","tags":[],"Class":"HttpService","type":"Function"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"input","Default":null}],"Name":"JSONDecode","tags":[],"Class":"HttpService","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"Variant","Name":"input","Default":null}],"Name":"JSONEncode","tags":[],"Class":"HttpService","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"input","Default":null}],"Name":"UrlEncode","tags":[],"Class":"HttpService","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"url","Default":null},{"Type":"bool","Name":"nocache","Default":"false"},{"Type":"Variant","Name":"headers","Default":null}],"Name":"GetAsync","tags":[],"Class":"HttpService","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"url","Default":null},{"Type":"string","Name":"data","Default":null},{"Type":"HttpContentType","Name":"content_type","Default":"ApplicationJson"},{"Type":"bool","Name":"compress","Default":"false"},{"Type":"Variant","Name":"headers","Default":null}],"Name":"PostAsync","tags":[],"Class":"HttpService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"Humanoid","tags":[]},{"ValueType":"bool","type":"Property","Name":"AutoJumpEnabled","tags":[],"Class":"Humanoid"},{"ValueType":"bool","type":"Property","Name":"AutoRotate","tags":[],"Class":"Humanoid"},{"ValueType":"Vector3","type":"Property","Name":"CameraOffset","tags":[],"Class":"Humanoid"},{"ValueType":"HumanoidDisplayDistanceType","type":"Property","Name":"DisplayDistanceType","tags":[],"Class":"Humanoid"},{"ValueType":"Material","type":"Property","Name":"FloorMaterial","tags":["readonly"],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"Health","tags":[],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"HealthDisplayDistance","tags":[],"Class":"Humanoid"},{"ValueType":"HumanoidHealthDisplayType","type":"Property","Name":"HealthDisplayType","tags":[],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"HipHeight","tags":[],"Class":"Humanoid"},{"ValueType":"bool","type":"Property","Name":"Jump","tags":[],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"JumpPower","tags":[],"Class":"Humanoid"},{"ValueType":"Object","type":"Property","Name":"LeftLeg","tags":["deprecated","hidden"],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"MaxHealth","tags":[],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"MaxSlopeAngle","tags":[],"Class":"Humanoid"},{"ValueType":"Vector3","type":"Property","Name":"MoveDirection","tags":["readonly"],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"NameDisplayDistance","tags":[],"Class":"Humanoid"},{"ValueType":"NameOcclusion","type":"Property","Name":"NameOcclusion","tags":[],"Class":"Humanoid"},{"ValueType":"bool","type":"Property","Name":"PlatformStand","tags":[],"Class":"Humanoid"},{"ValueType":"HumanoidRigType","type":"Property","Name":"RigType","tags":[],"Class":"Humanoid"},{"ValueType":"Object","type":"Property","Name":"RightLeg","tags":["deprecated","hidden"],"Class":"Humanoid"},{"ValueType":"Object","type":"Property","Name":"RootPart","tags":["readonly"],"Class":"Humanoid"},{"ValueType":"Object","type":"Property","Name":"SeatPart","tags":["readonly"],"Class":"Humanoid"},{"ValueType":"bool","type":"Property","Name":"Sit","tags":[],"Class":"Humanoid"},{"ValueType":"Vector3","type":"Property","Name":"TargetPoint","tags":[],"Class":"Humanoid"},{"ValueType":"Object","type":"Property","Name":"Torso","tags":["deprecated","hidden"],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"WalkSpeed","tags":[],"Class":"Humanoid"},{"ValueType":"Object","type":"Property","Name":"WalkToPart","tags":[],"Class":"Humanoid"},{"ValueType":"Vector3","type":"Property","Name":"WalkToPoint","tags":[],"Class":"Humanoid"},{"ValueType":"float","type":"Property","Name":"maxHealth","tags":["deprecated"],"Class":"Humanoid"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"accessory","Default":null}],"Name":"AddAccessory","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"status","Default":null}],"Name":"AddCustomStatus","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Status","Name":"status","Default":"Poison"}],"Name":"AddStatus","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"BuildRigFromAttachments","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"HumanoidStateType","Name":"state","Default":"None"}],"Name":"ChangeState","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"tool","Default":null}],"Name":"EquipTool","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetAccessories","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"Limb","Arguments":[{"Type":"Instance","Name":"part","Default":null}],"Name":"GetLimb","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetPlayingAnimationTracks","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"HumanoidStateType","Arguments":[],"Name":"GetState","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"HumanoidStateType","Name":"state","Default":null}],"Name":"GetStateEnabled","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetStatuses","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"status","Default":null}],"Name":"HasCustomStatus","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Status","Name":"status","Default":"Poison"}],"Name":"HasStatus","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"animation","Default":null}],"Name":"LoadAnimation","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"moveDirection","Default":null},{"Type":"bool","Name":"relativeToCamera","Default":"false"}],"Name":"Move","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"location","Default":null},{"Type":"Instance","Name":"part","Default":"nil"}],"Name":"MoveTo","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RemoveAccessories","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"status","Default":null}],"Name":"RemoveCustomStatus","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Status","Name":"status","Default":"Poison"}],"Name":"RemoveStatus","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"enabled","Default":null}],"Name":"SetClickToWalkEnabled","tags":["RobloxScriptSecurity"],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"HumanoidStateType","Name":"state","Default":null},{"Type":"bool","Name":"enabled","Default":null}],"Name":"SetStateEnabled","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"amount","Default":null}],"Name":"TakeDamage","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"UnequipTools","tags":[],"Class":"Humanoid","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"animation","Default":null}],"Name":"loadAnimation","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"amount","Default":null}],"Name":"takeDamage","tags":["deprecated"],"Class":"Humanoid","type":"Function"},{"Arguments":[{"Name":"animationTrack","Type":"Instance"}],"Name":"AnimationPlayed","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"speed","Type":"float"}],"Name":"Climbing","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"status","Type":"string"}],"Name":"CustomStatusAdded","tags":["deprecated"],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"status","Type":"string"}],"Name":"CustomStatusRemoved","tags":["deprecated"],"Class":"Humanoid","type":"Event"},{"Arguments":[],"Name":"Died","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"FallingDown","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"FreeFalling","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"GettingUp","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"health","Type":"float"}],"Name":"HealthChanged","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"Jumping","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"reached","Type":"bool"}],"Name":"MoveToFinished","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"PlatformStanding","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"Ragdoll","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"speed","Type":"float"}],"Name":"Running","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"},{"Name":"currentSeatPart","Type":"Instance"}],"Name":"Seated","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"old","Type":"HumanoidStateType"},{"Name":"new","Type":"HumanoidStateType"}],"Name":"StateChanged","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"state","Type":"HumanoidStateType"},{"Name":"isEnabled","Type":"bool"}],"Name":"StateEnabledChanged","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"status","Type":"Status"}],"Name":"StatusAdded","tags":["deprecated"],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"status","Type":"Status"}],"Name":"StatusRemoved","tags":["deprecated"],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"active","Type":"bool"}],"Name":"Strafing","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"speed","Type":"float"}],"Name":"Swimming","tags":[],"Class":"Humanoid","type":"Event"},{"Arguments":[{"Name":"touchingPart","Type":"Instance"},{"Name":"humanoidPart","Type":"Instance"}],"Name":"Touched","tags":[],"Class":"Humanoid","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"InputObject","tags":["notCreatable"]},{"ValueType":"Vector3","type":"Property","Name":"Delta","tags":[],"Class":"InputObject"},{"ValueType":"KeyCode","type":"Property","Name":"KeyCode","tags":[],"Class":"InputObject"},{"ValueType":"Vector3","type":"Property","Name":"Position","tags":[],"Class":"InputObject"},{"ValueType":"UserInputState","type":"Property","Name":"UserInputState","tags":[],"Class":"InputObject"},{"ValueType":"UserInputType","type":"Property","Name":"UserInputType","tags":[],"Class":"InputObject"},{"Superclass":"Instance","type":"Class","Name":"InsertService","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"AllowInsertFreeModels","tags":["deprecated","notbrowsable"],"Class":"InsertService"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"assetId","Default":null}],"Name":"ApproveAssetId","tags":["deprecated"],"Class":"InsertService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"assetVersionId","Default":null}],"Name":"ApproveAssetVersionId","tags":["deprecated"],"Class":"InsertService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"instance","Default":null}],"Name":"Insert","tags":["deprecated"],"Class":"InsertService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetBaseCategories","tags":["deprecated"],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[],"Name":"GetBaseSets","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"int","Name":"categoryId","Default":null}],"Name":"GetCollection","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"string","Name":"searchText","Default":null},{"Type":"int","Name":"pageNum","Default":null}],"Name":"GetFreeDecals","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"string","Name":"searchText","Default":null},{"Type":"int","Name":"pageNum","Default":null}],"Name":"GetFreeModels","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"int","Name":"assetId","Default":null}],"Name":"GetLatestAssetVersionAsync","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetUserCategories","tags":["deprecated"],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Array","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetUserSets","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"assetId","Default":null}],"Name":"LoadAsset","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"assetVersionId","Default":null}],"Name":"LoadAssetVersion","tags":[],"Class":"InsertService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"assetId","Default":null}],"Name":"loadAsset","tags":["deprecated"],"Class":"InsertService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"InstancePacketCache","tags":[]},{"Superclass":"Instance","type":"Class","Name":"IntConstrainedValue","tags":["deprecated"]},{"ValueType":"int","type":"Property","Name":"ConstrainedValue","tags":["hidden"],"Class":"IntConstrainedValue"},{"ValueType":"int","type":"Property","Name":"MaxValue","tags":[],"Class":"IntConstrainedValue"},{"ValueType":"int","type":"Property","Name":"MinValue","tags":[],"Class":"IntConstrainedValue"},{"ValueType":"int","type":"Property","Name":"Value","tags":[],"Class":"IntConstrainedValue"},{"Arguments":[{"Name":"value","Type":"int"}],"Name":"Changed","tags":[],"Class":"IntConstrainedValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"int"}],"Name":"changed","tags":["deprecated"],"Class":"IntConstrainedValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"IntValue","tags":[]},{"ValueType":"int","type":"Property","Name":"Value","tags":[],"Class":"IntValue"},{"Arguments":[{"Name":"value","Type":"int"}],"Name":"Changed","tags":[],"Class":"IntValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"int"}],"Name":"changed","tags":["deprecated"],"Class":"IntValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"JointInstance","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"C0","tags":[],"Class":"JointInstance"},{"ValueType":"CoordinateFrame","type":"Property","Name":"C1","tags":[],"Class":"JointInstance"},{"ValueType":"Object","type":"Property","Name":"Part0","tags":[],"Class":"JointInstance"},{"ValueType":"Object","type":"Property","Name":"Part1","tags":[],"Class":"JointInstance"},{"ValueType":"Object","type":"Property","Name":"part1","tags":["deprecated","hidden"],"Class":"JointInstance"},{"Superclass":"JointInstance","type":"Class","Name":"DynamicRotate","tags":[]},{"ValueType":"float","type":"Property","Name":"BaseAngle","tags":[],"Class":"DynamicRotate"},{"Superclass":"DynamicRotate","type":"Class","Name":"RotateP","tags":[]},{"Superclass":"DynamicRotate","type":"Class","Name":"RotateV","tags":[]},{"Superclass":"JointInstance","type":"Class","Name":"Glue","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"F0","tags":[],"Class":"Glue"},{"ValueType":"Vector3","type":"Property","Name":"F1","tags":[],"Class":"Glue"},{"ValueType":"Vector3","type":"Property","Name":"F2","tags":[],"Class":"Glue"},{"ValueType":"Vector3","type":"Property","Name":"F3","tags":[],"Class":"Glue"},{"Superclass":"JointInstance","type":"Class","Name":"ManualSurfaceJointInstance","tags":[]},{"Superclass":"ManualSurfaceJointInstance","type":"Class","Name":"ManualGlue","tags":[]},{"Superclass":"ManualSurfaceJointInstance","type":"Class","Name":"ManualWeld","tags":[]},{"Superclass":"JointInstance","type":"Class","Name":"Motor","tags":[]},{"ValueType":"float","type":"Property","Name":"CurrentAngle","tags":[],"Class":"Motor"},{"ValueType":"float","type":"Property","Name":"DesiredAngle","tags":[],"Class":"Motor"},{"ValueType":"float","type":"Property","Name":"MaxVelocity","tags":[],"Class":"Motor"},{"ReturnType":"void","Arguments":[{"Type":"float","Name":"value","Default":null}],"Name":"SetDesiredAngle","tags":[],"Class":"Motor","type":"Function"},{"Superclass":"Motor","type":"Class","Name":"Motor6D","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"Transform","tags":["hidden"],"Class":"Motor6D"},{"Superclass":"JointInstance","type":"Class","Name":"Rotate","tags":[]},{"Superclass":"JointInstance","type":"Class","Name":"Snap","tags":[]},{"Superclass":"JointInstance","type":"Class","Name":"VelocityMotor","tags":[]},{"ValueType":"float","type":"Property","Name":"CurrentAngle","tags":[],"Class":"VelocityMotor"},{"ValueType":"float","type":"Property","Name":"DesiredAngle","tags":[],"Class":"VelocityMotor"},{"ValueType":"Object","type":"Property","Name":"Hole","tags":[],"Class":"VelocityMotor"},{"ValueType":"float","type":"Property","Name":"MaxVelocity","tags":[],"Class":"VelocityMotor"},{"Superclass":"JointInstance","type":"Class","Name":"Weld","tags":[]},{"Superclass":"Instance","type":"Class","Name":"JointsService","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[],"Name":"ClearJoinAfterMoveJoints","tags":[],"Class":"JointsService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"CreateJoinAfterMoveJoints","tags":[],"Class":"JointsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"joinInstance","Default":null}],"Name":"SetJoinAfterMoveInstance","tags":[],"Class":"JointsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"joinTarget","Default":null}],"Name":"SetJoinAfterMoveTarget","tags":[],"Class":"JointsService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ShowPermissibleJoints","tags":[],"Class":"JointsService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Keyframe","tags":[]},{"ValueType":"float","type":"Property","Name":"Time","tags":[],"Class":"Keyframe"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"pose","Default":null}],"Name":"AddPose","tags":[],"Class":"Keyframe","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetPoses","tags":[],"Class":"Keyframe","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"pose","Default":null}],"Name":"RemovePose","tags":[],"Class":"Keyframe","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"KeyframeSequence","tags":[]},{"ValueType":"bool","type":"Property","Name":"Loop","tags":[],"Class":"KeyframeSequence"},{"ValueType":"AnimationPriority","type":"Property","Name":"Priority","tags":[],"Class":"KeyframeSequence"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"keyframe","Default":null}],"Name":"AddKeyframe","tags":[],"Class":"KeyframeSequence","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetKeyframes","tags":[],"Class":"KeyframeSequence","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"keyframe","Default":null}],"Name":"RemoveKeyframe","tags":[],"Class":"KeyframeSequence","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"KeyframeSequenceProvider","tags":[]},{"ReturnType":"Instance","Arguments":[{"Type":"Content","Name":"assetId","Default":null}],"Name":"GetKeyframeSequence","tags":[],"Class":"KeyframeSequenceProvider","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"assetId","Default":null},{"Type":"bool","Name":"useCache","Default":null}],"Name":"GetKeyframeSequenceById","tags":[],"Class":"KeyframeSequenceProvider","type":"Function"},{"ReturnType":"Content","Arguments":[{"Type":"Instance","Name":"keyframeSequence","Default":null}],"Name":"RegisterActiveKeyframeSequence","tags":[],"Class":"KeyframeSequenceProvider","type":"Function"},{"ReturnType":"Content","Arguments":[{"Type":"Instance","Name":"keyframeSequence","Default":null}],"Name":"RegisterKeyframeSequence","tags":[],"Class":"KeyframeSequenceProvider","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetAnimations","tags":[],"Class":"KeyframeSequenceProvider","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"Content","Name":"assetId","Default":null}],"Name":"GetKeyframeSequenceAsync","tags":[],"Class":"KeyframeSequenceProvider","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"Light","tags":[]},{"ValueType":"float","type":"Property","Name":"Brightness","tags":[],"Class":"Light"},{"ValueType":"Color3","type":"Property","Name":"Color","tags":[],"Class":"Light"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Light"},{"ValueType":"bool","type":"Property","Name":"Shadows","tags":[],"Class":"Light"},{"Superclass":"Light","type":"Class","Name":"PointLight","tags":[]},{"ValueType":"float","type":"Property","Name":"Range","tags":[],"Class":"PointLight"},{"Superclass":"Light","type":"Class","Name":"SpotLight","tags":[]},{"ValueType":"float","type":"Property","Name":"Angle","tags":[],"Class":"SpotLight"},{"ValueType":"NormalId","type":"Property","Name":"Face","tags":[],"Class":"SpotLight"},{"ValueType":"float","type":"Property","Name":"Range","tags":[],"Class":"SpotLight"},{"Superclass":"Light","type":"Class","Name":"SurfaceLight","tags":[]},{"ValueType":"float","type":"Property","Name":"Angle","tags":[],"Class":"SurfaceLight"},{"ValueType":"NormalId","type":"Property","Name":"Face","tags":[],"Class":"SurfaceLight"},{"ValueType":"float","type":"Property","Name":"Range","tags":[],"Class":"SurfaceLight"},{"Superclass":"Instance","type":"Class","Name":"Lighting","tags":["notCreatable"]},{"ValueType":"Color3","type":"Property","Name":"Ambient","tags":[],"Class":"Lighting"},{"ValueType":"float","type":"Property","Name":"Brightness","tags":[],"Class":"Lighting"},{"ValueType":"float","type":"Property","Name":"ClockTime","tags":[],"Class":"Lighting"},{"ValueType":"Color3","type":"Property","Name":"ColorShift_Bottom","tags":[],"Class":"Lighting"},{"ValueType":"Color3","type":"Property","Name":"ColorShift_Top","tags":[],"Class":"Lighting"},{"ValueType":"Color3","type":"Property","Name":"FogColor","tags":[],"Class":"Lighting"},{"ValueType":"float","type":"Property","Name":"FogEnd","tags":[],"Class":"Lighting"},{"ValueType":"float","type":"Property","Name":"FogStart","tags":[],"Class":"Lighting"},{"ValueType":"float","type":"Property","Name":"GeographicLatitude","tags":[],"Class":"Lighting"},{"ValueType":"bool","type":"Property","Name":"GlobalShadows","tags":[],"Class":"Lighting"},{"ValueType":"Color3","type":"Property","Name":"OutdoorAmbient","tags":[],"Class":"Lighting"},{"ValueType":"bool","type":"Property","Name":"Outlines","tags":[],"Class":"Lighting"},{"ValueType":"Color3","type":"Property","Name":"ShadowColor","tags":["deprecated"],"Class":"Lighting"},{"ValueType":"string","type":"Property","Name":"TimeOfDay","tags":[],"Class":"Lighting"},{"ReturnType":"double","Arguments":[],"Name":"GetMinutesAfterMidnight","tags":[],"Class":"Lighting","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetMoonDirection","tags":[],"Class":"Lighting","type":"Function"},{"ReturnType":"float","Arguments":[],"Name":"GetMoonPhase","tags":[],"Class":"Lighting","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetSunDirection","tags":[],"Class":"Lighting","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"double","Name":"minutes","Default":null}],"Name":"SetMinutesAfterMidnight","tags":[],"Class":"Lighting","type":"Function"},{"ReturnType":"double","Arguments":[],"Name":"getMinutesAfterMidnight","tags":["deprecated"],"Class":"Lighting","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"double","Name":"minutes","Default":null}],"Name":"setMinutesAfterMidnight","tags":["deprecated"],"Class":"Lighting","type":"Function"},{"Arguments":[{"Name":"skyboxChanged","Type":"bool"}],"Name":"LightingChanged","tags":[],"Class":"Lighting","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"LobbyService","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[],"Name":"BeginLeaveLobby","tags":["RobloxScriptSecurity"],"Class":"LobbyService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"placeId","Default":null}],"Name":"BeginLobbyStartGame","tags":["RobloxScriptSecurity"],"Class":"LobbyService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"LocalWorkspace","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"LocalizationService","tags":["notCreatable"]},{"ValueType":"string","type":"Property","Name":"RobloxLocaleId","tags":["readonly"],"Class":"LocalizationService"},{"ValueType":"string","type":"Property","Name":"SystemLocaleId","tags":["readonly"],"Class":"LocalizationService"},{"ReturnType":"Objects","Arguments":[],"Name":"GetCorescriptLocalizations","tags":[],"Class":"LocalizationService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"LocalizationTable","tags":[]},{"ValueType":"string","type":"Property","Name":"DevelopmentLanguage","tags":[],"Class":"LocalizationTable"},{"ValueType":"Object","type":"Property","Name":"Root","tags":[],"Class":"LocalizationTable"},{"ReturnType":"string","Arguments":[],"Name":"GetContents","tags":[],"Class":"LocalizationTable","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetEntries","tags":[],"Class":"LocalizationTable","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"targetLocaleId","Default":null},{"Type":"string","Name":"key","Default":null}],"Name":"GetString","tags":[],"Class":"LocalizationTable","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"RemoveKey","tags":[],"Class":"LocalizationTable","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"contents","Default":null}],"Name":"SetContents","tags":[],"Class":"LocalizationTable","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"string","Name":"targetLocaleId","Default":null},{"Type":"string","Name":"text","Default":null}],"Name":"SetEntry","tags":[],"Class":"LocalizationTable","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"LogService","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"source","Default":null}],"Name":"ExecuteScript","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetHttpResultHistory","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetLogHistory","tags":[],"Class":"LogService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RequestHttpResultApproved","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RequestServerHttpResult","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RequestServerOutput","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Function"},{"Arguments":[{"Name":"httpResult","Type":"Dictionary"}],"Name":"HttpResultOut","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Event"},{"Arguments":[{"Name":"message","Type":"string"},{"Name":"messageType","Type":"MessageType"}],"Name":"MessageOut","tags":[],"Class":"LogService","type":"Event"},{"Arguments":[{"Name":"isApproved","Type":"bool"}],"Name":"OnHttpResultApproved","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Event"},{"Arguments":[{"Name":"httpResult","Type":"Dictionary"}],"Name":"ServerHttpResultOut","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Event"},{"Arguments":[{"Name":"message","Type":"string"},{"Name":"messageType","Type":"MessageType"},{"Name":"timestamp","Type":"int"}],"Name":"ServerMessageOut","tags":["RobloxScriptSecurity"],"Class":"LogService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"LoginService","tags":[]},{"ReturnType":"void","Arguments":[],"Name":"Logout","tags":["RobloxSecurity"],"Class":"LoginService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"PromptLogin","tags":["RobloxSecurity"],"Class":"LoginService","type":"Function"},{"Arguments":[{"Name":"loginError","Type":"string"}],"Name":"LoginFailed","tags":["RobloxSecurity"],"Class":"LoginService","type":"Event"},{"Arguments":[{"Name":"username","Type":"string"}],"Name":"LoginSucceeded","tags":["RobloxSecurity"],"Class":"LoginService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"LuaSettings","tags":[]},{"ValueType":"bool","type":"Property","Name":"AreScriptStartsReported","tags":[],"Class":"LuaSettings"},{"ValueType":"double","type":"Property","Name":"DefaultWaitTime","tags":[],"Class":"LuaSettings"},{"ValueType":"int","type":"Property","Name":"GcFrequency","tags":[],"Class":"LuaSettings"},{"ValueType":"int","type":"Property","Name":"GcLimit","tags":[],"Class":"LuaSettings"},{"ValueType":"int","type":"Property","Name":"GcPause","tags":[],"Class":"LuaSettings"},{"ValueType":"int","type":"Property","Name":"GcStepMul","tags":[],"Class":"LuaSettings"},{"ValueType":"float","type":"Property","Name":"WaitingThreadsBudget","tags":[],"Class":"LuaSettings"},{"Superclass":"Instance","type":"Class","Name":"LuaSourceContainer","tags":["notbrowsable"]},{"Superclass":"LuaSourceContainer","type":"Class","Name":"BaseScript","tags":[]},{"ValueType":"bool","type":"Property","Name":"Disabled","tags":[],"Class":"BaseScript"},{"ValueType":"Content","type":"Property","Name":"LinkedSource","tags":[],"Class":"BaseScript"},{"Superclass":"BaseScript","type":"Class","Name":"CoreScript","tags":["notCreatable"]},{"Superclass":"BaseScript","type":"Class","Name":"Script","tags":[]},{"ValueType":"ProtectedString","type":"Property","Name":"Source","tags":["PluginSecurity"],"Class":"Script"},{"ReturnType":"string","Arguments":[],"Name":"GetHash","tags":["LocalUserSecurity"],"Class":"Script","type":"Function"},{"Superclass":"Script","type":"Class","Name":"LocalScript","tags":[]},{"Superclass":"LuaSourceContainer","type":"Class","Name":"ModuleScript","tags":[]},{"ValueType":"Content","type":"Property","Name":"LinkedSource","tags":[],"Class":"ModuleScript"},{"ValueType":"ProtectedString","type":"Property","Name":"Source","tags":["PluginSecurity"],"Class":"ModuleScript"},{"Superclass":"Instance","type":"Class","Name":"LuaWebService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"MarketplaceService","tags":["notCreatable"]},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"player","Default":null}],"Name":"PlayerCanMakePurchases","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"gamePassId","Default":null}],"Name":"PromptGamePassPurchase","tags":[],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"string","Name":"productId","Default":null}],"Name":"PromptNativePurchase","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"productId","Default":null},{"Type":"bool","Name":"equipIfPurchased","Default":"true"},{"Type":"CurrencyType","Name":"currencyType","Default":"Default"}],"Name":"PromptProductPurchase","tags":[],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"assetId","Default":null},{"Type":"bool","Name":"equipIfPurchased","Default":"true"},{"Type":"CurrencyType","Name":"currencyType","Default":"Default"}],"Name":"PromptPurchase","tags":[],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"string","Name":"productId","Default":null}],"Name":"PromptThirdPartyPurchase","tags":["LocalUserSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"assetId","Default":null},{"Type":"int","Name":"robuxAmount","Default":null}],"Name":"ReportAssetSale","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ReportRobuxUpsellStarted","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"ticket","Default":null},{"Type":"int","Name":"playerId","Default":null},{"Type":"int","Name":"productId","Default":null}],"Name":"SignalClientPurchaseSuccess","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"gamePassId","Default":null},{"Type":"bool","Name":"success","Default":null}],"Name":"SignalPromptGamePassPurchaseFinished","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"int","Name":"productId","Default":null},{"Type":"bool","Name":"success","Default":null}],"Name":"SignalPromptProductPurchaseFinished","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"assetId","Default":null},{"Type":"bool","Name":"success","Default":null}],"Name":"SignalPromptPurchaseFinished","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"value","Default":null}],"Name":"SignalServerLuaDialogClosed","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetDeveloperProductsAsync","tags":[],"Class":"MarketplaceService","type":"YieldFunction"},{"ReturnType":"Dictionary","Arguments":[{"Type":"int","Name":"assetId","Default":null},{"Type":"InfoType","Name":"infoType","Default":"Asset"}],"Name":"GetProductInfo","tags":[],"Class":"MarketplaceService","type":"YieldFunction"},{"ReturnType":"int","Arguments":[],"Name":"GetRobuxBalance","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"YieldFunction"},{"ReturnType":"Dictionary","Arguments":[{"Type":"InfoType","Name":"infoType","Default":null},{"Type":"int","Name":"productId","Default":null},{"Type":"int","Name":"expectedPrice","Default":null},{"Type":"string","Name":"requestId","Default":null}],"Name":"PerformPurchase","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"int","Name":"assetId","Default":null}],"Name":"PlayerOwnsAsset","tags":[],"Class":"MarketplaceService","type":"YieldFunction"},{"Arguments":[{"Name":"arguments","Type":"Tuple"}],"Name":"ClientLuaDialogRequested","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"ticket","Type":"string"},{"Name":"playerId","Type":"int"},{"Name":"productId","Type":"int"}],"Name":"ClientPurchaseSuccess","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"productId","Type":"string"},{"Name":"wasPurchased","Type":"bool"}],"Name":"NativePurchaseFinished","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"gamePassId","Type":"int"},{"Name":"wasPurchased","Type":"bool"}],"Name":"PromptGamePassPurchaseFinished","tags":[],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"gamePassId","Type":"int"}],"Name":"PromptGamePassPurchaseRequested","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"userId","Type":"int"},{"Name":"productId","Type":"int"},{"Name":"isPurchased","Type":"bool"}],"Name":"PromptProductPurchaseFinished","tags":["deprecated"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"productId","Type":"int"},{"Name":"equipIfPurchased","Type":"bool"},{"Name":"currencyType","Type":"CurrencyType"}],"Name":"PromptProductPurchaseRequested","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"assetId","Type":"int"},{"Name":"isPurchased","Type":"bool"}],"Name":"PromptPurchaseFinished","tags":[],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"assetId","Type":"int"},{"Name":"equipIfPurchased","Type":"bool"},{"Name":"currencyType","Type":"CurrencyType"}],"Name":"PromptPurchaseRequested","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"serverResponseTable","Type":"Dictionary"}],"Name":"ServerPurchaseVerification","tags":["RobloxScriptSecurity"],"Class":"MarketplaceService","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"productId","Type":"string"},{"Name":"receipt","Type":"string"},{"Name":"wasPurchased","Type":"bool"}],"Name":"ThirdPartyPurchaseFinished","tags":["LocalUserSecurity"],"Class":"MarketplaceService","type":"Event"},{"ReturnType":"ProductPurchaseDecision","Arguments":[{"Name":"receiptInfo","Type":"Dictionary"}],"Name":"ProcessReceipt","tags":[],"Class":"MarketplaceService","type":"Callback"},{"Superclass":"Instance","type":"Class","Name":"Message","tags":["deprecated"]},{"ValueType":"string","type":"Property","Name":"Text","tags":[],"Class":"Message"},{"Superclass":"Message","type":"Class","Name":"Hint","tags":["deprecated"]},{"Superclass":"Instance","type":"Class","Name":"Mouse","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"Hit","tags":["readonly"],"Class":"Mouse"},{"ValueType":"Content","type":"Property","Name":"Icon","tags":[],"Class":"Mouse"},{"ValueType":"CoordinateFrame","type":"Property","Name":"Origin","tags":["readonly"],"Class":"Mouse"},{"ValueType":"Object","type":"Property","Name":"Target","tags":["readonly"],"Class":"Mouse"},{"ValueType":"Object","type":"Property","Name":"TargetFilter","tags":[],"Class":"Mouse"},{"ValueType":"NormalId","type":"Property","Name":"TargetSurface","tags":["readonly"],"Class":"Mouse"},{"ValueType":"Ray","type":"Property","Name":"UnitRay","tags":["readonly"],"Class":"Mouse"},{"ValueType":"int","type":"Property","Name":"ViewSizeX","tags":["readonly"],"Class":"Mouse"},{"ValueType":"int","type":"Property","Name":"ViewSizeY","tags":["readonly"],"Class":"Mouse"},{"ValueType":"int","type":"Property","Name":"X","tags":["readonly"],"Class":"Mouse"},{"ValueType":"int","type":"Property","Name":"Y","tags":["readonly"],"Class":"Mouse"},{"ValueType":"CoordinateFrame","type":"Property","Name":"hit","tags":["deprecated","hidden","readonly"],"Class":"Mouse"},{"ValueType":"Object","type":"Property","Name":"target","tags":["deprecated","readonly"],"Class":"Mouse"},{"Arguments":[],"Name":"Button1Down","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"Button1Up","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"Button2Down","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"Button2Up","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"Idle","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[{"Name":"key","Type":"string"}],"Name":"KeyDown","tags":["deprecated"],"Class":"Mouse","type":"Event"},{"Arguments":[{"Name":"key","Type":"string"}],"Name":"KeyUp","tags":["deprecated"],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"Move","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"WheelBackward","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[],"Name":"WheelForward","tags":[],"Class":"Mouse","type":"Event"},{"Arguments":[{"Name":"key","Type":"string"}],"Name":"keyDown","tags":["deprecated"],"Class":"Mouse","type":"Event"},{"Superclass":"Mouse","type":"Class","Name":"PlayerMouse","tags":[]},{"Superclass":"Mouse","type":"Class","Name":"PluginMouse","tags":[]},{"Arguments":[{"Name":"instances","Type":"Objects"}],"Name":"DragEnter","tags":["PluginSecurity"],"Class":"PluginMouse","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"NetworkMarker","tags":["notbrowsable"]},{"Arguments":[],"Name":"Received","tags":[],"Class":"NetworkMarker","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"NetworkPeer","tags":["notbrowsable"]},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"limit","Default":null}],"Name":"SetOutgoingKBPSLimit","tags":["PluginSecurity"],"Class":"NetworkPeer","type":"Function"},{"Superclass":"NetworkPeer","type":"Class","Name":"NetworkClient","tags":["notCreatable"]},{"ValueType":"string","type":"Property","Name":"Ticket","tags":[],"Class":"NetworkClient"},{"Arguments":[{"Name":"peer","Type":"string"},{"Name":"replicator","Type":"Instance"}],"Name":"ConnectionAccepted","tags":[],"Class":"NetworkClient","type":"Event"},{"Arguments":[{"Name":"peer","Type":"string"},{"Name":"code","Type":"int"},{"Name":"reason","Type":"string"}],"Name":"ConnectionFailed","tags":[],"Class":"NetworkClient","type":"Event"},{"Arguments":[{"Name":"peer","Type":"string"}],"Name":"ConnectionRejected","tags":[],"Class":"NetworkClient","type":"Event"},{"Superclass":"NetworkPeer","type":"Class","Name":"NetworkServer","tags":["notCreatable"]},{"ValueType":"int","type":"Property","Name":"Port","tags":["readonly"],"Class":"NetworkServer"},{"ReturnType":"int","Arguments":[],"Name":"GetClientCount","tags":["LocalUserSecurity"],"Class":"NetworkServer","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"NetworkReplicator","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[],"Name":"CloseConnection","tags":["LocalUserSecurity"],"Class":"NetworkReplicator","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetPlayer","tags":[],"Class":"NetworkReplicator","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"verbosityLevel","Default":"0"}],"Name":"GetRakStatsString","tags":["PluginSecurity"],"Class":"NetworkReplicator","type":"Function"},{"Superclass":"NetworkReplicator","type":"Class","Name":"ClientReplicator","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"request","Default":null}],"Name":"RequestServerStats","tags":["RobloxScriptSecurity"],"Class":"ClientReplicator","type":"Function"},{"Arguments":[{"Name":"stats","Type":"Dictionary"}],"Name":"StatsReceived","tags":["RobloxScriptSecurity"],"Class":"ClientReplicator","type":"Event"},{"Superclass":"NetworkReplicator","type":"Class","Name":"ServerReplicator","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"NetworkSettings","tags":["notbrowsable"]},{"ValueType":"bool","type":"Property","Name":"ArePhysicsRejectionsReported","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"CanSendPacketBufferLimit","tags":[],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"ClientPhysicsSendRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"DataGCRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"DataMtuAdjust","tags":[],"Class":"NetworkSettings"},{"ValueType":"PacketPriority","type":"Property","Name":"DataSendPriority","tags":["hidden"],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"DataSendRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"EnableHeavyCompression","tags":["hidden"],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"ExperimentalPhysicsEnabled","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"ExtraMemoryUsed","tags":["PluginSecurity","hidden"],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"FreeMemoryMBytes","tags":["PluginSecurity","hidden","readonly"],"Class":"NetworkSettings"},{"ValueType":"double","type":"Property","Name":"IncommingReplicationLag","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"IsQueueErrorComputed","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"IsThrottledByCongestionControl","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"IsThrottledByOutgoingBandwidthLimit","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"MaxDataModelSendBuffer","tags":["deprecated"],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"NetworkOwnerRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"PhysicsMtuAdjust","tags":[],"Class":"NetworkSettings"},{"ValueType":"PhysicsReceiveMethod","type":"Property","Name":"PhysicsReceive","tags":[],"Class":"NetworkSettings"},{"ValueType":"PhysicsSendMethod","type":"Property","Name":"PhysicsSend","tags":[],"Class":"NetworkSettings"},{"ValueType":"PacketPriority","type":"Property","Name":"PhysicsSendPriority","tags":["hidden"],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"PhysicsSendRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"PreferredClientPort","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintBits","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintEvents","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintFilters","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintInstances","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintPhysicsErrors","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintProperties","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintSplitMessage","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintStreamInstanceQuota","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"PrintTouches","tags":[],"Class":"NetworkSettings"},{"ValueType":"double","type":"Property","Name":"ReceiveRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"RenderStreamedRegions","tags":[],"Class":"NetworkSettings"},{"ValueType":"string","type":"Property","Name":"ReportStatURL","tags":["deprecated","hidden"],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"SendPacketBufferLimit","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"ShowActiveAnimationAsset","tags":[],"Class":"NetworkSettings"},{"ValueType":"float","type":"Property","Name":"TouchSendRate","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"TrackDataTypes","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"TrackPhysicsDetails","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"UseInstancePacketCache","tags":[],"Class":"NetworkSettings"},{"ValueType":"bool","type":"Property","Name":"UsePhysicsPacketCache","tags":[],"Class":"NetworkSettings"},{"ValueType":"int","type":"Property","Name":"WaitingForCharacterLogRate","tags":["deprecated","hidden"],"Class":"NetworkSettings"},{"Superclass":"Instance","type":"Class","Name":"NotificationService","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"CancelAllNotification","tags":["LocalUserSecurity"],"Class":"NotificationService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"int","Name":"alertId","Default":null}],"Name":"CancelNotification","tags":["LocalUserSecurity"],"Class":"NotificationService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"int","Name":"alertId","Default":null},{"Type":"string","Name":"alertMsg","Default":null},{"Type":"int","Name":"minutesToFire","Default":null}],"Name":"ScheduleNotification","tags":["LocalUserSecurity"],"Class":"NotificationService","type":"Function"},{"ReturnType":"Array","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetScheduledNotifications","tags":["LocalUserSecurity"],"Class":"NotificationService","type":"YieldFunction"},{"Arguments":[{"Name":"connectionName","Type":"string"},{"Name":"connectionState","Type":"ConnectionState"},{"Name":"sequenceNumber","Type":"string"}],"Name":"RobloxConnectionChanged","tags":["RobloxScriptSecurity"],"Class":"NotificationService","type":"Event"},{"Arguments":[{"Name":"eventData","Type":"Map"}],"Name":"RobloxEventReceived","tags":["RobloxScriptSecurity"],"Class":"NotificationService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"NumberValue","tags":[]},{"ValueType":"double","type":"Property","Name":"Value","tags":[],"Class":"NumberValue"},{"Arguments":[{"Name":"value","Type":"double"}],"Name":"Changed","tags":[],"Class":"NumberValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"double"}],"Name":"changed","tags":["deprecated"],"Class":"NumberValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ObjectValue","tags":[]},{"ValueType":"Object","type":"Property","Name":"Value","tags":[],"Class":"ObjectValue"},{"Arguments":[{"Name":"value","Type":"Instance"}],"Name":"Changed","tags":[],"Class":"ObjectValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"Instance"}],"Name":"changed","tags":["deprecated"],"Class":"ObjectValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"OneQuarterClusterPacketCacheBase","tags":[]},{"Superclass":"Instance","type":"Class","Name":"PVInstance","tags":["notbrowsable"]},{"ValueType":"CoordinateFrame","type":"Property","Name":"CoordinateFrame","tags":["deprecated","writeonly"],"Class":"PVInstance"},{"Superclass":"PVInstance","type":"Class","Name":"BasePart","tags":["notbrowsable"]},{"ValueType":"bool","type":"Property","Name":"Anchored","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"BackParamA","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"BackParamB","tags":[],"Class":"BasePart"},{"ValueType":"SurfaceType","type":"Property","Name":"BackSurface","tags":[],"Class":"BasePart"},{"ValueType":"InputType","type":"Property","Name":"BackSurfaceInput","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"BottomParamA","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"BottomParamB","tags":[],"Class":"BasePart"},{"ValueType":"SurfaceType","type":"Property","Name":"BottomSurface","tags":[],"Class":"BasePart"},{"ValueType":"InputType","type":"Property","Name":"BottomSurfaceInput","tags":[],"Class":"BasePart"},{"ValueType":"BrickColor","type":"Property","Name":"BrickColor","tags":[],"Class":"BasePart"},{"ValueType":"CoordinateFrame","type":"Property","Name":"CFrame","tags":[],"Class":"BasePart"},{"ValueType":"bool","type":"Property","Name":"CanCollide","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"CenterOfMass","tags":["readonly"],"Class":"BasePart"},{"ValueType":"int","type":"Property","Name":"CollisionGroupId","tags":[],"Class":"BasePart"},{"ValueType":"Color3","type":"Property","Name":"Color","tags":[],"Class":"BasePart"},{"ValueType":"PhysicalProperties","type":"Property","Name":"CustomPhysicalProperties","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"Elasticity","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"Friction","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"FrontParamA","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"FrontParamB","tags":[],"Class":"BasePart"},{"ValueType":"SurfaceType","type":"Property","Name":"FrontSurface","tags":[],"Class":"BasePart"},{"ValueType":"InputType","type":"Property","Name":"FrontSurfaceInput","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"LeftParamA","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"LeftParamB","tags":[],"Class":"BasePart"},{"ValueType":"SurfaceType","type":"Property","Name":"LeftSurface","tags":[],"Class":"BasePart"},{"ValueType":"InputType","type":"Property","Name":"LeftSurfaceInput","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"LocalTransparencyModifier","tags":["hidden"],"Class":"BasePart"},{"ValueType":"bool","type":"Property","Name":"Locked","tags":[],"Class":"BasePart"},{"ValueType":"Material","type":"Property","Name":"Material","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"Orientation","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"Position","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"ReceiveAge","tags":["hidden","readonly"],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"Reflectance","tags":[],"Class":"BasePart"},{"ValueType":"int","type":"Property","Name":"ResizeIncrement","tags":["readonly"],"Class":"BasePart"},{"ValueType":"Faces","type":"Property","Name":"ResizeableFaces","tags":["readonly"],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"RightParamA","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"RightParamB","tags":[],"Class":"BasePart"},{"ValueType":"SurfaceType","type":"Property","Name":"RightSurface","tags":[],"Class":"BasePart"},{"ValueType":"InputType","type":"Property","Name":"RightSurfaceInput","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"RotVelocity","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"Rotation","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"Size","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"SpecificGravity","tags":["deprecated","readonly"],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"TopParamA","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"TopParamB","tags":[],"Class":"BasePart"},{"ValueType":"SurfaceType","type":"Property","Name":"TopSurface","tags":[],"Class":"BasePart"},{"ValueType":"InputType","type":"Property","Name":"TopSurfaceInput","tags":[],"Class":"BasePart"},{"ValueType":"float","type":"Property","Name":"Transparency","tags":[],"Class":"BasePart"},{"ValueType":"Vector3","type":"Property","Name":"Velocity","tags":[],"Class":"BasePart"},{"ValueType":"BrickColor","type":"Property","Name":"brickColor","tags":["deprecated"],"Class":"BasePart"},{"ReturnType":"void","Arguments":[],"Name":"BreakJoints","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Instance","Name":"part","Default":null}],"Name":"CanCollideWith","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"Tuple","Arguments":[],"Name":"CanSetNetworkOwnership","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"bool","Name":"recursive","Default":"false"}],"Name":"GetConnectedParts","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetJoints","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"float","Arguments":[],"Name":"GetMass","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetNetworkOwner","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"GetNetworkOwnershipAuto","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"CoordinateFrame","Arguments":[],"Name":"GetRenderCFrame","tags":["deprecated"],"Class":"BasePart","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetRootPart","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetTouchingParts","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsGrounded","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"MakeJoints","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"NormalId","Name":"normalId","Default":null},{"Type":"int","Name":"deltaAmount","Default":null}],"Name":"Resize","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"playerInstance","Default":"nil"}],"Name":"SetNetworkOwner","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SetNetworkOwnershipAuto","tags":[],"Class":"BasePart","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"breakJoints","tags":["deprecated"],"Class":"BasePart","type":"Function"},{"ReturnType":"float","Arguments":[],"Name":"getMass","tags":["deprecated"],"Class":"BasePart","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"makeJoints","tags":["deprecated"],"Class":"BasePart","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"NormalId","Name":"normalId","Default":null},{"Type":"int","Name":"deltaAmount","Default":null}],"Name":"resize","tags":["deprecated"],"Class":"BasePart","type":"Function"},{"Arguments":[{"Name":"part","Type":"Instance"}],"Name":"LocalSimulationTouched","tags":["deprecated"],"Class":"BasePart","type":"Event"},{"Arguments":[],"Name":"OutfitChanged","tags":["deprecated"],"Class":"BasePart","type":"Event"},{"Arguments":[{"Name":"otherPart","Type":"Instance"}],"Name":"StoppedTouching","tags":["deprecated"],"Class":"BasePart","type":"Event"},{"Arguments":[{"Name":"otherPart","Type":"Instance"}],"Name":"TouchEnded","tags":[],"Class":"BasePart","type":"Event"},{"Arguments":[{"Name":"otherPart","Type":"Instance"}],"Name":"Touched","tags":[],"Class":"BasePart","type":"Event"},{"Arguments":[{"Name":"otherPart","Type":"Instance"}],"Name":"touched","tags":["deprecated"],"Class":"BasePart","type":"Event"},{"Superclass":"BasePart","type":"Class","Name":"CornerWedgePart","tags":[]},{"Superclass":"BasePart","type":"Class","Name":"FormFactorPart","tags":[]},{"ValueType":"FormFactor","type":"Property","Name":"FormFactor","tags":["deprecated"],"Class":"FormFactorPart"},{"ValueType":"FormFactor","type":"Property","Name":"formFactor","tags":["deprecated","hidden"],"Class":"FormFactorPart"},{"Superclass":"FormFactorPart","type":"Class","Name":"Part","tags":[]},{"ValueType":"PartType","type":"Property","Name":"Shape","tags":[],"Class":"Part"},{"Superclass":"Part","type":"Class","Name":"FlagStand","tags":["deprecated"]},{"ValueType":"BrickColor","type":"Property","Name":"TeamColor","tags":[],"Class":"FlagStand"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"FlagCaptured","tags":[],"Class":"FlagStand","type":"Event"},{"Superclass":"Part","type":"Class","Name":"Platform","tags":[]},{"Superclass":"Part","type":"Class","Name":"Seat","tags":[]},{"ValueType":"bool","type":"Property","Name":"Disabled","tags":[],"Class":"Seat"},{"ValueType":"Object","type":"Property","Name":"Occupant","tags":["readonly"],"Class":"Seat"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"humanoid","Default":null}],"Name":"Sit","tags":[],"Class":"Seat","type":"Function"},{"Superclass":"Part","type":"Class","Name":"SkateboardPlatform","tags":["deprecated"]},{"ValueType":"Object","type":"Property","Name":"Controller","tags":["readonly"],"Class":"SkateboardPlatform"},{"ValueType":"Object","type":"Property","Name":"ControllingHumanoid","tags":["readonly"],"Class":"SkateboardPlatform"},{"ValueType":"int","type":"Property","Name":"Steer","tags":[],"Class":"SkateboardPlatform"},{"ValueType":"bool","type":"Property","Name":"StickyWheels","tags":[],"Class":"SkateboardPlatform"},{"ValueType":"int","type":"Property","Name":"Throttle","tags":[],"Class":"SkateboardPlatform"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"impulseWorld","Default":null}],"Name":"ApplySpecificImpulse","tags":[],"Class":"SkateboardPlatform","type":"Function"},{"Arguments":[{"Name":"humanoid","Type":"Instance"},{"Name":"skateboardController","Type":"Instance"}],"Name":"Equipped","tags":[],"Class":"SkateboardPlatform","type":"Event"},{"Arguments":[{"Name":"newState","Type":"MoveState"},{"Name":"oldState","Type":"MoveState"}],"Name":"MoveStateChanged","tags":[],"Class":"SkateboardPlatform","type":"Event"},{"Arguments":[{"Name":"humanoid","Type":"Instance"}],"Name":"Unequipped","tags":[],"Class":"SkateboardPlatform","type":"Event"},{"Arguments":[{"Name":"humanoid","Type":"Instance"},{"Name":"skateboardController","Type":"Instance"}],"Name":"equipped","tags":["deprecated"],"Class":"SkateboardPlatform","type":"Event"},{"Arguments":[{"Name":"humanoid","Type":"Instance"}],"Name":"unequipped","tags":["deprecated"],"Class":"SkateboardPlatform","type":"Event"},{"Superclass":"Part","type":"Class","Name":"SpawnLocation","tags":[]},{"ValueType":"bool","type":"Property","Name":"AllowTeamChangeOnTouch","tags":[],"Class":"SpawnLocation"},{"ValueType":"int","type":"Property","Name":"Duration","tags":[],"Class":"SpawnLocation"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"SpawnLocation"},{"ValueType":"bool","type":"Property","Name":"Neutral","tags":[],"Class":"SpawnLocation"},{"ValueType":"BrickColor","type":"Property","Name":"TeamColor","tags":[],"Class":"SpawnLocation"},{"Superclass":"FormFactorPart","type":"Class","Name":"WedgePart","tags":[]},{"Superclass":"BasePart","type":"Class","Name":"MeshPart","tags":[]},{"ValueType":"Content","type":"Property","Name":"MeshId","tags":["ScriptWriteRestricted: [NotAccessibleSecurity]"],"Class":"MeshPart"},{"ValueType":"Content","type":"Property","Name":"TextureID","tags":[],"Class":"MeshPart"},{"Superclass":"BasePart","type":"Class","Name":"ParallelRampPart","tags":["deprecated","notbrowsable"]},{"Superclass":"BasePart","type":"Class","Name":"PartOperation","tags":[]},{"ValueType":"int","type":"Property","Name":"TriangleCount","tags":["readonly"],"Class":"PartOperation"},{"ValueType":"bool","type":"Property","Name":"UsePartColor","tags":[],"Class":"PartOperation"},{"Superclass":"PartOperation","type":"Class","Name":"NegateOperation","tags":[]},{"Superclass":"PartOperation","type":"Class","Name":"UnionOperation","tags":[]},{"Superclass":"BasePart","type":"Class","Name":"PrismPart","tags":["deprecated","notbrowsable"]},{"ValueType":"PrismSides","type":"Property","Name":"Sides","tags":[],"Class":"PrismPart"},{"Superclass":"BasePart","type":"Class","Name":"PyramidPart","tags":["deprecated","notbrowsable"]},{"ValueType":"PyramidSides","type":"Property","Name":"Sides","tags":[],"Class":"PyramidPart"},{"Superclass":"BasePart","type":"Class","Name":"RightAngleRampPart","tags":["deprecated","notbrowsable"]},{"Superclass":"BasePart","type":"Class","Name":"Terrain","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"IsSmooth","tags":["deprecated","readonly"],"Class":"Terrain"},{"ValueType":"Region3int16","type":"Property","Name":"MaxExtents","tags":["readonly"],"Class":"Terrain"},{"ValueType":"Color3","type":"Property","Name":"WaterColor","tags":[],"Class":"Terrain"},{"ValueType":"float","type":"Property","Name":"WaterReflectance","tags":[],"Class":"Terrain"},{"ValueType":"float","type":"Property","Name":"WaterTransparency","tags":[],"Class":"Terrain"},{"ValueType":"float","type":"Property","Name":"WaterWaveSize","tags":[],"Class":"Terrain"},{"ValueType":"float","type":"Property","Name":"WaterWaveSpeed","tags":[],"Class":"Terrain"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null}],"Name":"AutowedgeCell","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Region3int16","Name":"region","Default":null}],"Name":"AutowedgeCells","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"Vector3","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null}],"Name":"CellCenterToWorld","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"Vector3","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null}],"Name":"CellCornerToWorld","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Clear","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ConvertToSmooth","tags":["PluginSecurity","deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Region3int16","Name":"region","Default":null}],"Name":"CopyRegion","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"CountCells","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"center","Default":null},{"Type":"float","Name":"radius","Default":null},{"Type":"Material","Name":"material","Default":null}],"Name":"FillBall","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"CoordinateFrame","Name":"cframe","Default":null},{"Type":"Vector3","Name":"size","Default":null},{"Type":"Material","Name":"material","Default":null}],"Name":"FillBlock","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"float","Name":"resolution","Default":null},{"Type":"Material","Name":"material","Default":null}],"Name":"FillRegion","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null}],"Name":"GetCell","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"Color3","Arguments":[{"Type":"Material","Name":"material","Default":null}],"Name":"GetMaterialColor","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null}],"Name":"GetWaterCell","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"region","Default":null},{"Type":"Vector3int16","Name":"corner","Default":null},{"Type":"bool","Name":"pasteEmptyCells","Default":null}],"Name":"PasteRegion","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"float","Name":"resolution","Default":null}],"Name":"ReadVoxels","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null},{"Type":"CellMaterial","Name":"material","Default":null},{"Type":"CellBlock","Name":"block","Default":null},{"Type":"CellOrientation","Name":"orientation","Default":null}],"Name":"SetCell","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Region3int16","Name":"region","Default":null},{"Type":"CellMaterial","Name":"material","Default":null},{"Type":"CellBlock","Name":"block","Default":null},{"Type":"CellOrientation","Name":"orientation","Default":null}],"Name":"SetCells","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Material","Name":"material","Default":null},{"Type":"Color3","Name":"value","Default":null}],"Name":"SetMaterialColor","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"x","Default":null},{"Type":"int","Name":"y","Default":null},{"Type":"int","Name":"z","Default":null},{"Type":"WaterForce","Name":"force","Default":null},{"Type":"WaterDirection","Name":"direction","Default":null}],"Name":"SetWaterCell","tags":["deprecated"],"Class":"Terrain","type":"Function"},{"ReturnType":"Vector3","Arguments":[{"Type":"Vector3","Name":"position","Default":null}],"Name":"WorldToCell","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"Vector3","Arguments":[{"Type":"Vector3","Name":"position","Default":null}],"Name":"WorldToCellPreferEmpty","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"Vector3","Arguments":[{"Type":"Vector3","Name":"position","Default":null}],"Name":"WorldToCellPreferSolid","tags":[],"Class":"Terrain","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"float","Name":"resolution","Default":null},{"Type":"Array","Name":"materials","Default":null},{"Type":"Array","Name":"occupancy","Default":null}],"Name":"WriteVoxels","tags":[],"Class":"Terrain","type":"Function"},{"Superclass":"BasePart","type":"Class","Name":"TrussPart","tags":[]},{"ValueType":"Style","type":"Property","Name":"Style","tags":[],"Class":"TrussPart"},{"Superclass":"BasePart","type":"Class","Name":"VehicleSeat","tags":[]},{"ValueType":"int","type":"Property","Name":"AreHingesDetected","tags":["readonly"],"Class":"VehicleSeat"},{"ValueType":"bool","type":"Property","Name":"Disabled","tags":[],"Class":"VehicleSeat"},{"ValueType":"bool","type":"Property","Name":"HeadsUpDisplay","tags":[],"Class":"VehicleSeat"},{"ValueType":"float","type":"Property","Name":"MaxSpeed","tags":[],"Class":"VehicleSeat"},{"ValueType":"Object","type":"Property","Name":"Occupant","tags":["readonly"],"Class":"VehicleSeat"},{"ValueType":"int","type":"Property","Name":"Steer","tags":[],"Class":"VehicleSeat"},{"ValueType":"float","type":"Property","Name":"SteerFloat","tags":[],"Class":"VehicleSeat"},{"ValueType":"int","type":"Property","Name":"Throttle","tags":[],"Class":"VehicleSeat"},{"ValueType":"float","type":"Property","Name":"ThrottleFloat","tags":[],"Class":"VehicleSeat"},{"ValueType":"float","type":"Property","Name":"Torque","tags":[],"Class":"VehicleSeat"},{"ValueType":"float","type":"Property","Name":"TurnSpeed","tags":[],"Class":"VehicleSeat"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"humanoid","Default":null}],"Name":"Sit","tags":[],"Class":"VehicleSeat","type":"Function"},{"Superclass":"PVInstance","type":"Class","Name":"Model","tags":[]},{"ValueType":"Object","type":"Property","Name":"PrimaryPart","tags":[],"Class":"Model"},{"ReturnType":"void","Arguments":[],"Name":"BreakJoints","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetExtentsSize","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"CoordinateFrame","Arguments":[],"Name":"GetModelCFrame","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"Vector3","Arguments":[],"Name":"GetModelSize","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"CoordinateFrame","Arguments":[],"Name":"GetPrimaryPartCFrame","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"MakeJoints","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"position","Default":null}],"Name":"MoveTo","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ResetOrientationToIdentity","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SetIdentityOrientation","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"CoordinateFrame","Name":"cframe","Default":null}],"Name":"SetPrimaryPartCFrame","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"delta","Default":null}],"Name":"TranslateBy","tags":[],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"breakJoints","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"makeJoints","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"location","Default":null}],"Name":"move","tags":["deprecated"],"Class":"Model","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"location","Default":null}],"Name":"moveTo","tags":["deprecated"],"Class":"Model","type":"Function"},{"Superclass":"Model","type":"Class","Name":"RootInstance","tags":["notbrowsable"]},{"Superclass":"RootInstance","type":"Class","Name":"Workspace","tags":[]},{"ValueType":"bool","type":"Property","Name":"AllowThirdPartySales","tags":[],"Class":"Workspace"},{"ValueType":"Object","type":"Property","Name":"CurrentCamera","tags":[],"Class":"Workspace"},{"ValueType":"double","type":"Property","Name":"DistributedGameTime","tags":[],"Class":"Workspace"},{"ValueType":"float","type":"Property","Name":"FallenPartsDestroyHeight","tags":["ScriptWriteRestricted: [PluginSecurity]"],"Class":"Workspace"},{"ValueType":"bool","type":"Property","Name":"FilteringEnabled","tags":["ScriptWriteRestricted: [PluginSecurity]"],"Class":"Workspace"},{"ValueType":"float","type":"Property","Name":"Gravity","tags":[],"Class":"Workspace"},{"ValueType":"bool","type":"Property","Name":"StreamingEnabled","tags":[],"Class":"Workspace"},{"ValueType":"Object","type":"Property","Name":"Terrain","tags":["readonly"],"Class":"Workspace"},{"ReturnType":"void","Arguments":[{"Type":"Objects","Name":"objects","Default":null}],"Name":"BreakJoints","tags":["PluginSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"ExperimentalSolverIsEnabled","tags":["LocalUserSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Ray","Name":"ray","Default":null},{"Type":"Instance","Name":"ignoreDescendantsInstance","Default":"nil"},{"Type":"bool","Name":"terrainCellsAreCubes","Default":"false"},{"Type":"bool","Name":"ignoreWater","Default":"false"}],"Name":"FindPartOnRay","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Ray","Name":"ray","Default":null},{"Type":"Objects","Name":"ignoreDescendantsTable","Default":null},{"Type":"bool","Name":"terrainCellsAreCubes","Default":"false"},{"Type":"bool","Name":"ignoreWater","Default":"false"}],"Name":"FindPartOnRayWithIgnoreList","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Ray","Name":"ray","Default":null},{"Type":"Objects","Name":"whitelistDescendantsTable","Default":null},{"Type":"bool","Name":"ignoreWater","Default":"false"}],"Name":"FindPartOnRayWithWhitelist","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"Instance","Name":"ignoreDescendantsInstance","Default":"nil"},{"Type":"int","Name":"maxParts","Default":"20"}],"Name":"FindPartsInRegion3","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"Objects","Name":"ignoreDescendantsTable","Default":null},{"Type":"int","Name":"maxParts","Default":"20"}],"Name":"FindPartsInRegion3WithIgnoreList","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"Objects","Name":"whitelistDescendantsTable","Default":null},{"Type":"int","Name":"maxParts","Default":"20"}],"Name":"FindPartsInRegion3WithWhiteList","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"GetNumAwakeParts","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"GetPhysicsAnalyzerBreakOnIssue","tags":["PluginSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"int","Name":"index","Default":null}],"Name":"GetPhysicsAnalyzerIssue","tags":["PluginSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"GetPhysicsThrottling","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"double","Arguments":[],"Name":"GetRealPhysicsFPS","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"Instance","Name":"ignoreDescendentsInstance","Default":"nil"}],"Name":"IsRegion3Empty","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"Objects","Name":"ignoreDescendentsTable","Default":null}],"Name":"IsRegion3EmptyWithIgnoreList","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Objects","Name":"objects","Default":null},{"Type":"JointCreationMode","Name":"jointType","Default":null}],"Name":"JoinToOutsiders","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Objects","Name":"objects","Default":null}],"Name":"MakeJoints","tags":["PluginSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"PGSIsEnabled","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"enable","Default":null}],"Name":"SetPhysicsAnalyzerBreakOnIssue","tags":["PluginSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"value","Default":null}],"Name":"SetPhysicsThrottleEnabled","tags":["LocalUserSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Objects","Name":"objects","Default":null}],"Name":"UnjoinFromOutsiders","tags":[],"Class":"Workspace","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ZoomToExtents","tags":["PluginSecurity"],"Class":"Workspace","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"Ray","Name":"ray","Default":null},{"Type":"Instance","Name":"ignoreDescendantsInstance","Default":"nil"},{"Type":"bool","Name":"terrainCellsAreCubes","Default":"false"},{"Type":"bool","Name":"ignoreWater","Default":"false"}],"Name":"findPartOnRay","tags":["deprecated"],"Class":"Workspace","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Region3","Name":"region","Default":null},{"Type":"Instance","Name":"ignoreDescendantsInstance","Default":"nil"},{"Type":"int","Name":"maxParts","Default":"20"}],"Name":"findPartsInRegion3","tags":["deprecated"],"Class":"Workspace","type":"Function"},{"Arguments":[{"Name":"count","Type":"int"}],"Name":"PhysicsAnalyzerIssuesFound","tags":["PluginSecurity"],"Class":"Workspace","type":"Event"},{"Superclass":"Model","type":"Class","Name":"Status","tags":["deprecated","notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"Pages","tags":[]},{"ValueType":"bool","type":"Property","Name":"IsFinished","tags":["readonly"],"Class":"Pages"},{"ReturnType":"Array","Arguments":[],"Name":"GetCurrentPage","tags":[],"Class":"Pages","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"AdvanceToNextPageAsync","tags":[],"Class":"Pages","type":"YieldFunction"},{"Superclass":"Pages","type":"Class","Name":"DataStorePages","tags":[]},{"Superclass":"Pages","type":"Class","Name":"FriendPages","tags":[]},{"Superclass":"Pages","type":"Class","Name":"InventoryPages","tags":[]},{"Superclass":"Pages","type":"Class","Name":"StandardPages","tags":[]},{"Superclass":"Instance","type":"Class","Name":"PartOperationAsset","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ParticleEmitter","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"Acceleration","tags":[],"Class":"ParticleEmitter"},{"ValueType":"ColorSequence","type":"Property","Name":"Color","tags":[],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"Drag","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NormalId","type":"Property","Name":"EmissionDirection","tags":[],"Class":"ParticleEmitter"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NumberRange","type":"Property","Name":"Lifetime","tags":[],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"LightEmission","tags":[],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"LightInfluence","tags":[],"Class":"ParticleEmitter"},{"ValueType":"bool","type":"Property","Name":"LockedToPart","tags":[],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"Rate","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NumberRange","type":"Property","Name":"RotSpeed","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NumberRange","type":"Property","Name":"Rotation","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NumberSequence","type":"Property","Name":"Size","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NumberRange","type":"Property","Name":"Speed","tags":[],"Class":"ParticleEmitter"},{"ValueType":"Vector2","type":"Property","Name":"SpreadAngle","tags":[],"Class":"ParticleEmitter"},{"ValueType":"Content","type":"Property","Name":"Texture","tags":[],"Class":"ParticleEmitter"},{"ValueType":"NumberSequence","type":"Property","Name":"Transparency","tags":[],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"VelocityInheritance","tags":[],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"VelocitySpread","tags":["deprecated"],"Class":"ParticleEmitter"},{"ValueType":"float","type":"Property","Name":"ZOffset","tags":[],"Class":"ParticleEmitter"},{"ReturnType":"void","Arguments":[],"Name":"Clear","tags":[],"Class":"ParticleEmitter","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"particleCount","Default":"16"}],"Name":"Emit","tags":[],"Class":"ParticleEmitter","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Path","tags":[]},{"ValueType":"PathStatus","type":"Property","Name":"Status","tags":["readonly"],"Class":"Path"},{"ReturnType":"Array","Arguments":[],"Name":"GetPointCoordinates","tags":["deprecated"],"Class":"Path","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetWaypoints","tags":[],"Class":"Path","type":"Function"},{"ReturnType":"int","Arguments":[{"Type":"int","Name":"start","Default":null}],"Name":"CheckOcclusionAsync","tags":[],"Class":"Path","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"PathWaypoint","tags":[]},{"ValueType":"PathWaypointAction","type":"Property","Name":"Action","tags":["readonly"],"Class":"PathWaypoint"},{"ValueType":"Vector3","type":"Property","Name":"Position","tags":["readonly"],"Class":"PathWaypoint"},{"Superclass":"Instance","type":"Class","Name":"PathfindingService","tags":["notCreatable"]},{"ValueType":"float","type":"Property","Name":"EmptyCutoff","tags":["deprecated"],"Class":"PathfindingService"},{"ReturnType":"Instance","Arguments":[{"Type":"Vector3","Name":"start","Default":null},{"Type":"Vector3","Name":"finish","Default":null},{"Type":"float","Name":"maxDistance","Default":null}],"Name":"ComputeRawPathAsync","tags":["deprecated"],"Class":"PathfindingService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"Vector3","Name":"start","Default":null},{"Type":"Vector3","Name":"finish","Default":null},{"Type":"float","Name":"maxDistance","Default":null}],"Name":"ComputeSmoothPathAsync","tags":["deprecated"],"Class":"PathfindingService","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"Vector3","Name":"start","Default":null},{"Type":"Vector3","Name":"finish","Default":null}],"Name":"FindPathAsync","tags":[],"Class":"PathfindingService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"PersonalServerService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"PhysicsPacketCache","tags":[]},{"Superclass":"Instance","type":"Class","Name":"PhysicsService","tags":[]},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"Instance","Name":"part","Default":null}],"Name":"CollisionGroupContainsPart","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name1","Default":null},{"Type":"string","Name":"name2","Default":null},{"Type":"bool","Name":"collidable","Default":null}],"Name":"CollisionGroupSetCollidable","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"name1","Default":null},{"Type":"string","Name":"name2","Default":null}],"Name":"CollisionGroupsAreCollidable","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"int","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"CreateCollisionGroup","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"int","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"GetCollisionGroupId","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"name","Default":null}],"Name":"GetCollisionGroupName","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetCollisionGroups","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"GetMaxCollisionGroups","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"RemoveCollisionGroup","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"from","Default":null},{"Type":"string","Name":"to","Default":null}],"Name":"RenameCollisionGroup","tags":[],"Class":"PhysicsService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"part","Default":null},{"Type":"string","Name":"name","Default":null}],"Name":"SetPartCollisionGroup","tags":[],"Class":"PhysicsService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"PhysicsSettings","tags":[]},{"ValueType":"bool","type":"Property","Name":"AllowSleep","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreAnchorsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreAssembliesShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreAwakePartsHighlighted","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreBodyTypesShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreContactIslandsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreContactPointsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreJointCoordinatesShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreMechanismsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreModelCoordsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreOwnersShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"ArePartCoordsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreRegionsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreUnalignedPartsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"AreWorldCoordsShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"DisableCSGv2","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"IsReceiveAgeShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"IsTreeShown","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"ParallelPhysics","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"PhysicsAnalyzerEnabled","tags":["PluginSecurity","readonly"],"Class":"PhysicsSettings"},{"ValueType":"EnviromentalPhysicsThrottle","type":"Property","Name":"PhysicsEnvironmentalThrottle","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"ShowDecompositionGeometry","tags":[],"Class":"PhysicsSettings"},{"ValueType":"double","type":"Property","Name":"ThrottleAdjustTime","tags":[],"Class":"PhysicsSettings"},{"ValueType":"bool","type":"Property","Name":"UseCSGv2","tags":[],"Class":"PhysicsSettings"},{"Superclass":"Instance","type":"Class","Name":"Player","tags":[]},{"ValueType":"int","type":"Property","Name":"AccountAge","tags":["readonly"],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"AppearanceDidLoad","tags":["RobloxScriptSecurity","deprecated","readonly"],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"AutoJumpEnabled","tags":[],"Class":"Player"},{"ValueType":"float","type":"Property","Name":"CameraMaxZoomDistance","tags":[],"Class":"Player"},{"ValueType":"float","type":"Property","Name":"CameraMinZoomDistance","tags":[],"Class":"Player"},{"ValueType":"CameraMode","type":"Property","Name":"CameraMode","tags":[],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"CanLoadCharacterAppearance","tags":[],"Class":"Player"},{"ValueType":"Object","type":"Property","Name":"Character","tags":[],"Class":"Player"},{"ValueType":"string","type":"Property","Name":"CharacterAppearance","tags":["deprecated","notbrowsable"],"Class":"Player"},{"ValueType":"int","type":"Property","Name":"CharacterAppearanceId","tags":[],"Class":"Player"},{"ValueType":"ChatMode","type":"Property","Name":"ChatMode","tags":["RobloxScriptSecurity","readonly"],"Class":"Player"},{"ValueType":"int","type":"Property","Name":"DataComplexity","tags":["deprecated","readonly"],"Class":"Player"},{"ValueType":"int","type":"Property","Name":"DataComplexityLimit","tags":["LocalUserSecurity","deprecated"],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"DataReady","tags":["deprecated","readonly"],"Class":"Player"},{"ValueType":"DevCameraOcclusionMode","type":"Property","Name":"DevCameraOcclusionMode","tags":[],"Class":"Player"},{"ValueType":"DevComputerCameraMovementMode","type":"Property","Name":"DevComputerCameraMode","tags":[],"Class":"Player"},{"ValueType":"DevComputerMovementMode","type":"Property","Name":"DevComputerMovementMode","tags":[],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"DevEnableMouseLock","tags":[],"Class":"Player"},{"ValueType":"DevTouchCameraMovementMode","type":"Property","Name":"DevTouchCameraMode","tags":[],"Class":"Player"},{"ValueType":"DevTouchMovementMode","type":"Property","Name":"DevTouchMovementMode","tags":[],"Class":"Player"},{"ValueType":"string","type":"Property","Name":"DisplayName","tags":["RobloxScriptSecurity"],"Class":"Player"},{"ValueType":"int","type":"Property","Name":"FollowUserId","tags":["readonly"],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"Guest","tags":["RobloxScriptSecurity","readonly"],"Class":"Player"},{"ValueType":"float","type":"Property","Name":"HealthDisplayDistance","tags":[],"Class":"Player"},{"ValueType":"float","type":"Property","Name":"MaximumSimulationRadius","tags":["LocalUserSecurity"],"Class":"Player"},{"ValueType":"MembershipType","type":"Property","Name":"MembershipType","tags":["readonly"],"Class":"Player"},{"ValueType":"float","type":"Property","Name":"NameDisplayDistance","tags":[],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"Neutral","tags":[],"Class":"Player"},{"ValueType":"string","type":"Property","Name":"OsPlatform","tags":["RobloxScriptSecurity"],"Class":"Player"},{"ValueType":"Object","type":"Property","Name":"ReplicationFocus","tags":[],"Class":"Player"},{"ValueType":"Object","type":"Property","Name":"RespawnLocation","tags":[],"Class":"Player"},{"ValueType":"float","type":"Property","Name":"SimulationRadius","tags":["LocalUserSecurity"],"Class":"Player"},{"ValueType":"Object","type":"Property","Name":"Team","tags":[],"Class":"Player"},{"ValueType":"BrickColor","type":"Property","Name":"TeamColor","tags":[],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"Teleported","tags":["RobloxScriptSecurity","hidden","readonly"],"Class":"Player"},{"ValueType":"bool","type":"Property","Name":"TeleportedIn","tags":["RobloxScriptSecurity"],"Class":"Player"},{"ValueType":"int","type":"Property","Name":"UserId","tags":[],"Class":"Player"},{"ValueType":"string","type":"Property","Name":"VRDevice","tags":["RobloxScriptSecurity"],"Class":"Player"},{"ValueType":"int","type":"Property","Name":"userId","tags":["deprecated"],"Class":"Player"},{"ReturnType":"void","Arguments":[],"Name":"ClearCharacterAppearance","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"float","Arguments":[{"Type":"Vector3","Name":"point","Default":null}],"Name":"DistanceFromCharacter","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"FriendStatus","Arguments":[{"Type":"Instance","Name":"player","Default":null}],"Name":"GetFriendStatus","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetGameSessionID","tags":["RobloxSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetMouse","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"GetUnder13","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"HasAppearanceLoaded","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsUserAvailableForExperiment","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"JumpCharacter","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":""}],"Name":"Kick","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"LoadBoolean","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"assetInstance","Default":null}],"Name":"LoadCharacterAppearance","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"LoadData","tags":["LocalUserSecurity","deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"LoadInstance","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"double","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"LoadNumber","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"LoadString","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector3","Name":"walkDirection","Default":null},{"Type":"bool","Name":"relativeToCamera","Default":"false"}],"Name":"Move","tags":[],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"walkDirection","Default":null},{"Type":"float","Name":"maxWalkDelta","Default":null}],"Name":"MoveCharacter","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RemoveCharacter","tags":["LocalUserSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null}],"Name":"RequestFriendship","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null}],"Name":"RevokeFriendship","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"bool","Name":"value","Default":null}],"Name":"SaveBoolean","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SaveData","tags":["LocalUserSecurity","deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"Instance","Name":"value","Default":null}],"Name":"SaveInstance","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"double","Name":"value","Default":null}],"Name":"SaveNumber","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"string","Name":"value","Default":null}],"Name":"SaveString","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"accountAge","Default":null}],"Name":"SetAccountAge","tags":["PluginSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"MembershipType","Name":"membershipType","Default":null}],"Name":"SetMembershipType","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"value","Default":null}],"Name":"SetSuperSafeChat","tags":["PluginSecurity"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"value","Default":null}],"Name":"SetUnder13","tags":["RobloxSecurity","deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"loadBoolean","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"loadInstance","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"double","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"loadNumber","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"loadString","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"bool","Name":"value","Default":null}],"Name":"saveBoolean","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"Instance","Name":"value","Default":null}],"Name":"saveInstance","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"double","Name":"value","Default":null}],"Name":"saveNumber","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"string","Name":"value","Default":null}],"Name":"saveString","tags":["deprecated"],"Class":"Player","type":"Function"},{"ReturnType":"Array","Arguments":[{"Type":"int","Name":"maxFriends","Default":"200"}],"Name":"GetFriendsOnline","tags":[],"Class":"Player","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"int","Name":"groupId","Default":null}],"Name":"GetRankInGroup","tags":[],"Class":"Player","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"groupId","Default":null}],"Name":"GetRoleInGroup","tags":[],"Class":"Player","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"IsBestFriendsWith","tags":["deprecated"],"Class":"Player","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"IsFriendsWith","tags":[],"Class":"Player","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"groupId","Default":null}],"Name":"IsInGroup","tags":[],"Class":"Player","type":"YieldFunction"},{"ReturnType":"void","Arguments":[],"Name":"LoadCharacter","tags":[],"Class":"Player","type":"YieldFunction"},{"ReturnType":"void","Arguments":[],"Name":"LoadCharacterBlocking","tags":["LocalUserSecurity"],"Class":"Player","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[],"Name":"WaitForDataReady","tags":["deprecated"],"Class":"Player","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"isFriendsWith","tags":["deprecated"],"Class":"Player","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[],"Name":"waitForDataReady","tags":["deprecated"],"Class":"Player","type":"YieldFunction"},{"Arguments":[{"Name":"character","Type":"Instance"}],"Name":"CharacterAdded","tags":[],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"character","Type":"Instance"}],"Name":"CharacterAppearanceLoaded","tags":[],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"character","Type":"Instance"}],"Name":"CharacterRemoving","tags":[],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"message","Type":"string"},{"Name":"recipient","Type":"Instance"}],"Name":"Chatted","tags":[],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"friendStatus","Type":"FriendStatus"}],"Name":"FriendStatusChanged","tags":["RobloxScriptSecurity"],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"time","Type":"double"}],"Name":"Idled","tags":[],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"teleportState","Type":"TeleportState"},{"Name":"placeId","Type":"int"},{"Name":"spawnName","Type":"string"}],"Name":"OnTeleport","tags":[],"Class":"Player","type":"Event"},{"Arguments":[{"Name":"radius","Type":"float"}],"Name":"SimulationRadiusChanged","tags":["LocalUserSecurity"],"Class":"Player","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"PlayerScripts","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[],"Name":"ClearComputerCameraMovementModes","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ClearComputerMovementModes","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ClearTouchCameraMovementModes","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ClearTouchMovementModes","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetRegisteredComputerCameraMovementModes","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetRegisteredComputerMovementModes","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetRegisteredTouchCameraMovementModes","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetRegisteredTouchMovementModes","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"ComputerCameraMovementMode","Name":"cameraMovementMode","Default":null}],"Name":"RegisterComputerCameraMovementMode","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"ComputerMovementMode","Name":"movementMode","Default":null}],"Name":"RegisterComputerMovementMode","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"TouchCameraMovementMode","Name":"cameraMovementMode","Default":null}],"Name":"RegisterTouchCameraMovementMode","tags":[],"Class":"PlayerScripts","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"TouchMovementMode","Name":"movementMode","Default":null}],"Name":"RegisterTouchMovementMode","tags":[],"Class":"PlayerScripts","type":"Function"},{"Arguments":[],"Name":"ComputerCameraMovementModeRegistered","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Event"},{"Arguments":[],"Name":"ComputerMovementModeRegistered","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Event"},{"Arguments":[],"Name":"TouchCameraMovementModeRegistered","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Event"},{"Arguments":[],"Name":"TouchMovementModeRegistered","tags":["RobloxScriptSecurity"],"Class":"PlayerScripts","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Players","tags":[]},{"ValueType":"bool","type":"Property","Name":"BubbleChat","tags":["readonly"],"Class":"Players"},{"ValueType":"bool","type":"Property","Name":"CharacterAutoLoads","tags":[],"Class":"Players"},{"ValueType":"bool","type":"Property","Name":"ClassicChat","tags":["readonly"],"Class":"Players"},{"ValueType":"Object","type":"Property","Name":"LocalPlayer","tags":["readonly"],"Class":"Players"},{"ValueType":"int","type":"Property","Name":"MaxPlayers","tags":["readonly"],"Class":"Players"},{"ValueType":"int","type":"Property","Name":"MaxPlayersInternal","tags":["LocalUserSecurity"],"Class":"Players"},{"ValueType":"int","type":"Property","Name":"NumPlayers","tags":["deprecated","readonly"],"Class":"Players"},{"ValueType":"int","type":"Property","Name":"PreferredPlayers","tags":["readonly"],"Class":"Players"},{"ValueType":"int","type":"Property","Name":"PreferredPlayersInternal","tags":["LocalUserSecurity"],"Class":"Players"},{"ValueType":"Object","type":"Property","Name":"localPlayer","tags":["deprecated","hidden","readonly"],"Class":"Players"},{"ValueType":"int","type":"Property","Name":"numPlayers","tags":["deprecated","hidden","readonly"],"Class":"Players"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":null}],"Name":"Chat","tags":["PluginSecurity"],"Class":"Players","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"CreateLocalPlayer","tags":["LocalUserSecurity"],"Class":"Players","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetPlayerByUserId","tags":[],"Class":"Players","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"character","Default":null}],"Name":"GetPlayerFromCharacter","tags":[],"Class":"Players","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetPlayers","tags":[],"Class":"Players","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"string","Name":"reason","Default":null},{"Type":"string","Name":"optionalMessage","Default":null}],"Name":"ReportAbuse","tags":["LocalUserSecurity"],"Class":"Players","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"ChatStyle","Name":"style","Default":"Classic"}],"Name":"SetChatStyle","tags":["PluginSecurity"],"Class":"Players","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":null}],"Name":"TeamChat","tags":["PluginSecurity"],"Class":"Players","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"message","Default":null},{"Type":"Instance","Name":"player","Default":null}],"Name":"WhisperChat","tags":["LocalUserSecurity"],"Class":"Players","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"character","Default":null}],"Name":"getPlayerFromCharacter","tags":["deprecated"],"Class":"Players","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"getPlayers","tags":["deprecated"],"Class":"Players","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"character","Default":null}],"Name":"playerFromCharacter","tags":["deprecated"],"Class":"Players","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"players","tags":["deprecated"],"Class":"Players","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetCharacterAppearanceAsync","tags":[],"Class":"Players","type":"YieldFunction"},{"ReturnType":"Dictionary","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetCharacterAppearanceInfoAsync","tags":[],"Class":"Players","type":"YieldFunction"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetFriendsAsync","tags":[],"Class":"Players","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetNameFromUserIdAsync","tags":[],"Class":"Players","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"string","Name":"userName","Default":null}],"Name":"GetUserIdFromNameAsync","tags":[],"Class":"Players","type":"YieldFunction"},{"ReturnType":"Tuple","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"ThumbnailType","Name":"thumbnailType","Default":null},{"Type":"ThumbnailSize","Name":"thumbnailSize","Default":null}],"Name":"GetUserThumbnailAsync","tags":[],"Class":"Players","type":"YieldFunction"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"player","Type":"Instance"},{"Name":"friendRequestEvent","Type":"FriendRequestEvent"}],"Name":"FriendRequestEvent","tags":["RobloxScriptSecurity"],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"message","Type":"string"}],"Name":"GameAnnounce","tags":["RobloxScriptSecurity"],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerAdded","tags":[],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"chatType","Type":"PlayerChatType"},{"Name":"player","Type":"Instance"},{"Name":"message","Type":"string"},{"Name":"targetPlayer","Type":"Instance"}],"Name":"PlayerChatted","tags":["LocalUserSecurity"],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerConnecting","tags":["LocalUserSecurity"],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerDisconnecting","tags":["LocalUserSecurity"],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerRejoining","tags":["LocalUserSecurity"],"Class":"Players","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerRemoving","tags":[],"Class":"Players","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Plugin","tags":[]},{"ValueType":"bool","type":"Property","Name":"CollisionEnabled","tags":["readonly"],"Class":"Plugin"},{"ValueType":"float","type":"Property","Name":"GridSize","tags":["readonly"],"Class":"Plugin"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"exclusiveMouse","Default":null}],"Name":"Activate","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"CreateToolbar","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"JointCreationMode","Arguments":[],"Name":"GetJoinMode","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetMouse","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"RibbonTool","Arguments":[],"Name":"GetSelectedRibbonTool","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"GetSetting","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"int","Arguments":[],"Name":"GetStudioUserId","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"rigModel","Default":null}],"Name":"ImportFbxAnimation","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Objects","Name":"objects","Default":null}],"Name":"Negate","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"script","Default":null},{"Type":"int","Name":"lineNumber","Default":"1"}],"Name":"OpenScript","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"url","Default":null}],"Name":"OpenWikiPage","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SaveSelectedToRoblox","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"RibbonTool","Name":"tool","Default":null},{"Type":"UDim2","Name":"position","Default":null}],"Name":"SelectRibbonTool","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Objects","Arguments":[{"Type":"Objects","Name":"objects","Default":null}],"Name":"Separate","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null},{"Type":"Variant","Name":"value","Default":null}],"Name":"SetSetting","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"Objects","Name":"objects","Default":null}],"Name":"Union","tags":["PluginSecurity"],"Class":"Plugin","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"ImportFbxRig","tags":["PluginSecurity"],"Class":"Plugin","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"string","Name":"assetType","Default":null}],"Name":"PromptForExistingAssetId","tags":["PluginSecurity"],"Class":"Plugin","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"suggestedFileName","Default":""}],"Name":"PromptSaveSelection","tags":["PluginSecurity"],"Class":"Plugin","type":"YieldFunction"},{"Arguments":[],"Name":"Deactivation","tags":["PluginSecurity"],"Class":"Plugin","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"PluginManager","tags":[]},{"ReturnType":"Instance","Arguments":[],"Name":"CreatePlugin","tags":["PluginSecurity"],"Class":"PluginManager","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"EndUntranslatedStringCollect","tags":["PluginSecurity"],"Class":"PluginManager","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"filePath","Default":""}],"Name":"ExportPlace","tags":["PluginSecurity"],"Class":"PluginManager","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"filePath","Default":""}],"Name":"ExportSelection","tags":["PluginSecurity"],"Class":"PluginManager","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StartUntranslatedStringCollect","tags":["PluginSecurity"],"Class":"PluginManager","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"PointsService","tags":["notCreatable"]},{"ReturnType":"int","Arguments":[],"Name":"GetAwardablePoints","tags":["deprecated"],"Class":"PointsService","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"int","Name":"userId","Default":null},{"Type":"int","Name":"amount","Default":null}],"Name":"AwardPoints","tags":[],"Class":"PointsService","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetGamePointBalance","tags":[],"Class":"PointsService","type":"YieldFunction"},{"ReturnType":"int","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetPointBalance","tags":["deprecated"],"Class":"PointsService","type":"YieldFunction"},{"Arguments":[{"Name":"userId","Type":"int"},{"Name":"pointsAwarded","Type":"int"},{"Name":"userBalanceInGame","Type":"int"},{"Name":"userTotalBalance","Type":"int"}],"Name":"PointsAwarded","tags":[],"Class":"PointsService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Pose","tags":[]},{"ValueType":"CoordinateFrame","type":"Property","Name":"CFrame","tags":[],"Class":"Pose"},{"ValueType":"PoseEasingDirection","type":"Property","Name":"EasingDirection","tags":[],"Class":"Pose"},{"ValueType":"PoseEasingStyle","type":"Property","Name":"EasingStyle","tags":[],"Class":"Pose"},{"ValueType":"float","type":"Property","Name":"MaskWeight","tags":["deprecated"],"Class":"Pose"},{"ValueType":"float","type":"Property","Name":"Weight","tags":[],"Class":"Pose"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"pose","Default":null}],"Name":"AddSubPose","tags":[],"Class":"Pose","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetSubPoses","tags":[],"Class":"Pose","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"pose","Default":null}],"Name":"RemoveSubPose","tags":[],"Class":"Pose","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"PostEffect","tags":[]},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"PostEffect"},{"Superclass":"PostEffect","type":"Class","Name":"BloomEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Intensity","tags":[],"Class":"BloomEffect"},{"ValueType":"float","type":"Property","Name":"Size","tags":[],"Class":"BloomEffect"},{"ValueType":"float","type":"Property","Name":"Threshold","tags":[],"Class":"BloomEffect"},{"Superclass":"PostEffect","type":"Class","Name":"BlurEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Size","tags":[],"Class":"BlurEffect"},{"Superclass":"PostEffect","type":"Class","Name":"ColorCorrectionEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Brightness","tags":[],"Class":"ColorCorrectionEffect"},{"ValueType":"float","type":"Property","Name":"Contrast","tags":[],"Class":"ColorCorrectionEffect"},{"ValueType":"float","type":"Property","Name":"Saturation","tags":[],"Class":"ColorCorrectionEffect"},{"ValueType":"Color3","type":"Property","Name":"TintColor","tags":[],"Class":"ColorCorrectionEffect"},{"Superclass":"PostEffect","type":"Class","Name":"SunRaysEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Intensity","tags":[],"Class":"SunRaysEffect"},{"ValueType":"float","type":"Property","Name":"Spread","tags":[],"Class":"SunRaysEffect"},{"Superclass":"Instance","type":"Class","Name":"RayValue","tags":[]},{"ValueType":"Ray","type":"Property","Name":"Value","tags":[],"Class":"RayValue"},{"Arguments":[{"Name":"value","Type":"Ray"}],"Name":"Changed","tags":[],"Class":"RayValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"Ray"}],"Name":"changed","tags":["deprecated"],"Class":"RayValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadata","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataCallbacks","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataClasses","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataEnums","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataEvents","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataFunctions","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataItem","tags":[]},{"ValueType":"bool","type":"Property","Name":"Browsable","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"string","type":"Property","Name":"ClassCategory","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"bool","type":"Property","Name":"Deprecated","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"bool","type":"Property","Name":"EditingDisabled","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"bool","type":"Property","Name":"IsBackend","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"double","type":"Property","Name":"UIMaximum","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"double","type":"Property","Name":"UIMinimum","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"double","type":"Property","Name":"UINumTicks","tags":[],"Class":"ReflectionMetadataItem"},{"ValueType":"string","type":"Property","Name":"summary","tags":[],"Class":"ReflectionMetadataItem"},{"Superclass":"ReflectionMetadataItem","type":"Class","Name":"ReflectionMetadataClass","tags":[]},{"ValueType":"int","type":"Property","Name":"ExplorerImageIndex","tags":[],"Class":"ReflectionMetadataClass"},{"ValueType":"int","type":"Property","Name":"ExplorerOrder","tags":[],"Class":"ReflectionMetadataClass"},{"ValueType":"bool","type":"Property","Name":"Insertable","tags":[],"Class":"ReflectionMetadataClass"},{"ValueType":"string","type":"Property","Name":"PreferredParent","tags":[],"Class":"ReflectionMetadataClass"},{"Superclass":"ReflectionMetadataItem","type":"Class","Name":"ReflectionMetadataEnum","tags":[]},{"Superclass":"ReflectionMetadataItem","type":"Class","Name":"ReflectionMetadataEnumItem","tags":[]},{"Superclass":"ReflectionMetadataItem","type":"Class","Name":"ReflectionMetadataMember","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataProperties","tags":[]},{"Superclass":"Instance","type":"Class","Name":"ReflectionMetadataYieldFunctions","tags":[]},{"Superclass":"Instance","type":"Class","Name":"RemoteEvent","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"FireAllClients","tags":[],"Class":"RemoteEvent","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"FireClient","tags":[],"Class":"RemoteEvent","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"FireServer","tags":[],"Class":"RemoteEvent","type":"Function"},{"Arguments":[{"Name":"arguments","Type":"Tuple"}],"Name":"OnClientEvent","tags":[],"Class":"RemoteEvent","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"},{"Name":"arguments","Type":"Tuple"}],"Name":"OnServerEvent","tags":[],"Class":"RemoteEvent","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"RemoteFunction","tags":[]},{"ReturnType":"Tuple","Arguments":[{"Type":"Instance","Name":"player","Default":null},{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"InvokeClient","tags":[],"Class":"RemoteFunction","type":"YieldFunction"},{"ReturnType":"Tuple","Arguments":[{"Type":"Tuple","Name":"arguments","Default":null}],"Name":"InvokeServer","tags":[],"Class":"RemoteFunction","type":"YieldFunction"},{"ReturnType":"Tuple","Arguments":[{"Name":"arguments","Type":"Tuple"}],"Name":"OnClientInvoke","tags":[],"Class":"RemoteFunction","type":"Callback"},{"ReturnType":"Tuple","Arguments":[{"Name":"player","Type":"Instance"},{"Name":"arguments","Type":"Tuple"}],"Name":"OnServerInvoke","tags":[],"Class":"RemoteFunction","type":"Callback"},{"Superclass":"Instance","type":"Class","Name":"RenderSettings","tags":["notbrowsable"]},{"ValueType":"int","type":"Property","Name":"AutoFRMLevel","tags":[],"Class":"RenderSettings"},{"ValueType":"bool","type":"Property","Name":"EagerBulkExecution","tags":[],"Class":"RenderSettings"},{"ValueType":"QualityLevel","type":"Property","Name":"EditQualityLevel","tags":[],"Class":"RenderSettings"},{"ValueType":"bool","type":"Property","Name":"EnableFRM","tags":["hidden"],"Class":"RenderSettings"},{"ValueType":"bool","type":"Property","Name":"ExportMergeByMaterial","tags":[],"Class":"RenderSettings"},{"ValueType":"FramerateManagerMode","type":"Property","Name":"FrameRateManager","tags":[],"Class":"RenderSettings"},{"ValueType":"GraphicsMode","type":"Property","Name":"GraphicsMode","tags":[],"Class":"RenderSettings"},{"ValueType":"int","type":"Property","Name":"MeshCacheSize","tags":[],"Class":"RenderSettings"},{"ValueType":"QualityLevel","type":"Property","Name":"QualityLevel","tags":[],"Class":"RenderSettings"},{"ValueType":"bool","type":"Property","Name":"ReloadAssets","tags":[],"Class":"RenderSettings"},{"ValueType":"bool","type":"Property","Name":"RenderCSGTrianglesDebug","tags":[],"Class":"RenderSettings"},{"ValueType":"Resolution","type":"Property","Name":"Resolution","tags":[],"Class":"RenderSettings"},{"ValueType":"bool","type":"Property","Name":"ShowBoundingBoxes","tags":[],"Class":"RenderSettings"},{"ReturnType":"int","Arguments":[],"Name":"GetMaxQualityLevel","tags":[],"Class":"RenderSettings","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"ReplicatedFirst","tags":["notCreatable"]},{"ReturnType":"bool","Arguments":[],"Name":"IsDefaultLoadingGuiRemoved","tags":["RobloxScriptSecurity"],"Class":"ReplicatedFirst","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsFinishedReplicating","tags":["RobloxScriptSecurity"],"Class":"ReplicatedFirst","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RemoveDefaultLoadingScreen","tags":[],"Class":"ReplicatedFirst","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SetDefaultLoadingGuiRemoved","tags":["RobloxScriptSecurity"],"Class":"ReplicatedFirst","type":"Function"},{"Arguments":[],"Name":"DefaultLoadingGuiRemoved","tags":["RobloxScriptSecurity"],"Class":"ReplicatedFirst","type":"Event"},{"Arguments":[],"Name":"FinishedReplicating","tags":["RobloxScriptSecurity"],"Class":"ReplicatedFirst","type":"Event"},{"Arguments":[],"Name":"RemoveDefaultLoadingGuiSignal","tags":["RobloxScriptSecurity"],"Class":"ReplicatedFirst","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ReplicatedStorage","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"RobloxReplicatedStorage","tags":["notCreatable","notbrowsable"]},{"Superclass":"Instance","type":"Class","Name":"RunService","tags":[]},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"int","Name":"priority","Default":null},{"Type":"Function","Name":"function","Default":null}],"Name":"BindToRenderStep","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetRobloxVersion","tags":["RobloxScriptSecurity"],"Class":"RunService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsClient","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsRunMode","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsRunning","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsServer","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsStudio","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Pause","tags":["PluginSecurity"],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Reset","tags":["PluginSecurity","deprecated"],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Run","tags":["PluginSecurity"],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"enable","Default":null}],"Name":"Set3dRenderingEnabled","tags":["RobloxScriptSecurity"],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Stop","tags":["PluginSecurity"],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"UnbindFromRenderStep","tags":[],"Class":"RunService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"enable","Default":null}],"Name":"setThrottleFramerateEnabled","tags":["RobloxScriptSecurity"],"Class":"RunService","type":"Function"},{"Arguments":[{"Name":"step","Type":"double"}],"Name":"Heartbeat","tags":[],"Class":"RunService","type":"Event"},{"Arguments":[{"Name":"step","Type":"double"}],"Name":"RenderStepped","tags":[],"Class":"RunService","type":"Event"},{"Arguments":[{"Name":"time","Type":"double"},{"Name":"step","Type":"double"}],"Name":"Stepped","tags":[],"Class":"RunService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"RuntimeScriptService","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"ScriptContext","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"ScriptsDisabled","tags":["LocalUserSecurity"],"Class":"ScriptContext"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"Instance","Name":"parent","Default":null}],"Name":"AddCoreScriptLocal","tags":["RobloxScriptSecurity"],"Class":"ScriptContext","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"double","Name":"seconds","Default":null}],"Name":"SetTimeout","tags":["PluginSecurity"],"Class":"ScriptContext","type":"Function"},{"Arguments":[{"Name":"message","Type":"string"},{"Name":"stackTrace","Type":"string"},{"Name":"script","Type":"Instance"}],"Name":"Error","tags":[],"Class":"ScriptContext","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ScriptDebugger","tags":["notCreatable"]},{"ValueType":"int","type":"Property","Name":"CurrentLine","tags":["readonly"],"Class":"ScriptDebugger"},{"ValueType":"bool","type":"Property","Name":"IsDebugging","tags":["readonly"],"Class":"ScriptDebugger"},{"ValueType":"bool","type":"Property","Name":"IsPaused","tags":["readonly"],"Class":"ScriptDebugger"},{"ValueType":"Object","type":"Property","Name":"Script","tags":["readonly"],"Class":"ScriptDebugger"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"expression","Default":null}],"Name":"AddWatch","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetBreakpoints","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Map","Arguments":[],"Name":"GetGlobals","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Map","Arguments":[{"Type":"int","Name":"stackFrame","Default":"0"}],"Name":"GetLocals","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetStack","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Map","Arguments":[{"Type":"int","Name":"stackFrame","Default":"0"}],"Name":"GetUpvalues","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Variant","Arguments":[{"Type":"Instance","Name":"watch","Default":null}],"Name":"GetWatchValue","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Objects","Arguments":[],"Name":"GetWatches","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Resume","tags":["deprecated"],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"int","Name":"line","Default":null}],"Name":"SetBreakpoint","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"Variant","Name":"value","Default":null}],"Name":"SetGlobal","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"Variant","Name":"value","Default":null},{"Type":"int","Name":"stackFrame","Default":"0"}],"Name":"SetLocal","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"name","Default":null},{"Type":"Variant","Name":"value","Default":null},{"Type":"int","Name":"stackFrame","Default":"0"}],"Name":"SetUpvalue","tags":[],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StepIn","tags":["deprecated"],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StepOut","tags":["deprecated"],"Class":"ScriptDebugger","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StepOver","tags":["deprecated"],"Class":"ScriptDebugger","type":"Function"},{"Arguments":[{"Name":"breakpoint","Type":"Instance"}],"Name":"BreakpointAdded","tags":[],"Class":"ScriptDebugger","type":"Event"},{"Arguments":[{"Name":"breakpoint","Type":"Instance"}],"Name":"BreakpointRemoved","tags":[],"Class":"ScriptDebugger","type":"Event"},{"Arguments":[{"Name":"line","Type":"int"}],"Name":"EncounteredBreak","tags":[],"Class":"ScriptDebugger","type":"Event"},{"Arguments":[],"Name":"Resuming","tags":[],"Class":"ScriptDebugger","type":"Event"},{"Arguments":[{"Name":"watch","Type":"Instance"}],"Name":"WatchAdded","tags":[],"Class":"ScriptDebugger","type":"Event"},{"Arguments":[{"Name":"watch","Type":"Instance"}],"Name":"WatchRemoved","tags":[],"Class":"ScriptDebugger","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ScriptService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"Selection","tags":[]},{"ReturnType":"Objects","Arguments":[],"Name":"Get","tags":["PluginSecurity"],"Class":"Selection","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Objects","Name":"selection","Default":null}],"Name":"Set","tags":["PluginSecurity"],"Class":"Selection","type":"Function"},{"Arguments":[],"Name":"SelectionChanged","tags":[],"Class":"Selection","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"ServerScriptService","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"ServerStorage","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"ServiceProvider","tags":["notbrowsable"]},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"FindService","tags":[],"Class":"ServiceProvider","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"GetService","tags":[],"Class":"ServiceProvider","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"getService","tags":["deprecated"],"Class":"ServiceProvider","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"className","Default":null}],"Name":"service","tags":["deprecated"],"Class":"ServiceProvider","type":"Function"},{"Arguments":[],"Name":"Close","tags":[],"Class":"ServiceProvider","type":"Event"},{"Arguments":[],"Name":"CloseLate","tags":["LocalUserSecurity"],"Class":"ServiceProvider","type":"Event"},{"Arguments":[{"Name":"service","Type":"Instance"}],"Name":"ServiceAdded","tags":[],"Class":"ServiceProvider","type":"Event"},{"Arguments":[{"Name":"service","Type":"Instance"}],"Name":"ServiceRemoving","tags":[],"Class":"ServiceProvider","type":"Event"},{"Superclass":"ServiceProvider","type":"Class","Name":"DataModel","tags":[]},{"ValueType":"int","type":"Property","Name":"CreatorId","tags":["readonly"],"Class":"DataModel"},{"ValueType":"CreatorType","type":"Property","Name":"CreatorType","tags":["readonly"],"Class":"DataModel"},{"ValueType":"int","type":"Property","Name":"GameId","tags":["readonly"],"Class":"DataModel"},{"ValueType":"GearGenreSetting","type":"Property","Name":"GearGenreSetting","tags":["readonly"],"Class":"DataModel"},{"ValueType":"Genre","type":"Property","Name":"Genre","tags":["readonly"],"Class":"DataModel"},{"ValueType":"bool","type":"Property","Name":"IsSFFlagsLoaded","tags":["RobloxScriptSecurity","readonly"],"Class":"DataModel"},{"ValueType":"string","type":"Property","Name":"JobId","tags":["readonly"],"Class":"DataModel"},{"ValueType":"int64","type":"Property","Name":"PlaceId","tags":["readonly"],"Class":"DataModel"},{"ValueType":"int","type":"Property","Name":"PlaceVersion","tags":["readonly"],"Class":"DataModel"},{"ValueType":"string","type":"Property","Name":"VIPServerId","tags":["readonly"],"Class":"DataModel"},{"ValueType":"int","type":"Property","Name":"VIPServerOwnerId","tags":["readonly"],"Class":"DataModel"},{"ValueType":"Object","type":"Property","Name":"Workspace","tags":["readonly"],"Class":"DataModel"},{"ValueType":"Object","type":"Property","Name":"lighting","tags":["deprecated","readonly"],"Class":"DataModel"},{"ValueType":"Object","type":"Property","Name":"workspace","tags":["deprecated","readonly"],"Class":"DataModel"},{"ReturnType":"void","Arguments":[{"Type":"Function","Name":"function","Default":null}],"Name":"BindToClose","tags":[],"Class":"DataModel","type":"Function"},{"ReturnType":"double","Arguments":[{"Type":"string","Name":"jobname","Default":null},{"Type":"double","Name":"greaterThan","Default":null}],"Name":"GetJobIntervalPeakFraction","tags":["PluginSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"double","Arguments":[{"Type":"string","Name":"jobname","Default":null},{"Type":"double","Name":"greaterThan","Default":null}],"Name":"GetJobTimePeakFraction","tags":["PluginSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetJobsExtendedStats","tags":["PluginSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetJobsInfo","tags":["PluginSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetMessage","tags":["deprecated"],"Class":"DataModel","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"GetRemoteBuildMode","tags":["deprecated"],"Class":"DataModel","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"url","Default":null},{"Type":"bool","Name":"synchronous","Default":"false"},{"Type":"HttpRequestType","Name":"httpRequestType","Default":"Default"},{"Type":"bool","Name":"doNotAllowDiabolicalMode","Default":"false"}],"Name":"HttpGet","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"url","Default":null},{"Type":"string","Name":"data","Default":null},{"Type":"bool","Name":"synchronous","Default":"false"},{"Type":"string","Name":"contentType","Default":"*/*"},{"Type":"HttpRequestType","Name":"httpRequestType","Default":"Default"},{"Type":"bool","Name":"doNotAllowDiabolicalMode","Default":"false"}],"Name":"HttpPost","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"GearType","Name":"gearType","Default":null}],"Name":"IsGearTypeAllowed","tags":[],"Class":"DataModel","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"IsLoaded","tags":[],"Class":"DataModel","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Content","Name":"url","Default":null}],"Name":"Load","tags":["LocalUserSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"OpenScreenshotsFolder","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"OpenVideosFolder","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"category","Default":null},{"Type":"string","Name":"action","Default":"custom"},{"Type":"string","Name":"label","Default":"none"},{"Type":"int","Name":"value","Default":"0"}],"Name":"ReportInGoogleAnalytics","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Shutdown","tags":["LocalUserSecurity"],"Class":"DataModel","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"url","Default":null},{"Type":"HttpRequestType","Name":"httpRequestType","Default":"Default"},{"Type":"bool","Name":"doNotAllowDiabolicalMode","Default":"false"}],"Name":"HttpGetAsync","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"url","Default":null},{"Type":"string","Name":"data","Default":null},{"Type":"string","Name":"contentType","Default":"*/*"},{"Type":"HttpRequestType","Name":"httpRequestType","Default":"Default"},{"Type":"bool","Name":"doNotAllowDiabolicalMode","Default":"false"}],"Name":"HttpPostAsync","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"YieldFunction"},{"ReturnType":"bool","Arguments":[{"Type":"SaveFilter","Name":"saveFilter","Default":"SaveAll"}],"Name":"SavePlace","tags":["deprecated"],"Class":"DataModel","type":"YieldFunction"},{"Arguments":[],"Name":"AllowedGearTypeChanged","tags":["deprecated"],"Class":"DataModel","type":"Event"},{"Arguments":[{"Name":"betterQuality","Type":"bool"}],"Name":"GraphicsQualityChangeRequest","tags":[],"Class":"DataModel","type":"Event"},{"Arguments":[{"Name":"object","Type":"Instance"},{"Name":"descriptor","Type":"Property"}],"Name":"ItemChanged","tags":["deprecated"],"Class":"DataModel","type":"Event"},{"Arguments":[],"Name":"Loaded","tags":[],"Class":"DataModel","type":"Event"},{"Arguments":[{"Name":"path","Type":"string"}],"Name":"ScreenshotReady","tags":["RobloxScriptSecurity"],"Class":"DataModel","type":"Event"},{"ReturnType":"Tuple","Arguments":[],"Name":"OnClose","tags":["deprecated"],"Class":"DataModel","type":"Callback"},{"Superclass":"ServiceProvider","type":"Class","Name":"GenericSettings","tags":[]},{"Superclass":"GenericSettings","type":"Class","Name":"AnalysticsSettings","tags":[]},{"Superclass":"GenericSettings","type":"Class","Name":"GlobalSettings","tags":["notbrowsable"]},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"GetFFlag","tags":[],"Class":"GlobalSettings","type":"Function"},{"ReturnType":"string","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"GetFVariable","tags":[],"Class":"GlobalSettings","type":"Function"},{"Superclass":"GenericSettings","type":"Class","Name":"UserSettings","tags":[]},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"name","Default":null}],"Name":"IsUserFeatureEnabled","tags":[],"Class":"UserSettings","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Reset","tags":[],"Class":"UserSettings","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Sky","tags":[]},{"ValueType":"bool","type":"Property","Name":"CelestialBodiesShown","tags":[],"Class":"Sky"},{"ValueType":"float","type":"Property","Name":"MoonAngularSize","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"MoonTextureId","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SkyboxBk","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SkyboxDn","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SkyboxFt","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SkyboxLf","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SkyboxRt","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SkyboxUp","tags":[],"Class":"Sky"},{"ValueType":"int","type":"Property","Name":"StarCount","tags":[],"Class":"Sky"},{"ValueType":"float","type":"Property","Name":"SunAngularSize","tags":[],"Class":"Sky"},{"ValueType":"Content","type":"Property","Name":"SunTextureId","tags":[],"Class":"Sky"},{"Superclass":"Instance","type":"Class","Name":"Smoke","tags":[]},{"ValueType":"Color3","type":"Property","Name":"Color","tags":[],"Class":"Smoke"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Smoke"},{"ValueType":"float","type":"Property","Name":"Opacity","tags":[],"Class":"Smoke"},{"ValueType":"float","type":"Property","Name":"RiseVelocity","tags":[],"Class":"Smoke"},{"ValueType":"float","type":"Property","Name":"Size","tags":[],"Class":"Smoke"},{"Superclass":"Instance","type":"Class","Name":"Sound","tags":[]},{"ValueType":"float","type":"Property","Name":"EmitterSize","tags":[],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"IsLoaded","tags":["readonly"],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"IsPaused","tags":["readonly"],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"IsPlaying","tags":["readonly"],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"Looped","tags":[],"Class":"Sound"},{"ValueType":"float","type":"Property","Name":"MaxDistance","tags":[],"Class":"Sound"},{"ValueType":"float","type":"Property","Name":"MinDistance","tags":["deprecated"],"Class":"Sound"},{"ValueType":"float","type":"Property","Name":"Pitch","tags":["deprecated"],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"PlayOnRemove","tags":[],"Class":"Sound"},{"ValueType":"double","type":"Property","Name":"PlaybackLoudness","tags":["readonly"],"Class":"Sound"},{"ValueType":"float","type":"Property","Name":"PlaybackSpeed","tags":[],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"Playing","tags":[],"Class":"Sound"},{"ValueType":"RollOffMode","type":"Property","Name":"RollOffMode","tags":[],"Class":"Sound"},{"ValueType":"Object","type":"Property","Name":"SoundGroup","tags":[],"Class":"Sound"},{"ValueType":"Content","type":"Property","Name":"SoundId","tags":[],"Class":"Sound"},{"ValueType":"double","type":"Property","Name":"TimeLength","tags":["readonly"],"Class":"Sound"},{"ValueType":"double","type":"Property","Name":"TimePosition","tags":[],"Class":"Sound"},{"ValueType":"float","type":"Property","Name":"Volume","tags":[],"Class":"Sound"},{"ValueType":"bool","type":"Property","Name":"isPlaying","tags":["deprecated","readonly"],"Class":"Sound"},{"ReturnType":"void","Arguments":[],"Name":"Pause","tags":[],"Class":"Sound","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Play","tags":[],"Class":"Sound","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Resume","tags":[],"Class":"Sound","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Stop","tags":[],"Class":"Sound","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"pause","tags":["deprecated"],"Class":"Sound","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"play","tags":["deprecated"],"Class":"Sound","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"stop","tags":["deprecated"],"Class":"Sound","type":"Function"},{"Arguments":[{"Name":"soundId","Type":"string"},{"Name":"numOfTimesLooped","Type":"int"}],"Name":"DidLoop","tags":[],"Class":"Sound","type":"Event"},{"Arguments":[{"Name":"soundId","Type":"string"}],"Name":"Ended","tags":[],"Class":"Sound","type":"Event"},{"Arguments":[{"Name":"soundId","Type":"string"}],"Name":"Loaded","tags":[],"Class":"Sound","type":"Event"},{"Arguments":[{"Name":"soundId","Type":"string"}],"Name":"Paused","tags":[],"Class":"Sound","type":"Event"},{"Arguments":[{"Name":"soundId","Type":"string"}],"Name":"Played","tags":[],"Class":"Sound","type":"Event"},{"Arguments":[{"Name":"soundId","Type":"string"}],"Name":"Resumed","tags":[],"Class":"Sound","type":"Event"},{"Arguments":[{"Name":"soundId","Type":"string"}],"Name":"Stopped","tags":[],"Class":"Sound","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"SoundEffect","tags":[]},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"SoundEffect"},{"ValueType":"int","type":"Property","Name":"Priority","tags":[],"Class":"SoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"ChorusSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Depth","tags":[],"Class":"ChorusSoundEffect"},{"ValueType":"float","type":"Property","Name":"Mix","tags":[],"Class":"ChorusSoundEffect"},{"ValueType":"float","type":"Property","Name":"Rate","tags":[],"Class":"ChorusSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"CompressorSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Attack","tags":[],"Class":"CompressorSoundEffect"},{"ValueType":"float","type":"Property","Name":"GainMakeup","tags":[],"Class":"CompressorSoundEffect"},{"ValueType":"float","type":"Property","Name":"Ratio","tags":[],"Class":"CompressorSoundEffect"},{"ValueType":"float","type":"Property","Name":"Release","tags":[],"Class":"CompressorSoundEffect"},{"ValueType":"Object","type":"Property","Name":"SideChain","tags":[],"Class":"CompressorSoundEffect"},{"ValueType":"float","type":"Property","Name":"Threshold","tags":[],"Class":"CompressorSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"DistortionSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Level","tags":[],"Class":"DistortionSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"EchoSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Delay","tags":[],"Class":"EchoSoundEffect"},{"ValueType":"float","type":"Property","Name":"DryLevel","tags":[],"Class":"EchoSoundEffect"},{"ValueType":"float","type":"Property","Name":"Feedback","tags":[],"Class":"EchoSoundEffect"},{"ValueType":"float","type":"Property","Name":"WetLevel","tags":[],"Class":"EchoSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"EqualizerSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"HighGain","tags":[],"Class":"EqualizerSoundEffect"},{"ValueType":"float","type":"Property","Name":"LowGain","tags":[],"Class":"EqualizerSoundEffect"},{"ValueType":"float","type":"Property","Name":"MidGain","tags":[],"Class":"EqualizerSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"FlangeSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Depth","tags":[],"Class":"FlangeSoundEffect"},{"ValueType":"float","type":"Property","Name":"Mix","tags":[],"Class":"FlangeSoundEffect"},{"ValueType":"float","type":"Property","Name":"Rate","tags":[],"Class":"FlangeSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"PitchShiftSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Octave","tags":[],"Class":"PitchShiftSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"ReverbSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"DecayTime","tags":[],"Class":"ReverbSoundEffect"},{"ValueType":"float","type":"Property","Name":"Density","tags":[],"Class":"ReverbSoundEffect"},{"ValueType":"float","type":"Property","Name":"Diffusion","tags":[],"Class":"ReverbSoundEffect"},{"ValueType":"float","type":"Property","Name":"DryLevel","tags":[],"Class":"ReverbSoundEffect"},{"ValueType":"float","type":"Property","Name":"WetLevel","tags":[],"Class":"ReverbSoundEffect"},{"Superclass":"SoundEffect","type":"Class","Name":"TremoloSoundEffect","tags":[]},{"ValueType":"float","type":"Property","Name":"Depth","tags":[],"Class":"TremoloSoundEffect"},{"ValueType":"float","type":"Property","Name":"Duty","tags":[],"Class":"TremoloSoundEffect"},{"ValueType":"float","type":"Property","Name":"Frequency","tags":[],"Class":"TremoloSoundEffect"},{"Superclass":"Instance","type":"Class","Name":"SoundGroup","tags":[]},{"ValueType":"float","type":"Property","Name":"Volume","tags":[],"Class":"SoundGroup"},{"Superclass":"Instance","type":"Class","Name":"SoundService","tags":["notCreatable"]},{"ValueType":"ReverbType","type":"Property","Name":"AmbientReverb","tags":[],"Class":"SoundService"},{"ValueType":"float","type":"Property","Name":"DistanceFactor","tags":[],"Class":"SoundService"},{"ValueType":"float","type":"Property","Name":"DopplerScale","tags":[],"Class":"SoundService"},{"ValueType":"bool","type":"Property","Name":"RespectFilteringEnabled","tags":[],"Class":"SoundService"},{"ValueType":"float","type":"Property","Name":"RolloffScale","tags":[],"Class":"SoundService"},{"ReturnType":"bool","Arguments":[],"Name":"BeginRecording","tags":["RobloxScriptSecurity"],"Class":"SoundService","type":"Function"},{"ReturnType":"Tuple","Arguments":[],"Name":"GetListener","tags":[],"Class":"SoundService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"sound","Default":null}],"Name":"PlayLocalSound","tags":[],"Class":"SoundService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"SoundType","Name":"sound","Default":null}],"Name":"PlayStockSound","tags":["RobloxScriptSecurity"],"Class":"SoundService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"ListenerType","Name":"listenerType","Default":null},{"Type":"Tuple","Name":"listener","Default":null}],"Name":"SetListener","tags":[],"Class":"SoundService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"int","Name":"deviceIndex","Default":null}],"Name":"SetRecordingDevice","tags":["RobloxScriptSecurity"],"Class":"SoundService","type":"Function"},{"ReturnType":"Dictionary","Arguments":[],"Name":"EndRecording","tags":["RobloxScriptSecurity"],"Class":"SoundService","type":"YieldFunction"},{"ReturnType":"Dictionary","Arguments":[],"Name":"GetRecordingDevices","tags":["RobloxScriptSecurity"],"Class":"SoundService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"Sparkles","tags":[]},{"ValueType":"Color3","type":"Property","Name":"Color","tags":["hidden"],"Class":"Sparkles"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Sparkles"},{"ValueType":"Color3","type":"Property","Name":"SparkleColor","tags":[],"Class":"Sparkles"},{"Superclass":"Instance","type":"Class","Name":"SpawnerService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"StarterGear","tags":[]},{"Superclass":"Instance","type":"Class","Name":"StarterPlayer","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"AllowCustomAnimations","tags":["ScriptWriteRestricted: [NotAccessibleSecurity]","hidden"],"Class":"StarterPlayer"},{"ValueType":"bool","type":"Property","Name":"AutoJumpEnabled","tags":[],"Class":"StarterPlayer"},{"ValueType":"float","type":"Property","Name":"CameraMaxZoomDistance","tags":[],"Class":"StarterPlayer"},{"ValueType":"float","type":"Property","Name":"CameraMinZoomDistance","tags":[],"Class":"StarterPlayer"},{"ValueType":"CameraMode","type":"Property","Name":"CameraMode","tags":[],"Class":"StarterPlayer"},{"ValueType":"DevCameraOcclusionMode","type":"Property","Name":"DevCameraOcclusionMode","tags":[],"Class":"StarterPlayer"},{"ValueType":"DevComputerCameraMovementMode","type":"Property","Name":"DevComputerCameraMovementMode","tags":[],"Class":"StarterPlayer"},{"ValueType":"DevComputerMovementMode","type":"Property","Name":"DevComputerMovementMode","tags":[],"Class":"StarterPlayer"},{"ValueType":"DevTouchCameraMovementMode","type":"Property","Name":"DevTouchCameraMovementMode","tags":[],"Class":"StarterPlayer"},{"ValueType":"DevTouchMovementMode","type":"Property","Name":"DevTouchMovementMode","tags":[],"Class":"StarterPlayer"},{"ValueType":"bool","type":"Property","Name":"EnableMouseLockOption","tags":[],"Class":"StarterPlayer"},{"ValueType":"float","type":"Property","Name":"HealthDisplayDistance","tags":[],"Class":"StarterPlayer"},{"ValueType":"bool","type":"Property","Name":"LoadCharacterAppearance","tags":[],"Class":"StarterPlayer"},{"ValueType":"float","type":"Property","Name":"NameDisplayDistance","tags":[],"Class":"StarterPlayer"},{"Superclass":"Instance","type":"Class","Name":"StarterPlayerScripts","tags":[]},{"Superclass":"StarterPlayerScripts","type":"Class","Name":"StarterCharacterScripts","tags":[]},{"Superclass":"Instance","type":"Class","Name":"Stats","tags":[]},{"ValueType":"int","type":"Property","Name":"ContactsCount","tags":["readonly"],"Class":"Stats"},{"ValueType":"float","type":"Property","Name":"DataReceiveKbps","tags":["readonly"],"Class":"Stats"},{"ValueType":"float","type":"Property","Name":"DataSendKbps","tags":["readonly"],"Class":"Stats"},{"ValueType":"float","type":"Property","Name":"HeartbeatTimeMs","tags":["readonly"],"Class":"Stats"},{"ValueType":"int","type":"Property","Name":"InstanceCount","tags":["readonly"],"Class":"Stats"},{"ValueType":"int","type":"Property","Name":"MovingPrimitivesCount","tags":["readonly"],"Class":"Stats"},{"ValueType":"float","type":"Property","Name":"PhysicsReceiveKbps","tags":["readonly"],"Class":"Stats"},{"ValueType":"float","type":"Property","Name":"PhysicsSendKbps","tags":["readonly"],"Class":"Stats"},{"ValueType":"float","type":"Property","Name":"PhysicsStepTimeMs","tags":["readonly"],"Class":"Stats"},{"ValueType":"int","type":"Property","Name":"PrimitivesCount","tags":["readonly"],"Class":"Stats"},{"ReturnType":"float","Arguments":[{"Type":"DeveloperMemoryTag","Name":"tag","Default":null}],"Name":"GetMemoryUsageMbForTag","tags":[],"Class":"Stats","type":"Function"},{"ReturnType":"Dictionary","Arguments":[{"Type":"TextureQueryType","Name":"queryType","Default":null},{"Type":"int","Name":"pageIndex","Default":null},{"Type":"int","Name":"pageSize","Default":null}],"Name":"GetPaginatedMemoryByTexture","tags":["RobloxScriptSecurity"],"Class":"Stats","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"StatsItem","tags":[]},{"ReturnType":"double","Arguments":[],"Name":"GetValue","tags":["PluginSecurity"],"Class":"StatsItem","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetValueString","tags":["PluginSecurity"],"Class":"StatsItem","type":"Function"},{"Superclass":"StatsItem","type":"Class","Name":"RunningAverageItemDouble","tags":[]},{"Superclass":"StatsItem","type":"Class","Name":"RunningAverageItemInt","tags":[]},{"Superclass":"StatsItem","type":"Class","Name":"RunningAverageTimeIntervalItem","tags":[]},{"Superclass":"StatsItem","type":"Class","Name":"TotalCountTimeIntervalItem","tags":[]},{"Superclass":"Instance","type":"Class","Name":"StringValue","tags":[]},{"ValueType":"string","type":"Property","Name":"Value","tags":[],"Class":"StringValue"},{"Arguments":[{"Name":"value","Type":"string"}],"Name":"Changed","tags":[],"Class":"StringValue","type":"Event"},{"Arguments":[{"Name":"value","Type":"string"}],"Name":"changed","tags":["deprecated"],"Class":"StringValue","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"TaskScheduler","tags":[]},{"ValueType":"bool","type":"Property","Name":"AreArbitersThrottled","tags":[],"Class":"TaskScheduler"},{"ValueType":"ConcurrencyModel","type":"Property","Name":"Concurrency","tags":[],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"NumRunningJobs","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"NumSleepingJobs","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"NumWaitingJobs","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"PriorityMethod","type":"Property","Name":"PriorityMethod","tags":[],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"SchedulerDutyCycle","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"SchedulerRate","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"SleepAdjustMethod","type":"Property","Name":"SleepAdjustMethod","tags":[],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"ThreadAffinity","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"ThreadPoolConfig","type":"Property","Name":"ThreadPoolConfig","tags":[],"Class":"TaskScheduler"},{"ValueType":"int","type":"Property","Name":"ThreadPoolSize","tags":["readonly"],"Class":"TaskScheduler"},{"ValueType":"double","type":"Property","Name":"ThrottledJobSleepTime","tags":[],"Class":"TaskScheduler"},{"Superclass":"Instance","type":"Class","Name":"Team","tags":[]},{"ValueType":"bool","type":"Property","Name":"AutoAssignable","tags":[],"Class":"Team"},{"ValueType":"bool","type":"Property","Name":"AutoColorCharacters","tags":["deprecated"],"Class":"Team"},{"ValueType":"int","type":"Property","Name":"Score","tags":["deprecated"],"Class":"Team"},{"ValueType":"BrickColor","type":"Property","Name":"TeamColor","tags":[],"Class":"Team"},{"ReturnType":"Objects","Arguments":[],"Name":"GetPlayers","tags":[],"Class":"Team","type":"Function"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerAdded","tags":[],"Class":"Team","type":"Event"},{"Arguments":[{"Name":"player","Type":"Instance"}],"Name":"PlayerRemoved","tags":[],"Class":"Team","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Teams","tags":["notCreatable"]},{"ReturnType":"Objects","Arguments":[],"Name":"GetTeams","tags":[],"Class":"Teams","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RebalanceTeams","tags":["deprecated"],"Class":"Teams","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"TeleportService","tags":[]},{"ValueType":"bool","type":"Property","Name":"CustomizedTeleportUI","tags":["deprecated"],"Class":"TeleportService"},{"ReturnType":"Variant","Arguments":[],"Name":"GetLocalPlayerTeleportData","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"Variant","Arguments":[{"Type":"string","Name":"setting","Default":null}],"Name":"GetTeleportSetting","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"setting","Default":null},{"Type":"Variant","Name":"value","Default":null}],"Name":"SetTeleportSetting","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"Instance","Name":"player","Default":"nil"},{"Type":"Variant","Name":"teleportData","Default":null},{"Type":"Instance","Name":"customLoadingScreen","Default":"nil"}],"Name":"Teleport","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"TeleportCancel","tags":["RobloxScriptSecurity"],"Class":"TeleportService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"string","Name":"instanceId","Default":null},{"Type":"Instance","Name":"player","Default":"nil"},{"Type":"string","Name":"spawnName","Default":""},{"Type":"Variant","Name":"teleportData","Default":null},{"Type":"Instance","Name":"customLoadingScreen","Default":"nil"}],"Name":"TeleportToPlaceInstance","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"string","Name":"reservedServerAccessCode","Default":null},{"Type":"Objects","Name":"players","Default":null},{"Type":"string","Name":"spawnName","Default":""},{"Type":"Variant","Name":"teleportData","Default":null},{"Type":"Instance","Name":"customLoadingScreen","Default":"nil"}],"Name":"TeleportToPrivateServer","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"placeId","Default":null},{"Type":"string","Name":"spawnName","Default":null},{"Type":"Instance","Name":"player","Default":"nil"},{"Type":"Variant","Name":"teleportData","Default":null},{"Type":"Instance","Name":"customLoadingScreen","Default":"nil"}],"Name":"TeleportToSpawnByName","tags":[],"Class":"TeleportService","type":"Function"},{"ReturnType":"Tuple","Arguments":[{"Type":"int","Name":"userId","Default":null}],"Name":"GetPlayerPlaceInstanceAsync","tags":[],"Class":"TeleportService","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"placeId","Default":null}],"Name":"ReserveServer","tags":[],"Class":"TeleportService","type":"YieldFunction"},{"Arguments":[{"Name":"loadingGui","Type":"Instance"},{"Name":"dataTable","Type":"Variant"}],"Name":"LocalPlayerArrivedFromTeleport","tags":[],"Class":"TeleportService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"TerrainRegion","tags":[]},{"ValueType":"bool","type":"Property","Name":"IsSmooth","tags":["deprecated","readonly"],"Class":"TerrainRegion"},{"ValueType":"Vector3","type":"Property","Name":"SizeInCells","tags":["readonly"],"Class":"TerrainRegion"},{"ReturnType":"void","Arguments":[],"Name":"ConvertToSmooth","tags":["PluginSecurity","deprecated"],"Class":"TerrainRegion","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"TestService","tags":[]},{"ValueType":"bool","type":"Property","Name":"AutoRuns","tags":[],"Class":"TestService"},{"ValueType":"string","type":"Property","Name":"Description","tags":[],"Class":"TestService"},{"ValueType":"int","type":"Property","Name":"ErrorCount","tags":["readonly"],"Class":"TestService"},{"ValueType":"bool","type":"Property","Name":"Is30FpsThrottleEnabled","tags":[],"Class":"TestService"},{"ValueType":"bool","type":"Property","Name":"IsPhysicsEnvironmentalThrottled","tags":[],"Class":"TestService"},{"ValueType":"bool","type":"Property","Name":"IsSleepAllowed","tags":[],"Class":"TestService"},{"ValueType":"int","type":"Property","Name":"NumberOfPlayers","tags":[],"Class":"TestService"},{"ValueType":"double","type":"Property","Name":"SimulateSecondsLag","tags":[],"Class":"TestService"},{"ValueType":"int","type":"Property","Name":"TestCount","tags":["readonly"],"Class":"TestService"},{"ValueType":"double","type":"Property","Name":"Timeout","tags":[],"Class":"TestService"},{"ValueType":"int","type":"Property","Name":"WarnCount","tags":["readonly"],"Class":"TestService"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"condition","Default":null},{"Type":"string","Name":"description","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Check","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"text","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Checkpoint","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Done","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"description","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Error","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"description","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Fail","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"text","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Message","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"condition","Default":null},{"Type":"string","Name":"description","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Require","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"bool","Name":"condition","Default":null},{"Type":"string","Name":"description","Default":null},{"Type":"Instance","Name":"source","Default":"nil"},{"Type":"int","Name":"line","Default":"0"}],"Name":"Warn","tags":[],"Class":"TestService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Run","tags":["PluginSecurity"],"Class":"TestService","type":"YieldFunction"},{"Arguments":[{"Name":"condition","Type":"bool"},{"Name":"text","Type":"string"},{"Name":"script","Type":"Instance"},{"Name":"line","Type":"int"}],"Name":"ServerCollectConditionalResult","tags":[],"Class":"TestService","type":"Event"},{"Arguments":[{"Name":"text","Type":"string"},{"Name":"script","Type":"Instance"},{"Name":"line","Type":"int"}],"Name":"ServerCollectResult","tags":[],"Class":"TestService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"TextFilterResult","tags":["notCreatable"]},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"toUserId","Default":null}],"Name":"GetChatForUserAsync","tags":[],"Class":"TextFilterResult","type":"YieldFunction"},{"ReturnType":"string","Arguments":[],"Name":"GetNonChatStringForBroadcastAsync","tags":[],"Class":"TextFilterResult","type":"YieldFunction"},{"ReturnType":"string","Arguments":[{"Type":"int","Name":"toUserId","Default":null}],"Name":"GetNonChatStringForUserAsync","tags":[],"Class":"TextFilterResult","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"TextService","tags":[]},{"ReturnType":"Vector2","Arguments":[{"Type":"string","Name":"string","Default":null},{"Type":"int","Name":"fontSize","Default":null},{"Type":"Font","Name":"font","Default":null},{"Type":"Vector2","Name":"frameSize","Default":null}],"Name":"GetTextSize","tags":[],"Class":"TextService","type":"Function"},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"stringToFilter","Default":null},{"Type":"int","Name":"fromUserId","Default":null}],"Name":"FilterStringAsync","tags":[],"Class":"TextService","type":"YieldFunction"},{"Superclass":"Instance","type":"Class","Name":"ThirdPartyUserService","tags":["notCreatable"]},{"ReturnType":"string","Arguments":[],"Name":"GetUserDisplayName","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"GetUserPlatformId","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"HaveActiveUser","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"ShowAccountPicker","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Function"},{"ReturnType":"int","Arguments":[{"Type":"UserInputType","Name":"gamepadId","Default":null}],"Name":"RegisterActiveUser","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"YieldFunction"},{"Arguments":[],"Name":"ActiveGamepadAdded","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Event"},{"Arguments":[],"Name":"ActiveGamepadRemoved","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Event"},{"Arguments":[{"Name":"signOutStatus","Type":"int"}],"Name":"ActiveUserSignedOut","tags":["RobloxScriptSecurity"],"Class":"ThirdPartyUserService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"TimerService","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"Toolbar","tags":[]},{"ReturnType":"Instance","Arguments":[{"Type":"string","Name":"text","Default":null},{"Type":"string","Name":"tooltip","Default":null},{"Type":"string","Name":"iconname","Default":null}],"Name":"CreateButton","tags":["PluginSecurity"],"Class":"Toolbar","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"TouchInputService","tags":[]},{"Superclass":"Instance","type":"Class","Name":"TouchTransmitter","tags":["notCreatable","notbrowsable"]},{"Superclass":"Instance","type":"Class","Name":"Trail","tags":[]},{"ValueType":"Object","type":"Property","Name":"Attachment0","tags":[],"Class":"Trail"},{"ValueType":"Object","type":"Property","Name":"Attachment1","tags":[],"Class":"Trail"},{"ValueType":"ColorSequence","type":"Property","Name":"Color","tags":[],"Class":"Trail"},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"Trail"},{"ValueType":"bool","type":"Property","Name":"FaceCamera","tags":[],"Class":"Trail"},{"ValueType":"float","type":"Property","Name":"Lifetime","tags":[],"Class":"Trail"},{"ValueType":"float","type":"Property","Name":"LightEmission","tags":[],"Class":"Trail"},{"ValueType":"float","type":"Property","Name":"MinLength","tags":[],"Class":"Trail"},{"ValueType":"Content","type":"Property","Name":"Texture","tags":[],"Class":"Trail"},{"ValueType":"float","type":"Property","Name":"TextureLength","tags":[],"Class":"Trail"},{"ValueType":"TextureMode","type":"Property","Name":"TextureMode","tags":[],"Class":"Trail"},{"ValueType":"NumberSequence","type":"Property","Name":"Transparency","tags":[],"Class":"Trail"},{"ReturnType":"void","Arguments":[],"Name":"Clear","tags":[],"Class":"Trail","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"TweenBase","tags":["notbrowsable"]},{"ValueType":"PlaybackState","type":"Property","Name":"PlaybackState","tags":["readonly"],"Class":"TweenBase"},{"ReturnType":"void","Arguments":[],"Name":"Cancel","tags":[],"Class":"TweenBase","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Pause","tags":[],"Class":"TweenBase","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Play","tags":[],"Class":"TweenBase","type":"Function"},{"Arguments":[{"Name":"playbackState","Type":"PlaybackState"}],"Name":"Completed","tags":[],"Class":"TweenBase","type":"Event"},{"Superclass":"TweenBase","type":"Class","Name":"Tween","tags":[]},{"ValueType":"Object","type":"Property","Name":"Instance","tags":["readonly"],"Class":"Tween"},{"ValueType":"TweenInfo","type":"Property","Name":"TweenInfo","tags":["readonly"],"Class":"Tween"},{"Superclass":"Instance","type":"Class","Name":"TweenService","tags":[]},{"ReturnType":"Instance","Arguments":[{"Type":"Instance","Name":"instance","Default":null},{"Type":"TweenInfo","Name":"tweenInfo","Default":null},{"Type":"Dictionary","Name":"propertyTable","Default":null}],"Name":"Create","tags":[],"Class":"TweenService","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"UIBase","tags":[]},{"Superclass":"UIBase","type":"Class","Name":"UIComponent","tags":[]},{"Superclass":"UIComponent","type":"Class","Name":"UIConstraint","tags":[]},{"Superclass":"UIConstraint","type":"Class","Name":"UIAspectRatioConstraint","tags":[]},{"ValueType":"float","type":"Property","Name":"AspectRatio","tags":[],"Class":"UIAspectRatioConstraint"},{"ValueType":"AspectType","type":"Property","Name":"AspectType","tags":[],"Class":"UIAspectRatioConstraint"},{"ValueType":"DominantAxis","type":"Property","Name":"DominantAxis","tags":[],"Class":"UIAspectRatioConstraint"},{"Superclass":"UIConstraint","type":"Class","Name":"UISizeConstraint","tags":[]},{"ValueType":"Vector2","type":"Property","Name":"MaxSize","tags":[],"Class":"UISizeConstraint"},{"ValueType":"Vector2","type":"Property","Name":"MinSize","tags":[],"Class":"UISizeConstraint"},{"Superclass":"UIConstraint","type":"Class","Name":"UITextSizeConstraint","tags":[]},{"ValueType":"int","type":"Property","Name":"MaxTextSize","tags":[],"Class":"UITextSizeConstraint"},{"ValueType":"int","type":"Property","Name":"MinTextSize","tags":[],"Class":"UITextSizeConstraint"},{"Superclass":"UIComponent","type":"Class","Name":"UILayout","tags":[]},{"Superclass":"UILayout","type":"Class","Name":"UIGridStyleLayout","tags":["notbrowsable"]},{"ValueType":"Vector2","type":"Property","Name":"AbsoluteContentSize","tags":["readonly"],"Class":"UIGridStyleLayout"},{"ValueType":"FillDirection","type":"Property","Name":"FillDirection","tags":[],"Class":"UIGridStyleLayout"},{"ValueType":"HorizontalAlignment","type":"Property","Name":"HorizontalAlignment","tags":[],"Class":"UIGridStyleLayout"},{"ValueType":"SortOrder","type":"Property","Name":"SortOrder","tags":[],"Class":"UIGridStyleLayout"},{"ValueType":"VerticalAlignment","type":"Property","Name":"VerticalAlignment","tags":[],"Class":"UIGridStyleLayout"},{"ReturnType":"void","Arguments":[],"Name":"ApplyLayout","tags":[],"Class":"UIGridStyleLayout","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Function","Name":"function","Default":"nil"}],"Name":"SetCustomSortFunction","tags":["deprecated"],"Class":"UIGridStyleLayout","type":"Function"},{"Superclass":"UIGridStyleLayout","type":"Class","Name":"UIGridLayout","tags":[]},{"ValueType":"UDim2","type":"Property","Name":"CellPadding","tags":[],"Class":"UIGridLayout"},{"ValueType":"UDim2","type":"Property","Name":"CellSize","tags":[],"Class":"UIGridLayout"},{"ValueType":"int","type":"Property","Name":"FillDirectionMaxCells","tags":[],"Class":"UIGridLayout"},{"ValueType":"StartCorner","type":"Property","Name":"StartCorner","tags":[],"Class":"UIGridLayout"},{"Superclass":"UIGridStyleLayout","type":"Class","Name":"UIListLayout","tags":[]},{"ValueType":"UDim","type":"Property","Name":"Padding","tags":[],"Class":"UIListLayout"},{"Superclass":"UIGridStyleLayout","type":"Class","Name":"UIPageLayout","tags":[]},{"ValueType":"bool","type":"Property","Name":"Animated","tags":[],"Class":"UIPageLayout"},{"ValueType":"bool","type":"Property","Name":"Circular","tags":[],"Class":"UIPageLayout"},{"ValueType":"Object","type":"Property","Name":"CurrentPage","tags":["readonly"],"Class":"UIPageLayout"},{"ValueType":"EasingDirection","type":"Property","Name":"EasingDirection","tags":[],"Class":"UIPageLayout"},{"ValueType":"EasingStyle","type":"Property","Name":"EasingStyle","tags":[],"Class":"UIPageLayout"},{"ValueType":"bool","type":"Property","Name":"GamepadInputEnabled","tags":[],"Class":"UIPageLayout"},{"ValueType":"UDim","type":"Property","Name":"Padding","tags":[],"Class":"UIPageLayout"},{"ValueType":"bool","type":"Property","Name":"ScrollWheelInputEnabled","tags":[],"Class":"UIPageLayout"},{"ValueType":"bool","type":"Property","Name":"TouchInputEnabled","tags":[],"Class":"UIPageLayout"},{"ValueType":"float","type":"Property","Name":"TweenTime","tags":[],"Class":"UIPageLayout"},{"ReturnType":"void","Arguments":[{"Type":"Instance","Name":"page","Default":null}],"Name":"JumpTo","tags":[],"Class":"UIPageLayout","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"int","Name":"index","Default":null}],"Name":"JumpToIndex","tags":[],"Class":"UIPageLayout","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Next","tags":[],"Class":"UIPageLayout","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"Previous","tags":[],"Class":"UIPageLayout","type":"Function"},{"Arguments":[{"Name":"page","Type":"Instance"}],"Name":"PageEnter","tags":[],"Class":"UIPageLayout","type":"Event"},{"Arguments":[{"Name":"page","Type":"Instance"}],"Name":"PageLeave","tags":[],"Class":"UIPageLayout","type":"Event"},{"Arguments":[{"Name":"currentPage","Type":"Instance"}],"Name":"Stopped","tags":[],"Class":"UIPageLayout","type":"Event"},{"Superclass":"UIGridStyleLayout","type":"Class","Name":"UITableLayout","tags":[]},{"ValueType":"bool","type":"Property","Name":"FillEmptySpaceColumns","tags":[],"Class":"UITableLayout"},{"ValueType":"bool","type":"Property","Name":"FillEmptySpaceRows","tags":[],"Class":"UITableLayout"},{"ValueType":"TableMajorAxis","type":"Property","Name":"MajorAxis","tags":[],"Class":"UITableLayout"},{"ValueType":"UDim2","type":"Property","Name":"Padding","tags":[],"Class":"UITableLayout"},{"Superclass":"UIComponent","type":"Class","Name":"UIPadding","tags":[]},{"ValueType":"UDim","type":"Property","Name":"PaddingBottom","tags":[],"Class":"UIPadding"},{"ValueType":"UDim","type":"Property","Name":"PaddingLeft","tags":[],"Class":"UIPadding"},{"ValueType":"UDim","type":"Property","Name":"PaddingRight","tags":[],"Class":"UIPadding"},{"ValueType":"UDim","type":"Property","Name":"PaddingTop","tags":[],"Class":"UIPadding"},{"Superclass":"UIComponent","type":"Class","Name":"UIScale","tags":[]},{"ValueType":"float","type":"Property","Name":"Scale","tags":[],"Class":"UIScale"},{"Superclass":"Instance","type":"Class","Name":"UserGameSettings","tags":[]},{"ValueType":"bool","type":"Property","Name":"AllTutorialsDisabled","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"CustomCameraMode","type":"Property","Name":"CameraMode","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"CameraYInverted","tags":["RobloxScriptSecurity","hidden"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"ChatVisible","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"ComputerCameraMovementMode","type":"Property","Name":"ComputerCameraMovementMode","tags":[],"Class":"UserGameSettings"},{"ValueType":"ComputerMovementMode","type":"Property","Name":"ComputerMovementMode","tags":[],"Class":"UserGameSettings"},{"ValueType":"ControlMode","type":"Property","Name":"ControlMode","tags":[],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"Fullscreen","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"float","type":"Property","Name":"GamepadCameraSensitivity","tags":[],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"HasEverUsedVR","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"IsUsingCameraYInverted","tags":["RobloxScriptSecurity","hidden","readonly"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"IsUsingGamepadCameraSensitivity","tags":["RobloxScriptSecurity","hidden","readonly"],"Class":"UserGameSettings"},{"ValueType":"float","type":"Property","Name":"MasterVolume","tags":[],"Class":"UserGameSettings"},{"ValueType":"float","type":"Property","Name":"MouseSensitivity","tags":[],"Class":"UserGameSettings"},{"ValueType":"Vector2","type":"Property","Name":"MouseSensitivityFirstPerson","tags":["RobloxScriptSecurity","hidden"],"Class":"UserGameSettings"},{"ValueType":"Vector2","type":"Property","Name":"MouseSensitivityThirdPerson","tags":["RobloxScriptSecurity","hidden"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"PerformanceStatsVisible","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"RotationType","type":"Property","Name":"RotationType","tags":[],"Class":"UserGameSettings"},{"ValueType":"SavedQualitySetting","type":"Property","Name":"SavedQualityLevel","tags":[],"Class":"UserGameSettings"},{"ValueType":"TouchCameraMovementMode","type":"Property","Name":"TouchCameraMovementMode","tags":[],"Class":"UserGameSettings"},{"ValueType":"TouchMovementMode","type":"Property","Name":"TouchMovementMode","tags":[],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"UsedCoreGuiIsVisibleToggle","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"UsedCustomGuiIsVisibleToggle","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"UsedHideHudShortcut","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"bool","type":"Property","Name":"VREnabled","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ValueType":"int","type":"Property","Name":"VRRotationIntensity","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings"},{"ReturnType":"int","Arguments":[],"Name":"GetCameraYInvertValue","tags":[],"Class":"UserGameSettings","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"string","Name":"tutorialId","Default":null}],"Name":"GetTutorialState","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"InFullScreen","tags":[],"Class":"UserGameSettings","type":"Function"},{"ReturnType":"bool","Arguments":[],"Name":"InStudioMode","tags":[],"Class":"UserGameSettings","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SetCameraYInvertVisible","tags":[],"Class":"UserGameSettings","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"SetGamepadCameraSensitivityVisible","tags":[],"Class":"UserGameSettings","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"tutorialId","Default":null},{"Type":"bool","Name":"value","Default":null}],"Name":"SetTutorialState","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings","type":"Function"},{"Arguments":[{"Name":"isFullscreen","Type":"bool"}],"Name":"FullscreenChanged","tags":[],"Class":"UserGameSettings","type":"Event"},{"Arguments":[{"Name":"isPerformanceStatsVisible","Type":"bool"}],"Name":"PerformanceStatsVisibleChanged","tags":["RobloxScriptSecurity"],"Class":"UserGameSettings","type":"Event"},{"Arguments":[{"Name":"isStudioMode","Type":"bool"}],"Name":"StudioModeChanged","tags":[],"Class":"UserGameSettings","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"UserInputService","tags":["notCreatable"]},{"ValueType":"bool","type":"Property","Name":"AccelerometerEnabled","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"Vector2","type":"Property","Name":"BottomBarSize","tags":["RobloxScriptSecurity","readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"GamepadEnabled","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"GazeSelectionEnabled","tags":["RobloxScriptSecurity","hidden"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"GyroscopeEnabled","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"KeyboardEnabled","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"ModalEnabled","tags":[],"Class":"UserInputService"},{"ValueType":"MouseBehavior","type":"Property","Name":"MouseBehavior","tags":[],"Class":"UserInputService"},{"ValueType":"float","type":"Property","Name":"MouseDeltaSensitivity","tags":[],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"MouseEnabled","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"MouseIconEnabled","tags":[],"Class":"UserInputService"},{"ValueType":"Vector2","type":"Property","Name":"NavBarSize","tags":["RobloxScriptSecurity","readonly"],"Class":"UserInputService"},{"ValueType":"double","type":"Property","Name":"OnScreenKeyboardAnimationDuration","tags":["RobloxScriptSecurity","readonly"],"Class":"UserInputService"},{"ValueType":"Vector2","type":"Property","Name":"OnScreenKeyboardPosition","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"Vector2","type":"Property","Name":"OnScreenKeyboardSize","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"OnScreenKeyboardVisible","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"OverrideMouseIconBehavior","type":"Property","Name":"OverrideMouseIconBehavior","tags":["RobloxScriptSecurity"],"Class":"UserInputService"},{"ValueType":"Vector2","type":"Property","Name":"StatusBarSize","tags":["RobloxScriptSecurity","readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"TouchEnabled","tags":["readonly"],"Class":"UserInputService"},{"ValueType":"CoordinateFrame","type":"Property","Name":"UserHeadCFrame","tags":["deprecated","readonly"],"Class":"UserInputService"},{"ValueType":"bool","type":"Property","Name":"VREnabled","tags":["readonly"],"Class":"UserInputService"},{"ReturnType":"bool","Arguments":[{"Type":"UserInputType","Name":"gamepadNum","Default":null},{"Type":"KeyCode","Name":"gamepadKeyCode","Default":null}],"Name":"GamepadSupports","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetConnectedGamepads","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetDeviceAcceleration","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetDeviceGravity","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Tuple","Arguments":[],"Name":"GetDeviceRotation","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Instance","Arguments":[],"Name":"GetFocusedTextBox","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UserInputType","Name":"gamepadNum","Default":null}],"Name":"GetGamepadConnected","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Array","Arguments":[{"Type":"UserInputType","Name":"gamepadNum","Default":null}],"Name":"GetGamepadState","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetKeysPressed","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"UserInputType","Arguments":[],"Name":"GetLastInputType","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetMouseButtonsPressed","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Vector2","Arguments":[],"Name":"GetMouseDelta","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Vector2","Arguments":[],"Name":"GetMouseLocation","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Array","Arguments":[],"Name":"GetNavigationGamepads","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"Platform","Arguments":[],"Name":"GetPlatform","tags":["RobloxScriptSecurity"],"Class":"UserInputService","type":"Function"},{"ReturnType":"Array","Arguments":[{"Type":"UserInputType","Name":"gamepadNum","Default":null}],"Name":"GetSupportedGamepadKeyCodes","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"CoordinateFrame","Arguments":[{"Type":"UserCFrame","Name":"type","Default":null}],"Name":"GetUserCFrame","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"KeyCode","Name":"keyCode","Default":null}],"Name":"IsKeyDown","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UserInputType","Name":"mouseButton","Default":null}],"Name":"IsMouseButtonPressed","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UserInputType","Name":"gamepadEnum","Default":null}],"Name":"IsNavigationGamepad","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RecenterUserHeadCFrame","tags":[],"Class":"UserInputService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"statusBarSize","Default":null},{"Type":"Vector2","Name":"navBarSize","Default":null},{"Type":"Vector2","Name":"bottomBarSize","Default":null}],"Name":"SendAppUISizes","tags":["RobloxScriptSecurity"],"Class":"UserInputService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"UserInputType","Name":"gamepadEnum","Default":null},{"Type":"bool","Name":"enabled","Default":null}],"Name":"SetNavigationGamepad","tags":[],"Class":"UserInputService","type":"Function"},{"Arguments":[{"Name":"acceleration","Type":"Instance"}],"Name":"DeviceAccelerationChanged","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"gravity","Type":"Instance"}],"Name":"DeviceGravityChanged","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"rotation","Type":"Instance"},{"Name":"cframe","Type":"CoordinateFrame"}],"Name":"DeviceRotationChanged","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"gamepadNum","Type":"UserInputType"}],"Name":"GamepadConnected","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"gamepadNum","Type":"UserInputType"}],"Name":"GamepadDisconnected","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"input","Type":"Instance"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"InputBegan","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"input","Type":"Instance"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"InputChanged","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"input","Type":"Instance"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"InputEnded","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[],"Name":"JumpRequest","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"lastInputType","Type":"UserInputType"}],"Name":"LastInputTypeChanged","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"textboxReleased","Type":"Instance"}],"Name":"TextBoxFocusReleased","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"textboxFocused","Type":"Instance"}],"Name":"TextBoxFocused","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touch","Type":"Instance"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchEnded","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"state","Type":"UserInputState"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchLongPress","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touch","Type":"Instance"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchMoved","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"totalTranslation","Type":"Vector2"},{"Name":"velocity","Type":"Vector2"},{"Name":"state","Type":"UserInputState"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchPan","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"scale","Type":"float"},{"Name":"velocity","Type":"float"},{"Name":"state","Type":"UserInputState"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchPinch","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"rotation","Type":"float"},{"Name":"velocity","Type":"float"},{"Name":"state","Type":"UserInputState"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchRotate","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touch","Type":"Instance"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchStarted","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"swipeDirection","Type":"SwipeDirection"},{"Name":"numberOfTouches","Type":"int"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchSwipe","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"touchPositions","Type":"Array"},{"Name":"gameProcessedEvent","Type":"bool"}],"Name":"TouchTap","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"position","Type":"Vector2"},{"Name":"processedByUI","Type":"bool"}],"Name":"TouchTapInWorld","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[{"Name":"type","Type":"UserCFrame"},{"Name":"value","Type":"CoordinateFrame"}],"Name":"UserCFrameChanged","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[],"Name":"WindowFocusReleased","tags":[],"Class":"UserInputService","type":"Event"},{"Arguments":[],"Name":"WindowFocused","tags":[],"Class":"UserInputService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"VRService","tags":[]},{"ValueType":"UserCFrame","type":"Property","Name":"GuiInputUserCFrame","tags":[],"Class":"VRService"},{"ValueType":"string","type":"Property","Name":"VRDeviceName","tags":["RobloxScriptSecurity","readonly"],"Class":"VRService"},{"ValueType":"bool","type":"Property","Name":"VREnabled","tags":["readonly"],"Class":"VRService"},{"ReturnType":"VRTouchpadMode","Arguments":[{"Type":"VRTouchpad","Name":"pad","Default":null}],"Name":"GetTouchpadMode","tags":[],"Class":"VRService","type":"Function"},{"ReturnType":"CoordinateFrame","Arguments":[{"Type":"UserCFrame","Name":"type","Default":null}],"Name":"GetUserCFrame","tags":[],"Class":"VRService","type":"Function"},{"ReturnType":"bool","Arguments":[{"Type":"UserCFrame","Name":"type","Default":null}],"Name":"GetUserCFrameEnabled","tags":[],"Class":"VRService","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"RecenterUserHeadCFrame","tags":[],"Class":"VRService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"CoordinateFrame","Name":"cframe","Default":null},{"Type":"UserCFrame","Name":"inputUserCFrame","Default":null}],"Name":"RequestNavigation","tags":[],"Class":"VRService","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"VRTouchpad","Name":"pad","Default":null},{"Type":"VRTouchpadMode","Name":"mode","Default":null}],"Name":"SetTouchpadMode","tags":[],"Class":"VRService","type":"Function"},{"Arguments":[{"Name":"cframe","Type":"CoordinateFrame"},{"Name":"inputUserCFrame","Type":"UserCFrame"}],"Name":"NavigationRequested","tags":[],"Class":"VRService","type":"Event"},{"Arguments":[{"Name":"pad","Type":"VRTouchpad"},{"Name":"mode","Type":"VRTouchpadMode"}],"Name":"TouchpadModeChanged","tags":[],"Class":"VRService","type":"Event"},{"Arguments":[{"Name":"type","Type":"UserCFrame"},{"Name":"value","Type":"CoordinateFrame"}],"Name":"UserCFrameChanged","tags":[],"Class":"VRService","type":"Event"},{"Arguments":[{"Name":"type","Type":"UserCFrame"},{"Name":"enabled","Type":"bool"}],"Name":"UserCFrameEnabled","tags":[],"Class":"VRService","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"Vector3Value","tags":[]},{"ValueType":"Vector3","type":"Property","Name":"Value","tags":[],"Class":"Vector3Value"},{"Arguments":[{"Name":"value","Type":"Vector3"}],"Name":"Changed","tags":[],"Class":"Vector3Value","type":"Event"},{"Arguments":[{"Name":"value","Type":"Vector3"}],"Name":"changed","tags":["deprecated"],"Class":"Vector3Value","type":"Event"},{"Superclass":"Instance","type":"Class","Name":"VirtualUser","tags":["notCreatable"]},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"Button1Down","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"Button1Up","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"Button2Down","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"Button2Up","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"CaptureController","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"ClickButton1","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"ClickButton2","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"Vector2","Name":"position","Default":null},{"Type":"CoordinateFrame","Name":"camera","Default":"Identity"}],"Name":"MoveMouse","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"SetKeyDown","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"SetKeyUp","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[],"Name":"StartRecording","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"string","Arguments":[],"Name":"StopRecording","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"ReturnType":"void","Arguments":[{"Type":"string","Name":"key","Default":null}],"Name":"TypeKey","tags":["LocalUserSecurity"],"Class":"VirtualUser","type":"Function"},{"Superclass":"Instance","type":"Class","Name":"Visit","tags":["notCreatable"]},{"Superclass":"Instance","type":"Class","Name":"WeldConstraint","tags":[]},{"ValueType":"bool","type":"Property","Name":"Enabled","tags":[],"Class":"WeldConstraint"},{"ValueType":"Object","type":"Property","Name":"Part0","tags":[],"Class":"WeldConstraint"},{"ValueType":"Object","type":"Property","Name":"Part1","tags":[],"Class":"WeldConstraint"},{"type":"Enum","Name":"AASamples","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":1,"Enum":"AASamples"},{"type":"EnumItem","Name":"4","tags":[],"Value":4,"Enum":"AASamples"},{"type":"EnumItem","Name":"8","tags":[],"Value":8,"Enum":"AASamples"},{"type":"Enum","Name":"AccessType","tags":[]},{"type":"EnumItem","Name":"Me","tags":[],"Value":0,"Enum":"AccessType"},{"type":"EnumItem","Name":"Friends","tags":[],"Value":1,"Enum":"AccessType"},{"type":"EnumItem","Name":"Everyone","tags":[],"Value":2,"Enum":"AccessType"},{"type":"EnumItem","Name":"InviteOnly","tags":[],"Value":3,"Enum":"AccessType"},{"type":"Enum","Name":"ActionType","tags":[]},{"type":"EnumItem","Name":"Nothing","tags":[],"Value":0,"Enum":"ActionType"},{"type":"EnumItem","Name":"Pause","tags":[],"Value":1,"Enum":"ActionType"},{"type":"EnumItem","Name":"Lose","tags":[],"Value":2,"Enum":"ActionType"},{"type":"EnumItem","Name":"Draw","tags":[],"Value":3,"Enum":"ActionType"},{"type":"EnumItem","Name":"Win","tags":[],"Value":4,"Enum":"ActionType"},{"type":"Enum","Name":"ActuatorRelativeTo","tags":[]},{"type":"EnumItem","Name":"Attachment0","tags":[],"Value":0,"Enum":"ActuatorRelativeTo"},{"type":"EnumItem","Name":"Attachment1","tags":[],"Value":1,"Enum":"ActuatorRelativeTo"},{"type":"EnumItem","Name":"World","tags":[],"Value":2,"Enum":"ActuatorRelativeTo"},{"type":"Enum","Name":"ActuatorType","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"ActuatorType"},{"type":"EnumItem","Name":"Motor","tags":[],"Value":1,"Enum":"ActuatorType"},{"type":"EnumItem","Name":"Servo","tags":[],"Value":2,"Enum":"ActuatorType"},{"type":"Enum","Name":"AnimationPriority","tags":[]},{"type":"EnumItem","Name":"Idle","tags":[],"Value":0,"Enum":"AnimationPriority"},{"type":"EnumItem","Name":"Movement","tags":[],"Value":1,"Enum":"AnimationPriority"},{"type":"EnumItem","Name":"Action","tags":[],"Value":2,"Enum":"AnimationPriority"},{"type":"EnumItem","Name":"Core","tags":[],"Value":1000,"Enum":"AnimationPriority"},{"type":"Enum","Name":"Antialiasing","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":0,"Enum":"Antialiasing"},{"type":"EnumItem","Name":"Off","tags":[],"Value":2,"Enum":"Antialiasing"},{"type":"EnumItem","Name":"On","tags":[],"Value":1,"Enum":"Antialiasing"},{"type":"Enum","Name":"AspectType","tags":[]},{"type":"EnumItem","Name":"FitWithinMaxSize","tags":[],"Value":0,"Enum":"AspectType"},{"type":"EnumItem","Name":"ScaleWithParentSize","tags":[],"Value":1,"Enum":"AspectType"},{"type":"Enum","Name":"AssetType","tags":[]},{"type":"EnumItem","Name":"Image","tags":[],"Value":1,"Enum":"AssetType"},{"type":"EnumItem","Name":"TeeShirt","tags":[],"Value":2,"Enum":"AssetType"},{"type":"EnumItem","Name":"Audio","tags":[],"Value":3,"Enum":"AssetType"},{"type":"EnumItem","Name":"Mesh","tags":[],"Value":4,"Enum":"AssetType"},{"type":"EnumItem","Name":"Lua","tags":[],"Value":5,"Enum":"AssetType"},{"type":"EnumItem","Name":"Hat","tags":[],"Value":8,"Enum":"AssetType"},{"type":"EnumItem","Name":"Place","tags":[],"Value":9,"Enum":"AssetType"},{"type":"EnumItem","Name":"Model","tags":[],"Value":10,"Enum":"AssetType"},{"type":"EnumItem","Name":"Shirt","tags":[],"Value":11,"Enum":"AssetType"},{"type":"EnumItem","Name":"Pants","tags":[],"Value":12,"Enum":"AssetType"},{"type":"EnumItem","Name":"Decal","tags":[],"Value":13,"Enum":"AssetType"},{"type":"EnumItem","Name":"Head","tags":[],"Value":17,"Enum":"AssetType"},{"type":"EnumItem","Name":"Face","tags":[],"Value":18,"Enum":"AssetType"},{"type":"EnumItem","Name":"Gear","tags":[],"Value":19,"Enum":"AssetType"},{"type":"EnumItem","Name":"Badge","tags":[],"Value":21,"Enum":"AssetType"},{"type":"EnumItem","Name":"Animation","tags":[],"Value":24,"Enum":"AssetType"},{"type":"EnumItem","Name":"Torso","tags":[],"Value":27,"Enum":"AssetType"},{"type":"EnumItem","Name":"RightArm","tags":[],"Value":28,"Enum":"AssetType"},{"type":"EnumItem","Name":"LeftArm","tags":[],"Value":29,"Enum":"AssetType"},{"type":"EnumItem","Name":"LeftLeg","tags":[],"Value":30,"Enum":"AssetType"},{"type":"EnumItem","Name":"RightLeg","tags":[],"Value":31,"Enum":"AssetType"},{"type":"EnumItem","Name":"Package","tags":[],"Value":32,"Enum":"AssetType"},{"type":"EnumItem","Name":"GamePass","tags":[],"Value":34,"Enum":"AssetType"},{"type":"EnumItem","Name":"Plugin","tags":[],"Value":38,"Enum":"AssetType"},{"type":"EnumItem","Name":"MeshPart","tags":[],"Value":40,"Enum":"AssetType"},{"type":"EnumItem","Name":"HairAccessory","tags":[],"Value":41,"Enum":"AssetType"},{"type":"EnumItem","Name":"FaceAccessory","tags":[],"Value":42,"Enum":"AssetType"},{"type":"EnumItem","Name":"NeckAccessory","tags":[],"Value":43,"Enum":"AssetType"},{"type":"EnumItem","Name":"ShoulderAccessory","tags":[],"Value":44,"Enum":"AssetType"},{"type":"EnumItem","Name":"FrontAccessory","tags":[],"Value":45,"Enum":"AssetType"},{"type":"EnumItem","Name":"BackAccessory","tags":[],"Value":46,"Enum":"AssetType"},{"type":"EnumItem","Name":"WaistAccessory","tags":[],"Value":47,"Enum":"AssetType"},{"type":"EnumItem","Name":"ClimbAnimation","tags":[],"Value":48,"Enum":"AssetType"},{"type":"EnumItem","Name":"DeathAnimation","tags":[],"Value":49,"Enum":"AssetType"},{"type":"EnumItem","Name":"FallAnimation","tags":[],"Value":50,"Enum":"AssetType"},{"type":"EnumItem","Name":"IdleAnimation","tags":[],"Value":51,"Enum":"AssetType"},{"type":"EnumItem","Name":"JumpAnimation","tags":[],"Value":52,"Enum":"AssetType"},{"type":"EnumItem","Name":"RunAnimation","tags":[],"Value":53,"Enum":"AssetType"},{"type":"EnumItem","Name":"SwimAnimation","tags":[],"Value":54,"Enum":"AssetType"},{"type":"EnumItem","Name":"WalkAnimation","tags":[],"Value":55,"Enum":"AssetType"},{"type":"EnumItem","Name":"PoseAnimation","tags":[],"Value":56,"Enum":"AssetType"},{"type":"EnumItem","Name":"EarAccessory","tags":[],"Value":57,"Enum":"AssetType"},{"type":"EnumItem","Name":"EyeAccessory","tags":[],"Value":58,"Enum":"AssetType"},{"type":"Enum","Name":"Axis","tags":[]},{"type":"EnumItem","Name":"X","tags":[],"Value":0,"Enum":"Axis"},{"type":"EnumItem","Name":"Y","tags":[],"Value":1,"Enum":"Axis"},{"type":"EnumItem","Name":"Z","tags":[],"Value":2,"Enum":"Axis"},{"type":"Enum","Name":"BinType","tags":[]},{"type":"EnumItem","Name":"Script","tags":[],"Value":0,"Enum":"BinType"},{"type":"EnumItem","Name":"GameTool","tags":[],"Value":1,"Enum":"BinType"},{"type":"EnumItem","Name":"Grab","tags":[],"Value":2,"Enum":"BinType"},{"type":"EnumItem","Name":"Clone","tags":[],"Value":3,"Enum":"BinType"},{"type":"EnumItem","Name":"Hammer","tags":[],"Value":4,"Enum":"BinType"},{"type":"Enum","Name":"BodyPart","tags":[]},{"type":"EnumItem","Name":"Head","tags":[],"Value":0,"Enum":"BodyPart"},{"type":"EnumItem","Name":"Torso","tags":[],"Value":1,"Enum":"BodyPart"},{"type":"EnumItem","Name":"LeftArm","tags":[],"Value":2,"Enum":"BodyPart"},{"type":"EnumItem","Name":"RightArm","tags":[],"Value":3,"Enum":"BodyPart"},{"type":"EnumItem","Name":"LeftLeg","tags":[],"Value":4,"Enum":"BodyPart"},{"type":"EnumItem","Name":"RightLeg","tags":[],"Value":5,"Enum":"BodyPart"},{"type":"Enum","Name":"Button","tags":[]},{"type":"EnumItem","Name":"Jump","tags":[],"Value":32,"Enum":"Button"},{"type":"EnumItem","Name":"Dismount","tags":[],"Value":8,"Enum":"Button"},{"type":"Enum","Name":"ButtonStyle","tags":[]},{"type":"EnumItem","Name":"Custom","tags":[],"Value":0,"Enum":"ButtonStyle"},{"type":"EnumItem","Name":"RobloxButtonDefault","tags":[],"Value":1,"Enum":"ButtonStyle"},{"type":"EnumItem","Name":"RobloxButton","tags":[],"Value":2,"Enum":"ButtonStyle"},{"type":"EnumItem","Name":"RobloxRoundButton","tags":[],"Value":3,"Enum":"ButtonStyle"},{"type":"EnumItem","Name":"RobloxRoundDefaultButton","tags":[],"Value":4,"Enum":"ButtonStyle"},{"type":"EnumItem","Name":"RobloxRoundDropdownButton","tags":[],"Value":5,"Enum":"ButtonStyle"},{"type":"Enum","Name":"CameraMode","tags":[]},{"type":"EnumItem","Name":"Classic","tags":[],"Value":0,"Enum":"CameraMode"},{"type":"EnumItem","Name":"LockFirstPerson","tags":[],"Value":1,"Enum":"CameraMode"},{"type":"Enum","Name":"CameraPanMode","tags":[]},{"type":"EnumItem","Name":"Classic","tags":[],"Value":0,"Enum":"CameraPanMode"},{"type":"EnumItem","Name":"EdgeBump","tags":[],"Value":1,"Enum":"CameraPanMode"},{"type":"Enum","Name":"CameraType","tags":[]},{"type":"EnumItem","Name":"Fixed","tags":[],"Value":0,"Enum":"CameraType"},{"type":"EnumItem","Name":"Watch","tags":[],"Value":2,"Enum":"CameraType"},{"type":"EnumItem","Name":"Attach","tags":[],"Value":1,"Enum":"CameraType"},{"type":"EnumItem","Name":"Track","tags":[],"Value":3,"Enum":"CameraType"},{"type":"EnumItem","Name":"Follow","tags":[],"Value":4,"Enum":"CameraType"},{"type":"EnumItem","Name":"Custom","tags":[],"Value":5,"Enum":"CameraType"},{"type":"EnumItem","Name":"Scriptable","tags":[],"Value":6,"Enum":"CameraType"},{"type":"EnumItem","Name":"Orbital","tags":[],"Value":7,"Enum":"CameraType"},{"type":"Enum","Name":"CellBlock","tags":[]},{"type":"EnumItem","Name":"Solid","tags":[],"Value":0,"Enum":"CellBlock"},{"type":"EnumItem","Name":"VerticalWedge","tags":[],"Value":1,"Enum":"CellBlock"},{"type":"EnumItem","Name":"CornerWedge","tags":[],"Value":2,"Enum":"CellBlock"},{"type":"EnumItem","Name":"InverseCornerWedge","tags":[],"Value":3,"Enum":"CellBlock"},{"type":"EnumItem","Name":"HorizontalWedge","tags":[],"Value":4,"Enum":"CellBlock"},{"type":"Enum","Name":"CellMaterial","tags":[]},{"type":"EnumItem","Name":"Empty","tags":[],"Value":0,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Grass","tags":[],"Value":1,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Sand","tags":[],"Value":2,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Brick","tags":[],"Value":3,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Granite","tags":[],"Value":4,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Asphalt","tags":[],"Value":5,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Iron","tags":[],"Value":6,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Aluminum","tags":[],"Value":7,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Gold","tags":[],"Value":8,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"WoodPlank","tags":[],"Value":9,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"WoodLog","tags":[],"Value":10,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Gravel","tags":[],"Value":11,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"CinderBlock","tags":[],"Value":12,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"MossyStone","tags":[],"Value":13,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Cement","tags":[],"Value":14,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"RedPlastic","tags":[],"Value":15,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"BluePlastic","tags":[],"Value":16,"Enum":"CellMaterial"},{"type":"EnumItem","Name":"Water","tags":[],"Value":17,"Enum":"CellMaterial"},{"type":"Enum","Name":"CellOrientation","tags":[]},{"type":"EnumItem","Name":"NegZ","tags":[],"Value":0,"Enum":"CellOrientation"},{"type":"EnumItem","Name":"X","tags":[],"Value":1,"Enum":"CellOrientation"},{"type":"EnumItem","Name":"Z","tags":[],"Value":2,"Enum":"CellOrientation"},{"type":"EnumItem","Name":"NegX","tags":[],"Value":3,"Enum":"CellOrientation"},{"type":"Enum","Name":"CenterDialogType","tags":[]},{"type":"EnumItem","Name":"UnsolicitedDialog","tags":[],"Value":1,"Enum":"CenterDialogType"},{"type":"EnumItem","Name":"PlayerInitiatedDialog","tags":[],"Value":2,"Enum":"CenterDialogType"},{"type":"EnumItem","Name":"ModalDialog","tags":[],"Value":3,"Enum":"CenterDialogType"},{"type":"EnumItem","Name":"QuitDialog","tags":[],"Value":4,"Enum":"CenterDialogType"},{"type":"Enum","Name":"ChatColor","tags":[]},{"type":"EnumItem","Name":"Blue","tags":[],"Value":0,"Enum":"ChatColor"},{"type":"EnumItem","Name":"Green","tags":[],"Value":1,"Enum":"ChatColor"},{"type":"EnumItem","Name":"Red","tags":[],"Value":2,"Enum":"ChatColor"},{"type":"EnumItem","Name":"White","tags":[],"Value":3,"Enum":"ChatColor"},{"type":"Enum","Name":"ChatMode","tags":[]},{"type":"EnumItem","Name":"Menu","tags":[],"Value":0,"Enum":"ChatMode"},{"type":"EnumItem","Name":"TextAndMenu","tags":[],"Value":1,"Enum":"ChatMode"},{"type":"Enum","Name":"ChatPrivacyMode","tags":[]},{"type":"EnumItem","Name":"AllUsers","tags":[],"Value":0,"Enum":"ChatPrivacyMode"},{"type":"EnumItem","Name":"NoOne","tags":[],"Value":1,"Enum":"ChatPrivacyMode"},{"type":"EnumItem","Name":"Friends","tags":[],"Value":2,"Enum":"ChatPrivacyMode"},{"type":"Enum","Name":"ChatStyle","tags":[]},{"type":"EnumItem","Name":"Classic","tags":[],"Value":0,"Enum":"ChatStyle"},{"type":"EnumItem","Name":"Bubble","tags":[],"Value":1,"Enum":"ChatStyle"},{"type":"EnumItem","Name":"ClassicAndBubble","tags":[],"Value":2,"Enum":"ChatStyle"},{"type":"Enum","Name":"CollisionFidelity","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"CollisionFidelity"},{"type":"EnumItem","Name":"Hull","tags":[],"Value":1,"Enum":"CollisionFidelity"},{"type":"EnumItem","Name":"Box","tags":[],"Value":2,"Enum":"CollisionFidelity"},{"type":"Enum","Name":"ComputerCameraMovementMode","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"ComputerCameraMovementMode"},{"type":"EnumItem","Name":"Follow","tags":[],"Value":2,"Enum":"ComputerCameraMovementMode"},{"type":"EnumItem","Name":"Classic","tags":[],"Value":1,"Enum":"ComputerCameraMovementMode"},{"type":"EnumItem","Name":"Orbital","tags":[],"Value":3,"Enum":"ComputerCameraMovementMode"},{"type":"Enum","Name":"ComputerMovementMode","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"ComputerMovementMode"},{"type":"EnumItem","Name":"KeyboardMouse","tags":[],"Value":1,"Enum":"ComputerMovementMode"},{"type":"EnumItem","Name":"ClickToMove","tags":[],"Value":2,"Enum":"ComputerMovementMode"},{"type":"Enum","Name":"ConcurrencyModel","tags":[]},{"type":"EnumItem","Name":"Serial","tags":[],"Value":0,"Enum":"ConcurrencyModel"},{"type":"EnumItem","Name":"Safe","tags":[],"Value":1,"Enum":"ConcurrencyModel"},{"type":"EnumItem","Name":"Logical","tags":[],"Value":2,"Enum":"ConcurrencyModel"},{"type":"EnumItem","Name":"Empirical","tags":[],"Value":3,"Enum":"ConcurrencyModel"},{"type":"Enum","Name":"ConnectionState","tags":[]},{"type":"EnumItem","Name":"Connected","tags":[],"Value":0,"Enum":"ConnectionState"},{"type":"EnumItem","Name":"Disconnected","tags":[],"Value":1,"Enum":"ConnectionState"},{"type":"Enum","Name":"ContextActionPriority","tags":[]},{"type":"EnumItem","Name":"Low","tags":[],"Value":1000,"Enum":"ContextActionPriority"},{"type":"EnumItem","Name":"Medium","tags":[],"Value":2000,"Enum":"ContextActionPriority"},{"type":"EnumItem","Name":"Default","tags":[],"Value":2000,"Enum":"ContextActionPriority"},{"type":"EnumItem","Name":"High","tags":[],"Value":3000,"Enum":"ContextActionPriority"},{"type":"Enum","Name":"ContextActionResult","tags":[]},{"type":"EnumItem","Name":"Pass","tags":[],"Value":1,"Enum":"ContextActionResult"},{"type":"EnumItem","Name":"Sink","tags":[],"Value":0,"Enum":"ContextActionResult"},{"type":"Enum","Name":"ControlMode","tags":[]},{"type":"EnumItem","Name":"MouseLockSwitch","tags":[],"Value":1,"Enum":"ControlMode"},{"type":"EnumItem","Name":"Classic","tags":[],"Value":0,"Enum":"ControlMode"},{"type":"Enum","Name":"CoreGuiType","tags":[]},{"type":"EnumItem","Name":"PlayerList","tags":[],"Value":0,"Enum":"CoreGuiType"},{"type":"EnumItem","Name":"Health","tags":[],"Value":1,"Enum":"CoreGuiType"},{"type":"EnumItem","Name":"Backpack","tags":[],"Value":2,"Enum":"CoreGuiType"},{"type":"EnumItem","Name":"Chat","tags":[],"Value":3,"Enum":"CoreGuiType"},{"type":"EnumItem","Name":"All","tags":[],"Value":4,"Enum":"CoreGuiType"},{"type":"Enum","Name":"CreatorType","tags":[]},{"type":"EnumItem","Name":"User","tags":[],"Value":0,"Enum":"CreatorType"},{"type":"EnumItem","Name":"Group","tags":[],"Value":1,"Enum":"CreatorType"},{"type":"Enum","Name":"CurrencyType","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"CurrencyType"},{"type":"EnumItem","Name":"Robux","tags":[],"Value":1,"Enum":"CurrencyType"},{"type":"EnumItem","Name":"Tix","tags":[],"Value":2,"Enum":"CurrencyType"},{"type":"Enum","Name":"CustomCameraMode","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"CustomCameraMode"},{"type":"EnumItem","Name":"Follow","tags":[],"Value":2,"Enum":"CustomCameraMode"},{"type":"EnumItem","Name":"Classic","tags":[],"Value":1,"Enum":"CustomCameraMode"},{"type":"Enum","Name":"DataStoreRequestType","tags":[]},{"type":"EnumItem","Name":"GetAsync","tags":[],"Value":0,"Enum":"DataStoreRequestType"},{"type":"EnumItem","Name":"SetIncrementAsync","tags":[],"Value":1,"Enum":"DataStoreRequestType"},{"type":"EnumItem","Name":"UpdateAsync","tags":[],"Value":2,"Enum":"DataStoreRequestType"},{"type":"EnumItem","Name":"GetSortedAsync","tags":[],"Value":3,"Enum":"DataStoreRequestType"},{"type":"EnumItem","Name":"SetIncrementSortedAsync","tags":[],"Value":4,"Enum":"DataStoreRequestType"},{"type":"EnumItem","Name":"OnUpdate","tags":[],"Value":5,"Enum":"DataStoreRequestType"},{"type":"Enum","Name":"DevCameraOcclusionMode","tags":[]},{"type":"EnumItem","Name":"Zoom","tags":[],"Value":0,"Enum":"DevCameraOcclusionMode"},{"type":"EnumItem","Name":"Invisicam","tags":[],"Value":1,"Enum":"DevCameraOcclusionMode"},{"type":"Enum","Name":"DevComputerCameraMovementMode","tags":[]},{"type":"EnumItem","Name":"UserChoice","tags":[],"Value":0,"Enum":"DevComputerCameraMovementMode"},{"type":"EnumItem","Name":"Classic","tags":[],"Value":1,"Enum":"DevComputerCameraMovementMode"},{"type":"EnumItem","Name":"Follow","tags":[],"Value":2,"Enum":"DevComputerCameraMovementMode"},{"type":"EnumItem","Name":"Orbital","tags":[],"Value":3,"Enum":"DevComputerCameraMovementMode"},{"type":"Enum","Name":"DevComputerMovementMode","tags":[]},{"type":"EnumItem","Name":"UserChoice","tags":[],"Value":0,"Enum":"DevComputerMovementMode"},{"type":"EnumItem","Name":"KeyboardMouse","tags":[],"Value":1,"Enum":"DevComputerMovementMode"},{"type":"EnumItem","Name":"ClickToMove","tags":[],"Value":2,"Enum":"DevComputerMovementMode"},{"type":"EnumItem","Name":"Scriptable","tags":[],"Value":3,"Enum":"DevComputerMovementMode"},{"type":"Enum","Name":"DevTouchCameraMovementMode","tags":[]},{"type":"EnumItem","Name":"UserChoice","tags":[],"Value":0,"Enum":"DevTouchCameraMovementMode"},{"type":"EnumItem","Name":"Classic","tags":[],"Value":1,"Enum":"DevTouchCameraMovementMode"},{"type":"EnumItem","Name":"Follow","tags":[],"Value":2,"Enum":"DevTouchCameraMovementMode"},{"type":"EnumItem","Name":"Orbital","tags":[],"Value":3,"Enum":"DevTouchCameraMovementMode"},{"type":"Enum","Name":"DevTouchMovementMode","tags":[]},{"type":"EnumItem","Name":"UserChoice","tags":[],"Value":0,"Enum":"DevTouchMovementMode"},{"type":"EnumItem","Name":"Thumbstick","tags":[],"Value":1,"Enum":"DevTouchMovementMode"},{"type":"EnumItem","Name":"DPad","tags":[],"Value":2,"Enum":"DevTouchMovementMode"},{"type":"EnumItem","Name":"Thumbpad","tags":[],"Value":3,"Enum":"DevTouchMovementMode"},{"type":"EnumItem","Name":"ClickToMove","tags":[],"Value":4,"Enum":"DevTouchMovementMode"},{"type":"EnumItem","Name":"Scriptable","tags":[],"Value":5,"Enum":"DevTouchMovementMode"},{"type":"EnumItem","Name":"DynamicThumbstick","tags":[],"Value":6,"Enum":"DevTouchMovementMode"},{"type":"Enum","Name":"DeveloperMemoryTag","tags":[]},{"type":"EnumItem","Name":"Internal","tags":[],"Value":0,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"HttpCache","tags":[],"Value":1,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Instances","tags":[],"Value":2,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Signals","tags":[],"Value":3,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"LuaHeap","tags":[],"Value":4,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Script","tags":[],"Value":5,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"PhysicsCollision","tags":[],"Value":6,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"PhysicsParts","tags":[],"Value":7,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsSolidModels","tags":[],"Value":8,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsMeshParts","tags":[],"Value":9,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsParticles","tags":[],"Value":10,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsParts","tags":[],"Value":11,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsSpatialHash","tags":[],"Value":12,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsTerrain","tags":[],"Value":13,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsTexture","tags":[],"Value":14,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"GraphicsTextureCharacter","tags":[],"Value":15,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Sounds","tags":[],"Value":16,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"StreamingSounds","tags":[],"Value":17,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"TerrainVoxels","tags":[],"Value":18,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Gui","tags":[],"Value":20,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Animation","tags":[],"Value":21,"Enum":"DeveloperMemoryTag"},{"type":"EnumItem","Name":"Navigation","tags":[],"Value":22,"Enum":"DeveloperMemoryTag"},{"type":"Enum","Name":"DialogBehaviorType","tags":[]},{"type":"EnumItem","Name":"SinglePlayer","tags":[],"Value":0,"Enum":"DialogBehaviorType"},{"type":"EnumItem","Name":"MultiplePlayers","tags":[],"Value":1,"Enum":"DialogBehaviorType"},{"type":"Enum","Name":"DialogPurpose","tags":[]},{"type":"EnumItem","Name":"Quest","tags":[],"Value":0,"Enum":"DialogPurpose"},{"type":"EnumItem","Name":"Help","tags":[],"Value":1,"Enum":"DialogPurpose"},{"type":"EnumItem","Name":"Shop","tags":[],"Value":2,"Enum":"DialogPurpose"},{"type":"Enum","Name":"DialogTone","tags":[]},{"type":"EnumItem","Name":"Neutral","tags":[],"Value":0,"Enum":"DialogTone"},{"type":"EnumItem","Name":"Friendly","tags":[],"Value":1,"Enum":"DialogTone"},{"type":"EnumItem","Name":"Enemy","tags":[],"Value":2,"Enum":"DialogTone"},{"type":"Enum","Name":"DominantAxis","tags":[]},{"type":"EnumItem","Name":"Width","tags":[],"Value":0,"Enum":"DominantAxis"},{"type":"EnumItem","Name":"Height","tags":[],"Value":1,"Enum":"DominantAxis"},{"type":"Enum","Name":"EasingDirection","tags":[]},{"type":"EnumItem","Name":"In","tags":[],"Value":0,"Enum":"EasingDirection"},{"type":"EnumItem","Name":"Out","tags":[],"Value":1,"Enum":"EasingDirection"},{"type":"EnumItem","Name":"InOut","tags":[],"Value":2,"Enum":"EasingDirection"},{"type":"Enum","Name":"EasingStyle","tags":[]},{"type":"EnumItem","Name":"Linear","tags":[],"Value":0,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Sine","tags":[],"Value":1,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Back","tags":[],"Value":2,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Quad","tags":[],"Value":3,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Quart","tags":[],"Value":4,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Quint","tags":[],"Value":5,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Bounce","tags":[],"Value":6,"Enum":"EasingStyle"},{"type":"EnumItem","Name":"Elastic","tags":[],"Value":7,"Enum":"EasingStyle"},{"type":"Enum","Name":"EnviromentalPhysicsThrottle","tags":[]},{"type":"EnumItem","Name":"DefaultAuto","tags":[],"Value":0,"Enum":"EnviromentalPhysicsThrottle"},{"type":"EnumItem","Name":"Disabled","tags":[],"Value":1,"Enum":"EnviromentalPhysicsThrottle"},{"type":"EnumItem","Name":"Always","tags":[],"Value":2,"Enum":"EnviromentalPhysicsThrottle"},{"type":"EnumItem","Name":"Skip2","tags":[],"Value":3,"Enum":"EnviromentalPhysicsThrottle"},{"type":"EnumItem","Name":"Skip4","tags":[],"Value":4,"Enum":"EnviromentalPhysicsThrottle"},{"type":"EnumItem","Name":"Skip8","tags":[],"Value":5,"Enum":"EnviromentalPhysicsThrottle"},{"type":"EnumItem","Name":"Skip16","tags":[],"Value":6,"Enum":"EnviromentalPhysicsThrottle"},{"type":"Enum","Name":"ErrorReporting","tags":[]},{"type":"EnumItem","Name":"DontReport","tags":[],"Value":0,"Enum":"ErrorReporting"},{"type":"EnumItem","Name":"Prompt","tags":[],"Value":1,"Enum":"ErrorReporting"},{"type":"EnumItem","Name":"Report","tags":[],"Value":2,"Enum":"ErrorReporting"},{"type":"Enum","Name":"ExplosionType","tags":[]},{"type":"EnumItem","Name":"NoCraters","tags":[],"Value":0,"Enum":"ExplosionType"},{"type":"EnumItem","Name":"Craters","tags":[],"Value":1,"Enum":"ExplosionType"},{"type":"EnumItem","Name":"CratersAndDebris","tags":[],"Value":2,"Enum":"ExplosionType"},{"type":"Enum","Name":"FillDirection","tags":[]},{"type":"EnumItem","Name":"Horizontal","tags":[],"Value":0,"Enum":"FillDirection"},{"type":"EnumItem","Name":"Vertical","tags":[],"Value":1,"Enum":"FillDirection"},{"type":"Enum","Name":"FilterResult","tags":[]},{"type":"EnumItem","Name":"Rejected","tags":[],"Value":1,"Enum":"FilterResult"},{"type":"EnumItem","Name":"Accepted","tags":[],"Value":0,"Enum":"FilterResult"},{"type":"Enum","Name":"Font","tags":[]},{"type":"EnumItem","Name":"Legacy","tags":[],"Value":0,"Enum":"Font"},{"type":"EnumItem","Name":"Arial","tags":[],"Value":1,"Enum":"Font"},{"type":"EnumItem","Name":"ArialBold","tags":[],"Value":2,"Enum":"Font"},{"type":"EnumItem","Name":"SourceSans","tags":[],"Value":3,"Enum":"Font"},{"type":"EnumItem","Name":"SourceSansBold","tags":[],"Value":4,"Enum":"Font"},{"type":"EnumItem","Name":"SourceSansSemibold","tags":[],"Value":16,"Enum":"Font"},{"type":"EnumItem","Name":"SourceSansLight","tags":[],"Value":5,"Enum":"Font"},{"type":"EnumItem","Name":"SourceSansItalic","tags":[],"Value":6,"Enum":"Font"},{"type":"EnumItem","Name":"Bodoni","tags":[],"Value":7,"Enum":"Font"},{"type":"EnumItem","Name":"Garamond","tags":[],"Value":8,"Enum":"Font"},{"type":"EnumItem","Name":"Cartoon","tags":[],"Value":9,"Enum":"Font"},{"type":"EnumItem","Name":"Code","tags":[],"Value":10,"Enum":"Font"},{"type":"EnumItem","Name":"Highway","tags":[],"Value":11,"Enum":"Font"},{"type":"EnumItem","Name":"SciFi","tags":[],"Value":12,"Enum":"Font"},{"type":"EnumItem","Name":"Arcade","tags":[],"Value":13,"Enum":"Font"},{"type":"EnumItem","Name":"Fantasy","tags":[],"Value":14,"Enum":"Font"},{"type":"EnumItem","Name":"Antique","tags":[],"Value":15,"Enum":"Font"},{"type":"Enum","Name":"FontSize","tags":[]},{"type":"EnumItem","Name":"Size8","tags":[],"Value":0,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size9","tags":[],"Value":1,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size10","tags":[],"Value":2,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size11","tags":[],"Value":3,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size12","tags":[],"Value":4,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size14","tags":[],"Value":5,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size18","tags":[],"Value":6,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size24","tags":[],"Value":7,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size36","tags":[],"Value":8,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size48","tags":[],"Value":9,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size28","tags":[],"Value":10,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size32","tags":[],"Value":11,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size42","tags":[],"Value":12,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size60","tags":[],"Value":13,"Enum":"FontSize"},{"type":"EnumItem","Name":"Size96","tags":[],"Value":14,"Enum":"FontSize"},{"type":"Enum","Name":"FormFactor","tags":[]},{"type":"EnumItem","Name":"Symmetric","tags":[],"Value":0,"Enum":"FormFactor"},{"type":"EnumItem","Name":"Brick","tags":[],"Value":1,"Enum":"FormFactor"},{"type":"EnumItem","Name":"Plate","tags":[],"Value":2,"Enum":"FormFactor"},{"type":"EnumItem","Name":"Custom","tags":[],"Value":3,"Enum":"FormFactor"},{"type":"Enum","Name":"FrameStyle","tags":[]},{"type":"EnumItem","Name":"Custom","tags":[],"Value":0,"Enum":"FrameStyle"},{"type":"EnumItem","Name":"ChatBlue","tags":[],"Value":1,"Enum":"FrameStyle"},{"type":"EnumItem","Name":"RobloxSquare","tags":[],"Value":2,"Enum":"FrameStyle"},{"type":"EnumItem","Name":"RobloxRound","tags":[],"Value":3,"Enum":"FrameStyle"},{"type":"EnumItem","Name":"ChatGreen","tags":[],"Value":4,"Enum":"FrameStyle"},{"type":"EnumItem","Name":"ChatRed","tags":[],"Value":5,"Enum":"FrameStyle"},{"type":"EnumItem","Name":"DropShadow","tags":[],"Value":6,"Enum":"FrameStyle"},{"type":"Enum","Name":"FramerateManagerMode","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":0,"Enum":"FramerateManagerMode"},{"type":"EnumItem","Name":"On","tags":[],"Value":1,"Enum":"FramerateManagerMode"},{"type":"EnumItem","Name":"Off","tags":[],"Value":2,"Enum":"FramerateManagerMode"},{"type":"Enum","Name":"FriendRequestEvent","tags":[]},{"type":"EnumItem","Name":"Issue","tags":[],"Value":0,"Enum":"FriendRequestEvent"},{"type":"EnumItem","Name":"Revoke","tags":[],"Value":1,"Enum":"FriendRequestEvent"},{"type":"EnumItem","Name":"Accept","tags":[],"Value":2,"Enum":"FriendRequestEvent"},{"type":"EnumItem","Name":"Deny","tags":[],"Value":3,"Enum":"FriendRequestEvent"},{"type":"Enum","Name":"FriendStatus","tags":[]},{"type":"EnumItem","Name":"Unknown","tags":[],"Value":0,"Enum":"FriendStatus"},{"type":"EnumItem","Name":"NotFriend","tags":[],"Value":1,"Enum":"FriendStatus"},{"type":"EnumItem","Name":"Friend","tags":[],"Value":2,"Enum":"FriendStatus"},{"type":"EnumItem","Name":"FriendRequestSent","tags":[],"Value":3,"Enum":"FriendStatus"},{"type":"EnumItem","Name":"FriendRequestReceived","tags":[],"Value":4,"Enum":"FriendStatus"},{"type":"Enum","Name":"FunctionalTestResult","tags":[]},{"type":"EnumItem","Name":"Passed","tags":[],"Value":0,"Enum":"FunctionalTestResult"},{"type":"EnumItem","Name":"Warning","tags":[],"Value":1,"Enum":"FunctionalTestResult"},{"type":"EnumItem","Name":"Error","tags":[],"Value":2,"Enum":"FunctionalTestResult"},{"type":"Enum","Name":"GameAvatarType","tags":[]},{"type":"EnumItem","Name":"R6","tags":[],"Value":0,"Enum":"GameAvatarType"},{"type":"EnumItem","Name":"R15","tags":[],"Value":1,"Enum":"GameAvatarType"},{"type":"EnumItem","Name":"PlayerChoice","tags":[],"Value":2,"Enum":"GameAvatarType"},{"type":"Enum","Name":"GearGenreSetting","tags":[]},{"type":"EnumItem","Name":"AllGenres","tags":[],"Value":0,"Enum":"GearGenreSetting"},{"type":"EnumItem","Name":"MatchingGenreOnly","tags":[],"Value":1,"Enum":"GearGenreSetting"},{"type":"Enum","Name":"GearType","tags":[]},{"type":"EnumItem","Name":"MeleeWeapons","tags":[],"Value":0,"Enum":"GearType"},{"type":"EnumItem","Name":"RangedWeapons","tags":[],"Value":1,"Enum":"GearType"},{"type":"EnumItem","Name":"Explosives","tags":[],"Value":2,"Enum":"GearType"},{"type":"EnumItem","Name":"PowerUps","tags":[],"Value":3,"Enum":"GearType"},{"type":"EnumItem","Name":"NavigationEnhancers","tags":[],"Value":4,"Enum":"GearType"},{"type":"EnumItem","Name":"MusicalInstruments","tags":[],"Value":5,"Enum":"GearType"},{"type":"EnumItem","Name":"SocialItems","tags":[],"Value":6,"Enum":"GearType"},{"type":"EnumItem","Name":"BuildingTools","tags":[],"Value":7,"Enum":"GearType"},{"type":"EnumItem","Name":"Transport","tags":[],"Value":8,"Enum":"GearType"},{"type":"Enum","Name":"Genre","tags":[]},{"type":"EnumItem","Name":"All","tags":[],"Value":0,"Enum":"Genre"},{"type":"EnumItem","Name":"TownAndCity","tags":[],"Value":1,"Enum":"Genre"},{"type":"EnumItem","Name":"Fantasy","tags":[],"Value":2,"Enum":"Genre"},{"type":"EnumItem","Name":"SciFi","tags":[],"Value":3,"Enum":"Genre"},{"type":"EnumItem","Name":"Ninja","tags":[],"Value":4,"Enum":"Genre"},{"type":"EnumItem","Name":"Scary","tags":[],"Value":5,"Enum":"Genre"},{"type":"EnumItem","Name":"Pirate","tags":[],"Value":6,"Enum":"Genre"},{"type":"EnumItem","Name":"Adventure","tags":[],"Value":7,"Enum":"Genre"},{"type":"EnumItem","Name":"Sports","tags":[],"Value":8,"Enum":"Genre"},{"type":"EnumItem","Name":"Funny","tags":[],"Value":9,"Enum":"Genre"},{"type":"EnumItem","Name":"WildWest","tags":[],"Value":10,"Enum":"Genre"},{"type":"EnumItem","Name":"War","tags":[],"Value":11,"Enum":"Genre"},{"type":"EnumItem","Name":"SkatePark","tags":[],"Value":12,"Enum":"Genre"},{"type":"EnumItem","Name":"Tutorial","tags":[],"Value":13,"Enum":"Genre"},{"type":"Enum","Name":"GraphicsMode","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":1,"Enum":"GraphicsMode"},{"type":"EnumItem","Name":"Direct3D9","tags":[],"Value":3,"Enum":"GraphicsMode"},{"type":"EnumItem","Name":"Direct3D11","tags":[],"Value":2,"Enum":"GraphicsMode"},{"type":"EnumItem","Name":"OpenGL","tags":[],"Value":4,"Enum":"GraphicsMode"},{"type":"EnumItem","Name":"Metal","tags":[],"Value":5,"Enum":"GraphicsMode"},{"type":"EnumItem","Name":"Vulkan","tags":[],"Value":6,"Enum":"GraphicsMode"},{"type":"EnumItem","Name":"NoGraphics","tags":[],"Value":7,"Enum":"GraphicsMode"},{"type":"Enum","Name":"HandlesStyle","tags":[]},{"type":"EnumItem","Name":"Resize","tags":[],"Value":0,"Enum":"HandlesStyle"},{"type":"EnumItem","Name":"Movement","tags":[],"Value":1,"Enum":"HandlesStyle"},{"type":"Enum","Name":"HorizontalAlignment","tags":[]},{"type":"EnumItem","Name":"Center","tags":[],"Value":0,"Enum":"HorizontalAlignment"},{"type":"EnumItem","Name":"Left","tags":[],"Value":1,"Enum":"HorizontalAlignment"},{"type":"EnumItem","Name":"Right","tags":[],"Value":2,"Enum":"HorizontalAlignment"},{"type":"Enum","Name":"HttpContentType","tags":[]},{"type":"EnumItem","Name":"ApplicationJson","tags":[],"Value":0,"Enum":"HttpContentType"},{"type":"EnumItem","Name":"ApplicationXml","tags":[],"Value":1,"Enum":"HttpContentType"},{"type":"EnumItem","Name":"ApplicationUrlEncoded","tags":[],"Value":2,"Enum":"HttpContentType"},{"type":"EnumItem","Name":"TextPlain","tags":[],"Value":3,"Enum":"HttpContentType"},{"type":"EnumItem","Name":"TextXml","tags":[],"Value":4,"Enum":"HttpContentType"},{"type":"Enum","Name":"HttpRequestType","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"HttpRequestType"},{"type":"EnumItem","Name":"MarketplaceService","tags":[],"Value":2,"Enum":"HttpRequestType"},{"type":"EnumItem","Name":"Players","tags":[],"Value":7,"Enum":"HttpRequestType"},{"type":"EnumItem","Name":"Chat","tags":[],"Value":15,"Enum":"HttpRequestType"},{"type":"EnumItem","Name":"Avatar","tags":[],"Value":16,"Enum":"HttpRequestType"},{"type":"Enum","Name":"HumanoidDisplayDistanceType","tags":[]},{"type":"EnumItem","Name":"Viewer","tags":[],"Value":0,"Enum":"HumanoidDisplayDistanceType"},{"type":"EnumItem","Name":"Subject","tags":[],"Value":1,"Enum":"HumanoidDisplayDistanceType"},{"type":"EnumItem","Name":"None","tags":[],"Value":2,"Enum":"HumanoidDisplayDistanceType"},{"type":"Enum","Name":"HumanoidHealthDisplayType","tags":[]},{"type":"EnumItem","Name":"DisplayWhenDamaged","tags":[],"Value":0,"Enum":"HumanoidHealthDisplayType"},{"type":"EnumItem","Name":"AlwaysOn","tags":[],"Value":1,"Enum":"HumanoidHealthDisplayType"},{"type":"EnumItem","Name":"AlwaysOff","tags":[],"Value":2,"Enum":"HumanoidHealthDisplayType"},{"type":"Enum","Name":"HumanoidRigType","tags":[]},{"type":"EnumItem","Name":"R6","tags":[],"Value":0,"Enum":"HumanoidRigType"},{"type":"EnumItem","Name":"R15","tags":[],"Value":1,"Enum":"HumanoidRigType"},{"type":"Enum","Name":"HumanoidStateType","tags":[]},{"type":"EnumItem","Name":"FallingDown","tags":[],"Value":0,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Running","tags":[],"Value":8,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"RunningNoPhysics","tags":[],"Value":10,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Climbing","tags":[],"Value":12,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"StrafingNoPhysics","tags":[],"Value":11,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Ragdoll","tags":[],"Value":1,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"GettingUp","tags":[],"Value":2,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Jumping","tags":[],"Value":3,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Landed","tags":[],"Value":7,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Flying","tags":[],"Value":6,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Freefall","tags":[],"Value":5,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Seated","tags":[],"Value":13,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"PlatformStanding","tags":[],"Value":14,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Dead","tags":[],"Value":15,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Swimming","tags":[],"Value":4,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"Physics","tags":[],"Value":16,"Enum":"HumanoidStateType"},{"type":"EnumItem","Name":"None","tags":[],"Value":18,"Enum":"HumanoidStateType"},{"type":"Enum","Name":"InOut","tags":[]},{"type":"EnumItem","Name":"Edge","tags":[],"Value":0,"Enum":"InOut"},{"type":"EnumItem","Name":"Inset","tags":[],"Value":1,"Enum":"InOut"},{"type":"EnumItem","Name":"Center","tags":[],"Value":2,"Enum":"InOut"},{"type":"Enum","Name":"InfoType","tags":[]},{"type":"EnumItem","Name":"Asset","tags":[],"Value":0,"Enum":"InfoType"},{"type":"EnumItem","Name":"Product","tags":[],"Value":1,"Enum":"InfoType"},{"type":"EnumItem","Name":"GamePass","tags":[],"Value":2,"Enum":"InfoType"},{"type":"Enum","Name":"InputType","tags":[]},{"type":"EnumItem","Name":"NoInput","tags":[],"Value":0,"Enum":"InputType"},{"type":"EnumItem","Name":"LeftTread","tags":[],"Value":1,"Enum":"InputType"},{"type":"EnumItem","Name":"RightTread","tags":[],"Value":2,"Enum":"InputType"},{"type":"EnumItem","Name":"Steer","tags":[],"Value":3,"Enum":"InputType"},{"type":"EnumItem","Name":"Throttle","tags":[],"Value":4,"Enum":"InputType"},{"type":"EnumItem","Name":"UpDown","tags":[],"Value":6,"Enum":"InputType"},{"type":"EnumItem","Name":"Action1","tags":[],"Value":7,"Enum":"InputType"},{"type":"EnumItem","Name":"Action2","tags":[],"Value":8,"Enum":"InputType"},{"type":"EnumItem","Name":"Action3","tags":[],"Value":9,"Enum":"InputType"},{"type":"EnumItem","Name":"Action4","tags":[],"Value":10,"Enum":"InputType"},{"type":"EnumItem","Name":"Action5","tags":[],"Value":11,"Enum":"InputType"},{"type":"EnumItem","Name":"Constant","tags":[],"Value":12,"Enum":"InputType"},{"type":"EnumItem","Name":"Sin","tags":[],"Value":13,"Enum":"InputType"},{"type":"Enum","Name":"JointCreationMode","tags":[]},{"type":"EnumItem","Name":"All","tags":[],"Value":0,"Enum":"JointCreationMode"},{"type":"EnumItem","Name":"Surface","tags":[],"Value":1,"Enum":"JointCreationMode"},{"type":"EnumItem","Name":"None","tags":[],"Value":2,"Enum":"JointCreationMode"},{"type":"Enum","Name":"JointType","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":28,"Enum":"JointType"},{"type":"EnumItem","Name":"Rotate","tags":[],"Value":7,"Enum":"JointType"},{"type":"EnumItem","Name":"RotateP","tags":[],"Value":8,"Enum":"JointType"},{"type":"EnumItem","Name":"RotateV","tags":[],"Value":9,"Enum":"JointType"},{"type":"EnumItem","Name":"Glue","tags":[],"Value":10,"Enum":"JointType"},{"type":"EnumItem","Name":"Weld","tags":[],"Value":1,"Enum":"JointType"},{"type":"EnumItem","Name":"Snap","tags":[],"Value":3,"Enum":"JointType"},{"type":"Enum","Name":"KeyCode","tags":[]},{"type":"EnumItem","Name":"Unknown","tags":[],"Value":0,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Backspace","tags":[],"Value":8,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Tab","tags":[],"Value":9,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Clear","tags":[],"Value":12,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Return","tags":[],"Value":13,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Pause","tags":[],"Value":19,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Escape","tags":[],"Value":27,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Space","tags":[],"Value":32,"Enum":"KeyCode"},{"type":"EnumItem","Name":"QuotedDouble","tags":[],"Value":34,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Hash","tags":[],"Value":35,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Dollar","tags":[],"Value":36,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Percent","tags":[],"Value":37,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Ampersand","tags":[],"Value":38,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Quote","tags":[],"Value":39,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftParenthesis","tags":[],"Value":40,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightParenthesis","tags":[],"Value":41,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Asterisk","tags":[],"Value":42,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Plus","tags":[],"Value":43,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Comma","tags":[],"Value":44,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Minus","tags":[],"Value":45,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Period","tags":[],"Value":46,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Slash","tags":[],"Value":47,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Zero","tags":[],"Value":48,"Enum":"KeyCode"},{"type":"EnumItem","Name":"One","tags":[],"Value":49,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Two","tags":[],"Value":50,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Three","tags":[],"Value":51,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Four","tags":[],"Value":52,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Five","tags":[],"Value":53,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Six","tags":[],"Value":54,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Seven","tags":[],"Value":55,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Eight","tags":[],"Value":56,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Nine","tags":[],"Value":57,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Colon","tags":[],"Value":58,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Semicolon","tags":[],"Value":59,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LessThan","tags":[],"Value":60,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Equals","tags":[],"Value":61,"Enum":"KeyCode"},{"type":"EnumItem","Name":"GreaterThan","tags":[],"Value":62,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Question","tags":[],"Value":63,"Enum":"KeyCode"},{"type":"EnumItem","Name":"At","tags":[],"Value":64,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftBracket","tags":[],"Value":91,"Enum":"KeyCode"},{"type":"EnumItem","Name":"BackSlash","tags":[],"Value":92,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightBracket","tags":[],"Value":93,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Caret","tags":[],"Value":94,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Underscore","tags":[],"Value":95,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Backquote","tags":[],"Value":96,"Enum":"KeyCode"},{"type":"EnumItem","Name":"A","tags":[],"Value":97,"Enum":"KeyCode"},{"type":"EnumItem","Name":"B","tags":[],"Value":98,"Enum":"KeyCode"},{"type":"EnumItem","Name":"C","tags":[],"Value":99,"Enum":"KeyCode"},{"type":"EnumItem","Name":"D","tags":[],"Value":100,"Enum":"KeyCode"},{"type":"EnumItem","Name":"E","tags":[],"Value":101,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F","tags":[],"Value":102,"Enum":"KeyCode"},{"type":"EnumItem","Name":"G","tags":[],"Value":103,"Enum":"KeyCode"},{"type":"EnumItem","Name":"H","tags":[],"Value":104,"Enum":"KeyCode"},{"type":"EnumItem","Name":"I","tags":[],"Value":105,"Enum":"KeyCode"},{"type":"EnumItem","Name":"J","tags":[],"Value":106,"Enum":"KeyCode"},{"type":"EnumItem","Name":"K","tags":[],"Value":107,"Enum":"KeyCode"},{"type":"EnumItem","Name":"L","tags":[],"Value":108,"Enum":"KeyCode"},{"type":"EnumItem","Name":"M","tags":[],"Value":109,"Enum":"KeyCode"},{"type":"EnumItem","Name":"N","tags":[],"Value":110,"Enum":"KeyCode"},{"type":"EnumItem","Name":"O","tags":[],"Value":111,"Enum":"KeyCode"},{"type":"EnumItem","Name":"P","tags":[],"Value":112,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Q","tags":[],"Value":113,"Enum":"KeyCode"},{"type":"EnumItem","Name":"R","tags":[],"Value":114,"Enum":"KeyCode"},{"type":"EnumItem","Name":"S","tags":[],"Value":115,"Enum":"KeyCode"},{"type":"EnumItem","Name":"T","tags":[],"Value":116,"Enum":"KeyCode"},{"type":"EnumItem","Name":"U","tags":[],"Value":117,"Enum":"KeyCode"},{"type":"EnumItem","Name":"V","tags":[],"Value":118,"Enum":"KeyCode"},{"type":"EnumItem","Name":"W","tags":[],"Value":119,"Enum":"KeyCode"},{"type":"EnumItem","Name":"X","tags":[],"Value":120,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Y","tags":[],"Value":121,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Z","tags":[],"Value":122,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftCurly","tags":[],"Value":123,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Pipe","tags":[],"Value":124,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightCurly","tags":[],"Value":125,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Tilde","tags":[],"Value":126,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Delete","tags":[],"Value":127,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadZero","tags":[],"Value":256,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadOne","tags":[],"Value":257,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadTwo","tags":[],"Value":258,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadThree","tags":[],"Value":259,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadFour","tags":[],"Value":260,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadFive","tags":[],"Value":261,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadSix","tags":[],"Value":262,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadSeven","tags":[],"Value":263,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadEight","tags":[],"Value":264,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadNine","tags":[],"Value":265,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadPeriod","tags":[],"Value":266,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadDivide","tags":[],"Value":267,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadMultiply","tags":[],"Value":268,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadMinus","tags":[],"Value":269,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadPlus","tags":[],"Value":270,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadEnter","tags":[],"Value":271,"Enum":"KeyCode"},{"type":"EnumItem","Name":"KeypadEquals","tags":[],"Value":272,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Up","tags":[],"Value":273,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Down","tags":[],"Value":274,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Right","tags":[],"Value":275,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Left","tags":[],"Value":276,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Insert","tags":[],"Value":277,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Home","tags":[],"Value":278,"Enum":"KeyCode"},{"type":"EnumItem","Name":"End","tags":[],"Value":279,"Enum":"KeyCode"},{"type":"EnumItem","Name":"PageUp","tags":[],"Value":280,"Enum":"KeyCode"},{"type":"EnumItem","Name":"PageDown","tags":[],"Value":281,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftShift","tags":[],"Value":304,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightShift","tags":[],"Value":303,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftMeta","tags":[],"Value":310,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightMeta","tags":[],"Value":309,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftAlt","tags":[],"Value":308,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightAlt","tags":[],"Value":307,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftControl","tags":[],"Value":306,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightControl","tags":[],"Value":305,"Enum":"KeyCode"},{"type":"EnumItem","Name":"CapsLock","tags":[],"Value":301,"Enum":"KeyCode"},{"type":"EnumItem","Name":"NumLock","tags":[],"Value":300,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ScrollLock","tags":[],"Value":302,"Enum":"KeyCode"},{"type":"EnumItem","Name":"LeftSuper","tags":[],"Value":311,"Enum":"KeyCode"},{"type":"EnumItem","Name":"RightSuper","tags":[],"Value":312,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Mode","tags":[],"Value":313,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Compose","tags":[],"Value":314,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Help","tags":[],"Value":315,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Print","tags":[],"Value":316,"Enum":"KeyCode"},{"type":"EnumItem","Name":"SysReq","tags":[],"Value":317,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Break","tags":[],"Value":318,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Menu","tags":[],"Value":319,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Power","tags":[],"Value":320,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Euro","tags":[],"Value":321,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Undo","tags":[],"Value":322,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F1","tags":[],"Value":282,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F2","tags":[],"Value":283,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F3","tags":[],"Value":284,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F4","tags":[],"Value":285,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F5","tags":[],"Value":286,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F6","tags":[],"Value":287,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F7","tags":[],"Value":288,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F8","tags":[],"Value":289,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F9","tags":[],"Value":290,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F10","tags":[],"Value":291,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F11","tags":[],"Value":292,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F12","tags":[],"Value":293,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F13","tags":[],"Value":294,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F14","tags":[],"Value":295,"Enum":"KeyCode"},{"type":"EnumItem","Name":"F15","tags":[],"Value":296,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World0","tags":[],"Value":160,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World1","tags":[],"Value":161,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World2","tags":[],"Value":162,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World3","tags":[],"Value":163,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World4","tags":[],"Value":164,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World5","tags":[],"Value":165,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World6","tags":[],"Value":166,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World7","tags":[],"Value":167,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World8","tags":[],"Value":168,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World9","tags":[],"Value":169,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World10","tags":[],"Value":170,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World11","tags":[],"Value":171,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World12","tags":[],"Value":172,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World13","tags":[],"Value":173,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World14","tags":[],"Value":174,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World15","tags":[],"Value":175,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World16","tags":[],"Value":176,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World17","tags":[],"Value":177,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World18","tags":[],"Value":178,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World19","tags":[],"Value":179,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World20","tags":[],"Value":180,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World21","tags":[],"Value":181,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World22","tags":[],"Value":182,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World23","tags":[],"Value":183,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World24","tags":[],"Value":184,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World25","tags":[],"Value":185,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World26","tags":[],"Value":186,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World27","tags":[],"Value":187,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World28","tags":[],"Value":188,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World29","tags":[],"Value":189,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World30","tags":[],"Value":190,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World31","tags":[],"Value":191,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World32","tags":[],"Value":192,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World33","tags":[],"Value":193,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World34","tags":[],"Value":194,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World35","tags":[],"Value":195,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World36","tags":[],"Value":196,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World37","tags":[],"Value":197,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World38","tags":[],"Value":198,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World39","tags":[],"Value":199,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World40","tags":[],"Value":200,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World41","tags":[],"Value":201,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World42","tags":[],"Value":202,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World43","tags":[],"Value":203,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World44","tags":[],"Value":204,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World45","tags":[],"Value":205,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World46","tags":[],"Value":206,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World47","tags":[],"Value":207,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World48","tags":[],"Value":208,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World49","tags":[],"Value":209,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World50","tags":[],"Value":210,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World51","tags":[],"Value":211,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World52","tags":[],"Value":212,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World53","tags":[],"Value":213,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World54","tags":[],"Value":214,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World55","tags":[],"Value":215,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World56","tags":[],"Value":216,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World57","tags":[],"Value":217,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World58","tags":[],"Value":218,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World59","tags":[],"Value":219,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World60","tags":[],"Value":220,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World61","tags":[],"Value":221,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World62","tags":[],"Value":222,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World63","tags":[],"Value":223,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World64","tags":[],"Value":224,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World65","tags":[],"Value":225,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World66","tags":[],"Value":226,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World67","tags":[],"Value":227,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World68","tags":[],"Value":228,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World69","tags":[],"Value":229,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World70","tags":[],"Value":230,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World71","tags":[],"Value":231,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World72","tags":[],"Value":232,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World73","tags":[],"Value":233,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World74","tags":[],"Value":234,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World75","tags":[],"Value":235,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World76","tags":[],"Value":236,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World77","tags":[],"Value":237,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World78","tags":[],"Value":238,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World79","tags":[],"Value":239,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World80","tags":[],"Value":240,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World81","tags":[],"Value":241,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World82","tags":[],"Value":242,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World83","tags":[],"Value":243,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World84","tags":[],"Value":244,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World85","tags":[],"Value":245,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World86","tags":[],"Value":246,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World87","tags":[],"Value":247,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World88","tags":[],"Value":248,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World89","tags":[],"Value":249,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World90","tags":[],"Value":250,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World91","tags":[],"Value":251,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World92","tags":[],"Value":252,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World93","tags":[],"Value":253,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World94","tags":[],"Value":254,"Enum":"KeyCode"},{"type":"EnumItem","Name":"World95","tags":[],"Value":255,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonX","tags":[],"Value":1000,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonY","tags":[],"Value":1001,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonA","tags":[],"Value":1002,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonB","tags":[],"Value":1003,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonR1","tags":[],"Value":1004,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonL1","tags":[],"Value":1005,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonR2","tags":[],"Value":1006,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonL2","tags":[],"Value":1007,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonR3","tags":[],"Value":1008,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonL3","tags":[],"Value":1009,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonStart","tags":[],"Value":1010,"Enum":"KeyCode"},{"type":"EnumItem","Name":"ButtonSelect","tags":[],"Value":1011,"Enum":"KeyCode"},{"type":"EnumItem","Name":"DPadLeft","tags":[],"Value":1012,"Enum":"KeyCode"},{"type":"EnumItem","Name":"DPadRight","tags":[],"Value":1013,"Enum":"KeyCode"},{"type":"EnumItem","Name":"DPadUp","tags":[],"Value":1014,"Enum":"KeyCode"},{"type":"EnumItem","Name":"DPadDown","tags":[],"Value":1015,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Thumbstick1","tags":[],"Value":1016,"Enum":"KeyCode"},{"type":"EnumItem","Name":"Thumbstick2","tags":[],"Value":1017,"Enum":"KeyCode"},{"type":"Enum","Name":"KeywordFilterType","tags":[]},{"type":"EnumItem","Name":"Include","tags":[],"Value":0,"Enum":"KeywordFilterType"},{"type":"EnumItem","Name":"Exclude","tags":[],"Value":1,"Enum":"KeywordFilterType"},{"type":"Enum","Name":"Language","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"Language"},{"type":"Enum","Name":"LeftRight","tags":[]},{"type":"EnumItem","Name":"Left","tags":[],"Value":0,"Enum":"LeftRight"},{"type":"EnumItem","Name":"Center","tags":[],"Value":1,"Enum":"LeftRight"},{"type":"EnumItem","Name":"Right","tags":[],"Value":2,"Enum":"LeftRight"},{"type":"Enum","Name":"LevelOfDetailSetting","tags":[]},{"type":"EnumItem","Name":"High","tags":[],"Value":2,"Enum":"LevelOfDetailSetting"},{"type":"EnumItem","Name":"Medium","tags":[],"Value":1,"Enum":"LevelOfDetailSetting"},{"type":"EnumItem","Name":"Low","tags":[],"Value":0,"Enum":"LevelOfDetailSetting"},{"type":"Enum","Name":"Limb","tags":[]},{"type":"EnumItem","Name":"Head","tags":[],"Value":0,"Enum":"Limb"},{"type":"EnumItem","Name":"Torso","tags":[],"Value":1,"Enum":"Limb"},{"type":"EnumItem","Name":"LeftArm","tags":[],"Value":2,"Enum":"Limb"},{"type":"EnumItem","Name":"RightArm","tags":[],"Value":3,"Enum":"Limb"},{"type":"EnumItem","Name":"LeftLeg","tags":[],"Value":4,"Enum":"Limb"},{"type":"EnumItem","Name":"RightLeg","tags":[],"Value":5,"Enum":"Limb"},{"type":"EnumItem","Name":"Unknown","tags":[],"Value":6,"Enum":"Limb"},{"type":"Enum","Name":"ListenerType","tags":[]},{"type":"EnumItem","Name":"Camera","tags":[],"Value":0,"Enum":"ListenerType"},{"type":"EnumItem","Name":"CFrame","tags":[],"Value":1,"Enum":"ListenerType"},{"type":"EnumItem","Name":"ObjectPosition","tags":[],"Value":2,"Enum":"ListenerType"},{"type":"EnumItem","Name":"ObjectCFrame","tags":[],"Value":3,"Enum":"ListenerType"},{"type":"Enum","Name":"Material","tags":[]},{"type":"EnumItem","Name":"Plastic","tags":[],"Value":256,"Enum":"Material"},{"type":"EnumItem","Name":"Wood","tags":[],"Value":512,"Enum":"Material"},{"type":"EnumItem","Name":"Slate","tags":[],"Value":800,"Enum":"Material"},{"type":"EnumItem","Name":"Concrete","tags":[],"Value":816,"Enum":"Material"},{"type":"EnumItem","Name":"CorrodedMetal","tags":[],"Value":1040,"Enum":"Material"},{"type":"EnumItem","Name":"DiamondPlate","tags":[],"Value":1056,"Enum":"Material"},{"type":"EnumItem","Name":"Foil","tags":[],"Value":1072,"Enum":"Material"},{"type":"EnumItem","Name":"Grass","tags":[],"Value":1280,"Enum":"Material"},{"type":"EnumItem","Name":"Ice","tags":[],"Value":1536,"Enum":"Material"},{"type":"EnumItem","Name":"Marble","tags":[],"Value":784,"Enum":"Material"},{"type":"EnumItem","Name":"Granite","tags":[],"Value":832,"Enum":"Material"},{"type":"EnumItem","Name":"Brick","tags":[],"Value":848,"Enum":"Material"},{"type":"EnumItem","Name":"Pebble","tags":[],"Value":864,"Enum":"Material"},{"type":"EnumItem","Name":"Sand","tags":[],"Value":1296,"Enum":"Material"},{"type":"EnumItem","Name":"Fabric","tags":[],"Value":1312,"Enum":"Material"},{"type":"EnumItem","Name":"SmoothPlastic","tags":[],"Value":272,"Enum":"Material"},{"type":"EnumItem","Name":"Metal","tags":[],"Value":1088,"Enum":"Material"},{"type":"EnumItem","Name":"WoodPlanks","tags":[],"Value":528,"Enum":"Material"},{"type":"EnumItem","Name":"Cobblestone","tags":[],"Value":880,"Enum":"Material"},{"type":"EnumItem","Name":"Air","tags":["notbrowsable"],"Value":1792,"Enum":"Material"},{"type":"EnumItem","Name":"Water","tags":["notbrowsable"],"Value":2048,"Enum":"Material"},{"type":"EnumItem","Name":"Rock","tags":["notbrowsable"],"Value":896,"Enum":"Material"},{"type":"EnumItem","Name":"Glacier","tags":["notbrowsable"],"Value":1552,"Enum":"Material"},{"type":"EnumItem","Name":"Snow","tags":["notbrowsable"],"Value":1328,"Enum":"Material"},{"type":"EnumItem","Name":"Sandstone","tags":["notbrowsable"],"Value":912,"Enum":"Material"},{"type":"EnumItem","Name":"Mud","tags":["notbrowsable"],"Value":1344,"Enum":"Material"},{"type":"EnumItem","Name":"Basalt","tags":["notbrowsable"],"Value":788,"Enum":"Material"},{"type":"EnumItem","Name":"Ground","tags":["notbrowsable"],"Value":1360,"Enum":"Material"},{"type":"EnumItem","Name":"CrackedLava","tags":["notbrowsable"],"Value":804,"Enum":"Material"},{"type":"EnumItem","Name":"Neon","tags":[],"Value":288,"Enum":"Material"},{"type":"EnumItem","Name":"Asphalt","tags":["notbrowsable"],"Value":1376,"Enum":"Material"},{"type":"EnumItem","Name":"LeafyGrass","tags":["notbrowsable"],"Value":1284,"Enum":"Material"},{"type":"EnumItem","Name":"Salt","tags":["notbrowsable"],"Value":1392,"Enum":"Material"},{"type":"EnumItem","Name":"Limestone","tags":["notbrowsable"],"Value":820,"Enum":"Material"},{"type":"EnumItem","Name":"Pavement","tags":["notbrowsable"],"Value":836,"Enum":"Material"},{"type":"Enum","Name":"MembershipType","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"MembershipType"},{"type":"EnumItem","Name":"BuildersClub","tags":[],"Value":1,"Enum":"MembershipType"},{"type":"EnumItem","Name":"TurboBuildersClub","tags":[],"Value":2,"Enum":"MembershipType"},{"type":"EnumItem","Name":"OutrageousBuildersClub","tags":[],"Value":3,"Enum":"MembershipType"},{"type":"Enum","Name":"MeshType","tags":[]},{"type":"EnumItem","Name":"Head","tags":[],"Value":0,"Enum":"MeshType"},{"type":"EnumItem","Name":"Torso","tags":[],"Value":1,"Enum":"MeshType"},{"type":"EnumItem","Name":"Wedge","tags":[],"Value":2,"Enum":"MeshType"},{"type":"EnumItem","Name":"Prism","tags":["deprecated"],"Value":7,"Enum":"MeshType"},{"type":"EnumItem","Name":"Pyramid","tags":["deprecated"],"Value":8,"Enum":"MeshType"},{"type":"EnumItem","Name":"ParallelRamp","tags":["deprecated"],"Value":9,"Enum":"MeshType"},{"type":"EnumItem","Name":"RightAngleRamp","tags":["deprecated"],"Value":10,"Enum":"MeshType"},{"type":"EnumItem","Name":"CornerWedge","tags":["deprecated"],"Value":11,"Enum":"MeshType"},{"type":"EnumItem","Name":"Brick","tags":[],"Value":6,"Enum":"MeshType"},{"type":"EnumItem","Name":"Sphere","tags":[],"Value":3,"Enum":"MeshType"},{"type":"EnumItem","Name":"Cylinder","tags":[],"Value":4,"Enum":"MeshType"},{"type":"EnumItem","Name":"FileMesh","tags":[],"Value":5,"Enum":"MeshType"},{"type":"Enum","Name":"MessageType","tags":[]},{"type":"EnumItem","Name":"MessageOutput","tags":[],"Value":0,"Enum":"MessageType"},{"type":"EnumItem","Name":"MessageInfo","tags":[],"Value":1,"Enum":"MessageType"},{"type":"EnumItem","Name":"MessageWarning","tags":[],"Value":2,"Enum":"MessageType"},{"type":"EnumItem","Name":"MessageError","tags":[],"Value":3,"Enum":"MessageType"},{"type":"Enum","Name":"MouseBehavior","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"MouseBehavior"},{"type":"EnumItem","Name":"LockCenter","tags":[],"Value":1,"Enum":"MouseBehavior"},{"type":"EnumItem","Name":"LockCurrentPosition","tags":[],"Value":2,"Enum":"MouseBehavior"},{"type":"Enum","Name":"MoveState","tags":[]},{"type":"EnumItem","Name":"Stopped","tags":[],"Value":0,"Enum":"MoveState"},{"type":"EnumItem","Name":"Coasting","tags":[],"Value":1,"Enum":"MoveState"},{"type":"EnumItem","Name":"Pushing","tags":[],"Value":2,"Enum":"MoveState"},{"type":"EnumItem","Name":"Stopping","tags":[],"Value":3,"Enum":"MoveState"},{"type":"EnumItem","Name":"AirFree","tags":[],"Value":4,"Enum":"MoveState"},{"type":"Enum","Name":"NameOcclusion","tags":[]},{"type":"EnumItem","Name":"OccludeAll","tags":[],"Value":2,"Enum":"NameOcclusion"},{"type":"EnumItem","Name":"EnemyOcclusion","tags":[],"Value":1,"Enum":"NameOcclusion"},{"type":"EnumItem","Name":"NoOcclusion","tags":[],"Value":0,"Enum":"NameOcclusion"},{"type":"Enum","Name":"NetworkOwnership","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":0,"Enum":"NetworkOwnership"},{"type":"EnumItem","Name":"Manual","tags":[],"Value":1,"Enum":"NetworkOwnership"},{"type":"EnumItem","Name":"OnContact","tags":[],"Value":2,"Enum":"NetworkOwnership"},{"type":"Enum","Name":"NormalId","tags":[]},{"type":"EnumItem","Name":"Top","tags":[],"Value":1,"Enum":"NormalId"},{"type":"EnumItem","Name":"Bottom","tags":[],"Value":4,"Enum":"NormalId"},{"type":"EnumItem","Name":"Back","tags":[],"Value":2,"Enum":"NormalId"},{"type":"EnumItem","Name":"Front","tags":[],"Value":5,"Enum":"NormalId"},{"type":"EnumItem","Name":"Right","tags":[],"Value":0,"Enum":"NormalId"},{"type":"EnumItem","Name":"Left","tags":[],"Value":3,"Enum":"NormalId"},{"type":"Enum","Name":"OverrideMouseIconBehavior","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"OverrideMouseIconBehavior"},{"type":"EnumItem","Name":"ForceShow","tags":[],"Value":1,"Enum":"OverrideMouseIconBehavior"},{"type":"EnumItem","Name":"ForceHide","tags":[],"Value":2,"Enum":"OverrideMouseIconBehavior"},{"type":"Enum","Name":"PacketPriority","tags":[]},{"type":"EnumItem","Name":"IMMEDIATE_PRIORITY","tags":[],"Value":0,"Enum":"PacketPriority"},{"type":"EnumItem","Name":"HIGH_PRIORITY","tags":[],"Value":1,"Enum":"PacketPriority"},{"type":"EnumItem","Name":"MEDIUM_PRIORITY","tags":[],"Value":2,"Enum":"PacketPriority"},{"type":"EnumItem","Name":"LOW_PRIORITY","tags":[],"Value":3,"Enum":"PacketPriority"},{"type":"Enum","Name":"PacketReliability","tags":[]},{"type":"EnumItem","Name":"UNRELIABLE","tags":[],"Value":0,"Enum":"PacketReliability"},{"type":"EnumItem","Name":"UNRELIABLE_SEQUENCED","tags":[],"Value":1,"Enum":"PacketReliability"},{"type":"EnumItem","Name":"RELIABLE","tags":[],"Value":2,"Enum":"PacketReliability"},{"type":"EnumItem","Name":"RELIABLE_ORDERED","tags":[],"Value":3,"Enum":"PacketReliability"},{"type":"EnumItem","Name":"RELIABLE_SEQUENCED","tags":[],"Value":4,"Enum":"PacketReliability"},{"type":"Enum","Name":"PartType","tags":[]},{"type":"EnumItem","Name":"Ball","tags":[],"Value":0,"Enum":"PartType"},{"type":"EnumItem","Name":"Block","tags":[],"Value":1,"Enum":"PartType"},{"type":"EnumItem","Name":"Cylinder","tags":[],"Value":2,"Enum":"PartType"},{"type":"Enum","Name":"PathStatus","tags":[]},{"type":"EnumItem","Name":"Success","tags":[],"Value":0,"Enum":"PathStatus"},{"type":"EnumItem","Name":"ClosestNoPath","tags":["deprecated"],"Value":1,"Enum":"PathStatus"},{"type":"EnumItem","Name":"ClosestOutOfRange","tags":["deprecated"],"Value":2,"Enum":"PathStatus"},{"type":"EnumItem","Name":"FailStartNotEmpty","tags":["deprecated"],"Value":3,"Enum":"PathStatus"},{"type":"EnumItem","Name":"FailFinishNotEmpty","tags":["deprecated"],"Value":4,"Enum":"PathStatus"},{"type":"EnumItem","Name":"NoPath","tags":[],"Value":5,"Enum":"PathStatus"},{"type":"Enum","Name":"PathWaypointAction","tags":[]},{"type":"EnumItem","Name":"Walk","tags":[],"Value":0,"Enum":"PathWaypointAction"},{"type":"EnumItem","Name":"Jump","tags":[],"Value":1,"Enum":"PathWaypointAction"},{"type":"Enum","Name":"PhysicsReceiveMethod","tags":[]},{"type":"EnumItem","Name":"Direct","tags":[],"Value":0,"Enum":"PhysicsReceiveMethod"},{"type":"EnumItem","Name":"Interpolation","tags":[],"Value":1,"Enum":"PhysicsReceiveMethod"},{"type":"Enum","Name":"PhysicsSendMethod","tags":[]},{"type":"EnumItem","Name":"ErrorComputation","tags":[],"Value":0,"Enum":"PhysicsSendMethod"},{"type":"EnumItem","Name":"ErrorComputation2","tags":[],"Value":1,"Enum":"PhysicsSendMethod"},{"type":"EnumItem","Name":"RoundRobin","tags":[],"Value":2,"Enum":"PhysicsSendMethod"},{"type":"EnumItem","Name":"TopNErrors","tags":[],"Value":3,"Enum":"PhysicsSendMethod"},{"type":"Enum","Name":"Platform","tags":[]},{"type":"EnumItem","Name":"Windows","tags":[],"Value":0,"Enum":"Platform"},{"type":"EnumItem","Name":"OSX","tags":[],"Value":1,"Enum":"Platform"},{"type":"EnumItem","Name":"IOS","tags":[],"Value":2,"Enum":"Platform"},{"type":"EnumItem","Name":"Android","tags":[],"Value":3,"Enum":"Platform"},{"type":"EnumItem","Name":"XBoxOne","tags":[],"Value":4,"Enum":"Platform"},{"type":"EnumItem","Name":"PS4","tags":[],"Value":5,"Enum":"Platform"},{"type":"EnumItem","Name":"PS3","tags":[],"Value":6,"Enum":"Platform"},{"type":"EnumItem","Name":"XBox360","tags":[],"Value":7,"Enum":"Platform"},{"type":"EnumItem","Name":"WiiU","tags":[],"Value":8,"Enum":"Platform"},{"type":"EnumItem","Name":"NX","tags":[],"Value":9,"Enum":"Platform"},{"type":"EnumItem","Name":"Ouya","tags":[],"Value":10,"Enum":"Platform"},{"type":"EnumItem","Name":"AndroidTV","tags":[],"Value":11,"Enum":"Platform"},{"type":"EnumItem","Name":"Chromecast","tags":[],"Value":12,"Enum":"Platform"},{"type":"EnumItem","Name":"Linux","tags":[],"Value":13,"Enum":"Platform"},{"type":"EnumItem","Name":"SteamOS","tags":[],"Value":14,"Enum":"Platform"},{"type":"EnumItem","Name":"WebOS","tags":[],"Value":15,"Enum":"Platform"},{"type":"EnumItem","Name":"DOS","tags":[],"Value":16,"Enum":"Platform"},{"type":"EnumItem","Name":"BeOS","tags":[],"Value":17,"Enum":"Platform"},{"type":"EnumItem","Name":"UWP","tags":[],"Value":18,"Enum":"Platform"},{"type":"EnumItem","Name":"None","tags":[],"Value":19,"Enum":"Platform"},{"type":"Enum","Name":"PlaybackState","tags":[]},{"type":"EnumItem","Name":"Begin","tags":[],"Value":0,"Enum":"PlaybackState"},{"type":"EnumItem","Name":"Delayed","tags":[],"Value":1,"Enum":"PlaybackState"},{"type":"EnumItem","Name":"Playing","tags":[],"Value":2,"Enum":"PlaybackState"},{"type":"EnumItem","Name":"Paused","tags":[],"Value":3,"Enum":"PlaybackState"},{"type":"EnumItem","Name":"Completed","tags":[],"Value":4,"Enum":"PlaybackState"},{"type":"EnumItem","Name":"Cancelled","tags":[],"Value":5,"Enum":"PlaybackState"},{"type":"Enum","Name":"PlayerActions","tags":[]},{"type":"EnumItem","Name":"CharacterForward","tags":[],"Value":0,"Enum":"PlayerActions"},{"type":"EnumItem","Name":"CharacterBackward","tags":[],"Value":1,"Enum":"PlayerActions"},{"type":"EnumItem","Name":"CharacterLeft","tags":[],"Value":2,"Enum":"PlayerActions"},{"type":"EnumItem","Name":"CharacterRight","tags":[],"Value":3,"Enum":"PlayerActions"},{"type":"EnumItem","Name":"CharacterJump","tags":[],"Value":4,"Enum":"PlayerActions"},{"type":"Enum","Name":"PlayerChatType","tags":[]},{"type":"EnumItem","Name":"All","tags":[],"Value":0,"Enum":"PlayerChatType"},{"type":"EnumItem","Name":"Team","tags":[],"Value":1,"Enum":"PlayerChatType"},{"type":"EnumItem","Name":"Whisper","tags":[],"Value":2,"Enum":"PlayerChatType"},{"type":"Enum","Name":"PoseEasingDirection","tags":[]},{"type":"EnumItem","Name":"Out","tags":[],"Value":1,"Enum":"PoseEasingDirection"},{"type":"EnumItem","Name":"InOut","tags":[],"Value":2,"Enum":"PoseEasingDirection"},{"type":"EnumItem","Name":"In","tags":[],"Value":0,"Enum":"PoseEasingDirection"},{"type":"Enum","Name":"PoseEasingStyle","tags":[]},{"type":"EnumItem","Name":"Linear","tags":[],"Value":0,"Enum":"PoseEasingStyle"},{"type":"EnumItem","Name":"Constant","tags":[],"Value":1,"Enum":"PoseEasingStyle"},{"type":"EnumItem","Name":"Elastic","tags":[],"Value":2,"Enum":"PoseEasingStyle"},{"type":"EnumItem","Name":"Cubic","tags":[],"Value":3,"Enum":"PoseEasingStyle"},{"type":"EnumItem","Name":"Bounce","tags":[],"Value":4,"Enum":"PoseEasingStyle"},{"type":"Enum","Name":"PriorityMethod","tags":[]},{"type":"EnumItem","Name":"LastError","tags":[],"Value":0,"Enum":"PriorityMethod"},{"type":"EnumItem","Name":"AccumulatedError","tags":[],"Value":1,"Enum":"PriorityMethod"},{"type":"EnumItem","Name":"FIFO","tags":[],"Value":2,"Enum":"PriorityMethod"},{"type":"Enum","Name":"PrismSides","tags":[]},{"type":"EnumItem","Name":"3","tags":[],"Value":3,"Enum":"PrismSides"},{"type":"EnumItem","Name":"5","tags":[],"Value":5,"Enum":"PrismSides"},{"type":"EnumItem","Name":"6","tags":[],"Value":6,"Enum":"PrismSides"},{"type":"EnumItem","Name":"8","tags":[],"Value":8,"Enum":"PrismSides"},{"type":"EnumItem","Name":"10","tags":[],"Value":10,"Enum":"PrismSides"},{"type":"EnumItem","Name":"20","tags":[],"Value":20,"Enum":"PrismSides"},{"type":"Enum","Name":"PrivilegeType","tags":[]},{"type":"EnumItem","Name":"Owner","tags":[],"Value":255,"Enum":"PrivilegeType"},{"type":"EnumItem","Name":"Admin","tags":[],"Value":240,"Enum":"PrivilegeType"},{"type":"EnumItem","Name":"Member","tags":[],"Value":128,"Enum":"PrivilegeType"},{"type":"EnumItem","Name":"Visitor","tags":[],"Value":10,"Enum":"PrivilegeType"},{"type":"EnumItem","Name":"Banned","tags":[],"Value":0,"Enum":"PrivilegeType"},{"type":"Enum","Name":"ProductPurchaseDecision","tags":[]},{"type":"EnumItem","Name":"NotProcessedYet","tags":[],"Value":0,"Enum":"ProductPurchaseDecision"},{"type":"EnumItem","Name":"PurchaseGranted","tags":[],"Value":1,"Enum":"ProductPurchaseDecision"},{"type":"Enum","Name":"PyramidSides","tags":[]},{"type":"EnumItem","Name":"3","tags":[],"Value":3,"Enum":"PyramidSides"},{"type":"EnumItem","Name":"4","tags":[],"Value":4,"Enum":"PyramidSides"},{"type":"EnumItem","Name":"5","tags":[],"Value":5,"Enum":"PyramidSides"},{"type":"EnumItem","Name":"6","tags":[],"Value":6,"Enum":"PyramidSides"},{"type":"EnumItem","Name":"8","tags":[],"Value":8,"Enum":"PyramidSides"},{"type":"EnumItem","Name":"10","tags":[],"Value":10,"Enum":"PyramidSides"},{"type":"EnumItem","Name":"20","tags":[],"Value":20,"Enum":"PyramidSides"},{"type":"Enum","Name":"QualityLevel","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":0,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level01","tags":[],"Value":1,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level02","tags":[],"Value":2,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level03","tags":[],"Value":3,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level04","tags":[],"Value":4,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level05","tags":[],"Value":5,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level06","tags":[],"Value":6,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level07","tags":[],"Value":7,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level08","tags":[],"Value":8,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level09","tags":[],"Value":9,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level10","tags":[],"Value":10,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level11","tags":[],"Value":11,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level12","tags":[],"Value":12,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level13","tags":[],"Value":13,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level14","tags":[],"Value":14,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level15","tags":[],"Value":15,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level16","tags":[],"Value":16,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level17","tags":[],"Value":17,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level18","tags":[],"Value":18,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level19","tags":[],"Value":19,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level20","tags":[],"Value":20,"Enum":"QualityLevel"},{"type":"EnumItem","Name":"Level21","tags":[],"Value":21,"Enum":"QualityLevel"},{"type":"Enum","Name":"R15CollisionType","tags":[]},{"type":"EnumItem","Name":"OuterBox","tags":[],"Value":0,"Enum":"R15CollisionType"},{"type":"EnumItem","Name":"InnerBox","tags":[],"Value":1,"Enum":"R15CollisionType"},{"type":"Enum","Name":"RenderPriority","tags":[]},{"type":"EnumItem","Name":"First","tags":[],"Value":0,"Enum":"RenderPriority"},{"type":"EnumItem","Name":"Input","tags":[],"Value":100,"Enum":"RenderPriority"},{"type":"EnumItem","Name":"Camera","tags":[],"Value":200,"Enum":"RenderPriority"},{"type":"EnumItem","Name":"Character","tags":[],"Value":300,"Enum":"RenderPriority"},{"type":"EnumItem","Name":"Last","tags":[],"Value":2000,"Enum":"RenderPriority"},{"type":"Enum","Name":"Resolution","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":0,"Enum":"Resolution"},{"type":"EnumItem","Name":"720x526","tags":[],"Value":1,"Enum":"Resolution"},{"type":"EnumItem","Name":"800x600","tags":[],"Value":2,"Enum":"Resolution"},{"type":"EnumItem","Name":"1024x600","tags":[],"Value":3,"Enum":"Resolution"},{"type":"EnumItem","Name":"1024x768","tags":[],"Value":4,"Enum":"Resolution"},{"type":"EnumItem","Name":"1280x720","tags":[],"Value":5,"Enum":"Resolution"},{"type":"EnumItem","Name":"1280x768","tags":[],"Value":6,"Enum":"Resolution"},{"type":"EnumItem","Name":"1152x864","tags":[],"Value":7,"Enum":"Resolution"},{"type":"EnumItem","Name":"1280x800","tags":[],"Value":8,"Enum":"Resolution"},{"type":"EnumItem","Name":"1360x768","tags":[],"Value":9,"Enum":"Resolution"},{"type":"EnumItem","Name":"1280x960","tags":[],"Value":10,"Enum":"Resolution"},{"type":"EnumItem","Name":"1280x1024","tags":[],"Value":11,"Enum":"Resolution"},{"type":"EnumItem","Name":"1440x900","tags":[],"Value":12,"Enum":"Resolution"},{"type":"EnumItem","Name":"1600x900","tags":[],"Value":13,"Enum":"Resolution"},{"type":"EnumItem","Name":"1600x1024","tags":[],"Value":14,"Enum":"Resolution"},{"type":"EnumItem","Name":"1600x1200","tags":[],"Value":15,"Enum":"Resolution"},{"type":"EnumItem","Name":"1680x1050","tags":[],"Value":16,"Enum":"Resolution"},{"type":"EnumItem","Name":"1920x1080","tags":[],"Value":17,"Enum":"Resolution"},{"type":"EnumItem","Name":"1920x1200","tags":[],"Value":18,"Enum":"Resolution"},{"type":"Enum","Name":"ReverbType","tags":[]},{"type":"EnumItem","Name":"NoReverb","tags":[],"Value":0,"Enum":"ReverbType"},{"type":"EnumItem","Name":"GenericReverb","tags":[],"Value":1,"Enum":"ReverbType"},{"type":"EnumItem","Name":"PaddedCell","tags":[],"Value":2,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Room","tags":[],"Value":3,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Bathroom","tags":[],"Value":4,"Enum":"ReverbType"},{"type":"EnumItem","Name":"LivingRoom","tags":[],"Value":5,"Enum":"ReverbType"},{"type":"EnumItem","Name":"StoneRoom","tags":[],"Value":6,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Auditorium","tags":[],"Value":7,"Enum":"ReverbType"},{"type":"EnumItem","Name":"ConcertHall","tags":[],"Value":8,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Cave","tags":[],"Value":9,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Arena","tags":[],"Value":10,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Hangar","tags":[],"Value":11,"Enum":"ReverbType"},{"type":"EnumItem","Name":"CarpettedHallway","tags":[],"Value":12,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Hallway","tags":[],"Value":13,"Enum":"ReverbType"},{"type":"EnumItem","Name":"StoneCorridor","tags":[],"Value":14,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Alley","tags":[],"Value":15,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Forest","tags":[],"Value":16,"Enum":"ReverbType"},{"type":"EnumItem","Name":"City","tags":[],"Value":17,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Mountains","tags":[],"Value":18,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Quarry","tags":[],"Value":19,"Enum":"ReverbType"},{"type":"EnumItem","Name":"Plain","tags":[],"Value":20,"Enum":"ReverbType"},{"type":"EnumItem","Name":"ParkingLot","tags":[],"Value":21,"Enum":"ReverbType"},{"type":"EnumItem","Name":"SewerPipe","tags":[],"Value":22,"Enum":"ReverbType"},{"type":"EnumItem","Name":"UnderWater","tags":[],"Value":23,"Enum":"ReverbType"},{"type":"Enum","Name":"RibbonTool","tags":[]},{"type":"EnumItem","Name":"Select","tags":[],"Value":0,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"Scale","tags":[],"Value":1,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"Rotate","tags":[],"Value":2,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"Move","tags":[],"Value":3,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"Transform","tags":[],"Value":4,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"ColorPicker","tags":[],"Value":5,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"MaterialPicker","tags":[],"Value":6,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"Group","tags":[],"Value":7,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"Ungroup","tags":[],"Value":8,"Enum":"RibbonTool"},{"type":"EnumItem","Name":"None","tags":[],"Value":9,"Enum":"RibbonTool"},{"type":"Enum","Name":"RollOffMode","tags":[]},{"type":"EnumItem","Name":"Inverse","tags":[],"Value":0,"Enum":"RollOffMode"},{"type":"EnumItem","Name":"Linear","tags":[],"Value":1,"Enum":"RollOffMode"},{"type":"EnumItem","Name":"InverseTapered","tags":[],"Value":3,"Enum":"RollOffMode"},{"type":"EnumItem","Name":"LinearSquare","tags":[],"Value":2,"Enum":"RollOffMode"},{"type":"Enum","Name":"RotationType","tags":[]},{"type":"EnumItem","Name":"MovementRelative","tags":[],"Value":0,"Enum":"RotationType"},{"type":"EnumItem","Name":"CameraRelative","tags":[],"Value":1,"Enum":"RotationType"},{"type":"Enum","Name":"RuntimeUndoBehavior","tags":[]},{"type":"EnumItem","Name":"Aggregate","tags":[],"Value":0,"Enum":"RuntimeUndoBehavior"},{"type":"EnumItem","Name":"Snapshot","tags":[],"Value":1,"Enum":"RuntimeUndoBehavior"},{"type":"EnumItem","Name":"Hybrid","tags":[],"Value":2,"Enum":"RuntimeUndoBehavior"},{"type":"Enum","Name":"SaveFilter","tags":[]},{"type":"EnumItem","Name":"SaveAll","tags":[],"Value":2,"Enum":"SaveFilter"},{"type":"EnumItem","Name":"SaveWorld","tags":[],"Value":0,"Enum":"SaveFilter"},{"type":"EnumItem","Name":"SaveGame","tags":[],"Value":1,"Enum":"SaveFilter"},{"type":"Enum","Name":"SavedQualitySetting","tags":[]},{"type":"EnumItem","Name":"Automatic","tags":[],"Value":0,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel1","tags":[],"Value":1,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel2","tags":[],"Value":2,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel3","tags":[],"Value":3,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel4","tags":[],"Value":4,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel5","tags":[],"Value":5,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel6","tags":[],"Value":6,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel7","tags":[],"Value":7,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel8","tags":[],"Value":8,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel9","tags":[],"Value":9,"Enum":"SavedQualitySetting"},{"type":"EnumItem","Name":"QualityLevel10","tags":[],"Value":10,"Enum":"SavedQualitySetting"},{"type":"Enum","Name":"ScaleType","tags":[]},{"type":"EnumItem","Name":"Stretch","tags":[],"Value":0,"Enum":"ScaleType"},{"type":"EnumItem","Name":"Slice","tags":[],"Value":1,"Enum":"ScaleType"},{"type":"EnumItem","Name":"Tile","tags":[],"Value":2,"Enum":"ScaleType"},{"type":"Enum","Name":"ScreenOrientation","tags":[]},{"type":"EnumItem","Name":"LandscapeLeft","tags":[],"Value":0,"Enum":"ScreenOrientation"},{"type":"EnumItem","Name":"LandscapeRight","tags":[],"Value":1,"Enum":"ScreenOrientation"},{"type":"EnumItem","Name":"LandscapeSensor","tags":[],"Value":2,"Enum":"ScreenOrientation"},{"type":"EnumItem","Name":"Portrait","tags":[],"Value":3,"Enum":"ScreenOrientation"},{"type":"EnumItem","Name":"Sensor","tags":[],"Value":4,"Enum":"ScreenOrientation"},{"type":"Enum","Name":"ScrollBarInset","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"ScrollBarInset"},{"type":"EnumItem","Name":"ScrollBar","tags":[],"Value":1,"Enum":"ScrollBarInset"},{"type":"EnumItem","Name":"Always","tags":[],"Value":2,"Enum":"ScrollBarInset"},{"type":"Enum","Name":"SizeConstraint","tags":[]},{"type":"EnumItem","Name":"RelativeXY","tags":[],"Value":0,"Enum":"SizeConstraint"},{"type":"EnumItem","Name":"RelativeXX","tags":[],"Value":1,"Enum":"SizeConstraint"},{"type":"EnumItem","Name":"RelativeYY","tags":[],"Value":2,"Enum":"SizeConstraint"},{"type":"Enum","Name":"SleepAdjustMethod","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"SleepAdjustMethod"},{"type":"EnumItem","Name":"LastSample","tags":[],"Value":1,"Enum":"SleepAdjustMethod"},{"type":"EnumItem","Name":"AverageInterval","tags":[],"Value":2,"Enum":"SleepAdjustMethod"},{"type":"Enum","Name":"SortOrder","tags":[]},{"type":"EnumItem","Name":"LayoutOrder","tags":[],"Value":2,"Enum":"SortOrder"},{"type":"EnumItem","Name":"Name","tags":[],"Value":0,"Enum":"SortOrder"},{"type":"EnumItem","Name":"Custom","tags":["deprecated"],"Value":1,"Enum":"SortOrder"},{"type":"Enum","Name":"SoundType","tags":[]},{"type":"EnumItem","Name":"NoSound","tags":[],"Value":0,"Enum":"SoundType"},{"type":"EnumItem","Name":"Boing","tags":[],"Value":1,"Enum":"SoundType"},{"type":"EnumItem","Name":"Bomb","tags":[],"Value":2,"Enum":"SoundType"},{"type":"EnumItem","Name":"Break","tags":[],"Value":3,"Enum":"SoundType"},{"type":"EnumItem","Name":"Click","tags":[],"Value":4,"Enum":"SoundType"},{"type":"EnumItem","Name":"Clock","tags":[],"Value":5,"Enum":"SoundType"},{"type":"EnumItem","Name":"Slingshot","tags":[],"Value":6,"Enum":"SoundType"},{"type":"EnumItem","Name":"Page","tags":[],"Value":7,"Enum":"SoundType"},{"type":"EnumItem","Name":"Ping","tags":[],"Value":8,"Enum":"SoundType"},{"type":"EnumItem","Name":"Snap","tags":[],"Value":9,"Enum":"SoundType"},{"type":"EnumItem","Name":"Splat","tags":[],"Value":10,"Enum":"SoundType"},{"type":"EnumItem","Name":"Step","tags":[],"Value":11,"Enum":"SoundType"},{"type":"EnumItem","Name":"StepOn","tags":[],"Value":12,"Enum":"SoundType"},{"type":"EnumItem","Name":"Swoosh","tags":[],"Value":13,"Enum":"SoundType"},{"type":"EnumItem","Name":"Victory","tags":[],"Value":14,"Enum":"SoundType"},{"type":"Enum","Name":"SpecialKey","tags":[]},{"type":"EnumItem","Name":"Insert","tags":[],"Value":0,"Enum":"SpecialKey"},{"type":"EnumItem","Name":"Home","tags":[],"Value":1,"Enum":"SpecialKey"},{"type":"EnumItem","Name":"End","tags":[],"Value":2,"Enum":"SpecialKey"},{"type":"EnumItem","Name":"PageUp","tags":[],"Value":3,"Enum":"SpecialKey"},{"type":"EnumItem","Name":"PageDown","tags":[],"Value":4,"Enum":"SpecialKey"},{"type":"EnumItem","Name":"ChatHotkey","tags":[],"Value":5,"Enum":"SpecialKey"},{"type":"Enum","Name":"StartCorner","tags":[]},{"type":"EnumItem","Name":"TopLeft","tags":[],"Value":0,"Enum":"StartCorner"},{"type":"EnumItem","Name":"TopRight","tags":[],"Value":1,"Enum":"StartCorner"},{"type":"EnumItem","Name":"BottomLeft","tags":[],"Value":2,"Enum":"StartCorner"},{"type":"EnumItem","Name":"BottomRight","tags":[],"Value":3,"Enum":"StartCorner"},{"type":"Enum","Name":"Status","tags":[]},{"type":"EnumItem","Name":"Poison","tags":["deprecated"],"Value":0,"Enum":"Status"},{"type":"EnumItem","Name":"Confusion","tags":["deprecated"],"Value":1,"Enum":"Status"},{"type":"Enum","Name":"Style","tags":[]},{"type":"EnumItem","Name":"AlternatingSupports","tags":[],"Value":0,"Enum":"Style"},{"type":"EnumItem","Name":"BridgeStyleSupports","tags":[],"Value":1,"Enum":"Style"},{"type":"EnumItem","Name":"NoSupports","tags":[],"Value":2,"Enum":"Style"},{"type":"Enum","Name":"SurfaceConstraint","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"SurfaceConstraint"},{"type":"EnumItem","Name":"Hinge","tags":[],"Value":1,"Enum":"SurfaceConstraint"},{"type":"EnumItem","Name":"SteppingMotor","tags":[],"Value":2,"Enum":"SurfaceConstraint"},{"type":"EnumItem","Name":"Motor","tags":[],"Value":3,"Enum":"SurfaceConstraint"},{"type":"Enum","Name":"SurfaceType","tags":[]},{"type":"EnumItem","Name":"Smooth","tags":[],"Value":0,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Glue","tags":[],"Value":1,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Weld","tags":[],"Value":2,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Studs","tags":[],"Value":3,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Inlet","tags":[],"Value":4,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Universal","tags":[],"Value":5,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Hinge","tags":[],"Value":6,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Motor","tags":[],"Value":7,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"SteppingMotor","tags":[],"Value":8,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"Unjoinable","tags":[],"Value":9,"Enum":"SurfaceType"},{"type":"EnumItem","Name":"SmoothNoOutlines","tags":[],"Value":10,"Enum":"SurfaceType"},{"type":"Enum","Name":"SwipeDirection","tags":[]},{"type":"EnumItem","Name":"Right","tags":[],"Value":0,"Enum":"SwipeDirection"},{"type":"EnumItem","Name":"Left","tags":[],"Value":1,"Enum":"SwipeDirection"},{"type":"EnumItem","Name":"Up","tags":[],"Value":2,"Enum":"SwipeDirection"},{"type":"EnumItem","Name":"Down","tags":[],"Value":3,"Enum":"SwipeDirection"},{"type":"EnumItem","Name":"None","tags":[],"Value":4,"Enum":"SwipeDirection"},{"type":"Enum","Name":"TableMajorAxis","tags":[]},{"type":"EnumItem","Name":"RowMajor","tags":[],"Value":0,"Enum":"TableMajorAxis"},{"type":"EnumItem","Name":"ColumnMajor","tags":[],"Value":1,"Enum":"TableMajorAxis"},{"type":"Enum","Name":"TeleportState","tags":[]},{"type":"EnumItem","Name":"RequestedFromServer","tags":[],"Value":0,"Enum":"TeleportState"},{"type":"EnumItem","Name":"Started","tags":[],"Value":1,"Enum":"TeleportState"},{"type":"EnumItem","Name":"WaitingForServer","tags":[],"Value":2,"Enum":"TeleportState"},{"type":"EnumItem","Name":"Failed","tags":[],"Value":3,"Enum":"TeleportState"},{"type":"EnumItem","Name":"InProgress","tags":[],"Value":4,"Enum":"TeleportState"},{"type":"Enum","Name":"TeleportType","tags":[]},{"type":"EnumItem","Name":"ToPlace","tags":[],"Value":0,"Enum":"TeleportType"},{"type":"EnumItem","Name":"ToInstance","tags":[],"Value":1,"Enum":"TeleportType"},{"type":"EnumItem","Name":"ToReservedServer","tags":[],"Value":2,"Enum":"TeleportType"},{"type":"Enum","Name":"TextXAlignment","tags":[]},{"type":"EnumItem","Name":"Left","tags":[],"Value":0,"Enum":"TextXAlignment"},{"type":"EnumItem","Name":"Center","tags":[],"Value":2,"Enum":"TextXAlignment"},{"type":"EnumItem","Name":"Right","tags":[],"Value":1,"Enum":"TextXAlignment"},{"type":"Enum","Name":"TextYAlignment","tags":[]},{"type":"EnumItem","Name":"Top","tags":[],"Value":0,"Enum":"TextYAlignment"},{"type":"EnumItem","Name":"Center","tags":[],"Value":1,"Enum":"TextYAlignment"},{"type":"EnumItem","Name":"Bottom","tags":[],"Value":2,"Enum":"TextYAlignment"},{"type":"Enum","Name":"TextureMode","tags":[]},{"type":"EnumItem","Name":"Stretch","tags":[],"Value":0,"Enum":"TextureMode"},{"type":"EnumItem","Name":"Wrap","tags":[],"Value":1,"Enum":"TextureMode"},{"type":"EnumItem","Name":"Static","tags":[],"Value":2,"Enum":"TextureMode"},{"type":"Enum","Name":"TextureQueryType","tags":[]},{"type":"EnumItem","Name":"NonHumanoid","tags":[],"Value":0,"Enum":"TextureQueryType"},{"type":"EnumItem","Name":"NonHumanoidOrphaned","tags":[],"Value":1,"Enum":"TextureQueryType"},{"type":"EnumItem","Name":"Humanoid","tags":[],"Value":2,"Enum":"TextureQueryType"},{"type":"EnumItem","Name":"HumanoidOrphaned","tags":[],"Value":3,"Enum":"TextureQueryType"},{"type":"Enum","Name":"ThreadPoolConfig","tags":[]},{"type":"EnumItem","Name":"Auto","tags":[],"Value":0,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"PerCore1","tags":[],"Value":101,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"PerCore2","tags":[],"Value":102,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"PerCore3","tags":[],"Value":103,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"PerCore4","tags":[],"Value":104,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"Threads1","tags":[],"Value":1,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"Threads2","tags":[],"Value":2,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"Threads3","tags":[],"Value":3,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"Threads4","tags":[],"Value":4,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"Threads8","tags":[],"Value":8,"Enum":"ThreadPoolConfig"},{"type":"EnumItem","Name":"Threads16","tags":[],"Value":16,"Enum":"ThreadPoolConfig"},{"type":"Enum","Name":"ThrottlingPriority","tags":[]},{"type":"EnumItem","Name":"Extreme","tags":[],"Value":2,"Enum":"ThrottlingPriority"},{"type":"EnumItem","Name":"ElevatedOnServer","tags":[],"Value":1,"Enum":"ThrottlingPriority"},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"ThrottlingPriority"},{"type":"Enum","Name":"ThumbnailSize","tags":[]},{"type":"EnumItem","Name":"Size48x48","tags":[],"Value":0,"Enum":"ThumbnailSize"},{"type":"EnumItem","Name":"Size180x180","tags":[],"Value":1,"Enum":"ThumbnailSize"},{"type":"EnumItem","Name":"Size420x420","tags":[],"Value":2,"Enum":"ThumbnailSize"},{"type":"EnumItem","Name":"Size60x60","tags":[],"Value":3,"Enum":"ThumbnailSize"},{"type":"EnumItem","Name":"Size100x100","tags":[],"Value":4,"Enum":"ThumbnailSize"},{"type":"EnumItem","Name":"Size150x150","tags":[],"Value":5,"Enum":"ThumbnailSize"},{"type":"EnumItem","Name":"Size352x352","tags":[],"Value":6,"Enum":"ThumbnailSize"},{"type":"Enum","Name":"ThumbnailType","tags":[]},{"type":"EnumItem","Name":"HeadShot","tags":[],"Value":0,"Enum":"ThumbnailType"},{"type":"EnumItem","Name":"AvatarBust","tags":[],"Value":1,"Enum":"ThumbnailType"},{"type":"EnumItem","Name":"AvatarThumbnail","tags":[],"Value":2,"Enum":"ThumbnailType"},{"type":"Enum","Name":"TickCountSampleMethod","tags":[]},{"type":"EnumItem","Name":"Fast","tags":[],"Value":0,"Enum":"TickCountSampleMethod"},{"type":"EnumItem","Name":"Benchmark","tags":[],"Value":1,"Enum":"TickCountSampleMethod"},{"type":"EnumItem","Name":"Precise","tags":[],"Value":2,"Enum":"TickCountSampleMethod"},{"type":"Enum","Name":"TopBottom","tags":[]},{"type":"EnumItem","Name":"Top","tags":[],"Value":0,"Enum":"TopBottom"},{"type":"EnumItem","Name":"Center","tags":[],"Value":1,"Enum":"TopBottom"},{"type":"EnumItem","Name":"Bottom","tags":[],"Value":2,"Enum":"TopBottom"},{"type":"Enum","Name":"TouchCameraMovementMode","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"TouchCameraMovementMode"},{"type":"EnumItem","Name":"Follow","tags":[],"Value":2,"Enum":"TouchCameraMovementMode"},{"type":"EnumItem","Name":"Classic","tags":[],"Value":1,"Enum":"TouchCameraMovementMode"},{"type":"EnumItem","Name":"Orbital","tags":[],"Value":3,"Enum":"TouchCameraMovementMode"},{"type":"Enum","Name":"TouchMovementMode","tags":[]},{"type":"EnumItem","Name":"Default","tags":[],"Value":0,"Enum":"TouchMovementMode"},{"type":"EnumItem","Name":"Thumbstick","tags":[],"Value":1,"Enum":"TouchMovementMode"},{"type":"EnumItem","Name":"DPad","tags":[],"Value":2,"Enum":"TouchMovementMode"},{"type":"EnumItem","Name":"Thumbpad","tags":[],"Value":3,"Enum":"TouchMovementMode"},{"type":"EnumItem","Name":"ClickToMove","tags":[],"Value":4,"Enum":"TouchMovementMode"},{"type":"EnumItem","Name":"DynamicThumbstick","tags":[],"Value":5,"Enum":"TouchMovementMode"},{"type":"Enum","Name":"TweenStatus","tags":[]},{"type":"EnumItem","Name":"Canceled","tags":[],"Value":0,"Enum":"TweenStatus"},{"type":"EnumItem","Name":"Completed","tags":[],"Value":1,"Enum":"TweenStatus"},{"type":"Enum","Name":"UiMessageType","tags":[]},{"type":"EnumItem","Name":"UiMessageError","tags":[],"Value":0,"Enum":"UiMessageType"},{"type":"EnumItem","Name":"UiMessageInfo","tags":[],"Value":1,"Enum":"UiMessageType"},{"type":"Enum","Name":"UploadSetting","tags":[]},{"type":"EnumItem","Name":"Never","tags":[],"Value":0,"Enum":"UploadSetting"},{"type":"EnumItem","Name":"Ask","tags":[],"Value":1,"Enum":"UploadSetting"},{"type":"EnumItem","Name":"Always","tags":[],"Value":2,"Enum":"UploadSetting"},{"type":"Enum","Name":"UserCFrame","tags":[]},{"type":"EnumItem","Name":"Head","tags":[],"Value":0,"Enum":"UserCFrame"},{"type":"EnumItem","Name":"LeftHand","tags":[],"Value":1,"Enum":"UserCFrame"},{"type":"EnumItem","Name":"RightHand","tags":[],"Value":2,"Enum":"UserCFrame"},{"type":"Enum","Name":"UserInputState","tags":[]},{"type":"EnumItem","Name":"Begin","tags":[],"Value":0,"Enum":"UserInputState"},{"type":"EnumItem","Name":"Change","tags":[],"Value":1,"Enum":"UserInputState"},{"type":"EnumItem","Name":"End","tags":[],"Value":2,"Enum":"UserInputState"},{"type":"EnumItem","Name":"Cancel","tags":[],"Value":3,"Enum":"UserInputState"},{"type":"EnumItem","Name":"None","tags":[],"Value":4,"Enum":"UserInputState"},{"type":"Enum","Name":"UserInputType","tags":[]},{"type":"EnumItem","Name":"MouseButton1","tags":[],"Value":0,"Enum":"UserInputType"},{"type":"EnumItem","Name":"MouseButton2","tags":[],"Value":1,"Enum":"UserInputType"},{"type":"EnumItem","Name":"MouseButton3","tags":[],"Value":2,"Enum":"UserInputType"},{"type":"EnumItem","Name":"MouseWheel","tags":[],"Value":3,"Enum":"UserInputType"},{"type":"EnumItem","Name":"MouseMovement","tags":[],"Value":4,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Touch","tags":[],"Value":7,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Keyboard","tags":[],"Value":8,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Focus","tags":[],"Value":9,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Accelerometer","tags":[],"Value":10,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gyro","tags":[],"Value":11,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad1","tags":[],"Value":12,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad2","tags":[],"Value":13,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad3","tags":[],"Value":14,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad4","tags":[],"Value":15,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad5","tags":[],"Value":16,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad6","tags":[],"Value":17,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad7","tags":[],"Value":18,"Enum":"UserInputType"},{"type":"EnumItem","Name":"Gamepad8","tags":[],"Value":19,"Enum":"UserInputType"},{"type":"EnumItem","Name":"TextInput","tags":[],"Value":20,"Enum":"UserInputType"},{"type":"EnumItem","Name":"None","tags":[],"Value":21,"Enum":"UserInputType"},{"type":"Enum","Name":"VRTouchpad","tags":[]},{"type":"EnumItem","Name":"Left","tags":[],"Value":0,"Enum":"VRTouchpad"},{"type":"EnumItem","Name":"Right","tags":[],"Value":1,"Enum":"VRTouchpad"},{"type":"Enum","Name":"VRTouchpadMode","tags":[]},{"type":"EnumItem","Name":"Touch","tags":[],"Value":0,"Enum":"VRTouchpadMode"},{"type":"EnumItem","Name":"VirtualThumbstick","tags":[],"Value":1,"Enum":"VRTouchpadMode"},{"type":"EnumItem","Name":"ABXY","tags":[],"Value":2,"Enum":"VRTouchpadMode"},{"type":"Enum","Name":"VerticalAlignment","tags":[]},{"type":"EnumItem","Name":"Center","tags":[],"Value":0,"Enum":"VerticalAlignment"},{"type":"EnumItem","Name":"Top","tags":[],"Value":1,"Enum":"VerticalAlignment"},{"type":"EnumItem","Name":"Bottom","tags":[],"Value":2,"Enum":"VerticalAlignment"},{"type":"Enum","Name":"VerticalScrollBarPosition","tags":[]},{"type":"EnumItem","Name":"Left","tags":[],"Value":1,"Enum":"VerticalScrollBarPosition"},{"type":"EnumItem","Name":"Right","tags":[],"Value":0,"Enum":"VerticalScrollBarPosition"},{"type":"Enum","Name":"VibrationMotor","tags":[]},{"type":"EnumItem","Name":"Large","tags":[],"Value":0,"Enum":"VibrationMotor"},{"type":"EnumItem","Name":"Small","tags":[],"Value":1,"Enum":"VibrationMotor"},{"type":"EnumItem","Name":"LeftTrigger","tags":[],"Value":2,"Enum":"VibrationMotor"},{"type":"EnumItem","Name":"RightTrigger","tags":[],"Value":3,"Enum":"VibrationMotor"},{"type":"EnumItem","Name":"LeftHand","tags":[],"Value":4,"Enum":"VibrationMotor"},{"type":"EnumItem","Name":"RightHand","tags":[],"Value":5,"Enum":"VibrationMotor"},{"type":"Enum","Name":"VideoQualitySettings","tags":[]},{"type":"EnumItem","Name":"LowResolution","tags":[],"Value":0,"Enum":"VideoQualitySettings"},{"type":"EnumItem","Name":"MediumResolution","tags":[],"Value":1,"Enum":"VideoQualitySettings"},{"type":"EnumItem","Name":"HighResolution","tags":[],"Value":2,"Enum":"VideoQualitySettings"},{"type":"Enum","Name":"WaterDirection","tags":[]},{"type":"EnumItem","Name":"NegX","tags":[],"Value":0,"Enum":"WaterDirection"},{"type":"EnumItem","Name":"X","tags":[],"Value":1,"Enum":"WaterDirection"},{"type":"EnumItem","Name":"NegY","tags":[],"Value":2,"Enum":"WaterDirection"},{"type":"EnumItem","Name":"Y","tags":[],"Value":3,"Enum":"WaterDirection"},{"type":"EnumItem","Name":"NegZ","tags":[],"Value":4,"Enum":"WaterDirection"},{"type":"EnumItem","Name":"Z","tags":[],"Value":5,"Enum":"WaterDirection"},{"type":"Enum","Name":"WaterForce","tags":[]},{"type":"EnumItem","Name":"None","tags":[],"Value":0,"Enum":"WaterForce"},{"type":"EnumItem","Name":"Small","tags":[],"Value":1,"Enum":"WaterForce"},{"type":"EnumItem","Name":"Medium","tags":[],"Value":2,"Enum":"WaterForce"},{"type":"EnumItem","Name":"Strong","tags":[],"Value":3,"Enum":"WaterForce"},{"type":"EnumItem","Name":"Max","tags":[],"Value":4,"Enum":"WaterForce"},{"type":"Enum","Name":"ZIndexBehavior","tags":[]},{"type":"EnumItem","Name":"Global","tags":[],"Value":0,"Enum":"ZIndexBehavior"},{"type":"EnumItem","Name":"Sibling","tags":[],"Value":1,"Enum":"ZIndexBehavior"}]]==]
	rawAPI = Services.HttpService:JSONDecode(rawAPI)

	for _, entry in pairs(rawAPI) do
		local eType = entry.type
		if eType == "Class" then
			classes[entry.Name] = entry
			entry.Properties = {}
			entry.Functions = {}
			entry.YieldFunctions = {}
			entry.Events = {}
			entry.Callbacks = {}
		elseif eType == "Property" then
			table.insert(classes[entry.Class].Properties, entry)
			entry.Category = (propCategories[entry.Class] and propCategories[entry.Class][entry.Name] or "Other")
			entry.Tags = {}
			for i, tag in pairs(entry.tags) do
				entry.Tags[tag] = true
			end
			entry.tags = nil
		elseif eType == "Enum" then
			enums[entry.Name] = entry
			entry.EnumItems = {}
		elseif eType == "EnumItem" then
			table.insert(enums[entry.Enum].EnumItems, entry)
		end
	end

	local function getMember(class, mType)
		if not classes[class] or not classes[class][mType] then
			return
		end
		local result = {}

		local currentClass = classes[class]
		while currentClass do
			for _, entry in pairs(currentClass[mType]) do
				table.insert(result, entry)
			end
			currentClass = classes[currentClass.Superclass]
		end

		table.sort(result, function(a, b)
			return a.Name < b.Name
		end)
		return result
	end

	local API = {
		Classes = classes,
		Enums = enums,
		GetMember = getMember,
	}

	return API
end

f.fetchRMD = function()
	local rawRMD = nil
	if script and script:FindFirstChild("RMD") then
		rawRMD = require(script.RMD)
	else
		rawRMD =
			[==[[{"Name":"BindableFunction","Summary":"Allow functions defined in one script to be called by another script","ExplorerOrder":4,"ExplorerImageIndex":66,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Invoke","Summary":"Causes the function assigned to OnInvoke to be called. Arguments passed to this function get passed to OnInvoke function.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"OnInvoke","Summary":"Should be defined as a function. This function is called when Invoke() is called. Number of arguments is variable.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BindableEvent","Summary":"Allow events defined in one script to be subscribed to by another script","ExplorerOrder":5,"ExplorerImageIndex":67,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Fire","Summary":"Used to make the custom event fire (see Event for more info). Arguments can be variable length.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Event","Summary":"This event fires when the Fire() method is used.  Receives the variable length arguments from Fire().","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchTransmitter","Summary":"Used by networking and replication code to transmit touch events - no other purpose","ExplorerOrder":3,"ExplorerImageIndex":37,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ForceField","Summary":"Prevents joint breakage from explosions, and stops Humanoids from taking damage","ExplorerOrder":3,"ExplorerImageIndex":37,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PluginManager","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TeleportService","Summary":"Allows players to seamlessly leave a game and join another","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Plugin","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PluginMouse","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Glue","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CollectionService","Summary":"A service which provides collections of instances based on tags assigned to them.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"ItemAdded","Summary":"Deprecated. Use GetInstanceAddedSignal instead.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"ItemRemoved","Summary":"Deprecated. Use GetInstancedRemovedSignal instead.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"GetCollection","Summary":"Deprecated. Use GetTagged instead.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"GetTagged","Summary":"Returns an array of all of the instances in the data model which have the given tag.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AddTag","Summary":"Adds a tag to an instance.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RemoveTag","Summary":"Removes a tag to an instance.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetTags","Summary":"Returns a list of all the collections that an instance belongs to.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"HasTag","Summary":"Returns whether the given instance has the given tag.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetInstanceAddedSignal","Summary":"Returns a signal that fires when the given tag either has a new instance with that tag added to the data model or that tag is assigned to an instance within the data model.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetInstanceRemovedSignal","Summary":"Returns a signal that fires when the given tag either has an instance with that tag removed from the data model or that tag is removed from an instance within the data model.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"JointsService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RunService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BadgeService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LogService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AssetService","Summary":"A service used to set and get information about assets stored on the Roblox website.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"RevertAsset","Summary":"Reverts a given place id to the version number provided. Returns true if successful on reverting, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetPlacePermissions","Summary":"Sets the permissions for a placeID to the place accessType. An optional table (inviteList) can be included that will set the accessType for only the player names provided. The table should be set up as an array of usernames (strings).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetPlacePermissions","Summary":"Given a placeID, this function will return a table with the permissions of the place. Useful for determining what kind of permissions a particular user may have for a place.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetAssetVersions","Summary":"Given a placeID, this function will return a table with the version info of the place. An optional arg of page number can be used to page through all revisions (a single page may hold about 50 revisions).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetCreatorAssetID","Summary":"Given a creationID, this function will return the asset that created the creationID. If no other asset created the given creationID, 0 is returned.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"HttpService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"HttpEnabled","Summary":"Enabling http requests from scripts","Browsable":"true","Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InsertService","Summary":"A service used to insert objects stored on the website into the game.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"AllowClientInsertModels","Summary":"Can be set in non-filtering-enabled places to allow LoadAsset to be used in LocalScripts.","Browsable":"true","Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AllowInsertFreeModels","Summary":"Allows free models to be inserted into place.","Browsable":"false","Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"GetCollection","Summary":"Returns a table for the assets stored in the category.  A category is an setId from www.roblox.com that links to a set.  <a href=\"http://wiki.roblox.com/index.php?title=API:Class/InsertService/GetCollection\" target=\"_blank\">More info on table format</a>. <a href=\"http://wiki.roblox.com/index.php/Sets\" target=\"_blank\">More info on sets</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Insert","Summary":"Inserts the Instance into the workspace.  It is recommended to use Instance.Parent = game.Workspace instead, as this can cause issues currently.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ApproveAssetId","Summary":"Deprecated","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"ApproveAssetVersionId","Summary":"Deprecated","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"GetBaseSets","Summary":"Returns a table containing a list of the various setIds that are ROBLOX approved. <a href=\"http://wiki.roblox.com/index.php/Sets\" target=\"_blank\">More info on sets</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetUserSets","Summary":"Returns a table containing a list of the various setIds that correspond to argument 'userId'. <a href=\"http://wiki.roblox.com/index.php/Sets\" target=\"_blank\">More info on sets</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetBaseCategories","Summary":"Deprecated. Use GetBaseSets() instead.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"GetUserCategories","Summary":"Deprecated. Use GetUserSets() instead.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LoadAsset","Summary":"Returns a Model containing the Instance that resides at AssetId on the web. This call will also yield the script until the model is returned. Script execution can still continue, however, if you use a <a href=\"http://wiki.roblox.com/index.php?title=Coroutine\" target=\"_blank\">coroutine</a>.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LoadAssetVersion","Summary":"Similar to LoadAsset, but instead an AssetVersionId is passed in, which refers to a particular version of the asset which is not neccessarily the latest version.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Hat","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":45,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"Accessory","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":32,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LocalBackpack","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LocalBackpackItem","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorFeature","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"Attachment","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":81,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Rotation","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WorldRotation","Summary":"Deprecated. Use WorldOrientation instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"Orientation","Summary":"Euler angles applied in YXZ order","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WorldOrientation","Summary":"Euler angles applied in YXZ order","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Constraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":86,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Enabled","Summary":"Toggles whether or not this constraint is enabled. Disabled constraints will not render in game.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Color","Summary":"The color of the in-game visual.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Visible","Summary":"Toggles the in-game visual associated with this constraint.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BallSocketConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":86,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LimitsEnabled","Summary":"Enables the angular limit between the axis of Attachment0 and the axis of Attachment1.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UpperAngle","Summary":"Maximum angle between the two main axes. Value in [0, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Restitution","Summary":"Restitution of the limit, or how elastic it is. Value in [0, 1].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TwistLimitsEnabled","Summary":"Enables the angular limits around the main axis of Attachment1.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TwistUpperAngle","Summary":"Upper angular limit around the axis of Attachment1. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TwistLowerAngle","Summary":"Lower angular limit around the axis of Attachment1. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Radius","Summary":"Radius of the in-game visual. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RopeConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":89,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Length","Summary":"The length of the rope or the maximum distance between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Restitution","Summary":"Restitution of the rope, or how elastic it is. Value in [0, 1].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CurrentDistance","Summary":"Current distance between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Thickness","Summary":"The thickness of the in-game visual (diameter). Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RodConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":90,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Length","Summary":"The length of the rod or the distance to be maintained between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CurrentDistance","Summary":"Current distance between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Thickness","Summary":"The thickness of the in-game visual (diameter). Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SpringConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":91,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LimitsEnabled","Summary":"Enables limits on the length of the spring.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Stiffness","Summary":"The stiffness parameter of the spring. Force is scaled based on distance from the free length. The units of this property are force / distance. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Damping","Summary":"The damping parameter of the spring. The force is scaled with respect to relative velocity. The units of this property are force / velocity. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FreeLength","Summary":"The distance (in studs) between the two attachments at which the spring exerts no stiffness force. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MaxForce","Summary":"The maximum force that the spring can apply. Useful to prevent instabilities. The units are mass * studs / seconds^2. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MaxLength","Summary":"Maximum spring length, or the maxium distance between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MinLength","Summary":"Minimum spring length, or the minimum distance between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Radius","Summary":"The radius of the in-game spring coil visual. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Thickness","Summary":"The thickness of the spring wire (diameter) in the in-game visual. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Coils","Summary":"The number of coils in the in-game visual. Value in [0, 8].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CurrentLength","Summary":"Current distance between the two attachments. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WeldConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":94,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"HingeConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":87,"Browsable":true,"PreferredParent":"","Members":[{"Name":"ActuatorType","Summary":"Type of the rotational actuator: None, Motor, or Servo.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LimitsEnabled","Summary":"Enables the angular limits on rotations around the main axis of Attachment0.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UpperAngle","Summary":"Upper limit for the angle from the SecondaryAxis of Attachment0 to the SecondaryAxis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LowerAngle","Summary":"Lower limit for the angle from the SecondaryAxis of Attachment0 to the SecondaryAxis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularRestitution","Summary":"Restitution of the two limits, or how elastic they are. Value in [0,1].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularVelocity","Summary":"The target angular velocity of the motor in radians per second around the rotation axis. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorMaxTorque","Summary":"The maximum torque the motor can apply to achieve the target angular velocity. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorMaxAcceleration","Summary":"The maximum angular acceleration of the motor in radians per second square. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularSpeed","Summary":"Target angular speed. This value is unsigned as the servo will always move toward its target. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ServoMaxTorque","Summary":"Maximum torque the servo motor can apply. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TargetAngle","Summary":"Target angle for the SecondaryAxis of Attachment1 from the SecondaryAxis of Attachment0 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CurrentAngle","Summary":"Signed angle between the SecondaryAxis of Attchement0 and the SecondaryAxis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Radius","Summary":"Radius of the in-game visual. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SlidingBallConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":88,"Browsable":true,"PreferredParent":"","Members":[{"Name":"ActuatorType","Summary":"Type of linear actuator (along the axis of the slider): None, Motor, or Servo.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LimitsEnabled","Summary":"Enables the limits on the linear motion along the axis of the slider.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LowerLimit","Summary":"Lower limit for the position of Attachment1 with respect to Attachment0 along the slider axis. Value in (-inf, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UpperLimit","Summary":"Upper limit for the position of Attachment1 with respect to Attachment0 along the slider axis. Value in (-inf, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Restitution","Summary":"Restitution of the two limits, or how elastic they are. Value in [0, 1].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Velocity","Summary":"The target linear velocity of the motor in studs per second along the slider axis. Value in (-inf, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorMaxForce","Summary":"The maximum force the motor can apply to achieve the target velocity. Units are mass * studs / seconds^2. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorMaxAcceleration","Summary":"The maximum acceleration of the motor in studs per second squared. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Speed","Summary":"Target speed in studs per second. This value is unsigned as the servo will always move toward its target. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ServoMaxForce","Summary":"Maximum force the servo motor can apply. Units are mass * studs / seconds^2. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TargetPosition","Summary":"Target position of Attachment1 with respect to Attachment0 along the slider axis. Value in (-inf, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CurrentPosition","Summary":"Current position of Attachment1 with respect to Attachment0 along the slider axis. Value in (-inf, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Size","Summary":"Size of the in-game visual associated with this constraint. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PrismaticConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":88,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CylindricalConstraint","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":95,"Browsable":true,"PreferredParent":"","Members":[{"Name":"InclinationAngle","Summary":"Direction of the rotation axis as an angle from the x-axis in the xy-plane of Attachment0. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularActuatorType","Summary":"Type of angular actuator: None, Motor, or Servo.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularLimitsEnabled","Summary":"Enables the angular limits around the rotation axis.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UpperAngle","Summary":"Upper limit for the angle (in degrees) between the reference axis and the SecondaryAxis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LowerAngle","Summary":"Lower limit for the angle (in degrees) between the reference axis and the SecondaryAxis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularRestitution","Summary":"Restitution of the two limits, or how elastic they are. Value in [0, 1].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularVelocity","Summary":"The target angular velocity of the motor in radians per second around the rotation axis. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorMaxTorque","Summary":"The maximum torque the motor can apply to achieve the target angular velocity. The units are mass * studs^2 / second^2. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MotorMaxAngularAcceleration","Summary":"The maximum angular acceleration of the motor in radians per second squared. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AngularSpeed","Summary":"Target angular speed. This value is unsigned as the servo will always move toward its target. In radians per second. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ServoMaxTorque","Summary":"Maximum torque the servo motor can apply. The units are mass * studs^2 / second^2. Value in [0, inf).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TargetAngle","Summary":"Target angle (in degrees) between the reference axis and the secondary axis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CurrentAngle","Summary":"Signed angle (in degrees) between the reference axis and the secondary axis of Attachment1 around the rotation axis. Value in [-180, 180].","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WorldRotationAxis","Summary":"The unit vector direction of the rotation axis in world coordinates.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RotationAxisVisible","Summary":"Enable the visibility of the rotation axis.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AlignOrientation","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":82,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AlignPosition","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":82,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"VectorForce","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":82,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LineForce","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":82,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Torque","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":82,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Mouse","Summary":"Used to receive input from the user. Actually tracks mouse events and keyboard events.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Hit","Summary":"The CoordinateFrame of where the Mouse ray is currently hitting a 3D object in the Workspace.  If the mouse is not over any 3D objects in the Workspace, this property is nil.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Icon","Summary":"The current Texture of the Mouse Icon. Stored as a string, for more information on how to format the string <a href=\"http://wiki.roblox.com/index.php/Content\" target=\"_blank\">go here</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Origin","Summary":"The CoordinateFrame of where the Mouse is when the mouse is not clicking.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Origin","Summary":"The CoordinateFrame of where the Mouse is when the mouse is not clicking.  This CoordinateFrame will be very close to the Camera.CoordinateFrame.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Target","Summary":"The Part the mouse is currently over. If the mouse is not currently over any object (on the skybox, for example) this property is nil.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TargetFilter","Summary":"A Part or Model that the Mouse will ignore when trying to find the Target, TargetSurface and Hit.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TargetSurface","Summary":"The NormalId (Top, Left, Down, etc.) of the face of the part the Mouse is currently over.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UnitRay","Summary":"The Unit Ray from where the mouse is (Origin) to the current Mouse.Target.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ViewSizeX","Summary":"The viewport's (game window) width in pixels.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ViewSizeY","Summary":"The viewport's (game window) height in pixels.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"X","Summary":"The absolute pixel position of the Mouse along the x-axis of the viewport (game window). Values start at 0 on the left hand side of the screen and increase to the right.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Y","Summary":"The absolute pixel position of the Mouse along the y-axis of the viewport (game window). Values start at 0 on the stop of the screen and increase to the bottom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Button1Down","Summary":"Fired when the first button (usually the left, but could be another) on the mouse is depressed.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Button1Up","Summary":"Fired when the first button (usually the left, but could be another) on the mouse is release.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Button2Down","Summary":"This event is currently non-operational.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Button2Up","Summary":"This event is currently non-operational.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Idle","Summary":"Fired constantly when the mouse is not firing any other event (i.e. the mouse isn't moving, nor any buttons being pressed or depressed).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"KeyDown","Summary":"Fired when a user presses a key on the keyboard. Argument is a string representation of the key.  If the key has no string representation (such as space), the string passed in is the keycode for that character. Keycodes are currently in ASCII.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"KeyUp","Summary":"Fired when a user releases a key on the keyboard. Argument is a string representation of the key.  If the key has no string representation (such as space), the string passed in is the keycode for that character. Keycodes are currently in ASCII.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Move","Summary":"Fired when the mouse X or Y member changes.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WheelBackward","Summary":"This event is currently non-operational.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WheelForward","Summary":"This event is currently non-operational.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ProfilingItem","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ChangeHistoryService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RotateP","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RotateV","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScriptContext","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Selection","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"VelocityMotor","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Weld","Summary":"","ExplorerOrder":20,"ExplorerImageIndex":34,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TaskScheduler","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"SetThreadShare","Summary":"Deprecated","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StatsItem","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Snap","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FileMesh","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ClickDetector","Summary":"Raises mouse events for parent object","ExplorerOrder":3,"ExplorerImageIndex":41,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MaxActivationDistance","Summary":"The maximum distance a Player's character can be from the ClickDetector's parent Part that will allow the Player's mouse to fire events on this object.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseClick","Summary":"Fired when a player clicks on the parent Part of ClickDetector. The argument provided is always of type Player.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseHoverEnter","Summary":"Fired when a player's mouse enters on the parent Part of ClickDetector. The argument provided is always of type Player.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseHoverLeave","Summary":"Fired when a player's mouse leaves the parent Part of ClickDetector. The argument provided is always of type Player.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Clothing","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Smoke","Summary":"Makes the parent part or model object emit smoke","ExplorerOrder":3,"ExplorerImageIndex":59,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Trail","Summary":"Makes two attachments emit trail when moving","ExplorerOrder":3,"ExplorerImageIndex":93,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LightEmission","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Beam","Summary":"Makes beam between two attachments","ExplorerOrder":3,"ExplorerImageIndex":96,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LightEmission","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ParticleEmitter","Summary":"A generic particle system.","ExplorerOrder":3,"ExplorerImageIndex":80,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LightEmission","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LightInfluence","Summary":"Specifies the amount of influence lighting has on the particle emmitter. A value of 0 is unlit, 1 is fully lit. Fractional values blend from unlit to lit.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Drag","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"VelocityInheritance","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Rate","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Rotation","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RotSpeed","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Speed","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Lifetime","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Sparkles","Summary":"Makes the parent part or model object fantastic","ExplorerOrder":3,"ExplorerImageIndex":42,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Explosion","Summary":"Creates an Explosion! This can be used as a purely graphical effect, or can be made to damage objects.","ExplorerOrder":3,"ExplorerImageIndex":36,"Browsable":true,"PreferredParent":"","Members":[{"Name":"BlastPressure","Summary":"How much force this Explosion exerts on objects within it's BlastRadius. Setting this to 0 creates a purely graphical effect. A larger number will cause Parts to fly away at higher velocities.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BlastRadius","Summary":"How big the Explosion is. This is a circle starting from the center of the Explosion's Position, the larger this property the larger the circle of destruction.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Position","Summary":"Where the Explosion occurs in absolute world coordinates.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ExplosionType","Summary":"Defines the behavior of the Explosion. <a href=\"http://wiki.roblox.com/index.php/ExplosionType\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Fire","Summary":"Makes the parent part or model object emit fire","ExplorerOrder":3,"ExplorerImageIndex":61,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Color","Summary":"The color of the base of the fire.  See SecondaryColor for more.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Heat","Summary":"How hot the fire appears to be. The flame moves quicker the higher this value is set.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SecondaryColor","Summary":"The color the fire interpolates to from Color. The longer a particle exists in the fire, the close to this color it becomes.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Size","Summary":"How large the fire appears to be.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Seat","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":35,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Platform","Summary":"Equivalent to a seat, except that the character stands up rather than sits down.","ExplorerOrder":3,"ExplorerImageIndex":35,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SkateboardPlatform","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":35,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"VehicleSeat","Summary":"Automatically finds and powers hinge joints in an assembly.  Ignores motors.","ExplorerOrder":3,"ExplorerImageIndex":35,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Tool","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":17,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Flag","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":38,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[{"Name":"CanBeDropped","Summary":"If someone is carrying this flag, this bool determines whether or not they can drop it and run.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TeamColor","Summary":"The Team this flag is for. Corresponds with the TeamColors in the Teams service.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Preliminary":false,"IsBackend":false},{"Name":"FlagStand","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":39,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"BackpackItem","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Decal","Summary":"Descibes a texture that is placed on one of the sides of the Part it is parented to.","ExplorerOrder":4,"ExplorerImageIndex":7,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Face","Summary":"Describes the face of the Part the decal will be applied to. <a href=\"http://wiki.roblox.com/index.php/NormalId\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Shiny","Summary":"How much light will appear to reflect off of the decal.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Specular","Summary":"How light will react to the surface of the decal.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Transparency","Summary":"How visible the decal is.  1 is completely invisible, while 0 is completely opaque","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"JointInstance","Summary":"","ExplorerOrder":20,"ExplorerImageIndex":34,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Message","Summary":"","ExplorerOrder":11,"ExplorerImageIndex":33,"Browsable":true,"Deprecated":"true","PreferredParent":"StarterGui","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"Hint","Summary":"","ExplorerOrder":11,"ExplorerImageIndex":33,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"IntValue","Summary":"Stores a int value in it's Value member. Useful to share int information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RayValue","Summary":"Stores a Ray value in it's Value member. Useful to share Ray information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"IntConstrainedValue","Summary":"Stores an int value in it's Value member.  Value is clamped to be in range of Min and MaxValue. Useful to share int information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"DoubleConstrainedValue","Summary":"Stores a double value in it's Value member.  Value is clamped to be in range of Min and MaxValue. Useful to share double information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[{"Name":"MaxValue","Summary":"The maximum we allow this Value to be set.  If Value is set higher than this, it automatically gets adjusted to MaxValue","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MinValue","Summary":"The minimum we allow this Value to be set.  If Value is set lower than this, it automatically gets adjusted to MinValue","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Preliminary":false,"IsBackend":false},{"Name":"BoolValue","Summary":"Stores a boolean value in it's Value member. Useful to share boolean information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CustomEvent","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"CustomEventReceiver","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"FloorWire","Summary":"Renders a thin cylinder than can be adorned with textures that 'flow' from one object to the next. Has basic pathing abilities and attempts to to not intersect anything. <a href=\"http://wiki.roblox.com/index.php/FloorWire_Guide\" target=\"_blank\">More info</a>","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[{"Name":"CycleOffset","Summary":"Controls how the decals are positioned along the wire. <a href=\"http://wiki.roblox.com/index.php/CycleOffset\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"From","Summary":"The object the FloorWire 'emits' from","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StudsBetweenTextures","Summary":"The space between two textures on the wire. Note: studs are relative depending on how far the camera is from the FloorWire.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Texture","Summary":"The image we use to render the textures that flow from beginning to end of the FloorWire.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TextureSize","Summary":"The size in studs of the Texture we use to flow from one object to the next.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"To","Summary":"The object the FloorWire 'emits' to","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Velocity","Summary":"The rate of travel that the textures flow along the wire.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WireRadius","Summary":"How thick the wire is.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Preliminary":false,"IsBackend":false},{"Name":"NumberValue","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StringValue","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Vector3Value","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CFrameValue","Summary":"Stores a CFrame value in it's Value member. Useful to share CFrame information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Color3Value","Summary":"Stores a Color3 value in it's Value member. Useful to share Color3 information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BrickColorValue","Summary":"Stores a BrickColor value in it's Value member. Useful to share BrickColor information across multiple scripts.","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ObjectValue","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":4,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SpecialMesh","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":8,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BlockMesh","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":8,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CylinderMesh","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":8,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BevelMesh","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"DataModelMesh","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Texture","Summary":"","ExplorerOrder":4,"ExplorerImageIndex":10,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Sound","Summary":"","ExplorerOrder":1,"ExplorerImageIndex":11,"Browsable":true,"PreferredParent":"","Members":[{"Name":"play","Summary":"Deprecated. Use Play() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"PlayOnRemove","Summary":"The sound will play when it is removed from the Workspace. Looped sounds don't play","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"EchoSoundEffect","Summary":"An echo audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Delay","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Feedback","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DryLevel","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WetLevel","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FlangeSoundEffect","Summary":"A Flanging audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Mix","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Depth","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Rate","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DistortionSoundEffect","Summary":"A Distortion audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Level","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PitchShiftSoundEffect","Summary":"A Pitch Shifting audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Octave","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ChorusSoundEffect","Summary":"A Chorus audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Mix","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Rate","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Depth","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TremoloSoundEffect","Summary":"A Tremolo audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Frequency","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Depth","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Duty","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ReverbSoundEffect","Summary":"A Reverb audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"DecayTime","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Diffusion","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Density","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DryLevel","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WetLevel","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"EqualizerSoundEffect","Summary":"An Three-band Equalizer audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LowGain","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MidGain","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"HighGain","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CompressorSoundEffect","Summary":"A Compressor audio effect that can be applied to a Sound or SoundGroup.","ExplorerOrder":2,"ExplorerImageIndex":84,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Threshold","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Attack","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Release","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Ratio","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GainMakeup","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SoundGroup","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":85,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StockSound","Summary":"","ExplorerOrder":-1,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SoundService","Summary":"","ExplorerOrder":50,"ExplorerImageIndex":31,"Browsable":true,"PreferredParent":"","Members":[{"Name":"AmbientReverb","Summary":"The ambient sound environment.  May not work when using hardware sound","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DopplerScale","Summary":"The doppler scale is a general scaling factor for how much the pitch varies due to doppler shifting in 3D sound. Doppler is the pitch bending effect when a sound comes towards the listener or moves away from it, much like the effect you hear when a train goes past you with its horn sounding. With dopplerscale you can exaggerate or diminish the effect.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DistanceFactor","Summary":"the relative distance factor, compared to 1.0 meters.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RolloffScale","Summary":"Setting this value makes the sound drop off faster or slower. The higher the value, the faster volume will attenuate, and conversely the lower the value, the slower it will attenuate. For example a rolloff factor of 1 will simulate the real world, where as a value of 2 will make sounds attenuate 2 times quicker.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Backpack","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":20,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StarterPack","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":20,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StarterPlayer","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":79,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StarterGear","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":20,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CoreGui","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":46,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIGridStyleLayout","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"SetCustomSortFunction","Summary":"When SortOrder is set to Custom, this lua function is used to determine the ordering of elements. Function should take two arguments (each will be an Instance child to compare), and return true if a comes before b, otherwise return false. In other words, use this function the same way you would use a table.sort function. The sorting should be deterministic, otherwise sort will fail and fall back to name order.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"ApplyLayout","Summary":"Forces a relayout of all elements. Useful when sort is set to Custom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SortOrder","Summary":"Determines how we decide which element to place next. Can be Name or Custom. If using Custom, make sure SetCustomSortFunction was called with an appropriate sort function.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FillDirection","Summary":"Determines which direction to fill the grid. Can be Horizontal or Vertical.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"HorizontalAlignment","Summary":"Determines how grid is placed within it's parent's container in the x direction. Can be Left, Center, or Right.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"VerticalAlignment","Summary":"Determines how grid is placed within it's parent's container in the y direction. Can be Top, Center, or Bottom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIListLayout","Summary":"Sets the position of UI elements in a list. You can use a UIListLayout by parenting it to a GuiObject. The UIListLayout will then apply itself to all of its GuiObject siblings.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Padding","Summary":"Determines the amount of free space between each element. Can be set either using scale (Percentage of parent's size in the current direction) or offset (a static spacing value, similar to pixel size).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIGridLayout","Summary":"Sets the position of UI elements in a 2D grid (this can be modified to 1D grid for list layout). This will also set the elements to a particular size, although this can be overridden with particular constraints on elements. You can use a UIGridLayout by parenting it to a GuiObject. The UIGridLayout will then apply itself to all of its GuiObject siblings.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"CellSize","Summary":"Denotes what size each element should be. Can be overridden by elements using constraints on individual elements.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CellPadding","Summary":"How much space between elements there should be.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FillDirectionMaxCells","Summary":"Determines how many cells over in the FillDirection we go before starting a new row or column. Set to 0 for max cell count.  Will be clamped if this is set higher than the parent container allows room for.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AbsoluteSize","Summary":"Returns the current size of the grid. If more elements are added, this can increase. If elements are removed this can decrease.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StartCorner","Summary":"Which corner we start laying the elements out from. Can be TopLeft, TopRight, BottomLeft, BottomRight.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIPageLayout","Summary":"Creates a paged viewing window, like the home screen of a mobile device. You can use a UIPageLayout by parenting it to a GuiObject. The UIPageLayout will then apply itself to all of its GuiObject siblings.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"CurrentPage","Summary":"The page that is either currently being displayed or is the target of the current animation.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Circular","Summary":"Whether or not the page layout wraps around at the ends.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Padding","Summary":"Determines the amount that pages are separated from each other by. Can be set either using scale (Percentage of parent's size in the current direction) or offset (a static spacing value, similar to pixel size).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Animated","Summary":"Whether or not to animate transitions between pages.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"EasingStyle","Summary":"The easing style to use when performing an animation.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"EasingDirection","Summary":"The easing direction to use when performing an animation.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TweenTime","Summary":"The length of the animation.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Next","Summary":"Sets CurrentPage to the page after the current page and animates to it, or does nothing if there isn't a next page.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Previous","Summary":"Sets CurrentPage to the page after the current page and animates to it, or does nothing if there isn't a next page.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"JumpTo","Summary":"If the instance is in the layout, then it sets CurrentPage to it and animtes to it. If circular layout is set, it will take the shortest path.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"JumpToIndex","Summary":"If the index is >= 0 and less than the size of the layout, acts like JumpTo. If it's out of bounds and circular is set, it will animate the full distance between the in-bounds index of CurrentPage and the new index.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PageEnter","Summary":"Fires when a page comes into view, and is going to be rendered.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PageLeave","Summary":"Fires when a page leaves view, and will not be rendered.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Stopped","Summary":"Fires when an animation to CurrentPage is completed without being cancelled, and the view stops scrolling.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UITableLayout","Summary":"Provides a layout of rows and columns that are sized based on the cells in them.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Padding","Summary":"The amount of padding to insert in between the cells of the table.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FillEmptySpaceRows","Summary":"Whether the table should expand to fill the available space of its container, row-wise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FillEmptySpaceColumns","Summary":"Whether the table should expand to fill the available space of its container, column-wise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MajorAxis","Summary":"Whether the direct siblings are considered the rows or the columns. The children of the direct siblings are the columns or rows, respectively.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UISizeConstraint","Summary":"Ensures a GuiObject does not become smaller or larger than the min and max size. If an element with a constraint is under the control of a layout, the constraint takes precedence in determining the element�s size, but not position. You can use a Constraint by parenting it to the element you wish to constrain.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MinSize","Summary":"The smallest size the GuiObject is allowed to be.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MaxSize","Summary":"The biggest size the GuiObject is allowed to be.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UITextSizeConstraint","Summary":"Ensures a GuiObject with text does not allow the font size to become larger or smaller than min and max text sizes. If an element with a constraint is under the control of a layout, the constraint takes precedence in determining the element�s size, but not position. You can use a Constraint by parenting it to the element you wish to constrain.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MinTextSize","Summary":"The smallest size the font is allowed to be.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MaxTextSize","Summary":"The biggest size the font is allowed to be.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIAspectRatioConstraint","Summary":"Ensures a GuiObject will always have a particular aspect ratio. If an element with a constraint is under the control of a layout, the constraint takes precedence in determining the element�s size, but not position. You can use a Constraint by parenting it to the element you wish to constrain.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"AspectRatio","Summary":"The aspect ratio to maintain. This is the width/height. Only positive numbers allowed.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AspectType","Summary":"Describes how the aspect ratio will determine its size. Options are FitWithinMaxSize, ScaleWithParentSize. FitWithinMaxSize will make the element the maximum size it can be within the current possible AbsoluteSize of the element while maintaining the AspectRatio. ScaleWithParentSize will make the element the closest to the parent element�s maximum size while maintaining aspect ratio.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DominantAxis","Summary":"Describes which axis to use when determining the new size of the element, while keeping respect to the aspect ratio.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIScale","Summary":"Uniformly scales a GUI object and all its children.","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Scale","Summary":"The scale factor to apply.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UIPadding","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":26,"Browsable":true,"PreferredParent":"","Members":[{"Name":"PaddingLeft","Summary":"The padding to apply on the left side relative to the parent's normal size.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PaddingRight","Summary":"The padding to apply on the right side relative to the parent's normal size.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PaddingTop","Summary":"The padding to apply on the top side relative to the parent's normal size.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PaddingBottom","Summary":"The padding to apply on the bottom side relative to the parent's normal size.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TweenBase","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"PlaybackState","Summary":"The current state of how the tween is animating. Possible values are Begin, Playing, Paused, Completed and Cancelled. This property is modified by using functions such as Tween:Play(), Tween:Pause(), and Tween:Cancel(). Read-only.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Play","Summary":"Starts or resumes (if Tween.PlaybackState is Paused) the tween animation. If current PlaybackState is Cancelled, this property will reset the tween to the beginning properties and play the animations from the beginning.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Pause","Summary":"Temporarily stops the tween animation. Animation can be resumed by calling Play().","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Cancel","Summary":"Stops the tween animation. Animation can be restarted by calling Play(). Animation will start from the beginning values.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Completed","Summary":"Fires when the tween either reaches PlaybackState Completed or Cancelled. PlaybackState of one of these types is passed as the first arg to the function listening to this event.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Tween","Summary":"An object linked to an instance that animates properties on the instance over a specified period of time. Useful for easily moving UI objects around, rotating objects, etc. without having to write a lot of code. To create a new tween, please use TweenService:Create.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Instance","Summary":"The object this tween is operating on. Read-only.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TweenInfo","Summary":"Specifies how the tween animates. Read-only.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TweenService","Summary":"Service responsible for creating tweens on instances.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StarterGui","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":46,"Browsable":true,"PreferredParent":"","Members":[{"Name":"SetCoreGuiEnabled","Summary":"Will stop/begin certain core gui elements being rendered. See CoreGuiType for core guis that can be modified.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetCoreGuiEnabled","Summary":"Returns a boolean describing whether a CoreGuiType is currently being rendered.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GuiService","Summary":"The GuiService is a special service, which currently allows developers to control what GuiObject is currently being selected by the Gamepad Gui navigator, and allows clients to check if Roblox's main menu is currently open. This service has a lot of hidden members, which are mainly used internally by Roblox's CoreScripts.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"GetGuiInset","Summary":"Returns a Tuple containing two Vector2 values representing the offset of user GUIs in pixels from the top right corner of the screen and the bottom right corner of the screen respectively.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ContextActionService","Summary":"A service used to bind input to various lua functions.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"BindAction","Summary":"Binds 'functionToBind' to fire when any 'inputTypes' happen. InputTypes can be variable in number and type. Types can be Enum.KeyCode, single character strings corresponding to keys, or Enum.UserInputType. 'actionName' is a key used by many other ContextActionService functions to query state. 'createTouchButton' if true will create a button on screen on touch devices.  This button will fire 'functionToBind' with three arguments: first argument is the actionName, second argument is the UserInputState of the input, and the third is the InputObject that fired this function. If 'functionToBind' yields or returns nil or Enum.ContextActionResult.Sink, the input will be sunk. If it returns Enum.ContextActionResult.Pass, the next bound action in the stack will be invoked.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetTitle","Summary":"If 'actionName' key contains a bound action, then 'title' is set as the title of the touch button. Does nothing if a touch button was not created. No guarantees are made whether title will be set when button is manipulated.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetDescription","Summary":"If 'actionName' key contains a bound action, then 'description' is set as the description of the bound action. This description will appear for users in a listing of current actions availables.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetImage","Summary":"If 'actionName' key contains a bound action, then 'image' is set as the image of the touch button. Does nothing if a touch button was not created. No guarantees are made whether image will be set when button is manipulated.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetPosition","Summary":"If 'actionName' key contains a bound action, then 'position' is set as the position of the touch button. Does nothing if a touch button was not created. No guarantees are made whether position will be set when button is manipulated.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UnbindAction","Summary":"If 'actionName' key contains a bound action, removes function from being called by all input that it was bound by (if function was also bound by a different action name as well, those bound input are still active). Will also remove any touch button created (if button was manipulated manually there is no guarantee it will be cleaned up).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UnbindAllActions","Summary":"Removes all functions bound. No actionNames will remain. All touch buttons will be removed. If button was manipulated manually there is no guarantee it will be cleaned up.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetBoundActionInfo","Summary":"Returns a table with info regarding the function bound with 'actionName'. Table has the keys 'title' (current title that was set with SetTitle) 'image' (image set with SetImage) 'description' (description set with SetDescription) 'inputTypes' (tuple containing all input bound for this 'actionName') 'createTouchButton' (whether or not we created a touch button for this 'actionName').","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetAllBoundActionInfo","Summary":"Returns a table with all bound action info. Each entry is a key with 'actionName' and value being the same table you would get from ContextActionService:GetBoundActionInfo('actionName').","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetButton","Summary":"If 'actionName' key contains a bound action, then this will return the touch button (if was created). Returns nil if a touch button was not created. No guarantees are made whether button will be retrievable when button is manipulated.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PointsService","Summary":"A service used to query and award points for Roblox users using the universal point system.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"PointsAwarded","Summary":"Fired when points are successfully awarded 'userId'. Also returns the updated balance of points for usedId in universe via 'userBalanceInUniverse', total points via 'userTotalBalance', and the amount points that were awarded via 'pointsAwarded'. This event fires on the server and also all clients in the game that awarded the points.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AwardPoints","Summary":"Will attempt to award the 'amount' points to 'userId', returns 'userId' awarded to, the number of points awarded, the new point total the user has in the game, and the total number of points the user now has. Will also fire PointsService.PointsAwarded. Works with server scripts ONLY.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetPointBalance","Summary":"Returns the overall balance of points that player with userId has (the sum of all points across all games). Works with server scripts ONLY.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetGamePointBalance","Summary":"Returns the balance of points that player with userId has in the current game (all placeID points combined within the game). Works with server scripts ONLY.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetAwardablePoints","Summary":"Returns the number of points the current universe can award to players. Works with server scripts ONLY.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Chat","Summary":"","ExplorerOrder":51,"ExplorerImageIndex":33,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ChatService","Summary":"","ExplorerOrder":51,"ExplorerImageIndex":33,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LocalizationService","Summary":"","ExplorerOrder":-1,"ExplorerImageIndex":92,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MarketplaceService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":46,"Browsable":true,"PreferredParent":"","Members":[{"Name":"PromptPurchase","Summary":"Will prompt 'player' to purchase the item associated with 'assetId'.  'equipIfPurchased' is an optional argument that will give the item to the player immediately if they buy it (only applies to gear).  'currencyType' is also optional and will attempt to prompt the user with a specified currency if the product can be purchased with this currency, otherwise we use the default currency of the product.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetProductInfo","Summary":"Takes one argument \"assetId\" which should be a number of an asset on www.roblox.com.  Returns a table containing the product information (if this process fails, returns an empty table).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PlayerOwnsAsset","Summary":"Checks to see if 'Player' owns the product associated with 'assetId'. Returns true if the player owns it, false otherwise. This call will produce a warning if called on a guest player.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ProcessReceipt","Summary":"Callback that is executed for pending Developer Product receipts.\n            \n            If this function does not return Enum.ProductPurchaseDecision.PurchaseGranted, then you will not be granted the money for the purchase!\n            \n            The callback will be invoked with a table, containing the following informational fields:\n            PlayerId - the id of the player making the purchase.\n            PlaceIdWherePurchased - the specific place where the purchase was made.\n            PurchaseId - a unique identifier for the purchase, should be used to prevent granting an item multiple times for one purchase.\n            ProductId - the id of the purchased product.\n            CurrencyType - the type of currency used (Tix, Robux).\n            CurrencySpent - the amount of currency spent on the product for this purchase.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PromptPurchaseFinished","Summary":"Fired when a 'player' dismisses a purchase dialog for 'assetId'.  If the player purchased the item 'isPurchased' will be true, otherwise it will be false. This call will produce a warning if called on a guest player.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UserInputService","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"TouchEnabled","Summary":"Returns true if the local device accepts touch input, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"KeyboardEnabled","Summary":"Returns true if the local device accepts keyboard input, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseEnabled","Summary":"Returns true if the local device accepts mouse input, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AccelerometerEnabled","Summary":"Returns true if the local device has an accelerometer, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GyroscopeEnabled","Summary":"Returns true if the local device has an gyroscope, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchTap","Summary":"Fired when a user taps their finger on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the tap gesture. This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchPinch","Summary":"Fired when a user pinches their fingers on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the pinch gesture. 'scale' is a float that indicates the difference from the beginning of the pinch gesture. 'velocity' is a float indicating how quickly the pinch gesture is happening. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchSwipe","Summary":"Fired when a user swipes their fingers on a TouchEnabled device. 'swipeDirection' is an Enum.SwipeDirection, indicating the direction the user swiped. 'numberOfTouches' is an int that indicates how many touches were involved with the gesture.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchLongPress","Summary":"Fired when a user holds at least one finger for a short amount of time on the same screen position on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the gesture. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchRotate","Summary":"Fired when a user rotates two fingers on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the gesture. 'rotation' is a float indicating how much the rotation has gone from the start of the gesture. 'velocity' is a float that indicates how quickly the gesture is being performed. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchPan","Summary":"Fired when a user drags at least one finger on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the gesture. 'totalTranslation' is a Vector2, indicating how far the pan gesture has gone from its starting point. 'velocity' is a Vector2 that indicates how quickly the gesture is being performed in each dimension. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchStarted","Summary":"Fired when a user places their finger on a TouchEnabled device. 'touch' is an InputObject, which contains useful data for querying user input.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchMoved","Summary":"Fired when a user moves their finger on a TouchEnabled device. 'touch' is an InputObject, which contains useful data for querying user input.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchEnded","Summary":"Fired when a user moves their finger on a TouchEnabled device. 'touch' is an InputObject, which contains useful data for querying user input.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputBegan","Summary":"Fired when a user begins interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc.). 'inputObject' is an InputObject, which contains useful data for querying user input.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputChanged","Summary":"Fired when a user changes interacting via a Human-Computer Interface device (Mouse move, touch move, mouse wheel, etc.). 'inputObject' is an InputObject, which contains useful data for querying user input.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputEnded","Summary":"Fired when a user stops interacting via a Human-Computer Interface device (Mouse button up, touch end, keyboard button up, etc.). 'inputObject' is an InputObject, which contains useful data for querying user input.  This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TextBoxFocused","Summary":"Fired when a user clicks/taps on a textbox to begin text entry. Argument is the textbox that was put in focus. This also fires if a textbox forces focus on the user. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TextBoxFocusReleased","Summary":"Fired when a user stops text entry into a textbox (usually by pressing return or clicking/tapping somewhere else on the screen). Argument is the textbox that was taken out of focus. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DeviceAccelerationChanged","Summary":"Fired when a user moves a device that has an accelerometer. This is fired with an InputObject, which has type Enum.InputType.Accelerometer, and position that shows the g force in each local device axis. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DeviceGravityChanged","Summary":"Fired when the force of gravity changes on a device that has an accelerometer. This is fired with an InputObject, which has type Enum.InputType.Accelerometer, and position that shows the g force in each local device axis. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DeviceRotationChanged","Summary":"Fired when a user rotates a device that has an gyroscope. This is fired with an InputObject, which has type Enum.InputType.Gyroscope, and position that shows total rotation in each local device axis.  The delta property describes the amount of rotation that last happened. A second argument of Vector4 is the device's current quaternion rotation in reference to it's default reference frame. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetDeviceAcceleration","Summary":"Returns an InputObject that describes the device's current acceleration. This is fired with an InputObject, which has type Enum.InputType.Accelerometer, and position that shows the g force in each local device axis.  The delta property describes the amount of rotation that last happened. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetDeviceGravity","Summary":"Returns an InputObject that describes the device's current gravity vector. This is fired with an InputObject, which has type Enum.InputType.Accelerometer, and position that shows the g force in each local device axis. The delta property describes the amount of rotation that last happened. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetDeviceRotation","Summary":"Returns an InputObject and a Vector4 that describes the device's current rotation vector. This is fired with an InputObject, which has type Enum.InputType.Gyroscope, and position that shows total rotation in each local device axis. The delta property describes the amount of rotation that last happened. The Vector4 is the device's current quaternion rotation in reference to it's default reference frame. This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Sky","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":28,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ColorCorrectionEffect","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":83,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Brightness","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Contrast","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Saturation","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BloomEffect","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":83,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Intensity","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Threshold","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Size","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BlurEffect","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":83,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Size","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SunRaysEffect","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":83,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Intensity","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Spread","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Motor","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Humanoid","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":9,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MoveTo","Summary":"Attempts to move the Humanoid and it's associated character to 'part'. 'location' is used as an offset from part's origin.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Jump","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Sit","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TakeDamage","Summary":"Decreases health by the amount.  Use this instead of changing health directly to make sure weapons are filtered for things such as ForceField(s).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UnequipTools","Summary":"Takes any active gear/tools that the Humanoid is using and puts them into the backpack.  This function only works on Humanoids with a corresponding Player.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"EquipTool","Summary":"Takes a specified tool and equips it to the Humanoid's Character.  Tool argument should be of type 'Tool'.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NameOcclusion","Summary":"Sets how to display other humanoid names to this humanoid's player. <a href=\"http://wiki.roblox.com/index.php/NameOcclusion\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyColors","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Shirt","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":43,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Pants","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":44,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ShirtGraphic","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":40,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Skin","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"DebugSettings","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FaceInstance","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GameSettings","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GlobalSettings","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Item","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NetworkPeer","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NetworkSettings","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PVInstance","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"CoordinateFrame","Summary":"Deprecated. Use CFrame instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RenderSettings","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RootInstance","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ServiceProvider","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"service","Summary":"Use GetService() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ProfilingItem","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NetworkMarker","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Hopper","Summary":"Use StarterPack instead","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"Instance","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"Archivable","Summary":"Determines whether or not an Instance can be saved when the game closes/attempts to save the game. Note: this only applies to games that use Data Persistence, or SavePlaceAsync.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ClassName","Summary":"The string name of this Instance's most derived class.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Parent","Summary":"The Instance that is directly above this Instance in the tree.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetDebugId","Summary":"This function is for internal testing. Don't use in production code","Browsable":"false","Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Clone","Summary":"Returns a copy of this Object and all its children. The copy's Parent is nil","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"clone","Summary":"Use Clone() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"isA","Summary":"Use IsA() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"IsA","Summary":"Returns a boolean if this Instance is of type 'className' or a is a subclass of type 'className'.  If 'className' is not a valid class type in ROBLOX, this function will always return false.  <a href=\"http://wiki.roblox.com/index.php/IsA\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindFirstChild","Summary":"Returns the first child of this Instance that matches the first argument 'name'.  The second argument 'recursive' is an optional boolean (defaults to false) that will force the call to traverse down thru all of this Instance's descendants until it finds an object with a name that matches the 'name' argument.  The function will return nil if no Instance is found.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindFirstChildOfClass","Summary":"Returns the first child of this Instance that with a ClassName equal to 'className'.  The function will return nil if no Instance is found.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindFirstChildWhichIsA","Summary":"Returns the first child of this Instance that :IsA(className).  The second argument 'recursive' is an optional boolean (defaults to false) that will force the call to traverse down thru all of this Instance's descendants until it finds an object with a name that matches the 'className' argument.  The function will return nil if no Instance is found.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindFirstAncestor","Summary":"Returns the first ancestor of this Instance that matches the first argument 'name'.  The function will return nil if no Instance is found.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindFirstAncestorOfClass","Summary":"Returns the first ancestor of this Instance with a ClassName equal to 'className'.  The function will return nil if no Instance is found.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindFirstAncestorWhichIsA","Summary":"Returns the first ancestor of this Instance that :IsA(className).  The function will return nil if no Instance is found.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetFullName","Summary":"Returns a string that shows the path from the root node (DataModel) to this Instance.  This string does not include the root node (DataModel).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"children","Summary":"Use GetChildren() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"getChildren","Summary":"Use GetChildren() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"GetChildren","Summary":"Returns a read-only table of this Object's children","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetDescendants","Summary":"Returns an array containing all of the descendants of the instance. Returns in preorder traversal, or in other words, where the parents come before their children, depth first.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Remove","Summary":"Deprecated. Use ClearAllChildren() to get rid of all child objects, or Destroy() to invalidate this object and its descendants","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"remove","Summary":"Use Remove() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"ClearAllChildren","Summary":"Removes all children (but not this object) from the workspace.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Destroy","Summary":"Removes object and all of its children from the workspace. Disconnects object and all children from open connections. Object and children may not be usable after calling Destroy.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"findFirstChild","Summary":"Use FindFirstChild() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"AncestryChanged","Summary":"Fired when any of this object's ancestors change.  First argument 'child' is the object whose parent changed.  Second argument 'parent' is the first argument's new parent.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DescendantAdded","Summary":"Fired after an Instance is parented to this object, or any of this object's descendants.  The 'descendant' argument is the Instance that is being added.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DescendantRemoving","Summary":"Fired after an Instance is unparented from this object, or any of this object's descendants.  The 'descendant' argument is the Instance that is being added.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Changed","Summary":"Fired after a property changes value.  The property argument is the name of the property","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyGyro","Summary":"Attempts to maintain a fixed orientation of its parent Part","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MaxTorque","Summary":"The maximum torque that will be exerted on the Part","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"maxTorque","Summary":"Use MaxTorque instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"D","Summary":"The dampening factor applied to this force","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"P","Summary":"The power continually applied to this force","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CFrame","Summary":"The cframe that this force is trying to orient its parent Part to.  Note: this force only uses the rotation of the cframe, not the position.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"cframe","Summary":"Use CFrame instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyPosition","Summary":"","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MaxForce","Summary":"The maximum force that will be exerted on the Part","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"maxForce","Summary":"Use MaxForce instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"D","Summary":"The dampening factor applied to this force","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"P","Summary":"The power factor continually applied to this force","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Position","Summary":"The Vector3 that this force is trying to position its parent Part to.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"position","Summary":"Use position instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RocketPropulsion","Summary":"A propulsion system that mimics a rocket","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyVelocity","Summary":"","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[{"Name":"MaxForce","Summary":"The maximum force that will be exerted on the Part in each axis","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"maxForce","Summary":"Use MaxForce instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"P","Summary":"The amount of power we add to the system.  The higher the power, the quicker the force will achieve its goal.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Velocity","Summary":"The velocity this system tries to achieve.  How quickly the system reaches this velocity (if ever) is defined by P.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"velocity","Summary":"Use Velocity instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyAngularVelocity","Summary":"","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyForce","Summary":"When parented to a physical part, BodyForce will continually exert a force upon its parent object.","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BodyThrust","Summary":"","ExplorerOrder":14,"ExplorerImageIndex":14,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Force","Summary":"The power continually applied to this force","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"force","Summary":"Use Force instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"Location","Summary":"The Vector3 location of where to apply the force to.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"location","Summary":"Use Location instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Hole","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"Feature","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Teams","Summary":"This Service-level object is the container for all Team objects in a level. A map that supports team games must have a Teams service. <a href=\"http://wiki.roblox.com/index.php/Team\" target=\"_blank\">More info</a>","ExplorerOrder":14,"ExplorerImageIndex":23,"Browsable":true,"PreferredParent":"","Members":[{"Name":"GetPlayers","Summary":"Returns a read-only table of players which are on this team.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Team","Summary":"The Team class is used to represent a faction in a team game. The only valid location for a Team object is under the Teams service. <a href=\"http://wiki.roblox.com/index.php/Team\" target=\"_blank\">More info</a>","ExplorerOrder":1,"ExplorerImageIndex":24,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SpawnLocation","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":25,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NetworkClient","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":16,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NetworkServer","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":15,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LuaSourceContainer","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"CurrentEditor","Summary":"The name of the player who is currently editing the script in Team Create.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Script","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":6,"Browsable":true,"PreferredParent":"","Members":[{"Name":"LinkedScript","Summary":"This property is under development. Do not use","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LocalScript","Summary":"A script that runs on clients, NOT servers.  LocalScripts can only run when parented under the PlayerGui currently.","ExplorerOrder":4,"ExplorerImageIndex":18,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NetworkReplicator","Summary":"","ExplorerOrder":3,"ExplorerImageIndex":29,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Model","Summary":"A construct used to group Parts and other objects together, also allows manipulation of multiple objects.","ExplorerOrder":10,"ExplorerImageIndex":2,"Browsable":true,"PreferredParent":"","Members":[{"Name":"BreakJoints","Summary":"Breaks all surface joints contained within","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetModelCFrame","Summary":"Returns a CFrame that has position of the centroid of all Parts in the Model.  The rotation matrix is either the rotation matrix of the user-defined PrimaryPart, or if not specified then  a part in the Model chosen by the engine.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetModelSize","Summary":"Returns a Vector3 that is union of the extents of all Parts in the model.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MakeJoints","Summary":"Creates the appropriate SurfaceJoints between all touching Parts contrained within the model. Technically, this function calls MakeJoints() on all Parts inside the model.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MoveTo","Summary":"Moves the centroid of the Model to the specified location, respecting all relative distances between parts in the model.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ResetOrientationToIdentity","Summary":"Rotates all parts in the model to the orientation that was set using SetIdentityOrientation().  If this function has never been called, rotation is reset to GetModelCFrame()'s rotation.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetIdentityOrientation","Summary":"Takes the current rotation matrix of the model and stores it as the model's identity matrix. The rotation is applied when ResetOrientationToIdentity() is called.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TranslateBy","Summary":"Similar to MoveTo(), except instead of moving to an explicit location, we use the model's current CFrame location and offset it.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetPrimaryPartCFrame","Summary":"Returns the cframe of the Model.PrimaryPart. If PrimaryPart is nil, then this function will throw an error.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetPrimaryPartCFrame","Summary":"Sets the cframe of the Model.PrimaryPart. If PrimaryPart is nil, then this function will throw an error. This also sets the cframe of all descendant Parts relative to the cframe change to PrimaryPart.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"makeJoints","Summary":"Use MakeJoints() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"move","Summary":"Use MoveTo() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"PrimaryPart","Summary":"A Part that serves as a reference for the Model's CFrame. Used in conjunction with GetModelPrimaryPartCFrame and SetModelPrimaryPartCFrame. Use this to rotate/translate all Parts relative to the PrimaryPart.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Status","Summary":"","ExplorerOrder":10,"ExplorerImageIndex":2,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[{"Name":"move","Summary":"Use MoveTo() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Preliminary":false,"IsBackend":false},{"Name":"DataModel","Summary":"The root of ROBLOX's parent-child hierarchy (commonly known as game after the global variable used to access it)","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"OnClose","Summary":"Deprecated. Use DataModel.BindToClose","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"Workspace","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"workspace","Summary":"Deprecated. Use Workspace","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"ShowMouse","Summary":"Deprecated. Use Workspace.IsMouseCursorVisible","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"IsLoaded","Summary":"Returns true if the game has finished loading, false otherwise.  Check this before listening to the Loaded signal to ensure a script knows when a game finishes loading.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Loaded","Summary":"Fires when the game finishes loading.  Use this to know when to remove your custom loading gui.  It is best to check IsLoaded() before connecting to this event, as the game may load before the event is connected to.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetPlaceID","Summary":"Use SetPlaceId() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SetCreatorID","Summary":"Use SetCreatorId() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DataStoreService","Summary":"Responsible for storing data across multiple user created places","ExplorerOrder":-1,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"GetDataStore","Summary":"Returns a data store with the given name and scope","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetGlobalDataStore","Summary":"Returns the default data store","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetOrderedDataStore","Summary":"Returns an ordered data store with the given name and scope","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GlobalDataStore","Summary":"Exposes functions for saving and loading data for the DataStoreService","ExplorerOrder":-1,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"OnUpdate","Summary":"Sets callback as a function to be executed any time the value associated with key is changed. It is important to disconnect the connection when the subscription to the key is no longer needed.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetAsync","Summary":"Returns the value of the entry in the DataStore with the given key","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"IncrementAsync","Summary":"Increments the value of a particular key amd returns the incremented value","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetAsync","Summary":"Sets the value of the key. This overwrites any existing data stored in the key","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UpdateAsync","Summary":"Retrieves the value of the key from the website, and updates it with a new value. The callback until the value fetched matches the value on the web. Returning nil means it will not save.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"OrderedDataStore","Summary":"A type of DataStore where values must be positive integers. This makes OrderedDataStore suitable for leaderboard related scripting where you are required to order large amounts of data efficiently.","ExplorerOrder":-1,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"GetSortedAsync","Summary":"Returns a DataStorePages object. The length of each page is determined by pageSize, and the order is determined by isAscending. minValue and maxValue are optional parameters which will filter the result.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"HopperBin","Summary":"","ExplorerOrder":24,"ExplorerImageIndex":22,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"Camera","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":5,"Browsable":true,"PreferredParent":"","Members":[{"Name":"CameraSubject","Summary":"Where the Camera's focus is.  Any rotation of the camera will be about this subject.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CameraType","Summary":"Defines how the camera will behave. <a href=\"http://wiki.roblox.com/index.php/CameraType\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CoordinateFrame","Summary":"The current position and rotation of the Camera.  For most CameraTypes, the rotation is set such that the CoordinateFrame lookVector is pointing at the Focus.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"CFrame","Summary":"The current position and rotation of the Camera.  For most CameraTypes, the rotation is set such that the CoordinateFrame lookVector is pointing at the Focus.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FieldOfView","Summary":"The current angle, or width, of what the camera can see.  Current acceptable values are from 20 degrees to 80.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Focus","Summary":"The current CoordinateFrame that the camera is looking at.  Note: it is not always guaranteed that the camera is always looking here.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ViewportSize","Summary":"Holds the x,y screen resolution of the viewport the camera is presenting (note: this can differ from the AbsoluteSize property of a full screen gui).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetRoll","Summary":"Returns the camera's current roll. Roll is defined in radians, and is stored as the delta from the camera's y axis default normal vector.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WorldToScreenPoint","Summary":"Takes a 3D position in the world and projects it onto x,y coordinates of screen space. Returns two values, first is a Vector3 that has x,y position and z position which is distance from camera (negative if behind camera, positive if in front). Second return value is a boolean indicating if the first argument is an on-screen coordinate.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScreenPointToRay","Summary":"Takes a 2D screen position and produces a Ray object to be used for 3D raycasting. Input is x,y screen coordinates, and a (optional, defaults to 0) z position which sets how far in the camera look vector to start the ray origin.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ViewportPointToRay","Summary":"Same as ScreenPointToRay, except no GUI offsets are taken into account. Useful for things like casting a ray from the middle of the Camera.ViewportSize","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WorldToViewportPoint","Summary":"Same as WorldToScreenPoint, except no GUI offsets are taken into account.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetRoll","Summary":"Sets the camera's current roll. Roll is defined in radians, and is stored as the delta from the camera's y axis default normal vector.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Players","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":21,"Browsable":true,"PreferredParent":"","Members":[{"Name":"CharacterAutoLoads","Summary":"Set to true, when a player joins a game, they get a character automatically, as well as when they die.  When set to false, characters do not auto load and will only load in using Player:LoadCharacter().","Browsable":"true","Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"players","Summary":"Use GetPlayers() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ReplicatedStorage","Summary":"A container whose contents are replicated to all clients and the server.","ExplorerOrder":3,"ExplorerImageIndex":70,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RobloxReplicatedStorage","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ReplicatedFirst","Summary":"A container whose contents are replicated to all clients (but not back to the server) first before anything else. Useful for creating loading guis, tutorials, etc.","ExplorerOrder":3,"ExplorerImageIndex":70,"Browsable":true,"PreferredParent":"","Members":[{"Name":"RemoveRobloxLoadingScreen","Summary":"Removes the default Roblox loading screen from view. Call this when you are ready to either show your own loading gui, or when the game is ready to play.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ServerStorage","Summary":"A container whose contents are only on the server.","ExplorerOrder":3,"ExplorerImageIndex":69,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ServerScriptService","Summary":"A container whose contents should be scripts. Scripts that are added to the container are run on the server.","ExplorerOrder":3,"ExplorerImageIndex":71,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Lighting","Summary":"Responsible for all lighting aspects of the world (affects how things are rendered).","ExplorerOrder":3,"ExplorerImageIndex":13,"Browsable":true,"PreferredParent":"","Members":[{"Name":"GetMinutesAfterMidnight","Summary":"The number of minutes that the current time is past midnight.  If currently at midnight, returns 0.  Will return decimal values if not at an exact minute.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetMoonDirection","Summary":"Returns the lookVector (Vector3) of the moon. If this lookVector was used in a CFrame, the Part would face the moon.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetMoonPhase","Summary":"Currently always returns 0.75. MoonPhase cannot be edited.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetSunDirection","Summary":"Returns the lookVector (Vector3) of the sun. If this lookVector was used in a CFrame, the Part would face the sun.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetMinutesAfterMidnight","Summary":"Sets the time to be a certain number of minutes after midnight.  This works with integer and decimal values.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Ambient","Summary":"The hue of the global lighting.  Changing this changes the color tint of all objects in the Workspace.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Brightness","Summary":"How much global light each Part in the Workspace receives. Standard range is 0 to 1 (0 being little light), but can be increased all the way to 5 (colors start to be appear very different at this value).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ColorShift_Bottom","Summary":"The hue of global lighting on the bottom surfaces of an object.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ColorShift_Top","Summary":"The hue of global lighting on the top surfaces of an object.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FogColor","Summary":"A Color3 value that changes the hue of distance fog.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FogEnd","Summary":"The distance at which fog completely blocks your vision. This distance is relative to the camera position. Units are in studs","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FogStart","Summary":"The distance at which the fog gradient begins. This distance is relative to the camera position. Units are in studs.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GeographicLatitude","Summary":"The latitude position the level is placed at.  This affects sun position. <a href=\"http://wiki.roblox.com/index.php/GeographicLatitude\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GlobalShadows","Summary":"Flag enabling shadows from sun and moon in the place","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"OutdoorAmbient","Summary":"Effective ambient value for outdoors, effectively shadow color outdoors (requires GlobalShadows enabled)","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Outlines","Summary":"Flag enabling or disabling outlines on parts and terrain","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ShadowColor","Summary":"Color the shadows appear as. Shadows are drawn mostly for characters, but depending on the lighting will also show for Parts in the Workspace.  Rendering settings can also affect if shadows are drawn.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TimeOfDay","Summary":"A string that represent the current time of day. Time is in 24-hour clock format \"XX::YY:ZZ\", where X is hour, Y is minute, and Z is seconds.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ClockTime","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LightingChanged","Summary":"Fired whenever a property of Lighting is changed, or a skybox is added or removed. Skyboxes are of type 'Sky' and should be parented directly to lighting.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TestService","Summary":"","ExplorerOrder":100,"ExplorerImageIndex":68,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DebuggerManager","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScriptDebugger","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DebuggerBreakpoint","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DebuggerWatch","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Debris","Summary":"A service that provides utility in cleaning up objects","ExplorerOrder":-1,"ExplorerImageIndex":30,"Browsable":true,"PreferredParent":"","Members":[{"Name":"addItem","Summary":"Use AddItem() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"AddItem","Summary":"Adds an Instance into the debris service that will later be destroyed.  Second argument 'lifetime' is optional and specifies how long (in seconds) to wait before destroying the item. If no time is specified then the item added will automatically be destroyed in 10 seconds.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MaxItems","Summary":"Deprecated. No replacement","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Accoutrement","Summary":"","ExplorerOrder":2,"ExplorerImageIndex":32,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Player","Summary":"","ExplorerOrder":1,"ExplorerImageIndex":12,"Browsable":true,"PreferredParent":"","Members":[{"Name":"CharacterAppearance","Summary":"","Browsable":"false","Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CameraMode","Summary":"An enum that describes how a Player's camera is allowed to behave. <a href=\"http://wiki.roblox.com/index.php/CameraMode\" target=\"_blank\">More info</a>.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DataReady","Summary":"Read-only. If true, this Player's persistent data can be loaded, false otherwise. <a href=\"http://wiki.roblox.com/index.php/ROBLOX_Scripting_How_To:_Data_Persistence\" target=\"_blank\">Info on Data Persistence</a>.","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"DataComplexity","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LoadCharacter","Summary":"Loads in a new character for this player.  This will replace the player's current character, if they have one. This should be used in conjunction with Players.CharacterAutoLoads to control spawning of characters. This function only works from a server-side script (NOT a LocalScript).","Browsable":"true","Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LoadData","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SaveData","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SaveBoolean","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SaveInstance","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SaveString","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LoadBoolean","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LoadNumber","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LoadString","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LoadInstance","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SaveNumber","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"playerFromCharacter","Summary":"Use GetPlayerFromCharacter() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SetUnder13","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"WaitForDataReady","Summary":"Yields until the persistent data for this Player is ready to be loaded. <a href=\"http://wiki.roblox.com/index.php/ROBLOX_Scripting_How_To:_Data_Persistence\" target=\"_blank\">Info on Data Persistence</a>.","Browsable":"true","Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"Idled","Summary":"Fired periodically after the user has been AFK for a while.  Currently this event is only fired for the *local* Player.  \"time\" is the time in seconds that the user has been idle.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Workspace","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":19,"Browsable":true,"PreferredParent":"","Members":[{"Name":"FindPartsInRegion3","Summary":"Returns parts in the area defined by the Region3, up to specified maxCount or 100, whichever is less","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindPartsInRegion3WithIgnoreList","Summary":"Returns parts in the area defined by the Region3, up to specified maxCount or 100, whichever is less","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindPartOnRay","Summary":"Return type is (BasePart, Vector3) if the ray hits.  If it misses it will return (nil, PointAtEndOfRay)","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FindPartOnRayWithIgnoreList","Summary":"Return type is (BasePart, Vector3) if the ray hits.  If it misses it will return (nil, PointAtEndOfRay)","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PGSPhysicsSolverEnabled","Summary":"Boolean used to enable the experimental physics solver","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FallenPartsDestroyHeight","Summary":"Sets the height at which falling characters and parts are destroyed. This property is not scriptable and can only be set in Studio","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BasePart","Summary":"A structural class, not creatable","ExplorerOrder":-1,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"Color","Summary":"Color3 of the part.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CFrame","Summary":"Contains information regarding the Part's position and a matrix that defines the Part's rotation.  Can read/write. <a href=\"http://wiki.roblox.com/index.php/Cframe\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CanCollide","Summary":"Determines whether physical interactions with other Parts are respected.  If true, will collide and react with physics to other Parts.  If false, other parts will pass thru instead of colliding","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Anchored","Summary":"Determines whether or not physics acts upon the Part.  If true, part stays 'Anchored' in space, not moving regardless of any collision/forces acting upon it.  If false, physics works normally on the part.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Elasticity","Summary":"A float value ranging from 0.0f to 1.0f. Sets how much the Part will rebound against another. a value of 1 is like a superball, and 0 is like a lead block.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Friction","Summary":"A float value ranging from 0.0f to 1.0f. Sets how much the Part will be able to slide. a value of 1 is no sliding, and 0 is no friction, so infinite sliding.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Locked","Summary":"Determines whether building tools (in-game and studio) can manipulate this Part.  If true, no editing allowed.  If false, editing is allowed.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Material","Summary":"Specifies the look and feel the Part should have.  Note: this does not define the color the Part is, see BrickColor for that. <a href=\"http://wiki.roblox.com/index.php/Material\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Reflectance","Summary":"Specifies how shiny the Part is. A value of 1 is completely reflective (chrome), while a value of 0 is no reflectance (concrete wall)","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ResizeIncrement","Summary":"Sets the value for the smallest change in size allowable by the Resize(NormalId, int) function.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ResizeableFaces","Summary":"Sets the value for the faces allowed to be resized by the Resize(NormalId, int) function.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Transparency","Summary":"Sets how visible an object is. A value of 1 makes the object invisible, while a value of 0 makes the object opaque.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Velocity","Summary":"How fast the Part is traveling in studs/second. This property is NOT recommended to be modified directly, unless there is good reason.  Otherwise, try using a BodyForce to move a Part.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PositionLocal","Summary":"Position relative to parent part, or global space if there is no parent.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"OrientationLocal","Summary":"Orientation relative to parent part, or global space if there is no parent.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Orientation","Summary":"Rotation around X, Y, and Z axis.  Rotations applied in YXZ order.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Rotation","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CenterOfMass","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"makeJoints","Summary":"Use MakeJoints() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"MakeJoints","Summary":"Creates the appropriate SurfaceJoints with all parts that are touching this Instance (including internal joints in the Instance, as in a Model).  This uses the SurfaceTypes defined on the surfaces of parts to create the appropriate welds. <a href=\"http://wiki.roblox.com/index.php/MakeJoints\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BreakJoints","Summary":"Destroys SurfaceJoints with all parts that are touching this Instance (including internal joints in the Instance, as in a Model).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetMass","Summary":"Returns a number that is the mass of this Instance.  Mass of a Part is immutable, and is changed only by the size of the Part.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Resize","Summary":"Resizes a Part in the direction of the face defined by 'NormalId', by the amount specified by 'deltaAmount'. If the operation will expand the part to intersect another Instance, the part will not resize at all.  Return true if the call is successful, false otherwise.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"getMass","Summary":"Use GetMass() instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"OutfitChanged","Summary":"","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"LocalSimulationTouched","Summary":"Deprecated. Use Touched instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"StoppedTouching","Summary":"Deprecated. Use TouchEnded instead","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchEnded","Summary":"Fired when the part stops touching another part","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Part","Summary":"A plastic building block - the fundamental component of ROBLOX","ExplorerOrder":11,"ExplorerImageIndex":1,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TrussPart","Summary":"An extendable building truss","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WedgePart","Summary":"A Wedge Part","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PrismPart","Summary":"A Prism Part","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":"false","Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"PyramidPart","Summary":"A Pyramid Part","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":"false","Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"ParallelRampPart","Summary":"A ParallelRamp Part","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":"false","Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"RightAngleRampPart","Summary":"A RightAngleRamp Part","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":"false","Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"CornerWedgePart","Summary":"A CornerWedge Part","ExplorerOrder":12,"ExplorerImageIndex":1,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PlayerGui","Summary":"A container instance that syncs data between a single player and the server.  ScreenGui objects that are placed in this container will be shown to the Player parent only","ExplorerOrder":13,"ExplorerImageIndex":46,"Browsable":true,"PreferredParent":"","Members":[{"Name":"SelectionImageObject","Summary":"Overrides the default selection adornment (used for gamepads). For best results, this should point to a GuiObject.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PlayerScripts","Summary":"A container instance that contains LocalScripts.  LocalScript objects that are placed in this container will be exectue only when a Player is the parent.","ExplorerOrder":13,"ExplorerImageIndex":78,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StarterPlayerScripts","Summary":"A container instance that contains LocalScripts.  LocalScript objects that are placed in this container will be copied to new Players on startup.","ExplorerOrder":13,"ExplorerImageIndex":78,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StarterCharacterScripts","Summary":"A container instance that contains LocalScripts.  LocalScript objects that are placed in this container will be copied to new characters on startup.","ExplorerOrder":13,"ExplorerImageIndex":78,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GuiMain","Summary":"Deprecated, please use ScreenGui","ExplorerOrder":14,"ExplorerImageIndex":47,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"LayerCollector","Summary":"The base class of ScreenGui, BillboardGui, and SurfaceGui.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScreenGui","Summary":"The core GUI object on which tools are built.  Add Frames/Labels/Buttons to this object to have them rendered as a 2D overlay","ExplorerOrder":14,"ExplorerImageIndex":47,"Browsable":true,"PreferredParent":"StarterGui","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"FunctionalTest","Summary":"Deprecated. Use TestService instead","ExplorerOrder":1,"ExplorerImageIndex":0,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"BillboardGui","Summary":"A GUI that adorns an object in the 3D world.  Add Frames/Labels/Buttons to this object to have them rendered while attached to a 3D object","ExplorerOrder":14,"ExplorerImageIndex":64,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"Adornee","Summary":"The Object the billboard gui uses as its base to render from.  Currently, the only way to set this property is thru a script, and must exist in the workspace.  This will only render if the object assigned derives from BasePart.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AbsolutePosition","Summary":"A read-only Vector2 value that is the GuiObject's current position (x,y) in pixel space, from the top left corner of the GuiObject.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AbsoluteSize","Summary":"A read-only Vector2 value that is the GuiObject's current size (width, height) in pixel space.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Active","Summary":"If true, this GuiObject can fire mouse events and will pass them to any GuiObjects layered underneath, while false will do neither.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AlwaysOnTop","Summary":"If true, billboard gui does not get occluded by 3D objects, but always renders on the screen.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Enabled","Summary":"If true, billboard gui will render, otherwise rendering will be skipped.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ExtentsOffset","Summary":"A Vector3 (x,y,z) defined in studs that will offset the gui from the extents of the 3d object it is rendering from.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PlayerToHideFrom","Summary":"Specifies a Player that the BillboardGui will not render to.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"StudsOffset","Summary":"A Vector3 (x,y,z) defined in studs that will offset the gui from the centroid of the 3d object it is rendering from","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SizeOffset","Summary":"A Vector2 (x,y) defined in studs that will offset the gui size from it's current size.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Size","Summary":"A UDim2 value describing the size of the BillboardGui. More information on UDim2 is available <a href=\"http://wiki.roblox.com/index.php/UDim2\" target=\"_blank\">here</a>. Relative values are defined as one-to-one with studs.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LightInfluence","Summary":"Specifies the amount of influence lighting has on the billboard gui. A value of 0 is unlit, 1 is fully lit. Fractional values blend from unlit to lit.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SurfaceGui","Summary":"Renders its contained GuiObjects flat against the face of a part.","ExplorerOrder":14,"ExplorerImageIndex":64,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"Adornee","Summary":"The Object the surface gui uses as its base to render from.  Currently, the only way to set this property is thru a script, and must exist in the workspace.  This will only render if the object assigned derives from BasePart.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Active","Summary":"If true, this GuiObject can fire mouse events and will pass them to any GuiObjects layered underneath, while false will do neither.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Enabled","Summary":"If true, surface gui will render, otherwise rendering will be skipped.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"LightInfluence","Summary":"Specifies the amount of influence lighting has on the surface gui. A value of 0 is unlit, 1 is fully lit. Fractional values blend from unlit to lit.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GuiBase2d","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"AbsolutePosition","Summary":"A read-only Vector2 value that is the GuiObject's current position (x,y) in pixel space, from the top left corner of the GuiObject.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AbsoluteSize","Summary":"A read-only Vector2 value that is the GuiObject's current size (width, height) in pixel space.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputObject","Summary":"An object that describes a particular user input, such as mouse movement, touches, keyboard, and more.","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":true,"PreferredParent":"","Members":[{"Name":"UserInputType","Summary":"An enum that describes what kind of input this object is describing (mousebutton, touch, etc.).  See Enum.UserInputType for more info.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UserInputState","Summary":"An enum that describes what state of a particular input (touch began, touch moved, touch ended, etc.). See Enum.UserInputState for more info.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Position","Summary":"A Vector3 value that describes a positional value of this input. For mouse and touch input, this is the screen position of the mouse/touch, described in the x and y components. For mouse wheel input, the z component describes whether the wheel was moved forward or backward.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"KeyCode","Summary":"An enum that describes what kind of input is being pressed. For types of input like Keyboard, this describes what key was pressed. For input like mousebutton, this provides no additional information.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GuiObject","Summary":"","ExplorerOrder":0,"ExplorerImageIndex":0,"Browsable":"false","PreferredParent":"","Members":[{"Name":"TweenPosition","Summary":"Smoothly moves a GuiObject from its current position to 'endPosition'. The only required argument is 'endPosition'. <a href=\"http://wiki.roblox.com/index.php/TweenPosition\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TweenSize","Summary":"Smoothly translates a GuiObject's current size to 'endSize'. The only required argument is 'endSize'. <a href=\"http://wiki.roblox.com/index.php/TweenSize\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TweenSizeAndPosition","Summary":"Smoothly translates a GuiObject's current size to 'endSize', and also smoothly translates the GuiObject's current position to 'endPosition'. The only required arguments are 'endSize' and 'endPosition'. <a href=\"http://wiki.roblox.com/index.php/TweenSizeAndPosition\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Active","Summary":"If true, this GuiObject can fire mouse events and will pass them to any GuiObjects layered underneath, while false will do neither.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BackgroundColor3","Summary":"A Color3 value that specifies the background color for the GuiObject. This value is ignored if the Style property (not found on all GuiObjects) is set to something besides custom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BackgroundTransparency","Summary":"A number value that specifies how transparent the background of the GuiObject is. This value is ignored if the Style property (not found on all GuiObjects) is set to something besides custom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BorderColor3","Summary":"A Color3 value that specifies the color of the outline of the GuiObject. This value is ignored if the Style property (not found on all GuiObjects) is set to something besides custom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BorderSizePixel","Summary":"A number value that specifies the thickness (in pixels) of the outline of the GuiObject. Currently this value can only be set to either 0 or 1, any other number has no effect. This value is ignored if the Style property (not found on all GuiObjects) is set to something besides custom.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ClipsDescendants","Summary":"If set to true, any descendants of this GuiObject will only render if contained within it's borders. If set to false, all descendants will render regardless of position.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Draggable","Summary":"If true, allows a GuiObject to be dragged by the user's mouse. The events 'DragBegin' and 'DragStopped' are fired when the appropriate action happens, and only will fire on Draggable=true GuiObjects.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Size","Summary":"A UDim2 value describing the size of the GuiObject on screen in both absolute and relative coordinates. More information on UDim2 is available <a href=\"http://wiki.roblox.com/index.php/UDim2\" target=\"_blank\">here</a>.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Position","Summary":"A UDim2 value describing the position of the top-left corner of the GuiObject on screen. More information on UDim2 is available <a href=\"http://wiki.roblox.com/index.php/UDim2\" target=\"_blank\">here</a>.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SizeConstraint","Summary":"The direction(s) that an object can be resized in. <a href=\"http://wiki.roblox.com/index.php/SizeConstraint\" target=\"_blank\">More info</a>.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ZIndex","Summary":"Describes the ordering in which overlapping GuiObjects will be drawn. A value of 1 is drawn first, while higher values are drawn in ascending order (each value draws over the last).","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BackgroundColor","Summary":"Deprecated. Use BackgroundColor3 instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"BorderColor","Summary":"Deprecated. Use BorderColor3 instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false},{"Name":"SelectionImageObject","Summary":"Overrides the default selection adornment (used for gamepads). For best results, this should point to a GuiObject.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DragBegin","Summary":"Fired when a GuiObject with Draggable set to true starts to be dragged. 'InitialPosition' is a UDim2 value of the position of the GuiObject before any drag operation began.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DragStopped","Summary":"Always fired after a DragBegin event, DragStopped is fired when the user releases the mouse button causing a drag operation on the GuiObject. Arguments 'x', and 'y' specify the top-left absolute position of the GuiObject when the event is fired.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseEnter","Summary":"Fired when the mouse enters a GuiObject, as long as the GuiObject is active (see active property for more detail). Arguments 'x', and 'y' specify the absolute pixel position of the mouse.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseLeave","Summary":"Fired when the mouse leaves a GuiObject, as long as the GuiObject is active (see active property for more detail). Arguments 'x', and 'y' specify the absolute pixel position of the mouse.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseMoved","Summary":"Fired when the mouse is inside a GuiObject and moves, as long as the GuiObject is active (see active property for more detail). Arguments 'x', and 'y' specify the absolute pixel position of the mouse.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchTap","Summary":"Fired when a user taps their finger on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the tap gesture. This event only fires locally.  This event will always fire regardless of game state.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchPinch","Summary":"Fired when a user pinches their fingers on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the pinch gesture. 'scale' is a float that indicates the difference from the beginning of the pinch gesture. 'velocity' is a float indicating how quickly the pinch gesture is happening. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchSwipe","Summary":"Fired when a user swipes their fingers on a TouchEnabled device. 'swipeDirection' is an Enum.SwipeDirection, indicating the direction the user swiped. 'numberOfTouches' is an int that indicates how many touches were involved with the gesture.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchLongPress","Summary":"Fired when a user holds at least one finger for a short amount of time on the same screen position on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the gesture. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchRotate","Summary":"Fired when a user rotates two fingers on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the gesture. 'rotation' is a float indicating how much the rotation has gone from the start of the gesture. 'velocity' is a float that indicates how quickly the gesture is being performed. 'state' indicates the Enum.UserInputState of the gesture.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TouchPan","Summary":"Fired when a user drags at least one finger on a TouchEnabled device. 'touchPositions' is a Lua array of Vector2, each indicating the position of all the fingers involved in the gesture. 'totalTranslation' is a Vector2, indicating how far the pan gesture has gone from its starting point. 'velocity' is a Vector2 that indicates how quickly the gesture is being performed in each dimension. 'state' indicates the Enum.UserInputState of the gesture.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputBegan","Summary":"Fired when a user begins interacting via a Human-Computer Interface device (Mouse button down, touch begin, keyboard button down, etc.). 'inputObject' is an InputObject, which contains useful data for querying user input.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputChanged","Summary":"Fired when a user changes interacting via a Human-Computer Interface device (Mouse move, touch move, mouse wheel, etc.). 'inputObject' is an InputObject, which contains useful data for querying user input.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InputEnded","Summary":"Fired when a user stops interacting via a Human-Computer Interface device (Mouse button up, touch end, keyboard button up, etc.). 'inputObject' is an InputObject, which contains useful data for querying user input.  This event only fires locally.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Frame","Summary":"A container object used to layout other GUI objects","ExplorerOrder":15,"ExplorerImageIndex":48,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"Style","Summary":"Determines how a frame will look. Uses Enum.FrameStyle. <a href=\"http://wiki.roblox.com/index.php?title=API:Enum/FrameStyle\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScrollingFrame","Summary":"A container object used to layout other GUI objects, and allows for scrolling.","ExplorerOrder":15,"ExplorerImageIndex":48,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"ScrollingEnabled","Summary":"Determines whether or not scrolling is allowed on this frame. If turned off, no scroll bars will be rendered.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CanvasSize","Summary":"Determines the size of the area that is scrollable. The UDim2 is calculated using the parent gui's size, similar to the regular Size property on gui objects.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CanvasPosition","Summary":"The absolute position the scroll frame is in respect to the canvas size. The minimum this can be set to is (0,0), while the max is the absolute canvas size - AbsoluteWindowSize.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AbsoluteWindowSize","Summary":"The size in pixels of the frame, without the scrollbars.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScrollBarThickness","Summary":"How thick the scroll bar appears. This applies to both the horizontal and vertical scroll bars. Can be set to 0 for no bars render.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TopImage","Summary":"The \"Up\" image on the vertical scrollbar. Size of this is always ScrollBarThickness by ScrollBarThickness. This is also used as the \"left\" image on the horizontal scroll bar.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MidImage","Summary":"The \"Middle\" image on the vertical scrollbar. Size of this can vary in the y direction, but is always set at ScrollBarThickness in x direction. This is also used as the \"mid\" image on the horizontal scroll bar.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BottomImage","Summary":"The \"Down\" image on the vertical scrollbar. Size of this is always ScrollBarThickness by ScrollBarThickness. This is also used as the \"right\" image on the horizontal scroll bar.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ImageLabel","Summary":"A GUI object containing an Image","ExplorerOrder":18,"ExplorerImageIndex":49,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"Image","Summary":"Specifies the id of the texture to display. <a href=\"http://wiki.roblox.com/index.php?title=API:Class/ImageLabel/Image\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScaleType","Summary":"Specifies how an image should be displayed. See ScaleType for more info.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SliceCenter","Summary":"If ScaleType is set to Slice, this Rect is used to specify the central part of the image. Everything outside of this is considered to be the border.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TileSize","Summary":"If ScaleType is set to Tile, this sets the size of the tile.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TextLabel","Summary":"A GUI object containing text","ExplorerOrder":19,"ExplorerImageIndex":50,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"TextColor","Summary":"Deprecated. Use TextColor3 instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TextButton","Summary":"A GUI button containing text","ExplorerOrder":17,"ExplorerImageIndex":51,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"TextColor","Summary":"Deprecated. Use TextColor3 instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TextBox","Summary":"A text entry box","ExplorerOrder":17,"ExplorerImageIndex":51,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"TextColor","Summary":"Deprecated. Use TextColor3 instead","Browsable":true,"Deprecated":"true","Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GuiButton","Summary":"A GUI button containing an Image","ExplorerOrder":16,"ExplorerImageIndex":52,"Browsable":"false","PreferredParent":"","Members":[{"Name":"AutoButtonColor","Summary":"Determines whether a button changes color automatically when reacting to mouse events.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Modal","Summary":"Allows the mouse to be free in first person mode. If a button with this property set to true is visible, the mouse is 'free' in first person mode.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Style","Summary":"Determines how a button will look, including mouse event states. Uses Enum.ButtonStyle. <a href=\"http://wiki.roblox.com/index.php?title=API:Class/GuiButton/Style\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseButton1Click","Summary":"Fired when the mouse is over the button, and the mouse down and up events fire without the mouse leaving the button.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseButton1Down","Summary":"Fired when the mouse button is pushed down on a button.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseButton1Up","Summary":"Fired when the mouse button is released on a button.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseButton2Click","Summary":"This function currently does not work :(","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseButton2Down","Summary":"This function currently does not work :(","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MouseButton2Up","Summary":"This function currently does not work :(","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ImageButton","Summary":"A GUI button containing an Image","ExplorerOrder":16,"ExplorerImageIndex":52,"Browsable":true,"PreferredParent":"StarterGui","Members":[{"Name":"Image","Summary":"Specifies the asset id of the texture to display. <a href=\"http://wiki.roblox.com/index.php?title=API:Class/ImageButton/Image\" target=\"_blank\">More info</a>","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ScaleType","Summary":"Specifies how an image should be displayed. See ScaleType for more info.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SliceCenter","Summary":"If ScaleType is set to Slice, this Rect is used to specify the central part of the image. Everything outside of this is considered to be the border.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TileSize","Summary":"If ScaleType is set to Tile, this sets the size of the tile.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Handles","Summary":"A 3D GUI object to represent draggable handles","ExplorerOrder":19,"ExplorerImageIndex":53,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ArcHandles","Summary":"A 3D GUI object to represent draggable arc handles","ExplorerOrder":20,"ExplorerImageIndex":56,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SelectionBox","Summary":"A 3D GUI object to represent the visible selection around an object","ExplorerOrder":21,"ExplorerImageIndex":54,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SelectionSphere","Summary":"A 3D GUI object to represent the visible selection around an object","ExplorerOrder":21,"ExplorerImageIndex":54,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SurfaceSelection","Summary":"A 3D GUI object to represent the visible selection around a face of an object","ExplorerOrder":21,"ExplorerImageIndex":55,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Configuration","Summary":"An object that can be placed under parts to hold Value objects that represent that part's configuration","ExplorerOrder":22,"ExplorerImageIndex":58,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Folder","Summary":"An object that can be created to hold and organize objects","ExplorerOrder":1,"ExplorerImageIndex":77,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SelectionPartLasso","Summary":"A visual line drawn representation between two part objects","ExplorerOrder":22,"ExplorerImageIndex":57,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"SelectionPointLasso","Summary":"A visual line drawn representation between two positions","ExplorerOrder":22,"ExplorerImageIndex":57,"Browsable":true,"Deprecated":"true","PreferredParent":"","Members":[],"Preliminary":false,"IsBackend":false},{"Name":"PartPairLasso","Summary":"A visual line drawn representation between two parts.","ExplorerOrder":22,"ExplorerImageIndex":57,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Pose","Summary":"The pose of a joint relative to it's parent part in a keyframe","ExplorerOrder":22,"ExplorerImageIndex":60,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Keyframe","Summary":"One keyframe of an animation","ExplorerOrder":22,"ExplorerImageIndex":60,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Animation","Summary":"Represents a linked animation object, containing keyframes and poses.","ExplorerOrder":22,"ExplorerImageIndex":60,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AnimationTrack","Summary":"Returned by a call to LoadAnimation. Controls the playback of an animation on a Humanoid.","ExplorerOrder":22,"ExplorerImageIndex":60,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"AnimationController","Summary":"Allows animations to be played on joints of the parent object.","ExplorerOrder":22,"ExplorerImageIndex":60,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"CharacterMesh","Summary":"Modifies the appearance of a body part.","ExplorerOrder":22,"ExplorerImageIndex":60,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Dialog","Summary":"An object used to make dialog trees to converse with players","ExplorerOrder":22,"ExplorerImageIndex":62,"Browsable":true,"PreferredParent":"","Members":[{"Name":"ConversationDistance","Summary":"The maximum distance that the player's character can be from the dialog's parent in order to use the dialog.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GoodbyeChoiceActive","Summary":"Indicates whether or not an extra choice is available for the player to exit the dialog tree at this node.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GoodbyeDialog","Summary":"The prompt text for an extra choice that allows the player to exit the dialog tree at this node.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InUse","Summary":"Indicates whether or not the dialog is currently being used by one or more players.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"InitialPrompt","Summary":"The chat message that is displayed to the player when they first activate the dialog.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Purpose","Summary":"Describes the purpose of the dialog, which is used to display a relevant icon on the dialog's activation button.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Tone","Summary":"Describes the tone of the dialog, which is used to display a relevant color in the dialog interface.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"BehaviorType","Summary":"Indicates how the dialog may be used by players. Use Enum.DialogBehaviorType.SinglePlayer if only one player should interact with the dialog at a time, otherwise use Enum.DialogBehaviorType.MultiplePlayers.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetCurrentPlayers","Summary":"Returns an array of the players currently conversing with this dialog.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"DialogChoice","Summary":"An object used to make dialog trees to converse with players","ExplorerOrder":22,"ExplorerImageIndex":63,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"UnionOperation","Summary":"A UnionOperation is a union of multiple parts","ExplorerOrder":2,"ExplorerImageIndex":73,"Browsable":"true","PreferredParent":"","Members":[{"Name":"UsePartColor","Summary":"Override the colors of the mesh with the part color.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"NegateOperation","Summary":"A NegateOperation can be used to create holes in other parts","ExplorerOrder":2,"ExplorerImageIndex":72,"Browsable":"true","PreferredParent":"","Members":[{"Name":"UsePartColor","Summary":"Override the colors of the mesh with the part color.","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"MeshPart","Summary":"A MeshPart is a physically simulatable mesh","ExplorerOrder":2,"ExplorerImageIndex":73,"Browsable":"true","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Terrain","Summary":"Object representing a high performance bounded grid of static 4x4 parts","ExplorerOrder":0,"ExplorerImageIndex":65,"Browsable":"true","PreferredParent":"","Members":[{"Name":"WaterTransparency","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WaterWaveSize","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WaterWaveSpeed","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"WaterReflectance","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetCell","Summary":"Returns CellMaterial, CellBlock, CellOrientation","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"GetWaterCell","Summary":"Returns hasAnyWater, WaterForce, WaterDirection","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SetWaterCell","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Light","Summary":"Parent of all light objects","ExplorerOrder":3,"ExplorerImageIndex":13,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Brightness","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"PointLight","Summary":"Makes the parent part emit light in a spherical shape","ExplorerOrder":3,"ExplorerImageIndex":13,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Range","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SpotLight","Summary":"Makes the parent part emit light in a conical shape","ExplorerOrder":3,"ExplorerImageIndex":13,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Range","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Angle","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"SurfaceLight","Summary":"Makes the parent part emit light in a frustum shape from rectangle defined by part","ExplorerOrder":3,"ExplorerImageIndex":13,"Browsable":true,"PreferredParent":"","Members":[{"Name":"Range","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Brightness","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"Angle","Summary":"","Browsable":true,"Deprecated":false,"Preliminary":false,"IsBackend":false}],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RemoteFunction","Summary":"Allow functions defined in one script to be called by another script across client/server boundary","ExplorerOrder":4,"ExplorerImageIndex":74,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"RemoteEvent","Summary":"Allow events defined in one script to be subscribed to by another script across client/server boundary","ExplorerOrder":5,"ExplorerImageIndex":75,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"TerrainRegion","Summary":"Object representing a snapshot of the region of terrain","ExplorerOrder":2,"ExplorerImageIndex":65,"Browsable":"true","PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false},{"Name":"ModuleScript","Summary":"A script fragment. Only runs when another script uses require() on it.","ExplorerOrder":5,"ExplorerImageIndex":76,"Browsable":true,"PreferredParent":"","Members":[],"Deprecated":false,"Preliminary":false,"IsBackend":false}]]==]
	end

	rawRMD = Services.HttpService:JSONDecode(rawRMD)

	local RMD = {}
	for _, v in pairs(rawRMD) do
		RMD[v.Name] = v
	end

	return RMD
end

function f.checkInPane(window)
	local inPane = false
	for i, v in pairs(LPaneItems) do
		if v.Window == window then
			inPane = true
		end
	end
	for i, v in pairs(RPaneItems) do
		if v.Window == window then
			inPane = true
		end
	end
	return inPane
end

function f.transGui(gui, num)
	if gui:IsA("GuiObject") then
		gui.BackgroundTransparency = num
	end
	if gui:IsA("TextBox") or gui:IsA("TextLabel") then
		gui.TextTransparency = num
	elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
		gui.ImageTransparency = num
	end
	for i, v in pairs(gui:GetChildren()) do
		f.transGui(v, num)
	end
end

function f.hookWindowListener(window, name)
	if name ~= "Properties" then
		window.TopBar.Close.MouseEnter:connect(function()
			window.TopBar.Close.BackgroundTransparency = 0.5
		end)

		window.TopBar.Close.MouseLeave:connect(function()
			window.TopBar.Close.BackgroundTransparency = 1
		end)

		window.TopBar.Close.MouseButton1Click:connect(function()
			if f.checkInPane(window) then
				f.removeFromPane(window)
				window.Visible = false
				window.Parent:ClearAllChildren()
				window.Parent:Remove()
				script:Remove()
				return
			end
		end)
	else
		window.TopBar.Close.Visible = false
	end
end

-- Explorer Functions

function f.tabIsA(tab, class)
	for i, v in pairs(tab) do
		if v:IsA(class) then
			return true
		end
	end
	return false
end

function f.hasChildren(tab)
	for i, v in pairs(tab) do
		if #v:GetChildren() > 0 then
			return true
		end
	end
	return false
end

function f.tabHasChar(tab)
	local players = Services.Players
	for i, v in pairs(tab) do
		if players:GetPlayerFromCharacter(v) then
			return true
		end
	end
	return false
end

function f.expandAll(obj)
	local node = nodes[obj]
	while node do
		explorerTree.Expanded[node] = true
		node = node.Parent
	end
end

function f.rightClick(obj)
	rightClickContext:Clear()

	local selection = explorerTree.Selection

	-- Cut

	if obj:IsA("ModuleScript") then
		rightClickContext:Add({
			Name = "Require Module",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "Ctrl+E",
			Disabled = false,
			OnClick = function()
				print(pcall(function()
					createReqGui()(obj)
				end))
				rightClickContext:Hide()
			end,
		})
		if decompile then
			rightClickContext:Add({
				Name = "View Script",
				Icon = "",
				DisabledIcon = "",
				Shortcut = "Ctrl+E",
				Disabled = false,
				OnClick = function()
					spawn(function()
						print(pcall(showCode, obj, obj.Name))
					end)

					rightClickContext:Hide()
				end,
			})
		end
	elseif decompile and obj:IsA("LocalScript") then
		rightClickContext:Add({
			Name = "View Script",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "Ctrl+E",
			Disabled = false,
			OnClick = function()
				spawn(function()
					print(pcall(showCode, obj, obj.Name))
				end)

				rightClickContext:Hide()
			end,
		})

		rightClickContext:Add({
			Name = "Copy Script Source",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "Ctrl+E",
			Disabled = false,
			OnClick = function()
				spawn(function()
					setclipboard(decompile(obj))
				end)

				rightClickContext:Hide()
			end,
		})
	end
	if obj:IsA("ModuleScript") or obj:IsA("LocalScript") then
		rightClickContext:AddDivider()
	end

	rightClickContext:Add({
		Name = "Cut",
		Icon = f.icon(nil, iconIndex.CUT_ICON),
		DisabledIcon = f.icon(nil, iconIndex.CUT_D_ICON),
		Shortcut = "Ctrl+X",
		Disabled = #selection.List == 0,
		OnClick = function()
			pcall(function()
				clipboard = {}
				for i, v in pairs(selection.List) do
					table.insert(clipboard, v:Clone())
					v:Destroy()
				end
			end)
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Copy",
		Icon = f.icon(nil, iconIndex.COPY_ICON),
		DisabledIcon = f.icon(nil, iconIndex.COPY_D_ICON),
		Shortcut = "Ctrl+C",
		Disabled = #selection.List == 0,
		OnClick = function()
			pcall(function()
				clipboard = {}
				for i, v in pairs(selection.List) do
					table.insert(clipboard, v:Clone())
				end
			end)
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Paste Into",
		Icon = f.icon(nil, iconIndex.PASTE_ICON),
		DisabledIcon = f.icon(nil, iconIndex.PASTE_D_ICON),
		Shortcut = "Ctrl+V",
		Disabled = #clipboard == 0,
		OnClick = function()
			pcall(function()
				for i, v in pairs(selection.List) do
					for _, copy in pairs(clipboard) do
						copy:Clone().Parent = v
					end
				end
			end)
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Duplicate",
		Icon = f.icon(nil, iconIndex.COPY_ICON),
		DisabledIcon = f.icon(nil, iconIndex.COPY_D_ICON),
		Shortcut = "Ctrl+D",
		Disabled = #selection.List == 0,
		OnClick = function()
			pcall(function()
				for i, v in pairs(selection.List) do
					v:Clone().Parent = v.Parent
				end
			end)
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Delete",
		Icon = f.icon(nil, iconIndex.DELETE_ICON),
		DisabledIcon = f.icon(nil, iconIndex.DELETE_D_ICON),
		Shortcut = "Del",
		Disabled = #selection.List == 0,
		OnClick = function()
			pcall(function()
				for i, v in pairs(selection.List) do
					v:Destroy()
				end
			end)
			rightClickContext:Hide()
		end,
	})

	if setclipboard then
		rightClickContext:Add({
			Name = "Copy Path",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "Ctrl+R",
			Disabled = #selection.List == 0,
			OnClick = function()
				setclipboard("game." .. string.gsub(obj:GetFullName(), "Players." .. plr.Name, "Players.LocalPlayer"))
				rightClickContext:Hide()
			end,
		})
	end

	rightClickContext:AddDivider()

	rightClickContext:Add({
		Name = "Group",
		Icon = f.icon(nil, iconIndex.GROUP_ICON),
		DisabledIcon = f.icon(nil, iconIndex.GROUP_D_ICON),
		Shortcut = "Ctrl+G",
		Disabled = #selection.List == 0,
		OnClick = function()
			local base = selection.List[1]
			local model = Instance.new("Model", base.Parent)
			for i, v in pairs(selection.List) do
				v.Parent = model
			end
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Ungroup",
		Icon = f.icon(nil, iconIndex.UNGROUP_ICON),
		DisabledIcon = f.icon(nil, iconIndex.UNGROUP_D_ICON),
		Shortcut = "Ctrl+U",
		Disabled = not f.tabIsA(selection.List, "Model"),
		OnClick = function()
			for i, v in pairs(selection.List) do
				if v:IsA("Model") then
					for _, child in pairs(v:GetChildren()) do
						child.Parent = v.Parent
					end
					v:Destroy()
				end
			end
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Select Children",
		Icon = f.icon(nil, iconIndex.SELECTCHILDREN_ICON),
		DisabledIcon = f.icon(nil, iconIndex.SELECTCHILDREN_D_ICON),
		Shortcut = "",
		Disabled = not f.hasChildren(selection.List),
		OnClick = function()
			local oldSel = selection.List
			selection.List = {}
			selection.Selected = {}
			for i, v in pairs(oldSel) do
				for _, child in pairs(v:GetChildren()) do
					explorerTree.Selection:Add(child)
					f.expandAll(child.Parent)
				end
			end
			explorerTree:TreeUpdate()
			explorerTree:Refresh()
			rightClickContext:Hide()
		end,
	})

	rightClickContext:Add({
		Name = "Jump To Parent",
		Icon = "",
		DisabledIcon = "",
		Shortcut = "",
		Disabled = #selection.List == 0,
		OnClick = function()
			local oldSel = selection.List
			selection.List = {}
			selection.Selected = {}
			for i, v in pairs(oldSel) do
				if v.Parent ~= nil then
					selection:Add(v.Parent)
				end
			end
			explorerTree:Refresh()
			rightClickContext:Hide()
		end,
	})

	-- Parts
	if f.tabIsA(selection.List, "BasePart") or f.tabIsA(selection.List, "Model") then
		rightClickContext:AddDivider()

		rightClickContext:Add({
			Name = "Teleport To",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "",
			Disabled = #selection.List == 0,
			OnClick = function()
				for i, v in pairs(selection.List) do
					if v:IsA("BasePart") then
						Services.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
						break
					end
				end
				rightClickContext:Hide()
			end,
		})

		rightClickContext:Add({
			Name = "Teleport Here",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "",
			Disabled = #selection.List == 0,
			OnClick = function()
				rightClickContext:Hide()
			end,
		})
	end

	-- Player
	local hasPlayer = false

	if f.tabIsA(selection.List, "Player") then
		hasPlayer = true
		rightClickContext:AddDivider()

		rightClickContext:Add({
			Name = "Jump To Character",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "",
			Disabled = #selection.List == 0,
			OnClick = function()
				rightClickContext:Hide()
			end,
		})
	end

	if f.tabHasChar(selection.List) then
		if not hasPlayer then
			rightClickContext:AddDivider()
		end

		rightClickContext:Add({
			Name = "Jump To Player",
			Icon = "",
			DisabledIcon = "",
			Shortcut = "",
			Disabled = #selection.List == 0,
			OnClick = function()
				rightClickContext:Hide()
			end,
		})
	end

	rightClickContext:Refresh()
	rightClickContext:Show(gui, mouse.X, mouse.Y)
end

function f.newExplorer()
	local newgui = getResource("ExplorerPanel")
	local explorerScroll = ScrollBar.new()
	local explorerScrollH = ScrollBar.new(true)
	local newTree = TreeView.new()
	newTree.Scroll = explorerScroll
	newTree.DisplayFrame = newgui.Content.List
	newTree.TreeUpdate = f.updateTree
	newTree.SearchText = ""
	newTree.SearchExpanded = {}

	local nameEvents = {}

	newTree.PreUpdate = function(self)
		for i, v in pairs(nameEvents) do
			v:Disconnect()
			nameEvents[i] = nil
		end
	end

	newTree.NodeCreate = function(self, entry, i)
		entry.Indent.IconFrame.Icon.Image = iconMap

		entry.MouseEnter:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if self.Selection.Selected[node.Obj] then
					return
				end
				if rightClickContext.Frame.Parent ~= nil and f.checkMouseInGui(rightClickContext.Frame) then
					return
				end
				entry.BackgroundTransparency = 0.7
			end
		end)
		entry.MouseLeave:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if self.Selection.Selected[node.Obj] then
					return
				end
				entry.BackgroundTransparency = 1
			end
		end)
		entry.MouseButton1Down:Connect(function()
			local node = self.Tree[i + self.Index]
			if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				self.Selection:Add(node.Obj)
			else
				self.Selection:Set({ node.Obj })
			end
			self:Refresh()
			propertiesTree:TreeUpdate()
			propertiesTree:Refresh()
		end)
		entry.MouseButton2Down:Connect(function()
			local node = self.Tree[i + self.Index]
			rightEntry = entry
			rightClickContext.Frame.Parent = nil
			if not self.Selection.Selected[node.Obj] then
				self.Selection:Set({ node.Obj })
			end
			self:Refresh()
		end)
		entry.MouseButton2Up:Connect(function()
			if rightEntry and f.checkMouseInGui(rightEntry) then
				f.rightClick((self.Tree[i + self.Index]).Obj)
			end
		end)

		entry.Indent.Expand.MouseEnter:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if
					(not self.SearchResults and self.Expanded[node])
					or (self.SearchResults and self.SearchExpanded[node.Obj])
				then
					f.icon(entry.Indent.Expand, iconIndex.NodeExpandedOver)
				else
					f.icon(entry.Indent.Expand, iconIndex.NodeCollapsedOver)
				end
			end
		end)
		entry.Indent.Expand.MouseLeave:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if
					(not self.SearchResults and self.Expanded[node])
					or (self.SearchResults and self.SearchExpanded[node.Obj])
				then
					f.icon(entry.Indent.Expand, iconIndex.NodeExpanded)
				else
					f.icon(entry.Indent.Expand, iconIndex.NodeCollapsed)
				end
			end
		end)
		entry.Indent.Expand.MouseButton1Down:Connect(function()
			local node = self.Tree[i + self.Index]
			if node and not self.SearchResults then
				self:Expand(node)
			else
				if self.SearchExpanded[node.Obj] then
					self.SearchExpanded[node.Obj] = nil
				else
					self.SearchExpanded[node.Obj] = 2
				end
				if self.TreeUpdate then
					self:TreeUpdate()
				end
				self:Refresh()
			end
		end)
	end

	newTree.NodeDraw = function(self, entry, node)
		f.icon(entry.Indent.IconFrame, iconIndex[node.Obj.ClassName] or 0)
		entry.Indent.EntryName.Text = node.Obj.Name
		if #node > 0 then
			entry.Indent.Expand.Visible = true
			if
				(not self.SearchResults and self.Expanded[node])
				or (self.SearchResults and self.SearchExpanded[node.Obj] == 2)
			then
				f.icon(entry.Indent.Expand, iconIndex.NodeExpanded)
			else
				f.icon(entry.Indent.Expand, iconIndex.NodeCollapsed)
			end
			if self.SearchExpanded[node.Obj] == 1 then
				entry.Indent.Expand.Visible = false
			end
		else
			entry.Indent.Expand.Visible = false
		end

		if node.Obj.Parent ~= node.Parent.Obj then
			spawn(function()
				f.moveObject(node.Obj, node.Obj.Parent)
			end)
		end

		if self.Selection.Selected[node.Obj] then
			entry.Indent.EntryName.TextColor3 = Color3.new(1, 1, 1)
			entry.BackgroundTransparency = 0
		else
			entry.Indent.EntryName.TextColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255)
			entry.BackgroundTransparency = 1
		end

		nameEvents[node.Obj] = node.Obj:GetPropertyChangedSignal("Name"):Connect(function()
			entry.Indent.EntryName.Text = node.Obj.Name
		end)

		entry.Indent.Position = UDim2.new(0, 18 * node.Depth, 0, 0)
		entry.Size = UDim2.new(0, nodeWidth + 10, 0, 18)
	end

	explorerScroll.Gui.Parent = newgui.Content
	explorerScroll:Texture({
		FrameColor = Color3.new(80 / 255, 80 / 255, 80 / 255),
		ThumbColor = Color3.new(120 / 255, 120 / 255, 120 / 255),
		ThumbSelectColor = Color3.new(140 / 255, 140 / 255, 140 / 255),
		ButtonColor = Color3.new(163 / 255, 162 / 255, 165 / 255),
		ArrowColor = Color3.new(220 / 255, 220 / 255, 220 / 255),
	})
	explorerScroll:SetScrollFrame(newgui.Content, 3)

	explorerScrollH.Gui.Visible = false
	explorerScrollH.Gui.Parent = newgui.Content
	explorerScrollH:Texture({
		FrameColor = Color3.new(80 / 255, 80 / 255, 80 / 255),
		ThumbColor = Color3.new(120 / 255, 120 / 255, 120 / 255),
		ThumbSelectColor = Color3.new(140 / 255, 140 / 255, 140 / 255),
		ButtonColor = Color3.new(163 / 255, 162 / 255, 165 / 255),
		ArrowColor = Color3.new(220 / 255, 220 / 255, 220 / 255),
	})
	explorerScrollH.Gui.Position = UDim2.new(0, 0, 1, -16)
	explorerScrollH.Gui.Size = UDim2.new(1, -16, 0, 16)

	newTree.OnUpdate = function(self)
		local guiX = explorerPanel.Content.AbsoluteSize.X - 16
		explorerScrollH.VisibleSpace = guiX
		explorerScrollH.TotalSpace = nodeWidth + 10
		if nodeWidth > guiX then
			explorerScrollH.Gui.Visible = true
			explorerScroll.Gui.Size = UDim2.new(0, 16, 1, -16)
			self.DisplayFrame.Size = UDim2.new(1, -16, 1, -16)
		else
			explorerScrollH.Gui.Visible = false
			explorerScroll.Gui.Size = UDim2.new(0, 16, 1, 0)
			self.DisplayFrame.Size = UDim2.new(1, -16, 1, 0)
		end
		explorerScroll.TotalSpace = #self.Tree + 1
		explorerScroll.VisibleSpace = math.ceil(self.DisplayFrame.AbsoluteSize.Y / 19)
		explorerScrollH:Update()
		explorerScroll:Update()
	end
	explorerScroll.OnUpdate = function(self)
		if newTree.Index == self.Index then
			return
		end
		newTree.Index = self.Index
		newTree:Refresh()
	end
	explorerScrollH.OnUpdate = function(self)
		for i, v in pairs(explorerTree.Entries) do
			v.Position = UDim2.new(0, 1 - self.Index, 0, v.Position.Y.Offset)
		end
	end
	--explorerData = {Window = newgui, NodeData = {}, Scroll = explorerScroll, Entries = {}}

	explorerTree = newTree

	table.insert(activeWindows, newgui)
	f.hookWindowListener(newgui, "Explorer")
	newgui.Changed:connect(function(prop)
		if prop == "AbsoluteSize" or prop == "AbsolutePosition" then
			newTree:Refresh()
		end
	end)

	local searchBox = newgui.TopBar.SearchFrame.Search
	local searchAnim = searchBox.Parent.Entering
	searchBox:GetPropertyChangedSignal("Text"):Connect(function()
		local searchTime = tick()
		lastSearch = searchTime
		wait()
		if lastSearch ~= searchTime then
			return
		end
		newTree.SearchText = searchBox.Text
		f.updateSearch(newTree)
		explorerTree:TreeUpdate()
		explorerTree:Refresh()
	end)

	searchBox.Focused:Connect(function()
		searchBox.Empty.Visible = false
		searchAnim:TweenSizeAndPosition(
			UDim2.new(1, 0, 0, 2),
			UDim2.new(0, 0, 0, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quart,
			0.5,
			true
		)
	end)

	searchBox.FocusLost:Connect(function()
		if searchBox.Text == "" then
			searchBox.Empty.Visible = true
		else
			searchBox.Empty.Visible = false
		end
		searchAnim:TweenSizeAndPosition(
			UDim2.new(0, 0, 0, 2),
			UDim2.new(0.5, 0, 0, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quart,
			0.5,
			true
		)
	end)

	return newgui
end

function f.refreshExplorer()
	explorerTree:Refresh()
end

function f.makeWindow(name)
	local newWindow = getResource(name)

	table.insert(activeWindows, newWindow)
	f.hookWindowListener(newWindow, name)

	return newWindow
end

function f.getRMDOrder(class)
	local currentClass = API.Classes[class]
	while currentClass do
		if RMD[currentClass.Name] and RMD[currentClass.Name].ExplorerOrder then
			return RMD[currentClass.Name].ExplorerOrder
		end
		currentClass = API.Classes[currentClass.Superclass]
	end
	return 999
end

function f.reDepth(node, depth)
	for i, v in ipairs(node) do
		v.Depth = depth + 1
		f.reDepth(node[i], depth + 1)
	end
end

function f.moveObject(obj, par)
	ypcall(function()
		if obj.Parent == nil then
			return
		end
		local node = nodes[obj]
		local newNode = nodes[par]
		if node and newNode then
			local parNode = node.Parent
			for i, v in ipairs(parNode) do
				if v == node then
					table.remove(parNode, i)
					break
				end
			end

			node.Depth = f.depth(par) + 1
			f.reDepth(node, node.Depth)

			node.Parent = newNode
			newNode.Sorted = nil
			table.insert(newNode, node)

			if not updateDebounce then
				updateDebounce = true
				wait()
				updateDebounce = false
				explorerTree:TreeUpdate()
				f.refreshExplorer()
			end
		end
	end)
end

function f.addObject(obj, noupdate, recurse)
	ypcall(function()
		local access = obj.Changed
		if not nodes[obj.Parent] then
			return
		end
		local newNode = {
			Obj = obj,
			Parent = nodes[obj.Parent],
			ExplorerOrder = f.getRMDOrder(obj.ClassName),
			Depth = f.depth(obj),
			UID = tick(),
		}
		if newNode.ExplorerOrder <= 0 and not obj:IsA("Workspace") and obj.Parent == game then
			newNode.ExplorerOrder = 999
		end
		nodes[obj] = newNode
		newNode.Parent.Sorted = nil
		table.insert(newNode.Parent, newNode)

		newNode.AncestryEvent = obj.AncestryChanged:Connect(function(child, par)
			if child == obj then
				f.moveObject(obj, par)
			end
		end)

		newNode.AddedEvent = obj.ChildAdded:Connect(function(child)
			f.addObject(child, false, true)
		end)

		newNode.RemovedEvent = obj.ChildRemoved:Connect(function(child)
			f.removeObject(child, false, true)
		end)

		if recurse then
			for i, v in pairs(obj:GetDescendants()) do
				f.addObject(v, true)
			end
		end
	end)
end

function f.nodeDescendants(node, descendants)
	for i, v in ipairs(node) do
		table.insert(descendants, v.Obj)
		f.nodeDescendants(v, descendants)
	end
end

function f.removeObject(obj, noupdate, recurse)
	ypcall(function()
		local node = nodes[obj]
		if node then
			local par = node.Parent
			for i, v in ipairs(par) do
				if v == node then
					table.remove(par, i)
					break
				end
			end

			node.AncestryEvent:Disconnect()
			node.AncestryEvent = nil

			node.AddedEvent:Disconnect()
			node.AddedEvent = nil

			node.RemovedEvent:Disconnect()
			node.RemovedEvent = nil

			if recurse then
				local descendants = {}
				f.nodeDescendants(node, descendants)
				for i, v in ipairs(descendants) do
					f.removeObject(v, true)
				end
			end

			nodes[obj] = nil

			if not updateDebounce and not noupdate then
				updateDebounce = true
				wait()
				updateDebounce = false
				explorerTree:TreeUpdate()
				f.refreshExplorer()
			end
		end
	end)
end

function f.indexNodes(obj)
	if not nodes[game] then
		nodes[game] = { Obj = game, Parent = nil }
	end

	local addObject = f.addObject
	local removeObject = f.removeObject

	for i, v in pairs(game:GetChildren()) do
		addObject(v, true, true)
	end
end

function f.gExpanded(obj)
	if explorerData.NodeData and explorerData.NodeData[obj] and explorerData.NodeData[obj].Expanded then
		return true
	end
	return false
end

local searchFunctions = {
	["class:"] = function(token, results)
		local class = string.match(token, "%S+:%s*(%S*)")
		if class == "" then
			return
		end
		local foundClass = ""
		for i, v in pairs(API.Classes) do
			if i:lower() == class:lower() then
				foundClass = i
				break
			elseif i:lower():find(class:lower(), 1, true) then
				foundClass = i
			end
		end

		if foundClass == "" then
			return
		end

		return function(obj)
			return obj.ClassName == foundClass
		end
	end,
	["isa:"] = function(token, results)
		local class = string.match(token, "%S+:%s*(%S*)")
		if class == "" then
			return
		end
		local foundClass = ""
		for i, v in pairs(API.Classes) do
			if i:lower() == class:lower() then
				foundClass = i
				break
			elseif i:lower():find(class:lower(), 1, true) then
				foundClass = i
			end
		end

		if foundClass == "" then
			return
		end

		return function(obj)
			return obj:IsA(foundClass)
		end
	end,
	["regex:"] = function(token, results)
		local pattern = string.match(token, "%S+:%s*(%S*)")
		if pattern == "" then
			return
		end

		return function(obj)
			return obj.Name:find(pattern)
		end
	end,
}

local searchCache = {}

function f.updateSearch(self)
	local searchText = self.SearchText
	if searchText == "" then
		self.SearchResults = nil
		return
	end
	local results = {}
	local tokens = {}
	local checks = {}
	local tokenMap = {}

	self.SearchExpanded = {}

	-- Splits search text into multiple tokens for multiple searching
	for w in string.gmatch(searchText, "[^|]+") do
		table.insert(tokens, w)
	end

	-- Create checks based on search text
	for _, token in pairs(tokens) do
		token = token:match("%s*(.+)")
		tokenMap[token] = true
		local keyword = string.match(token, "%S+:")
		if searchFunctions[keyword] then
			local res = searchFunctions[keyword](token, results)
			if res then
				checks[token] = res
			end
		else
			checks[token] = function(obj)
				return obj.Name:lower():find(token:lower(), 1, true)
			end
		end
	end

	-- Remove uneeded items from cache
	for i, v in pairs(searchCache) do
		if not tokenMap[i] then
			searchCache[i] = nil
		end
	end

	-- Perform the searches
	local searchExpanded = self.SearchExpanded

	for token, check in pairs(checks) do
		local newResults = {}
		if searchCache[token] then
			for obj, v in pairs(searchCache[token]) do
				results[obj] = true
				searchExpanded[obj] = math.max(searchExpanded[obj] or 0, 1)
				local par = obj.Parent
				while par and not results[par] or searchExpanded[par] == 1 do
					results[par] = true
					searchExpanded[par] = 2
					par = par.Parent
				end
			end
		else
			for i, v in pairs(game:GetDescendants()) do
				local success, found = pcall(check, v)
				if found and nodes[v] then
					results[v] = true
					newResults[v] = true
					searchExpanded[v] = math.max(searchExpanded[v] or 0, 1)
					local par = v.Parent
					while par and not results[par] or searchExpanded[par] == 1 do
						results[par] = true
						newResults[par] = true
						searchExpanded[par] = 2
						par = par.Parent
					end
				end
			end
			searchCache[token] = newResults
		end
	end

	--[[
	for i,v in pairs(game:GetDescendants()) do
		searchCache[token] = {}
		for token,check in pairs(checks) do
			if searchCache[token] then for obj,_ in pairs(searchCache[token]) do results[obj] = true end break end
			local success,found = pcall(check,v)
			if found and nodes[v] then
				results[v] = true
				local par = v.Parent
				while par and not results[par] do
					results[par] = true
					par = par.Parent
				end
				break
			end
		end
	end
	--]]
	self.SearchChecks = checks
	self.SearchResults = results
end

local textWidthRuler = Instance.new("TextLabel", gui)
textWidthRuler.Font = Enum.Font.SourceSans
textWidthRuler.TextSize = 14
textWidthRuler.Visible = false

function f.textWidth(text)
	textWidthRuler.Text = text
	return textWidthRuler.TextBounds.X
end

function f.updateTree(self)
	local isSearching = self.SearchResults
	local searchExpanded = self.SearchExpanded

	nodeWidth = 0

	local function fillTree(node, tree)
		if not node.Sorted then
			table.sort(node, function(a, b)
				local o1 = a.ExplorerOrder
				local o2 = b.ExplorerOrder
				if o1 ~= o2 then
					return o1 < o2
				elseif a.Obj.Name ~= b.Obj.Name then
					return a.Obj.Name < b.Obj.Name
				elseif a.Obj.ClassName ~= b.Obj.ClassName then
					return a.Obj.ClassName < b.Obj.ClassName
				else
					return a.UID < b.UID
				end
			end)
			node.Sorted = true
		end

		for i = 1, #node do
			--node[i].Ind = i
			if not isSearching or (isSearching and isSearching[node[i].Obj]) then
				local textWidth = node[i].Depth * 18 + f.textWidth(node[i].Obj.Name) + 22
				nodeWidth = textWidth > nodeWidth and textWidth or nodeWidth
				table.insert(tree, node[i])
				if
					(not isSearching and explorerTree.Expanded[node[i]])
					or (isSearching and searchExpanded[node[i].Obj] == 2)
				then
					fillTree(node[i], tree)
				end
			end
		end
	end

	self.Tree = {}
	fillTree(nodes[game], self.Tree)
	--self.Scroll:Update()
end

function f.icon(frame, index)
	local row, col = math.floor(index / 14 % 14), math.floor(index % 14)
	local pad, border = 2, 1
	if not frame then
		frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(0, 16, 0, 16)
		frame.ClipsDescendants = true
		local newMap = Instance.new("ImageLabel", frame)
		newMap.Name = "Icon"
		newMap.BackgroundTransparency = 1
		newMap.Size = UDim2.new(16, 0, 16, 0)
		newMap.Image = iconMap
	end
	local icon = frame.Icon
	icon.Position = UDim2.new(-col - (pad * (col + 1) + border) / 16, 0, -row - (pad * (row + 1) + border) / 16, 0)
	return frame
end

function f.depth(obj)
	local depth = 0
	local curPar = obj.Parent
	while curPar ~= nil do
		curPar = curPar.Parent
		depth = depth + 1
	end
	return depth
end

local Selection
do
	Selection = {
		List = {},
		Selected = {},
	}

	function Selection:Add(obj)
		if Selection.Selected[obj] then
			return
		end

		Selection.Selected[obj] = true
		table.insert(Selection.List, obj)
	end

	function Selection:Set(objs)
		for i, v in pairs(Selection.List) do
			Selection.Selected[v] = nil
		end
		Selection.List = {}

		for i, v in pairs(objs) do
			if not Selection.Selected[v] then
				Selection.Selected[v] = true
				table.insert(Selection.List, v)
			end
		end
	end

	function Selection:Remove(obj)
		if not Selection.Selected[obj] then
			return
		end

		Selection.Selected[obj] = false
		for i, v in pairs(Selection.List) do
			if v == obj then
				table.remove(Selection.List, i)
				break
			end
		end
	end
end

function f.refreshExplorers(id)
	--wait()
	local e = explorerData
	local window = e.Window
	local scroll = e.Scroll
	local entrySpace = math.floor(window.Content.List.AbsoluteSize.Y / 19) + 1

	scroll.TotalSpace = #e.Tree
	scroll.VisibleSpace = entrySpace - 1

	for i = 1, entrySpace do
		local node = e.Tree[i + scroll.Index]
		if node then
			local nodeData = e.NodeData[node.Obj]
			local cEntry = e.Entries[i]
			if not cEntry then
				cEntry = entryTemplate:Clone()
				cEntry.Position = UDim2.new(0, 1, 0, 2 + 19 * #window.Content.List:GetChildren())
				cEntry.Parent = window.Content.List
				e.Entries[i] = cEntry

				cEntry.MouseEnter:connect(function()
					local node = e.Tree[i + scroll.Index]
					if node then
						if Selection.Selected[node.Obj] then
							return
						end
						cEntry.BackgroundTransparency = 0.7
					end
				end)
				cEntry.MouseLeave:connect(function()
					local node = e.Tree[i + scroll.Index]
					if node then
						if Selection.Selected[node.Obj] then
							return
						end
						cEntry.BackgroundTransparency = 1
					end
				end)
				cEntry.MouseButton1Down:connect(function()
					local node = e.Tree[i + scroll.Index]
					if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
						Selection:Add(node.Obj)
					else
						Selection:Set({ node.Obj })
					end
					f.refreshExplorer()
				end)

				cEntry.Indent.Expand.MouseEnter:connect(function()
					local node = e.Tree[i + scroll.Index]
					if node then
						if not e.NodeData[node.Obj] then
							e.NodeData[node.Obj] = {}
						end
						if e.NodeData[node.Obj].Expanded then
							f.icon(cEntry.Indent.Expand, iconIndex.NodeExpandedOver)
						else
							f.icon(cEntry.Indent.Expand, iconIndex.NodeCollapsedOver)
						end
					end
				end)
				cEntry.Indent.Expand.MouseLeave:connect(function()
					local node = e.Tree[i + scroll.Index]
					if node then
						if not e.NodeData[node.Obj] then
							e.NodeData[node.Obj] = {}
						end
						if e.NodeData[node.Obj].Expanded then
							f.icon(cEntry.Indent.Expand, iconIndex.NodeExpanded)
						else
							f.icon(cEntry.Indent.Expand, iconIndex.NodeCollapsed)
						end
					end
				end)
				cEntry.Indent.Expand.MouseButton1Down:connect(function()
					local node = e.Tree[i + scroll.Index]
					if node then
						if not e.NodeData[node.Obj] then
							e.NodeData[node.Obj] = {}
						end
						if e.NodeData[node.Obj].Expanded then
							e.NodeData[node.Obj].Expanded = false
						else
							e.NodeData[node.Obj].Expanded = true
						end
						f.updateTree()
						f.refreshExplorer()
					end
				end)
			end

			cEntry.Visible = true
			f.icon(cEntry.Indent.IconFrame, iconIndex[node.Obj.ClassName] or 0)
			cEntry.Indent.EntryName.Text = node.Obj.Name
			if #node.Obj:GetChildren() > 0 then
				cEntry.Indent.Expand.Visible = true
				if nodeData and nodeData.Expanded then
					f.icon(cEntry.Indent.Expand, iconIndex.NodeExpanded)
				else
					f.icon(cEntry.Indent.Expand, iconIndex.NodeCollapsed)
				end
			else
				cEntry.Indent.Expand.Visible = false
			end

			if Selection.Selected[node.Obj] then
				cEntry.Indent.EntryName.TextColor3 = Color3.new(1, 1, 1)
				cEntry.BackgroundTransparency = 0
			else
				cEntry.Indent.EntryName.TextColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255)
				cEntry.BackgroundTransparency = 1
			end

			cEntry.Indent.Position = UDim2.new(0, 18 * node.Depth, 0, 0)
		else
			local cEntry = e.Entries[i]
			if cEntry then
				cEntry.Visible = false
			end
		end
	end

	-- Outliers
	for i = entrySpace + 1, #e.Entries do
		if e.Entries[i] then
			e.Entries[i]:Destroy()
			e.Entries[i] = nil
		end
	end
end

-- Properties Functions

function f.toValue(str, valueType)
	if valueType == "int" or valueType == "float" or valueType == "double" then
		return tonumber(str)
	end
end

function f.childValue(prop, value, obj)
	local propName = prop.Name
	local parentPropName = prop.ParentProp.Name
	local parentPropType = prop.ParentProp.ValueType
	local objProp = obj[parentPropName]

	if parentPropType == "Vector3" then
		return Vector3.new(
			propName == "X" and value or objProp.X,
			propName == "Y" and value or objProp.Y,
			propName == "Z" and value or objProp.Z
		)
	elseif parentPropType == "Rect2D" then
		return Rect.new(
			propName == "X0" and value or objProp.Min.X,
			propName == "Y0" and value or objProp.Min.Y,
			propName == "X1" and value or objProp.Max.X,
			propName == "Y1" and value or objProp.Max.Y
		)
	end
end

function f.setProp(prop, str, child)
	local value = f.toValue(str, prop.ValueType)
	if value then
		for i, v in pairs(explorerTree.Selection.List) do
			pcall(function()
				if v:IsA(prop.Class) then
					if #child == 0 then
						v[prop.Name] = value
					else
						v[prop.ParentProp.Name] = f.childValue(prop, value, v)
					end
				end
			end)
		end
	end
end

local propControls = {
	["Default"] = function(prop, child)
		local newMt = setmetatable({}, {})

		local controlGui, readOnlyText, lastValue

		local function setup(self, frame)
			controlGui = resources.PropControls.String:Clone()
			readOnlyText = controlGui.ReadOnly

			if prop.Tags["readonly"] then
				if lastValue then
					readOnlyText.Text = tostring(lastValue)
				end
				readOnlyText.Visible = true
				readOnlyText.Parent = frame
			else
				if lastValue then
					controlGui.Text = tostring(lastValue)
				end
				controlGui.FocusLost:Connect(function()
					f.setProp(prop, controlGui.Text, child or {})
				end)
				controlGui.Parent = frame
			end
		end
		newMt.Setup = setup

		local function update(self, value)
			lastValue = value
			if not controlGui then
				return
			end
			if not prop.Tags["readonly"] then
				controlGui.Text = tostring(value)
			else
				readOnlyText.Text = tostring(value)
			end
		end
		newMt.Update = update

		local function focus(self)
			controlGui:CaptureFocus()
		end
		newMt.Focus = focus
		return newMt
	end,
	["Vector3"] = function(prop, child)
		local newMt = setmetatable({}, {})

		local controlGui, readOnlyText

		local function setup(self, frame)
			controlGui = resources.PropControls.String:Clone()
			readOnlyText = controlGui.ReadOnly

			if prop.Tags["readonly"] then
				readOnlyText.Visible = true
				readOnlyText.Parent = frame
			else
				controlGui.FocusLost:Connect(function()
					f.setProp(prop, controlGui.Text, child or {})
				end)
				controlGui.Parent = frame
			end
		end
		newMt.Setup = setup

		local function update(self, value)
			if not prop.Tags["readonly"] then
				controlGui.Text = tostring(value)
				self.Children[1].Control:Update(value.X)
				self.Children[2].Control:Update(value.Y)
				self.Children[3].Control:Update(value.Z)
			else
				readOnlyText.Text = tostring(value)
				self.Children[1].Control:Update(value.X)
				self.Children[2].Control:Update(value.Y)
				self.Children[3].Control:Update(value.Z)
			end
		end
		newMt.Update = update

		local function focus(self)
			controlGui:CaptureFocus()
		end
		newMt.Focus = focus

		newMt.Children = {
			f.getChildProp(prop, { Name = "X", ValueType = "double", Depth = 2 }),
			f.getChildProp(prop, { Name = "Y", ValueType = "double", Depth = 2 }),
			f.getChildProp(prop, { Name = "Z", ValueType = "double", Depth = 2 }),
		}

		return newMt
	end,
	["Rect2D"] = function(prop, child)
		local newMt = setmetatable({}, {})

		local controlGui, readOnlyText

		local function setup(self, frame)
			controlGui = resources.PropControls.String:Clone()
			readOnlyText = controlGui.ReadOnly

			if prop.Tags["readonly"] then
				readOnlyText.Visible = true
				readOnlyText.Parent = frame
			else
				controlGui.FocusLost:Connect(function()
					f.setProp(prop, controlGui.Text, child or {})
				end)
				controlGui.Parent = frame
			end
		end
		newMt.Setup = setup

		local function update(self, value)
			if not prop.Tags["readonly"] then
				controlGui.Text = tostring(value)
				self.Children[1].Control:Update(value.Min.X)
				self.Children[2].Control:Update(value.Min.Y)
				self.Children[3].Control:Update(value.Max.X)
				self.Children[4].Control:Update(value.Max.Y)
			else
				readOnlyText.Text = tostring(value)
				self.Children[1].Control:Update(value.Min.X)
				self.Children[2].Control:Update(value.Min.Y)
				self.Children[3].Control:Update(value.Max.X)
				self.Children[4].Control:Update(value.Max.Y)
			end
		end
		newMt.Update = update

		local function focus(self)
			controlGui:CaptureFocus()
		end
		newMt.Focus = focus

		newMt.Children = {
			f.getChildProp(prop, { Name = "X0", ValueType = "double", Depth = 2 }),
			f.getChildProp(prop, { Name = "Y0", ValueType = "double", Depth = 2 }),
			f.getChildProp(prop, { Name = "X1", ValueType = "double", Depth = 2 }),
			f.getChildProp(prop, { Name = "Y1", ValueType = "double", Depth = 2 }),
		}

		return newMt
	end,
}

function f.getPropControl(prop, child)
	local control = propControls[prop.ValueType] or propControls["Default"]
	return control(prop, child)
end

--[[
local propExpandable = {
	["Vector3"] = true
}
--]]

--[[
function f.getChildrenControls(obj,prop)
	local children = {}
	if prop.ValueType == "Vector3" then
		local newProp = {}
		for i,v in pairs(prop) do newProp[i] = v end
		newProp.ValueType = "double"
		newProp.Name = "X"
		newProp.ParentName = prop.Name
		newProp.ParentType = prop.ValueType
		local newNode = {
			Prop = newProp,
			RefName = prop.Class.."|"..prop.Name.."|X",
			Control = f.getPropControl(newProp,{"X"}),
			Depth = 2,
			Obj = obj,
			Children = {}
		}
		table.insert(children,newNode)
	end
	return children
end
--]]

function f.getChildProp(prop, data)
	local newProp = {
		Name = data.Name,
		ValueType = data.ValueType,
		ParentProp = prop,
		Tags = prop.Tags,
		Class = prop.Class,
	}
	local childNode = {
		Prop = newProp,
		RefName = prop.Class .. "|" .. prop.Name .. "|" .. data.Name,
		Control = f.getPropControl(newProp, { data.Name }),
		Depth = data.Depth,
		Children = {},
	}
	return childNode
end

function f.updatePropTree(self)
	self.Tree = {}

	propWidth = 0
	local gotProps = {}
	local props = {}
	local newTree = {}

	for i, v in pairs(explorerTree.Selection.List) do
		local class = API.Classes[v.ClassName]
		while class ~= nil and not gotProps[class.Name] do
			for _, prop in pairs(class.Properties) do
				pcall(function()
					local check = v[prop.Name]
					local categoryList = propCategories[class.Name] or {}
					local newNode = {
						Prop = prop,
						RefName = class.Name .. "|" .. prop.Name,
						Obj = v,
						Control = f.getPropControl(prop),
						Depth = 1,
						--Children = f.getChildrenControls(v,prop)
					}
					--f.setupControls(newNode)
					--newNode.Control.Children = newNode.Children
					local textWidth = f.textWidth(prop.Name) + newNode.Depth * 18 + 5
					propWidth = textWidth > propWidth and textWidth or propWidth
					table.insert(props, newNode)
				end)
			end
			gotProps[class.Name] = true
			class = API.Classes[class.Superclass]
		end
	end

	table.sort(props, function(a, b)
		local o1 = categoryOrder[a.Prop.Category] or 0
		local o2 = categoryOrder[b.Prop.Category] or 0
		if o1 ~= o2 then
			return o1 < o2
		else
			return a.Prop.Name < b.Prop.Name
		end
	end)

	local nextCategory = ""
	local categoryNode
	for i, v in pairs(props) do
		if nextCategory ~= v.Prop.Category then
			nextCategory = v.Prop.Category
			categoryNode = {
				Category = true,
				RefName = "CAT:" .. nextCategory,
				Prop = { Name = nextCategory },
				Depth = 1,
			}
			table.insert(newTree, categoryNode)
		end
		if self.Expanded["CAT:" .. nextCategory] then
			table.insert(newTree, v)
			if v.Control.Children and self.Expanded[v.RefName] then
				for _, child in pairs(v.Control.Children) do
					table.insert(newTree, child)
				end
			end
		end
	end

	self.Tree = newTree
end

function f.newProperties()
	local newgui = getResource("PropertiesPanel")
	local propertiesScroll = ScrollBar.new()
	local propertiesScrollH = ScrollBar.new(true)
	local newTree = TreeView.new()
	newTree.NodeTemplate = getResource("PEntry")
	newTree.Height = 22
	newTree.OffY = 0
	newTree.Scroll = propertiesScroll
	newTree.DisplayFrame = newgui.Content.List
	newTree.TreeUpdate = f.updatePropTree
	newTree.SearchText = ""

	local changeEvents = {}
	local drawOrder = 0

	newTree.PreUpdate = function(self)
		drawOrder = 0
		for i, v in pairs(changeEvents) do
			v:Disconnect()
			changeEvents[i] = nil
		end
	end

	newTree.NodeCreate = function(self, entry, i)
		entry.MouseEnter:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if self.Selection.Selected[node.RefName] then
					return
				end
				entry.Indent.BackgroundTransparency = 0.7
			end
		end)
		entry.MouseLeave:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if self.Selection.Selected[node.RefName] then
					return
				end
				entry.Indent.BackgroundTransparency = 1
			end
		end)
		entry.MouseButton1Down:Connect(function()
			local node = self.Tree[i + self.Index]
			--node.Control:Focus()
		end)
		entry.MouseButton2Down:Connect(function()
			local node = self.Tree[i + self.Index]
			--node.Control:Focus()
		end)

		entry.Indent.Expand.MouseEnter:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if
					(not self.SearchResults and self.Expanded[node])
					or (self.SearchResults and self.SearchExpanded[node.Obj])
				then
					f.icon(entry.Indent.Expand, iconIndex.NodeExpandedOver)
				else
					f.icon(entry.Indent.Expand, iconIndex.NodeCollapsedOver)
				end
			end
		end)
		entry.Indent.Expand.MouseLeave:Connect(function()
			local node = self.Tree[i + self.Index]
			if node then
				if
					(not self.SearchResults and self.Expanded[node])
					or (self.SearchResults and self.SearchExpanded[node.Obj])
				then
					f.icon(entry.Indent.Expand, iconIndex.NodeExpanded)
				else
					f.icon(entry.Indent.Expand, iconIndex.NodeCollapsed)
				end
			end
		end)
		entry.Indent.Expand.MouseButton1Down:Connect(function()
			local node = self.Tree[i + self.Index]
			self:Expand(node.RefName)
		end)
	end

	newTree.NodeDraw = function(self, entry, node)
		entry.Indent.EntryName.Text = node.Prop.Name
		entry.Indent.Control:ClearAllChildren()

		if not node.Category then
			-- Update property controls
			node.Control:Setup(entry.Indent.Control)
			if node.Depth > 1 then
				--node.Control:Update(node.Obj[node.Prop.ParentName][node.Prop.Name])
			else
				node.Control:Update(node.Obj[node.Prop.Name])
			end

			-- Color switching
			--if drawOrder % 2 == 0 and not node.Category then
			--	entry.BackgroundColor3 = Color3.new(96/255,96/255,96/255)
			--else
			entry.BackgroundColor3 = Color3.new(80 / 255, 80 / 255, 80 / 255)
			--end
		else
			entry.BackgroundColor3 = Color3.new(64 / 255, 64 / 255, 64 / 255)
		end
		drawOrder = drawOrder + 1

		-- Fonts for category nodes and property nodes
		if node.Category then
			entry.Indent.Sep.Visible = false
			entry.Indent.EntryName.Font = Enum.Font.SourceSansBold
			entry.Indent.EntryName.TextColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255)
		else
			entry.Indent.Sep.Visible = true
			entry.Indent.EntryName.Font = Enum.Font.SourceSans
			if node.Prop.Tags["readonly"] then
				entry.Indent.EntryName.TextColor3 = Color3.new(144 / 255, 144 / 255, 144 / 255)
			else
				entry.Indent.EntryName.TextColor3 = Color3.new(220 / 255, 220 / 255, 220 / 255)
			end
		end

		if node.Category or node.Control.Children then
			entry.Indent.Expand.Visible = true
			if self.Expanded[node.RefName] then
				f.icon(entry.Indent.Expand, iconIndex.NodeExpanded)
			else
				f.icon(entry.Indent.Expand, iconIndex.NodeCollapsed)
			end
		else
			entry.Indent.Expand.Visible = false
		end

		if self.Selection.Selected[node.Obj] then
			entry.Indent.EntryName.TextColor3 = Color3.new(1, 1, 1)
			entry.Indent.BackgroundTransparency = 0
		else
			--entry.Indent.EntryName.TextColor3 = Color3.new(220/255, 220/255, 220/255)
			entry.Indent.BackgroundTransparency = 1
		end

		if not node.Category and node.Depth == 1 then
			changeEvents[node.Obj] = node.Obj:GetPropertyChangedSignal(node.Prop.Name):Connect(function()
				node.Control:Update(node.Obj[node.Prop.Name])
			end)
		end

		entry.Indent.Position = UDim2.new(0, 18 * node.Depth, 0, 0)

		local newPropWidth = propWidth - node.Depth * 18
		entry.Indent.EntryName.Size = UDim2.new(0, newPropWidth, 0, 22)
		entry.Indent.Control.Position = UDim2.new(0, newPropWidth + 2, 0, 0)
		entry.Indent.Control.Size = UDim2.new(1, -newPropWidth - 2, 0, 22)
		entry.Indent.Sep.Position = UDim2.new(0, newPropWidth + 1, 0, 0)
		entry.Size = UDim2.new(0, 281, 0, 22)
	end

	propertiesScroll.Gui.Parent = newgui.Content
	propertiesScroll:Texture({
		FrameColor = Color3.new(80 / 255, 80 / 255, 80 / 255),
		ThumbColor = Color3.new(120 / 255, 120 / 255, 120 / 255),
		ThumbSelectColor = Color3.new(140 / 255, 140 / 255, 140 / 255),
		ButtonColor = Color3.new(163 / 255, 162 / 255, 165 / 255),
		ArrowColor = Color3.new(220 / 255, 220 / 255, 220 / 255),
	})
	propertiesScroll:SetScrollFrame(newgui.Content, 3)

	propertiesScrollH.Gui.Visible = false
	propertiesScrollH.Gui.Parent = newgui.Content
	propertiesScrollH:Texture({
		FrameColor = Color3.new(80 / 255, 80 / 255, 80 / 255),
		ThumbColor = Color3.new(120 / 255, 120 / 255, 120 / 255),
		ThumbSelectColor = Color3.new(140 / 255, 140 / 255, 140 / 255),
		ButtonColor = Color3.new(163 / 255, 162 / 255, 165 / 255),
		ArrowColor = Color3.new(220 / 255, 220 / 255, 220 / 255),
	})
	propertiesScrollH.Gui.Position = UDim2.new(0, 0, 1, -16)
	propertiesScrollH.Gui.Size = UDim2.new(1, -16, 0, 16)

	newTree.OnUpdate = function(self)
		local guiX = propertiesPanel.Content.AbsoluteSize.X - 16
		--[[
		propertiesScrollH.VisibleSpace = guiX
		propertiesScrollH.TotalSpace = nodeWidth+10
		if nodeWidth > guiX then
			explorerScrollH.Gui.Visible = true
			explorerScroll.Gui.Size = UDim2.new(0,16,1,-16)
			self.DisplayFrame.Size = UDim2.new(1,-16,1,-16)
		else
			explorerScrollH.Gui.Visible = false
			explorerScroll.Gui.Size = UDim2.new(0,16,1,0)
			self.DisplayFrame.Size = UDim2.new(1,-16,1,0)
		end
		--]]
		propertiesScroll.TotalSpace = #self.Tree + 1
		propertiesScroll.VisibleSpace = math.ceil(self.DisplayFrame.AbsoluteSize.Y / 23)
		propertiesScrollH:Update()
		propertiesScroll:Update()
	end
	propertiesScroll.OnUpdate = function(self)
		if newTree.Index == self.Index then
			return
		end
		newTree.Index = self.Index
		newTree:Refresh()
	end
	propertiesScrollH.OnUpdate = function(self)
		for i, v in pairs(propertiesTree.Entries) do
			v.Position = UDim2.new(0, -self.Index, 0, v.Position.Y.Offset)
		end
	end
	--explorerData = {Window = newgui, NodeData = {}, Scroll = explorerScroll, Entries = {}}

	propertiesTree = newTree

	table.insert(activeWindows, newgui)
	f.hookWindowListener(newgui, "Properties")
	newgui.Changed:connect(function(prop)
		if prop == "AbsoluteSize" or prop == "AbsolutePosition" then
			newTree:Refresh()
		end
	end)

	local searchBox = newgui.TopBar.SearchFrame.Search
	local searchAnim = searchBox.Parent.Entering
	searchBox:GetPropertyChangedSignal("Text"):Connect(function()
		--[[
		local searchTime = tick()
		lastSearch = searchTime
		wait()
		if lastSearch ~= searchTime then return end
		newTree.SearchText = searchBox.Text
		f.updateSearch(newTree)
		explorerTree:TreeUpdate()
		explorerTree:Refresh()
		--]]
	end)

	searchBox.Focused:Connect(function()
		searchBox.Empty.Visible = false
		searchAnim:TweenSizeAndPosition(
			UDim2.new(1, 0, 0, 2),
			UDim2.new(0, 0, 0, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quart,
			0.5,
			true
		)
	end)

	searchBox.FocusLost:Connect(function()
		if searchBox.Text == "" then
			searchBox.Empty.Visible = true
		else
			searchBox.Empty.Visible = false
		end
		searchAnim:TweenSizeAndPosition(
			UDim2.new(0, 0, 0, 2),
			UDim2.new(0.5, 0, 0, 0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quart,
			0.5,
			true
		)
	end)

	return newgui
end

local function welcomePlayer()
	local oldt = tick()

	API = f.fetchAPI()
	RMD = f.fetchRMD()
	rightClickContext = ContextMenu.new()
	f.indexNodes()
	explorerTree:TreeUpdate()

	explorerTree:Refresh()
	f.addToPane(explorerPanel, "Right")
	f.addToPane(propertiesPanel, "Right")
	f.resizePaneItem(propertiesPanel, "Right", 0.5)

	local now = tick()
	print("Loaded in", tostring(now - oldt):sub(0, 4), "Seconds")
end

mouse.Move:connect(function()
	--if mouseWindow == nil then return end
	local x, y = mouse.X, mouse.Y

	if x <= 50 then
		setPane = "Left"
	elseif x >= gui.AbsoluteSize.X - 50 then
		setPane = "Right"
	else
		setPane = "None"
	end
end)

explorerPanel = f.newExplorer()
propertiesPanel = f.newProperties()

for category, _ in pairs(categoryOrder) do
	propertiesTree.Expanded["CAT:" .. category] = true
end

propertiesTree.Expanded["CAT:Surface Inputs"] = false
propertiesTree.Expanded["CAT:Surface"] = false

welcomePlayer()
