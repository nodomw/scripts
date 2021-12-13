local E621Browser = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local topbar = Instance.new("Frame")
local toptext = Instance.new("TextLabel")
local logo = Instance.new("ImageButton")
local images = Instance.new("Frame")
local image1 = Instance.new("Frame")
local imageframe = Instance.new("Frame")
local point1 = Instance.new("Frame")
local rating = Instance.new("TextLabel")
local statustextimage = Instance.new("TextLabel")
local showimage = Instance.new("TextButton")
local UIGridLayout = Instance.new("UIGridLayout")
local image2 = Instance.new("Frame")
local imageframe_2 = Instance.new("Frame")
local point1_2 = Instance.new("Frame")
local rating_2 = Instance.new("TextLabel")
local statustextimage_2 = Instance.new("TextLabel")
local showimage_2 = Instance.new("TextButton")
local image3 = Instance.new("Frame")
local imageframe_3 = Instance.new("Frame")
local point1_3 = Instance.new("Frame")
local rating_3 = Instance.new("TextLabel")
local statustextimage_3 = Instance.new("TextLabel")
local showimage_3 = Instance.new("TextButton")
local image4 = Instance.new("Frame")
local imageframe_4 = Instance.new("Frame")
local point1_4 = Instance.new("Frame")
local rating_4 = Instance.new("TextLabel")
local statustextimage_4 = Instance.new("TextLabel")
local showimage_4 = Instance.new("TextButton")
local image5 = Instance.new("Frame")
local imageframe_5 = Instance.new("Frame")
local point1_5 = Instance.new("Frame")
local rating_5 = Instance.new("TextLabel")
local statustextimage_5 = Instance.new("TextLabel")
local showimage_5 = Instance.new("TextButton")
local searchbutton = Instance.new("TextButton")
local searchterm = Instance.new("TextBox")
local pages = Instance.new("TextBox")
local statustext = Instance.new("TextLabel")
local biggerimg = Instance.new("Frame")
local top = Instance.new("Frame")
local rating_6 = Instance.new("TextLabel")
local point = Instance.new("Frame")
local scaling = Instance.new("TextLabel")

--Properties:

E621Browser.Name = "E621 Browser"
E621Browser.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
E621Browser.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = E621Browser
main.BackgroundColor3 = Color3.fromRGB(0, 25, 47)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Position = UDim2.new(0.0282824524, 0, 0.037108928, 0)
main.Size = UDim2.new(0, 750, 0, 334)

topbar.Name = "topbar"
topbar.Parent = main
topbar.BackgroundColor3 = Color3.fromRGB(1, 46, 86)
topbar.BorderSizePixel = 0
topbar.Size = UDim2.new(1, 0, 0, 30)

toptext.Name = "toptext"
toptext.Parent = topbar
toptext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toptext.BackgroundTransparency = 1.000
toptext.Size = UDim2.new(1, 0, 1, 0)
toptext.Font = Enum.Font.Gotham
toptext.Text = " e621 browser by sjors"
toptext.TextColor3 = Color3.fromRGB(255, 255, 255)
toptext.TextSize = 14.000

logo.Name = "logo"
logo.Parent = topbar
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.BackgroundTransparency = 1.000
logo.Size = UDim2.new(0, 30, 0, 30)
logo.Image = "http://www.roblox.com/asset/?id=5172208200"

images.Name = "images"
images.Parent = main
images.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
images.BackgroundTransparency = 1.000
images.Position = UDim2.new(0.0399999991, 0, 0.600000024, 0)
images.Size = UDim2.new(0.920000017, 0, 0.0449101813, 0)

image1.Name = "image1"
image1.Parent = images
image1.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
image1.BorderSizePixel = 0
image1.Position = UDim2.new(0.075000003, 0, 0.756598234, 0)
image1.Size = UDim2.new(0.200000003, 0, 0, 15)

imageframe.Name = "imageframe"
imageframe.Parent = image1
imageframe.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
imageframe.BackgroundTransparency = 0.500
imageframe.BorderSizePixel = 0
imageframe.Position = UDim2.new(0, 0, -8.13333321, 0)
imageframe.Size = UDim2.new(0, 134, 0, 122)

point1.Name = "point1"
point1.Parent = imageframe
point1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
point1.BackgroundTransparency = 1.000
point1.Size = UDim2.new(0, 1, 0, 1)

