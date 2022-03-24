local Wrapper = {}
Wrapper.__index = Wrapper

local typeof = typeof
local assert = assert

function Wrapper:CreatePlugin(Name, Description)
    local self = setmetatable({}, Wrapper)
    self.PluginName = Name
    self.PluginDescription = Description
    self.Commands = {}

    return self
end

function Wrapper:AddCommand(CommandName, List, Description, Alias, Func)
	assert(typeof(CommandName) == "string", "CommandName must be a string.")
	assert(typeof(List) == "string", "List must be a string.")
	assert(typeof(Description) == "string", "Description must be a string.")
	assert(typeof(Func) == "function", "Func must be a function.")
	assert(typeof(Alias) == "table", "Alias must be a table.")
	
	self.Commands[CommandName] = {
	    ListName = List,
        Description = Description,
        Aliases = Alias,
        Function = function(Args, Speaker)
            Func(Args, Speaker)
        end
	}
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Settings = {Toggles = {}, Connections = {}}
local Player = Players.LocalPlayer
local Character = Player.Character

local function Chat(Message)
	if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
		ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(Message, "All")
	else
		notify("Custom Chat", "CMD-IY cannot chat in custom chats.")
	end
end
	
local EightBallMessages = {"It is certain", "It is decidedly so", "Without a doubt", "Yes - definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"}
local Cmd = Wrapper:CreatePlugin("CMD-IY", "Ports commands from cmd-x to iy.")

