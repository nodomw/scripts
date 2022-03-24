execCmd("ControlUpdate")
local Plugin = {
    ["PluginName"] = "Control",
    ["PluginDescription"] = "You can control people with tools",
    ["Commands"] = {
        ["control"] = {
            ["ListName"] = "Control [Plr] / Ct [Plr]",
            ["Description"] = "This command is for controling someone",
            ["Aliases"] = {"ct"},
            ["Function"] = function(args,speaker)
            --Made By Thomas_Cornez#4004
            Workspace = game.Workspace
            Players = game:GetService("Players")
            player = getPlayer(args[1], speaker)
  
            toolcount = 0
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v:IsA("Tool") then
            toolcount = toolcount + 1
            end
            end
            if toolcount < 2 then
                    notify("Thomas_Cornez", "You need 2 tools")
                    return
                end
            
                        for i,v in pairs(player) do
                            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players[v].Character.HumanoidRootPart.CFrame
                        end
            
                        for _,v in pairs(Players.LocalPlayer:FindFirstChildOfClass"Backpack":GetChildren()) do
             pcall(function() v.CanBeDropped = true end)
            end
                        for _, tool in ipairs(Players.LocalPlayer.Backpack:GetChildren()) do
               if tool:IsA("Tool") then
                    tool.Parent = Players.LocalPlayer.Character
               end
            end
            keypress(0x08)
            wait()
            keyrelease(0x08)
            if not keypress then
            notify("Press backspace")
            notify("And dont forgot to have a good exploiter")
        end
            toolcount = 0
 end,
},
["uncontrol"] = {
    ["ListName"] = "Uncontrol / Unct",
    ["Description"] = "A command for forcing to uncontrol the target",
    ["Aliases"] = {"unct"},
    ["Function"] = function(args,speaker)
        local Name = Players.LocalPlayer.Name
        for i,v in pairs(game.Workspace[Name]:GetChildren())do
            if v.ClassName == "Tool" then
                v.Parent = Players.LocalPlayer.Backpack
        for _,v in pairs(game.Workspace:GetChildren())do 
            if v.ClassName == "Tool" then
              v.Parent = Players.LocalPlayer.Backpack
            end
          end
        end
    end
    --Last thing I made was shit, sorry
    end,
},
["controllogs"] = {
    ["ListName"] = "ControlLogs",
    ["Description"] = "See the changelogs",
    ["Aliases"] = {},
    ["Function"] = function(args,speaker)
        changelogs()
    end,
},

        ["ControlUpdate"] = {
        ["ListName"] = "",
        ["Description"] = "Dont delete this if you find this or dont execute this",
        ["Aliases"] = {""},
        ["Function"] = function(args,speaker)
            local Ver = 4.7
                local Version = game:HttpGet("https://pastebin.com/raw/GWUHByDL",false)
                if Version ~= "control " .. Ver then
                notify('Updating', 'Updating to ' .. Version)
                wait(3)
                writefile("control.iy",game:HttpGet("https://pastebin.com/raw/4VFnQ5ah",false))
                deletePlugin("control.iy")
                deletePlugin("Control.iy")
                wait(0.5)
                addPlugin("control.iy")
                notify('Updating', 'Done ! If you want to see the changelogs, type ;ControlLogs')
   changelogs()             
end
  
    function changelogs()
        local VERSION = 4.7
        
        local Changes = {
            "[+] I remake the code of ;uncontrol / ;unct because the last thing was shit",
            "[+*] Fix/remake the GUI made by Alex The Great",
            "[*] Fix some bugs-Issue with the code"
            
        }
        
        local function Create(class, properties)
            local Object = Instance.new(class)
            for Property, Value in pairs(properties) do
                Object[Property] = Value
            end
            return Object
        end
        
        local Settings = {
            -- Text size for the labels in the changelog
            ["ChangesTextSize"] = 25,
            
            ["TitleSize"] = 40,
            
            ["PrimaryFont"] = Enum.Font.SourceSansBold,
            ["SecondaryFont"] = Enum.Font.SourceSans,
            
            -- Gui colors
            ["Colors"] = {
                ["PrimaryBackground"] = Color3.fromRGB(125, 125, 125),
                ["SecondaryBackground"] = Color3.fromRGB(150, 150, 150),
                ["TitleColor"] = Color3.fromRGB(170, 0, 255),
                ["BorderColor"] =  Color3.new(200, 200, 200),
                
                ["TextColor"] = Color3.new(255, 255, 255),
                ["ChangesTextColor"] = Color3.new(0, 0, 0),
                ["VersionColor"] = Color3.fromRGB(25, 25, 255),
                ["CreditsColor"] = Color3.fromRGB(25, 255, 25)
            }
        }
        
        local ScreenGui = Create("ScreenGui", {Name = "Changelog Gui", Parent = game:GetService("CoreGui")})
        local MainFrame = Create("Frame", {BackgroundColor3 = Settings.Colors.PrimaryBackground, BorderColor3 = Settings.Colors.BorderColor, BorderMode = Enum.BorderMode.Outline, BorderSizePixel = 1, Name = "MainFrame", Parent = ScreenGui, Position = UDim2.new(0.5, -200, 0.5, -125), Size = UDim2.new(0, 400, 0, 250)})
        local Title = Create("TextLabel", {BackgroundColor3 = Settings.Colors.TitleColor, BorderSizePixel = 0, Name = "Title", Parent = MainFrame, Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 0, 50), Font = Settings.PrimaryFont, Text = "CHANGELOG", TextColor3 = Settings.Colors.TextColor, TextSize = Settings.TitleSize})
        local CloseButton = Create("TextButton", {AutoButtonColor = false, BackgroundTransparency = 1, Name = "Close", Parent = MainFrame, Position = UDim2.new(1, -50, 0, 0), Size = UDim2.new(0, 50, 0, 50), Font = Settings.PrimaryFont, Text = "X", TextColor3 = Settings.Colors.TextColor, TextSize = Settings.TitleSize})
        local Holder = Create("ScrollingFrame", {BackgroundColor3 = Settings.Colors.SecondaryBackground, BorderSizePixel = 0, Name = "Holder", Parent = MainFrame, Position = UDim2.new(0, 20, 0, 70), Size = UDim2.new(1, -40, 1, -100), BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png", MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png", TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png", ScrollBarThickness = 10})
        local VersionLabel = Create("TextLabel", {BackgroundTransparency = 1, Name = "Version", Parent = MainFrame, Position = UDim2.new(0, 0, 1, -30), Size = UDim2.new(0.5, 0, 0, 30), Font = Settings.SecondaryFont, Text = "Control "..tostring(VERSION), TextColor3 = Settings.Colors.VersionColor, TextSize = 25})
        local CreditsLabel = Create("TextLabel", {BackgroundTransparency = 1, Name = "Credits", Parent = MainFrame, Position = UDim2.new(0.5, 0, 1, -30), Size = UDim2.new(0.5, 0, 0, 30), Font = Settings.SecondaryFont, Text = "By Thomas_Cornez", TextColor3 = Settings.Colors.CreditsColor, TextSize = 25})
        
        local Active = true
        CloseButton.MouseButton1Down:Connect(function()
            Active = false
            ScreenGui:Destroy()
        end)
        
        local ChangePosition = 10 -- Initial offset
        for _,Change in pairs(Changes) do
            -- Get the size of the text on the Y axis
            local SizeY = game:GetService("TextService"):GetTextSize(Change, Settings.ChangesTextSize, Settings.SecondaryFont, Vector2.new(Holder.AbsoluteSize.X, 500)).Y -- 500 is just a buffer
            
            local Label = Create("TextLabel", {BackgroundTransparency = 1, Name = "Change", Parent = Holder, Position = UDim2.new(0, 10, 0, ChangePosition), Size = UDim2.new(1, -25, 0, SizeY), Font = Settings.SecondaryFont, Text = "_", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = Settings.ChangesTextSize, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top})
            ChangePosition = ChangePosition + SizeY
            
            -- Change the canvas size with each addition (would to at after all have been added but becuase there is a delay, do it on each object)
            Holder.CanvasSize = UDim2.new(0, 0, 0, ChangePosition)
            
            -- Animate the text
            local Line = ""
            local Iteration = 0
            for Character in Change:gmatch(".") do
                if Active == false then
                    break
                end
                
                Line = Line..Character
                
                if Line ~= Change and Iteration % 2 == 0 then
                    Label.Text = Line.."_" -- Add _ to make it like its typeing it out
                    wait()
                else
                    Label.Text = Line
                end
                
                Iteration = Iteration + 1
            end
        end
    end
    -- Thank you to Alex The Great (Alex the Great#9740) for making the gui function :)
end   
         }
     }
}

return Plugin