rating.Name = "rating"
rating.Parent = image1
rating.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rating.BackgroundTransparency = 1.000
rating.Size = UDim2.new(1, 0, 1, 0)
rating.Font = Enum.Font.SourceSans
rating.Text = "↕ 0   ❤️0"
rating.TextColor3 = Color3.fromRGB(0, 0, 0)
rating.TextSize = 14.000

statustextimage.Name = "statustextimage"
statustextimage.Parent = image1
statustextimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statustextimage.BackgroundTransparency = 1.000
statustextimage.Position = UDim2.new(0, 0, 1, 0)
statustextimage.Size = UDim2.new(1, 0, 1, 0)
statustextimage.Font = Enum.Font.SourceSans
statustextimage.Text = "nothing"
statustextimage.TextColor3 = Color3.fromRGB(255, 255, 255)
statustextimage.TextSize = 14.000

showimage.Name = "showimage"
showimage.Parent = image1
showimage.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
showimage.BorderSizePixel = 0
showimage.Position = UDim2.new(0, 0, -9.5, 0)
showimage.Size = UDim2.new(1, 0, 0, 20)
showimage.Font = Enum.Font.Gotham
showimage.Text = "Show image"
showimage.TextColor3 = Color3.fromRGB(255, 255, 255)
showimage.TextSize = 12.000

UIGridLayout.Parent = images
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0.194000006, 0, 0, 15)

image2.Name = "image2"
image2.Parent = images
image2.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
image2.BorderSizePixel = 0
image2.Position = UDim2.new(0.075000003, 0, 0.756598234, 0)
image2.Size = UDim2.new(0.200000003, 0, 0, 15)

imageframe_2.Name = "imageframe"
imageframe_2.Parent = image2
imageframe_2.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
imageframe_2.BackgroundTransparency = 0.500
imageframe_2.BorderSizePixel = 0
imageframe_2.Position = UDim2.new(0, 0, -8.13333321, 0)
imageframe_2.Size = UDim2.new(0, 134, 0, 122)

point1_2.Name = "point1"
point1_2.Parent = imageframe_2
point1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
point1_2.BackgroundTransparency = 1.000
point1_2.Size = UDim2.new(0, 1, 0, 1)

rating_2.Name = "rating"
rating_2.Parent = image2
rating_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rating_2.BackgroundTransparency = 1.000
rating_2.Size = UDim2.new(1, 0, 1, 0)
rating_2.Font = Enum.Font.SourceSans
rating_2.Text = "↕ 0   ❤️0"
rating_2.TextColor3 = Color3.fromRGB(0, 0, 0)
rating_2.TextSize = 14.000

statustextimage_2.Name = "statustextimage"
statustextimage_2.Parent = image2
statustextimage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_2.BackgroundTransparency = 1.000
statustextimage_2.Position = UDim2.new(0, 0, 1, 0)
statustextimage_2.Size = UDim2.new(1, 0, 1, 0)
statustextimage_2.Font = Enum.Font.SourceSans
statustextimage_2.Text = "nothing"
statustextimage_2.TextColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_2.TextSize = 14.000

showimage_2.Name = "showimage"
showimage_2.Parent = image2
showimage_2.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
showimage_2.BorderSizePixel = 0
showimage_2.Position = UDim2.new(0, 0, -9.5, 0)
showimage_2.Size = UDim2.new(1, 0, 0, 20)
showimage_2.Font = Enum.Font.Gotham
showimage_2.Text = "Show image"
showimage_2.TextColor3 = Color3.fromRGB(255, 255, 255)
showimage_2.TextSize = 12.000

image3.Name = "image3"
image3.Parent = images
image3.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
image3.BorderSizePixel = 0
image3.Position = UDim2.new(0.075000003, 0, 0.756598234, 0)
image3.Size = UDim2.new(0.200000003, 0, 0, 15)

imageframe_3.Name = "imageframe"
imageframe_3.Parent = image3
imageframe_3.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
imageframe_3.BackgroundTransparency = 0.500
imageframe_3.BorderSizePixel = 0
imageframe_3.Position = UDim2.new(0, 0, -8.13333321, 0)
imageframe_3.Size = UDim2.new(0, 134, 0, 122)

point1_3.Name = "point1"
point1_3.Parent = imageframe_3
point1_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
point1_3.BackgroundTransparency = 1.000
point1_3.Size = UDim2.new(0, 1, 0, 1)