Cmd:AddCommand("eightballpu", "eightballpu [question]", "Asks the 8-ball a question publicly", {"8ballpu"}, function(Args, Speaker)
	Chat(EightBallMessages[math.random(#EightBallMessages)])
end)

Cmd:AddCommand("eightballpr", "eightballpr [question]", "Asks the 8-ball a question privately", {"8ballpr"}, function(Args, Speaker)
	StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[8Ball]: " .. EightBallMessages[math.random(#EightBallMessages)],
        Color = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.SourceSansBold,
        FontSize = Enum.FontSize.Size24
    })
end)

Cmd:AddCommand("nugget", "nugget", "Makes your self a nugget", {}, function(Args, Speaker)
    for _, Object in pairs(Character:GetChildren()) do
        if Object:IsA("BasePart") and not Object.Name == "Head" and not Object.Name:find("Torso") then
            Object:Destroy()
        end
    end

    Character.Head.Mesh:Destroy()
end)

Cmd:AddCommand("cartwheel", "cartwheel", "Do cartwheels", {}, function(Args, Speaker)
    Settings.Toggles["CartWheel"] = true

    local function RestoreProperty()
        if Character:FindFirstChild("Torso") then
            Character.Torso["Right Shoulder"].MaxVelocity = 0.15
            Character.Torso["Left Shoulder"].MaxVelocity = 0.15
            Character.Torso["Right Hip"].MaxVelocity = 0.1
            Character.Torso["Left Hip"].MaxVelocity = 0.1
            Character.Torso["Right Shoulder"].DesiredAngle = 0
            Character.Torso["Left Shoulder"].DesiredAngle = 0
            Character.Torso["Right Hip"].DesiredAngle = 0
            Character.Torso["Left Hip"].DesiredAngle = 0
        else
            notify("R6 is required!")
        end
    end

    local function Down(VelocityObject)
        for _ = 1, VelocityObject.Velocity.Y / 3 do
			VelocityObject.Velocity = VelocityObject.Velocity + Vector3.new(0, -4.25, 0)
			wait()
		end
        VelocityObject:Destroy()
    end

    local Debounce = false

    local function Flip()
        if Debounce then
            return
        end
		Debounce = true
		local Gyro = Instance.new("BodyGyro")
		Gyro.P = Gyro.P * 10
		Gyro.MaxTorque = Vector3.new(99900000, 99900000, 99900000)
		Gyro.CFrame = Character.Torso.CFrame
        Gyro.Parent = Character.Torso
        
		for _ = 0, 50 do
			Gyro.CFrame = Gyro.CFrame * CFrame.fromEulerAnglesXYZ(math.pi / -29, 0, 0)
			wait()
        end
        
		Gyro.CFrame = Character.Torso.CFrame
		wait()
		Gyro:Destroy()
		Character.Humanoid.PlatformStand = false
		RestoreProperty()
        Debounce = false
    end

    while Settings.Toggles["CartWheel"] do
        Flip()
        wait()
    end
end)

Cmd:AddCommand("uncartwheel", "uncartwheel", "Stops cartwheeling", {}, function(Args, Speaker)
    Settings.Toggles["CartWheel"] = false
end)

Cmd:AddCommand("monstermash", "monstermash", "Monstermash dance move", {}, function(Args, Speaker)
    if not r15(Player) then
		local Animation = Instance.new("Animation")
		Animation.AnimationId = "rbxassetid://35654637"
		local Track = Character.Humanoid:LoadAnimation(Animation)
        Track:Play()
    else
        notify("R15 Error", "Monstermash requires r6")
    end
end)

Cmd:AddCommand("oldroblox", "oldroblox", "Makes roblox have a blocky feel", {}, function(Args, Speaker)
    for _, Object in pairs(workspace:GetDescendants()) do
        if Object:IsA("BasePart") then
            local Texture = Instance.new("Texture")
            Texture.Texture = "rbxassetid://48715260"
            Texture.Face = "Top"
            Texture.StudsPerTileU = "1"
            Texture.StudsPerTileV = "1"
            Texture.Transparency = Object.Transparency
            Texture.Parent = Object

            Object.Material = "Plastic"

            local Texture = Instance.new("Texture")
            Texture.Texture = "rbxassetid://20299774"
            Texture.Face = "Bottom"
            Texture.StudsPerTileU = "1"
            Texture.StudsPerTileV = "1"
            Texture.Transparency = Object.Transparency
            Texture.Parent = Object

            Object.Material = "Plastic"
        end
    end

    local Lighting = game:GetService("Lighting")
    Lighting.ClockTime = 12
    Lighting.GlobalShadows = false
    Lighting.Outlines = false

    for _, Object in pairs(Lighting:GetDescendants()) do
        if Object:IsA("Sky") then
            Object:Destroy()
        end
    end

    local Skybox = Instance.new("Sky")
    Skybox.SkyboxBk = "rbxassetid://161781263"
    Skybox.SkyboxDn = "rbxassetid://161781258"
    Skybox.SkyboxFt = "rbxassetid://161781261"
    Skybox.SkyboxLf = "rbxassetid://161781267"
    Skybox.SkyboxRt = "rbxassetid://161781268"
    Skybox.SkyboxUp = "rbxassetid://161781260"
    Skybox.Parent = Lighting
end)


local RetardOne = Instance.new("Animation")
RetardOne.AnimationId = "rbxassetid://259438880"
local RetardTwo = Instance.new("Animation")
RetardTwo.AnimationId = "rbxassetid://181526230"
local RetardThree = Instance.new("Animation")
RetardThree.AnimationId = "rbxassetid://33796059"

Cmd:AddCommand("retard", "retard [mode 1-3]", "Makes your character go retard mode", {}, function(Args, Speaker)
    local Mode = Args[1]
    if Mode == "1" then
        local Track = Character.Humanoid:LoadAnimation(RetardOne)
        Track:Play(0.1, 1, 1e3)
    elseif Mode == "2" then
        local Track = Character.Humanoid:LoadAnimation(RetardTwo)
        local Track2 = Character.Humanoid:LoadAnimation(RetardThree)
        Track:Play(0.1, 1, 1)
        Track2:Play(0.1, 1, 1e8)
    elseif Mode == "3" then
        local Track = Character.Humanoid:LoadAnimation(RetardTwo)
        Track:Play(0.1, 1, 1)
    else
        local Track = Character.Humanoid:LoadAnimation(RetardThree)
        Track:Play(0.1, 1, 1e8)
    end
end)

Cmd:AddCommand("cinematic", "cinematic", "Disables some part of coregui for cinematic effect", {}, function(Args, Speaker)
    game:GetService("CoreGui").TopBar.Enabled = false
	game:GetService("CoreGui").RobloxGui.Backpack.Visible = false
	game:GetService("CoreGui").RobloxGui.PlayerListMaster.Visible = false
end)

Cmd:AddCommand("uncinematic", "uncinematic", "Disables some part of coregui for cinematic effect", {"nocinematic"}, function(Args, Speaker)
    game:GetService("CoreGui").TopBar.Enabled = true
	game:GetService("CoreGui").RobloxGui.Backpack.Visible = true
	game:GetService("CoreGui").RobloxGui.PlayerListMaster.Visible = true
end)

return Cmd