rating_3.Name = "rating"
rating_3.Parent = image3
rating_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rating_3.BackgroundTransparency = 1.000
rating_3.Size = UDim2.new(1, 0, 1, 0)
rating_3.Font = Enum.Font.SourceSans
rating_3.Text = "↕ 0   ❤️0"
rating_3.TextColor3 = Color3.fromRGB(0, 0, 0)
rating_3.TextSize = 14.000

statustextimage_3.Name = "statustextimage"
statustextimage_3.Parent = image3
statustextimage_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_3.BackgroundTransparency = 1.000
statustextimage_3.Position = UDim2.new(0, 0, 1, 0)
statustextimage_3.Size = UDim2.new(1, 0, 1, 0)
statustextimage_3.Font = Enum.Font.SourceSans
statustextimage_3.Text = "nothing"
statustextimage_3.TextColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_3.TextSize = 14.000

showimage_3.Name = "showimage"
showimage_3.Parent = image3
showimage_3.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
showimage_3.BorderSizePixel = 0
showimage_3.Position = UDim2.new(0, 0, -9.5, 0)
showimage_3.Size = UDim2.new(1, 0, 0, 20)
showimage_3.Font = Enum.Font.Gotham
showimage_3.Text = "Show image"
showimage_3.TextColor3 = Color3.fromRGB(255, 255, 255)
showimage_3.TextSize = 12.000

image4.Name = "image4"
image4.Parent = images
image4.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
image4.BorderSizePixel = 0
image4.Position = UDim2.new(0.075000003, 0, 0.756598234, 0)
image4.Size = UDim2.new(0.200000003, 0, 0, 15)

imageframe_4.Name = "imageframe"
imageframe_4.Parent = image4
imageframe_4.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
imageframe_4.BackgroundTransparency = 0.500
imageframe_4.BorderSizePixel = 0
imageframe_4.Position = UDim2.new(0, 0, -8.13333321, 0)
imageframe_4.Size = UDim2.new(0, 134, 0, 122)

point1_4.Name = "point1"
point1_4.Parent = imageframe_4
point1_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
point1_4.BackgroundTransparency = 1.000
point1_4.Size = UDim2.new(0, 1, 0, 1)

rating_4.Name = "rating"
rating_4.Parent = image4
rating_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rating_4.BackgroundTransparency = 1.000
rating_4.Size = UDim2.new(1, 0, 1, 0)
rating_4.Font = Enum.Font.SourceSans
rating_4.Text = "↕ 0   ❤️0"
rating_4.TextColor3 = Color3.fromRGB(0, 0, 0)
rating_4.TextSize = 14.000

statustextimage_4.Name = "statustextimage"
statustextimage_4.Parent = image4
statustextimage_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_4.BackgroundTransparency = 1.000
statustextimage_4.Position = UDim2.new(0, 0, 1, 0)
statustextimage_4.Size = UDim2.new(1, 0, 1, 0)
statustextimage_4.Font = Enum.Font.SourceSans
statustextimage_4.Text = "nothing"
statustextimage_4.TextColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_4.TextSize = 14.000

showimage_4.Name = "showimage"
showimage_4.Parent = image4
showimage_4.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
showimage_4.BorderSizePixel = 0
showimage_4.Position = UDim2.new(0, 0, -9.5, 0)
showimage_4.Size = UDim2.new(1, 0, 0, 20)
showimage_4.Font = Enum.Font.Gotham
showimage_4.Text = "Show image"
showimage_4.TextColor3 = Color3.fromRGB(255, 255, 255)
showimage_4.TextSize = 12.000

image5.Name = "image5"
image5.Parent = images
image5.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
image5.BorderSizePixel = 0
image5.Position = UDim2.new(0.075000003, 0, 0.756598234, 0)
image5.Size = UDim2.new(0.200000003, 0, 0, 15)

imageframe_5.Name = "imageframe"
imageframe_5.Parent = image5
imageframe_5.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
imageframe_5.BackgroundTransparency = 0.500
imageframe_5.BorderSizePixel = 0
imageframe_5.Position = UDim2.new(0, 0, -8.13333321, 0)
imageframe_5.Size = UDim2.new(0, 134, 0, 122)

point1_5.Name = "point1"
point1_5.Parent = imageframe_5
point1_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
point1_5.BackgroundTransparency = 1.000
point1_5.Size = UDim2.new(0, 1, 0, 1)

rating_5.Name = "rating"
rating_5.Parent = image5
rating_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rating_5.BackgroundTransparency = 1.000
rating_5.Size = UDim2.new(1, 0, 1, 0)
rating_5.Font = Enum.Font.SourceSans
rating_5.Text = "↕ 0   ❤️0"
rating_5.TextColor3 = Color3.fromRGB(0, 0, 0)
rating_5.TextSize = 14.000

statustextimage_5.Name = "statustextimage"
statustextimage_5.Parent = image5
statustextimage_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_5.BackgroundTransparency = 1.000
statustextimage_5.Position = UDim2.new(0, 0, 1, 0)
statustextimage_5.Size = UDim2.new(1, 0, 1, 0)
statustextimage_5.Font = Enum.Font.SourceSans
statustextimage_5.Text = "nothing"
statustextimage_5.TextColor3 = Color3.fromRGB(255, 255, 255)
statustextimage_5.TextSize = 14.000

showimage_5.Name = "showimage"
showimage_5.Parent = image5
showimage_5.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
showimage_5.BorderSizePixel = 0
showimage_5.Position = UDim2.new(0, 0, -9.5, 0)
showimage_5.Size = UDim2.new(1, 0, 0, 20)
showimage_5.Font = Enum.Font.Gotham
showimage_5.Text = "Show image"
showimage_5.TextColor3 = Color3.fromRGB(255, 255, 255)
showimage_5.TextSize = 12.000

searchbutton.Name = "searchbutton"
searchbutton.Parent = main
searchbutton.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
searchbutton.BorderSizePixel = 0
searchbutton.Position = UDim2.new(0.231999993, 0, 0.86500001, 0)
searchbutton.Size = UDim2.new(0, 400, 0, 30)
searchbutton.Font = Enum.Font.Gotham
searchbutton.Text = "Search"
searchbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
searchbutton.TextSize = 14.000

searchterm.Name = "searchterm"
searchterm.Parent = searchbutton
searchterm.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
searchterm.BorderSizePixel = 0
searchterm.Position = UDim2.new(0, 0, -1, -15)
searchterm.Size = UDim2.new(0.5, 0, 0, 30)
searchterm.Font = Enum.Font.Gotham
searchterm.PlaceholderText = "Search tags"
searchterm.Text = ""
searchterm.TextColor3 = Color3.fromRGB(255, 255, 255)
searchterm.TextSize = 14.000

pages.Name = "pages"
pages.Parent = searchbutton
pages.BackgroundColor3 = Color3.fromRGB(37, 71, 123)
pages.BorderSizePixel = 0
pages.Position = UDim2.new(0.5, 0, -1, -15)
pages.Size = UDim2.new(0.5, 0, 0, 30)
pages.Font = Enum.Font.Gotham
pages.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
pages.PlaceholderText = "Page number"
pages.Text = ""
pages.TextColor3 = Color3.fromRGB(255, 255, 255)
pages.TextSize = 14.000

statustext.Name = "statustext"
statustext.Parent = main
statustext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statustext.BackgroundTransparency = 1.000
statustext.Position = UDim2.new(0.366666675, 0, 0.0898203626, 0)
statustext.Size = UDim2.new(0, 200, 0, 27)
statustext.Font = Enum.Font.Arial
statustext.Text = ""
statustext.TextColor3 = Color3.fromRGB(255, 255, 255)
statustext.TextSize = 14.000

biggerimg.Name = "biggerimg"
biggerimg.Parent = E621Browser
biggerimg.BackgroundColor3 = Color3.fromRGB(0, 25, 47)
biggerimg.Position = UDim2.new(0.450520843, 0, 0.0310074147, 0)
biggerimg.Size = UDim2.new(0, 600, 0, 770)

top.Name = "top"
top.Parent = biggerimg
top.BackgroundColor3 = Color3.fromRGB(1, 46, 86)
top.Size = UDim2.new(1, 0, 0, 30)

rating_6.Name = "rating"
rating_6.Parent = top
rating_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rating_6.BackgroundTransparency = 1.000
rating_6.Size = UDim2.new(1, 0, 1, 0)
rating_6.Font = Enum.Font.Gotham
rating_6.Text = "Image"
rating_6.TextColor3 = Color3.fromRGB(255, 255, 255)
rating_6.TextSize = 14.000

point.Name = "point"
point.Parent = biggerimg
point.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
point.Position = UDim2.new(0, 10, 0, 40)
point.Size = UDim2.new(0, 1, 0, 1)

scaling.Name = "scaling"
scaling.Parent = biggerimg
scaling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scaling.BackgroundTransparency = 1.000
scaling.Position = UDim2.new(0.0166666675, 0, 0.961969078, 0)
scaling.Size = UDim2.new(0, 590, 0, 29)
scaling.Font = Enum.Font.SourceSans
scaling.Text = ""
scaling.TextColor3 = Color3.fromRGB(255, 255, 255)
scaling.TextSize = 14.000
scaling.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function TNCVE_fake_script() -- showimage.loadimage
	local script = Instance.new("LocalScript", showimage)

	local image
	local removeimage = script.Parent.Parent.Parent:WaitForChild("removeimage")
	removeimage.Event:connect(function()
		if image then
			image:Remove()
			image = nil
		end
	end)
	script.Parent.MouseButton1Click:Connect(function()
		removeimage:Fire()
		local imgvalue = script.Parent.Parent.Parent:FindFirstChild(script.Parent.Parent.Name .. "link")
		local http = game:GetService("HttpService")
		if imgvalue.Value ~= "" then
			local decoded = http:JSONDecode(imgvalue.Value)
			local xsize = 0
			local ysize = 0
			local devidedby = 1
			local page = tonumber(script.Parent.Parent.Parent.Parent.searchbutton.pages.Text)
			if not page then
				page = 1 - 1
			else
				page = page - 1
			end
			if decoded["posts"][1]["file"]["width"] / 2 > 580 then
				xsize = 580
			else
				xsize = decoded["posts"][1]["file"]["width"] / 2
			end
			local aspectRatio = (decoded["posts"][1]["file"]["height"] / decoded["posts"][1]["file"]["width"])
			local ysize = (xsize * aspectRatio)
			if ysize > 700 then
				ysize = 700
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Scaling is not accurate!"
			else
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Correct scaling."
			end
			local count = string.sub(script.Parent.Parent.Name, 6)
			local e621image = decoded["posts"][tonumber(count + (page + 1) * 5) - 5]["file"]["url"]
			local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
			image = Drawing.new("Image")
			image.Data = game:HttpGet(e621image)
			image.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
			image.Size = Vector2.new(xsize, ysize)
			image.Visible = true
			moveloop = game:GetService("RunService").RenderStepped:Connect(function()
				pcall(function()
					if image then
						local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
						image.Position = Vector2.new(point.AbsolutePosition.X, point.AbsolutePosition.Y + 36)
					else
						moveloop:Remove()
					end
				end)
			end)
		end
	end)
end
coroutine.wrap(TNCVE_fake_script)()
local function LWQZ_fake_script() -- showimage_2.loadimage
	local script = Instance.new("LocalScript", showimage_2)

	local image
	local removeimage = script.Parent.Parent.Parent:WaitForChild("removeimage")
	removeimage.Event:connect(function()
		if image then
			image:Remove()
			image = nil
		end
	end)
	script.Parent.MouseButton1Click:Connect(function()
		removeimage:Fire()
		local imgvalue = script.Parent.Parent.Parent:FindFirstChild(script.Parent.Parent.Name .. "link")
		local http = game:GetService("HttpService")
		if imgvalue.Value ~= "" then
			local decoded = http:JSONDecode(imgvalue.Value)
			local xsize = 0
			local ysize = 0
			local devidedby = 1
			local page = tonumber(script.Parent.Parent.Parent.Parent.searchbutton.pages.Text)
			if not page then
				page = 1 - 1
			else
				page = page - 1
			end
			if decoded["posts"][1]["file"]["width"] / 2 > 580 then
				xsize = 580
			else
				xsize = decoded["posts"][1]["file"]["width"] / 2
			end
			local aspectRatio = (decoded["posts"][1]["file"]["height"] / decoded["posts"][1]["file"]["width"])
			local ysize = (xsize * aspectRatio)
			if ysize > 700 then
				ysize = 700
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Scaling is not accurate!"
			else
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Correct scaling."
			end
			local count = string.sub(script.Parent.Parent.Name, 6)
			local e621image = decoded["posts"][tonumber(count + (page + 1) * 5) - 5]["file"]["url"]
			local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
			image = Drawing.new("Image")
			image.Data = game:HttpGet(e621image)
			image.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
			image.Size = Vector2.new(xsize, ysize)
			image.Visible = true
			moveloop = game:GetService("RunService").RenderStepped:Connect(function()
				pcall(function()
					if image then
						local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
						image.Position = Vector2.new(point.AbsolutePosition.X, point.AbsolutePosition.Y + 36)
					else
						moveloop:Remove()
					end
				end)
			end)
		end
	end)
end
coroutine.wrap(LWQZ_fake_script)()
local function JJCH_fake_script() -- showimage_3.loadimage
	local script = Instance.new("LocalScript", showimage_3)

	local image
	local removeimage = script.Parent.Parent.Parent:WaitForChild("removeimage")
	removeimage.Event:connect(function()
		if image then
			image:Remove()
			image = nil
		end
	end)
	script.Parent.MouseButton1Click:Connect(function()
		removeimage:Fire()
		local imgvalue = script.Parent.Parent.Parent:FindFirstChild(script.Parent.Parent.Name .. "link")
		local http = game:GetService("HttpService")
		if imgvalue.Value ~= "" then
			local decoded = http:JSONDecode(imgvalue.Value)
			local xsize = 0
			local ysize = 0
			local devidedby = 1
			local page = tonumber(script.Parent.Parent.Parent.Parent.searchbutton.pages.Text)
			if not page then
				page = 1 - 1
			else
				page = page - 1
			end
			if decoded["posts"][1]["file"]["width"] / 2 > 580 then
				xsize = 580
			else
				xsize = decoded["posts"][1]["file"]["width"] / 2
			end
			local aspectRatio = (decoded["posts"][1]["file"]["height"] / decoded["posts"][1]["file"]["width"])
			local ysize = (xsize * aspectRatio)
			if ysize > 700 then
				ysize = 700
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Scaling is not accurate!"
			else
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Correct scaling."
			end
			local count = string.sub(script.Parent.Parent.Name, 6)
			local e621image = decoded["posts"][tonumber(count + (page + 1) * 5) - 5]["file"]["url"]
			local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
			image = Drawing.new("Image")
			image.Data = game:HttpGet(e621image)
			image.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
			image.Size = Vector2.new(xsize, ysize)
			image.Visible = true
			moveloop = game:GetService("RunService").RenderStepped:Connect(function()
				pcall(function()
					if image then
						local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
						image.Position = Vector2.new(point.AbsolutePosition.X, point.AbsolutePosition.Y + 36)
					else
						moveloop:Remove()
					end
				end)
			end)
		end
	end)
end
coroutine.wrap(JJCH_fake_script)()
local function WQCMNK_fake_script() -- showimage_4.loadimage
	local script = Instance.new("LocalScript", showimage_4)

	local image
	local removeimage = script.Parent.Parent.Parent:WaitForChild("removeimage")
	removeimage.Event:connect(function()
		if image then
			image:Remove()
			image = nil
		end
	end)
	script.Parent.MouseButton1Click:Connect(function()
		removeimage:Fire()
		local imgvalue = script.Parent.Parent.Parent:FindFirstChild(script.Parent.Parent.Name .. "link")
		local http = game:GetService("HttpService")
		if imgvalue.Value ~= "" then
			local decoded = http:JSONDecode(imgvalue.Value)
			local xsize = 0
			local ysize = 0
			local devidedby = 1
			local page = tonumber(script.Parent.Parent.Parent.Parent.searchbutton.pages.Text)
			if not page then
				page = 1 - 1
			else
				page = page - 1
			end
			if decoded["posts"][1]["file"]["width"] / 2 > 580 then
				xsize = 580
			else
				xsize = decoded["posts"][1]["file"]["width"] / 2
			end
			local aspectRatio = (decoded["posts"][1]["file"]["height"] / decoded["posts"][1]["file"]["width"])
			local ysize = (xsize * aspectRatio)
			if ysize > 700 then
				ysize = 700
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Scaling is not accurate!"
			else
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Correct scaling."
			end
			local count = string.sub(script.Parent.Parent.Name, 6)
			local e621image = decoded["posts"][tonumber(count + (page + 1) * 5) - 5]["file"]["url"]
			local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
			image = Drawing.new("Image")
			image.Data = game:HttpGet(e621image)
			image.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
			image.Size = Vector2.new(xsize, ysize)
			image.Visible = true
			moveloop = game:GetService("RunService").RenderStepped:Connect(function()
				pcall(function()
					if image then
						local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
						image.Position = Vector2.new(point.AbsolutePosition.X, point.AbsolutePosition.Y + 36)
					else
						moveloop:Remove()
					end
				end)
			end)
		end
	end)
end
coroutine.wrap(WQCMNK_fake_script)()
local function TAAOFX_fake_script() -- showimage_5.loadimage
	local script = Instance.new("LocalScript", showimage_5)

	local image
	local removeimage = script.Parent.Parent.Parent:WaitForChild("removeimage")
	removeimage.Event:connect(function()
		if image then
			image:Remove()
			image = nil
		end
	end)
	script.Parent.MouseButton1Click:Connect(function()
		removeimage:Fire()
		local imgvalue = script.Parent.Parent.Parent:FindFirstChild(script.Parent.Parent.Name .. "link")
		local http = game:GetService("HttpService")
		if imgvalue.Value ~= "" then
			local decoded = http:JSONDecode(imgvalue.Value)
			local xsize = 0
			local ysize = 0
			local devidedby = 1
			local page = tonumber(script.Parent.Parent.Parent.Parent.searchbutton.pages.Text)
			if not page then
				page = 1 - 1
			else
				page = page - 1
			end
			if decoded["posts"][1]["file"]["width"] / 2 > 580 then
				xsize = 580
			else
				xsize = decoded["posts"][1]["file"]["width"] / 2
			end
			local aspectRatio = (decoded["posts"][1]["file"]["height"] / decoded["posts"][1]["file"]["width"])
			local ysize = (xsize * aspectRatio)
			if ysize > 700 then
				ysize = 700
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Scaling is not accurate!"
			else
				script.Parent.Parent.Parent.Parent.Parent.biggerimg.scaling.Text = "Correct scaling."
			end
			local count = string.sub(script.Parent.Parent.Name, 6)
			local e621image = decoded["posts"][tonumber(count + (page + 1) * 5) - 5]["file"]["url"]
			local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
			image = Drawing.new("Image")
			image.Data = game:HttpGet(e621image)
			image.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
			image.Size = Vector2.new(xsize, ysize)
			image.Visible = true
			moveloop = game:GetService("RunService").RenderStepped:Connect(function()
				pcall(function()
					if image then
						local point = script.Parent.Parent.Parent.Parent.Parent.biggerimg.point
						image.Position = Vector2.new(point.AbsolutePosition.X, point.AbsolutePosition.Y + 36)
					else
						moveloop:Remove()
					end
				end)
			end)
		end
	end)
end
coroutine.wrap(TAAOFX_fake_script)()
local function SYUJEK_fake_script() -- images.bindevent
	local script = Instance.new("LocalScript", images)

	local removeimg = Instance.new("BindableEvent", script.Parent)
	removeimg.Name = "removeimage"
end
coroutine.wrap(SYUJEK_fake_script)()
local function QLNK_fake_script() -- searchbutton.searchscript
	local script = Instance.new("LocalScript", searchbutton)

	local searching = false
	local http = game:GetService("HttpService")
	local imagetable = {}
	local donecounter = 0

	local images = script.Parent.Parent.images
	local imagelink1 = Instance.new("StringValue", images)
	imagelink1.Name = "image1link"
	local imagelink2 = Instance.new("StringValue", images)
	imagelink2.Name = "image2link"
	local imagelink3 = Instance.new("StringValue", images)
	imagelink3.Name = "image3link"
	local imagelink4 = Instance.new("StringValue", images)
	imagelink4.Name = "image4link"
	local imagelink5 = Instance.new("StringValue", images)
	imagelink5.Name = "image5link"

	script.Parent.MouseButton1Click:Connect(function()
		if not searching then
			searching = true
			for i, v in next, imagetable do
				pcall(function()
					v:Remove()
				end)
			end
			local page = tonumber(script.Parent.pages.Text)
			if not page then
				page = 1 - 1
			else
				page = page - 1
			end
			for i = 1, 5 do
				local rating = script.Parent.Parent.images["image" .. tostring(i)].rating
				local statustext = script.Parent.Parent.images["image" .. tostring(i)].statustextimage
				rating.Text = "↕ 0   ❤️0"
				statustext.Text = "nothing"
			end
			local search = script.Parent.searchterm.Text
			if search == "" then
				search = " "
			end
			script.Parent.Parent.statustext.Text = "Searching e621 for '" .. search .. "'"
			local imagecount = 0 + (page * 5)
			local decoded
			wait(0.5)
			for i = 1, 5 do
				wait(1)
				imagecount = imagecount + 1
				script.Parent.Parent.statustext.Text = "Searching e621 for '"
					.. search
					.. "'"
					.. " image: "
					.. tostring(imagecount)
				local e621image = nil
				local unabletofind = false
				local e621
				repeat
					wait()
					e621 = game:HttpGet("https://e621.net/posts.json?tags=" .. search)
					decoded = http:JSONDecode(e621)
					if decoded["posts"][imagecount] then
						e621image = decoded["posts"][imagecount]["file"]["url"]
						script.Parent.Parent.statustext.Text = "Image " .. tostring(imagecount) .. "..."
						if e621image then
							script.Parent.Parent.statustext.Text = "Found image " .. tostring(imagecount) .. "!"
						else
							unabletofind = true
						end
					else
						unabletofind = true
					end
				until e621image ~= nil or unabletofind
				spawn(function()
					if e621image then
						script.Parent.Parent.statustext.Text = "Found image " .. tostring(i) .. ", drawing..."
						script.Parent.Parent.images["image" .. tostring(i)].statustextimage.Text = "drawing " .. i
						local a = tick()
						local point = script.Parent.Parent.images["image" .. tostring(i)].imageframe.point1
						local image = Drawing.new("Image")
						image.Data = game:HttpGet(e621image)
						image.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
						image.Size = Vector2.new(133, 122)
						image.Visible = true
						donecounter = donecounter + 1
						imagetable[tostring(i)] = image
						local secondstext = math.ceil(tick() - a) == 1 and " second!" or " seconds!"
						local rating = script.Parent.Parent.images["image" .. tostring(i * page + 1)].rating
						local icon = "↕"
						if decoded["posts"][i]["score"]["total"] == 0 then
							icon = "↕"
						elseif decoded["posts"][i]["score"]["total"] > 0 then
							icon = "⬆"
						elseif decoded["posts"][i]["score"]["total"] < 0 then
							icon = "⬇️"
						end
						images["image" .. i .. "link"].Value = e621
						rating.Text = icon
							.. decoded["posts"][i]["score"]["total"]
							.. "   ❤️"
							.. decoded["posts"][i]["fav_count"]
						script.Parent.Parent.images["image" .. tostring(i)].statustextimage.Text = "done drawing "
							.. i
							.. " "
							.. search
						script.Parent.Parent.statustext.Text = "Loaded image "
							.. tostring(i)
							.. " took "
							.. tostring(math.ceil(tick() - a))
							.. secondstext
						wait(0.5)
					else
						script.Parent.Parent.statustext.Text = "Could not load image " .. tostring(i)
						local rating = script.Parent.Parent.images["image" .. tostring(i)].rating
						rating.Text = "↕ 0   ❤️0"
						donecounter = donecounter + 1
						images["image" .. i .. "link"].Value = ""
						wait(0.5)
					end
				end)
			end
			script.Parent.Parent.statustext.Text = "Finished loading 5 images."
		else
			script.Parent.Parent.statustext.Text = "Still drawing images!!! >.<"
		end
	end)

	game:GetService("RunService").RenderStepped:connect(function()
		if donecounter >= 5 then
			donecounter = 0
			searching = false
		end
		for i, v in next, imagetable do
			pcall(function()
				local point = script.Parent.Parent.images["image" .. tostring(i)].imageframe.point1
				v.Position = Vector2.new(point.AbsolutePosition.X + 1, point.AbsolutePosition.Y + 36)
			end)
		end
	end)
end
coroutine.wrap(QLNK_fake_script)()
local function TMNX_fake_script() -- main.LocalScript
	local script = Instance.new("LocalScript", main)

	local draggable = function(gui)
		local UserInputService = game:GetService("UserInputService")
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

	draggable(script.Parent)
end
coroutine.wrap(TMNX_fake_script)()
local function CDUXVL_fake_script() -- biggerimg.LocalScript
	local script = Instance.new("LocalScript", biggerimg)

	script.Parent.Parent.Parent = game.CoreGui
	local draggable = function(gui)
		local UserInputService = game:GetService("UserInputService")
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

	draggable(script.Parent)
end
coroutine.wrap(CDUXVL_fake_script)()
