if not getgenv().library then
    getgenv().library = loadstring(game:HttpGet("https://pastebin.com/raw/n8aRyinR"))()
end
getgenv().collision = {cam, workspace.Ray_Ignore, workspace.Debris}
local a = game:GetService("Players")
local b = loadstring(game:HttpGet("https://pastebin.com/raw/n6QC3DfH"))()
local c = a.LocalPlayer
local d = c:GetMouse()
local cam = workspace.CurrentCamera
local e = getrawmetatable(game)
local f = e.__namecall
local g = e.__index
local h = e.__newindex
local i = Instance.new("Animation", workspace)
local j = getsenv(c.PlayerGui.Client)
local k = game:GetService("Lighting")
i.AnimationId = "rbxassetid://0"
getgenv().tocolor = function(l)
    return Color3.fromRGB(l.R * 255, l.G * 255, l.B * 255)
end
getgenv().fromcolor = function(l)
    return {R = l.R, G = l.G, B = l.B}
end
setreadonly(e, false)
local m = {
    "Plastic",
    "Wood",
    "Slate",
    "Concrete",
    "CorrodedMetal",
    "DiamondPlate",
    "Foil",
    "Grass",
    "Ice",
    "Marble",
    "Granite",
    "Brick",
    "Pebble",
    "Sand",
    "Fabric",
    "SmoothPlastic",
    "Metal",
    "WoodPlanks",
    "Cobblestone",
    "Air",
    "Water",
    "Rock",
    "Glacier",
    "Snow",
    "Sandstone",
    "Mud",
    "Basalt",
    "Ground",
    "CrackedLava",
    "Neon",
    "Glass",
    "Asphalt",
    "LeafyGrass",
    "Salt",
    "Limestone",
    "Pavement",
    "ForceField"
}
local n = {
    "AmaticSC",
    "Arcade",
    "Arial",
    "ArialBold",
    "Bangers",
    "Bodoni",
    "Cartoon",
    "Code",
    "Creepster",
    "DenkOne",
    "Fantasy",
    "Fondamento",
    "FredokaOne",
    "Garamond",
    "Gotham",
    "GothamBlack",
    "GothamBold",
    "GothamSemibold",
    "GrenzeGotisch",
    "Highway",
    "IndieFlower",
    "JosefinSans",
    "Jura",
    "Kalam",
    "Legacy",
    "LuckiestGuy",
    "Merriweather",
    "Michroma",
    "Nunito",
    "Oswald",
    "PatrickHand",
    "PermanentMarker",
    "Roboto",
    "RobotoCondensed",
    "RobotoMono",
    "Sarpanch",
    "SciFi",
    "SourceSans",
    "SourceSansBold",
    "SourceSansItalic",
    "SourceSansLight",
    "SourceSansSemibold",
    "SpecialElite",
    "TitilliumWeb",
    "Ubuntu"
}
local o = {version = "0.0.1"}
setmetatable(o, {})
local p = function()
end
local q = function()
    game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer()
end
local r = j.speedupdate
local s = {
    ["Anime Sky"] = {
        SkyboxLf = "http://www.roblox.com/asset/?id=6598069162",
        SkyboxBk = "http://www.roblox.com/asset/?id=6598038571",
        SkyboxDn = "http://www.roblox.com/asset/?id=6598060864",
        SkyboxFt = "http://www.roblox.com/asset/?id=6598069162",
        SkyboxLf = "http://www.roblox.com/asset/?id=6598069162",
        SkyboxRt = "http://www.roblox.com/asset/?id=6598083861",
        SkyboxUp = "http://www.roblox.com/asset/?id=6598088065"
    },
    ["Pink Vision"] = {
        SkyboxLf = "http://www.roblox.com/asset/?id=6593932587",
        SkyboxBk = "http://www.roblox.com/asset/?id=6593929026",
        SkyboxDn = "http://www.roblox.com/asset/?id=6593930140",
        SkyboxFt = "http://www.roblox.com/asset/?id=6593931249",
        SkyboxLf = "http://www.roblox.com/asset/?id=6593932587",
        SkyboxRt = "http://www.roblox.com/asset/?id=6593933789",
        SkyboxUp = "http://www.roblox.com/asset/?id=6593935319"
    },
    ["Space"] = {
        SkyboxLf = "http://www.roblox.com/asset/?id=149397684",
        SkyboxBk = "http://www.roblox.com/asset/?id=149397692",
		SkyboxDn = "http://www.roblox.com/asset/?id=149397686",
		SkyboxFt = "http://www.roblox.com/asset/?id=149397697",
		SkyboxLf = "http://www.roblox.com/asset/?id=149397684",
		SkyboxRt = "http://www.roblox.com/asset/?id=149397688",
		SkyboxUp = "http://www.roblox.com/asset/?id=149397702",
    },
    ["Cloudy Sky"] = {
        SkyboxLf = "http://www.roblox.com/asset/?id=252760980",
        SkyboxBk = "http://www.roblox.com/asset/?id=252760981",
		SkyboxDn = "http://www.roblox.com/asset/?id=252763035",
		SkyboxFt = "http://www.roblox.com/asset/?id=52761439",
		SkyboxLf = "http://www.roblox.com/asset/?id=252760980",
		SkyboxRt = "http://www.roblox.com/asset/?id=252760986",
		SkyboxUp = "http://www.roblox.com/asset/?id=252762652",
    }
}
function checkSky()
    if o["Visuals"]["Self"]["Override_Skybox"] then
        local t = k:FindFirstChildOfClass("Sky")
        if t then
            t.SkyboxLf = s[o["Visuals"]["Self"]["Skybox"]].SkyboxLf
            t.SkyboxBk = s[o["Visuals"]["Self"]["Skybox"]].SkyboxBk
            t.SkyboxDn = s[o["Visuals"]["Self"]["Skybox"]].SkyboxDn
            t.SkyboxFt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxFt
            t.SkyboxRt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxRt
            t.SkyboxUp = s[o["Visuals"]["Self"]["Skybox"]].SkyboxUp
        else
            t = Instance.new("Sky")
            t.SkyboxLf = s[o["Visuals"]["Self"]["Skybox"]].SkyboxLf
            t.SkyboxBk = s[o["Visuals"]["Self"]["Skybox"]].SkyboxBk
            t.SkyboxDn = s[o["Visuals"]["Self"]["Skybox"]].SkyboxDn
            t.SkyboxFt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxFt
            t.SkyboxRt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxRt
            t.SkyboxUp = s[o["Visuals"]["Self"]["Skybox"]].SkyboxUp
            t.Parent = k
        end
    end
end
function filterdebris()
    for u, v in pairs(workspace.Debris:GetChildren()) do
        spawn(
            function()
                if o["Visuals"]["Others"]["Dropped_Weapons"] and v:IsA("Part") then
                    for u, w in pairs(v:GetChildren()) do
                        if w:IsA("MeshPart") then
                            w.TextureID = ""
                            w.Material =
                                o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "Custom" and
                                Enum.Material.SmoothPlastic or
                                o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "Flat" and Enum.Material.Neon or
                                o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "ForceField" and
                                    Enum.Material.ForceField
                            w.Color = tocolor(o["Visuals"]["Others"]["Dropped_Weapons_Color"])
                            w.Transparency = o["Visuals"]["Others"]["Dropped_Weapons_Transparency"] / 100
                        end
                    end
                end
                if o["Visuals"]["Others"]["Disable_Bullet_Holes"] and v.Name == "Bullet" then
                    v:Destroy()
                end
            end
        )
    end
end
local x = {}
local y = {}
local z
local A = {
    name = "Kermit's Sex Dungeon",
    darkmode = true,
    togglekey = Enum.KeyCode.Insert,
    [1] = {
        name = "Rage",
        [1] = {
            name = "Main",
            [1] = {"Checkbox", "Enable Ragebot", p, {}, "Enabled"},
            [2] = {"Dropdown", "Origin", p, {options = {"Camera", "Head", "Real Head"}}, "Origin"},
            [3] = {"Checkbox", "Silent Aim", p, {}, "Silent Aim"},
            [4] = {"Checkbox", "Autoshoot", p, {}, "Autoshoot"},
            [5] = {"Slider", "Min Damage", p, {min = 1, max = 100, precise = true, default = 25}, "Min_Damage"},
            [6] = {"Checkbox", "Autowall", p, {}, "Autowall"},
            [7] = {
                "Slider",
                "Min Damage Behind Wall",
                p,
                {min = 1, max = 100, precise = true, default = 25},
                "Min_Damage_Wall"
            }
        },
        [2] = {
            name = "Hitboxes",
            [1] = {"Checkbox", "Head", p, {}, "Head"},
            [2] = {"Checkbox", "Torso", p, {}, "Torso"},
            [3] = {"Checkbox", "Pelvis", p, {}, "Pelvis"}
        },
        [3] = {
            name = "Baim",
            [1] = {"Checkbox", "On Head Break", p, {}, "On_Head_Break"},
            [2] = {"Checkbox", "On HP", p, {}, "On_HP"},
            [3] = {"Slider", "HP Amount", p, {min = 1, max = 100, precise = true, default = 25}, "HP_Amount"},
            [4] = {"Keybind", "On Key", p, {}, "Key"}
        },
        [4] = {
            name = "Exploits",
            [1] = {"Checkbox", "Remove Recoil", p, {}, "Remove_Recoil"},
            [2] = {"Checkbox", "Always Hit", p, {}, "Always_Hit"},
            [3] = {"Dropdown", "Force Pitch", p, {options = {"Off", "Up", "Down", "Zero"}}, "Force_Pitch"},
            [4] = {"Checkbox", "Boost Damage", p, {}, "Boost_Damage"},
            [5] = {"Slider", "Multiplier", p, {min = 1, max = 1, precise = true, default = 1}, "Multiplier"},
            [6] = {"Checkbox", "Double Tap", p, {}, "Double_Tap"},
            [7] = {"Keybind", "DT Key", p, {}, "DT_Key"}
        },
        [5] = {
            name = "Other",
            [1] = {"Slider", "Max Penetrations", p, {min = 1, max = 4, precise = true, default = 4}, "Max_Penetrations"},
            [2] = {"Checkbox", "Keybind Indicators", p, {}, "Indicators"},
            [3] = {"Checkbox", "Safepoint (BETA)", p, {}, "Safepoint"},
            [4] = {"Keybind", "Min DMG Override", p, {}, "DMG_Override"},
            [5] = {
                "Slider",
                "Override Amount",
                p,
                {min = 1, max = 100, precise = true, default = 25},
                "Override_Amount"
            }
        }
    },
    [2] = {
        name = "Anti-Aim",
        [1] = {
            name = "Angles",
            [1] = {"Checkbox", "Enable Anti-Aim", q, {}, "Enabled"},
            [2] = {"Dropdown", "Pitch", q, {options = {"Off", "Down", "Zero", "Up", "Random"}}, "Pitch"},
            [3] = {"Dropdown", "Yaw", p, {options = {"Off", "Left", "Right", "Back", "Custom", "Random"}}, "Yaw"},
            [4] = {"Slider", "Custom Yaw", p, {min = 0, max = 360, precise = true, default = 180}, "Custom_Yaw"},
            [5] = {"Checkbox", "Pitch Extend", q, {}, "Pitch_Extend"},
            [6] = {"Checkbox", "At Targets", p, {}, "At Targets"}
        },
        [2] = {
            name = "Extra",
            [1] = {"Checkbox", "Disable On E", q, {}, "Disable_On_E"},
            [2] = {"Checkbox", "Slide Walk", p, {}, "Slide_Walk"},
            [3] = {"Checkbox", "No Animations", p, {}, "No_Animations"},
            [4] = {"Checkbox", "No Head", p, {}, "No_Head"}
        },
        [3] = {
            name = "Yaw",
            [1] = {"Checkbox", "Enable Jitter", p, {}, "Jitter"},
            [2] = {"Slider", "Jitter Range", p, {min = 0, max = 360, precise = true, default = 90}, "Jitter_Range"},
            [3] = {"Checkbox", "Randomize Jitter", p, {}, "Randomize_Jitter"},
            [4] = {
                "Slider",
                "Randomize Jitter Min",
                p,
                {min = 0, max = 360, precise = true, default = 0},
                "Randomize_Jitter_Min"
            },
            [5] = {"Checkbox", "Enable Spin", p, {}, "Spin"},
            [6] = {"Slider", "Spin Range", p, {min = 1, max = 360, precise = true, default = 360}, "Spin_Range"},
            [7] = {"Slider", "Spin Increment", p, {min = 1, max = 270, precise = true, default = 1}, "Spin_Increment"}
        },
        [4] = {
            name = "Exploits",
            [1] = {"Checkbox", "Slow Walk", p, {}, "Slow_Walk"},
            [2] = {"Slider", "Slow Walk Speed", p, {min = 1, max = 12, precise = true, default = 10}, "Slow_Walk_Speed"},
            [3] = {"Keybind", "Slow Walk Bind", p, {}, "Slow_Walk_Bind"},
            [4] = {"Checkbox", "Fake Duck", p, {}, "Fake_Duck"},
            [5] = {"Keybind", "Fake Duck Bind", p, {}, "Fake_Duck_Bind"}
        },
        [5] = {
            name = "Manual Binds",
            [1] = {"Keybind", "Manual Left", p, {}, "Left"},
            [2] = {"Keybind", "Manual Right", p, {}, "Right"}
        }
    },
    [3] = {
        name = "Visuals",
        [1] = {
            name = "Enemies",
            [1] = {"Checkbox", "Box", p, {}, "Box"},
            [2] = {"Slider", "Box X", p, {min = 40, max = 50, precise = true, default = 45}, "Box_X"},
            [3] = {"Colorpicker", "Box Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Box_Color"},
            [4] = {"Checkbox", "Name", p, {}, "Name"},
            [5] = {"Dropdown", "Name Font", p, {options = n, default = "GothamBold"}, "Name_Font"},
            [6] = {"Colorpicker", "Name Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Name_Color"},
            [7] = {"Slider", "Name Font Size", p, {min = 10, max = 25, precise = true, default = 15}, "Name_Font_Size"},
            [8] = {"Slider", "Name Y Offset", p, {min = 3.8, max = 4.5, precise = false, default = 3.8}, "Name_Offset"},
            [9] = {"Checkbox", "Health", p, {}, "Health"},
            [10] = {
                "Slider",
                "Health Thickness",
                p,
                {min = 1, max = 5, precise = true, default = 1},
                "Health_Thickness"
            },
            [11] = {"Colorpicker", "Health Color", p, {color = Color3.fromRGB(0, 255, 0)}, "Health_Color"},
            [12] = {
                "Slider",
                "Health X Offset",
                p,
                {min = 2.8, max = 4, precise = false, default = 2.8},
                "Health_Offset"
            }
        },
        [2] = {
            name = "Self",
            [1] = {"Checkbox", "Third Person", p, {}, "Third_Person"},
            [2] = {"Keybind", "Third Person Key", p, {}, "Third_Person_Key"},
            [3] = {
                "Slider",
                "Third Person Distance",
                p,
                {min = 7, max = 20, precise = true, default = 13},
                "Third_Person_Distance"
            },
            [4] = {"Checkbox", "Override FOV", p, {}, "Override_FOV"},
            [5] = {"Slider", "FOV Amount", p, {min = 30, max = 120, precise = true, default = 90}, "FOV_Amount"},
            [6] = {"Checkbox", "Override Skybox", checkSky, {}, "Override_Skybox"},
            [7] = {
                "Dropdown",
                "Skybox",
                checkSky,
                {options = {"Anime Sky", "Pink Vision", "Space", "Cloudy Sky"}},
                "Skybox"
            },
            [8] = {"Slider", "Scope Blend", p, {min = 0, max = 99, precise = true, default = 0}, "Scope_Blend"}
        },
        [3] = {
            name = "Viewmodel",
            [1] = {"Slider", "X Offset", p, {min = -400, max = 400, precise = true, default = 0}, "X_Offset"},
            [2] = {"Slider", "Y Offset", p, {min = -400, max = 400, precise = true, default = 0}, "Y_Offset"},
            [3] = {"Slider", "Z Offset", p, {min = -400, max = 400, precise = true, default = 0}, "Z_Offset"}
        },
        [4] = {
            name = "Bullet Tracers",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Dropdown", "Material", p, {options = {"Custom", "Flat", "ForceField"}}, "Material"},
            [3] = {"Slider", "Life Time", p, {min = 0, max = 5, precise = true, default = 5}, "Life_Time"},
            [4] = {"Colorpicker", "Tracer Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Tracer_Color"},
            [5] = {"Slider", "Thickness", p, {min = 1, max = 3, precise = true, default = 1}, "Thickness"}
        },
        [5] = {
            name = "Chams",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Slider", "Transparency", p, {min = 0, max = 100, precise = true, default = 0}, "Transparency"},
            [3] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Color"},
            [4] = {"Checkbox", "Through Walls", p, {enabled = true}, "Through_Walls"}
        },
        [6] = {
            name = "World",
            [1] = {"Checkbox", "No Scope", p, {}, "No_Scope"},
            [2] = {"Checkbox", "World Color", p, {}, "World_Color"},
            [3] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "World_Color_Color"},
            [4] = {"Checkbox", "No Flash", p, {}, "No_Flash"},
            [5] = {"Checkbox", "Time of Day", p, {}, "Time_Of_Day"},
            [6] = {"Slider", "Time", p, {min = 0, max = 24, precise = true, default = 12}, "Time"},
            [7] = {"Checkbox", "Night Mode", p, {}, "Night_Mode"},
            [8] = {
                "Slider",
                "Night Mode Strength",
                p,
                {min = 0, max = 255, precise = true, default = 0},
                "Night_Mode_Strength"
            },
            [9] = {"Checkbox", "Hitsound", p, {}, "Hitsound"},
            [10] = {
                "Dropdown",
                "Sound",
                p,
                {options = {"Skeet", "Minecraft", "Terraria", "HitMarker", "Custom"}},
                "Hitsound_Sound"
            },
            [11] = {"Textbox", "Custom ID", p, {placeholder = "HITSOUND ID"}, "Custom_ID"},
            [12] = {"Checkbox", "Fire Radius", p, {}, "Fire_Radius"},
            [13] = {"Colorpicker", "Radius Color", p, {color = Color3.fromRGB(255, 0, 0)}, "Fire_Radius_Color"},
            [14] = {"Checkbox", "Smoke Radius", p, {}, "Smoke_Radius"},
            [15] = {"Colorpicker", "Radius Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Smoke_Radius_Color"},
            [16] = {
                "Slider",
                "Reduce Smoke Particles",
                p,
                {min = 0, max = 100, precise = true, default = 0, suffix = "%"},
                "Reduce_Smoke"
            },
            [17] = {"Checkbox", "No Shadows", function(B)
                    k.GlobalShadows = not B
                end, {}, "No_Shadows"}
        },
        [7] = {
            name = "Hand Chams",
            [1] = {"Checkbox", "Enable Hand Chams", p, {}, "Enabled"},
            [2] = {"Checkbox", "Override Gun", p, {}, "Gun"},
            [3] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Gun_Color"},
            [4] = {"Dropdown", "Material", p, {options = {"Custom", "Flat", "ForceField"}}, "Gun_Material"},
            [5] = {"Slider", "Transparency", p, {min = 0, max = 99, precise = true, default = 0}, "Gun_Transparency"},
            [6] = {"Slider", "Reflectance", p, {min = 0, max = 5, precise = true, default = 0}, "Gun_Reflectance"},
            [7] = {"Checkbox", "Override Accessories", p, {}, "Hands"},
            [8] = {"Checkbox", "Remove Gloves", p, {}, "Remove_Gloves"},
            [9] = {"Checkbox", "Remove Sleeves", p, {}, "Remove_Sleeves"},
            [10] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Hand_Color"},
            [11] = {"Checkbox", "Override Skin", p, {}, "Skin"},
            [12] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Skin_Color"},
            [13] = {"Slider", "Transparency", p, {min = 0, max = 100, precise = true, default = 0}, "Skin_Transparency"}
        },
        [8] = {
            name = "Others",
            [1] = {"Checkbox", "Dropped Weapon Chams", filterdebris, {}, "Dropped_Weapons"},
            [2] = {
                "Dropdown",
                "Material",
                filterdebris,
                {options = {"Custom", "Flat", "ForceField"}},
                "Dropped_Weapons_Material"
            },
            [3] = {
                "Colorpicker",
                "Color",
                filterdebris,
                {color = Color3.fromRGB(255, 255, 255)},
                "Dropped_Weapons_Color"
            },
            [4] = {
                "Slider",
                "Transparency",
                filterdebris,
                {min = 0, max = 100, precise = true, default = 0},
                "Dropped_Weapons_Transparency"
            },
            [5] = {"Checkbox", "Disable Blood", filterdebris, {}, "Disable_Blood"},
            [6] = {"Checkbox", "Disable Bullet Holes", filterdebris, {}, "Disable_Bullet_Holes"}
        },
        [9] = {
            name = "Bullet Impacts",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Dropdown", "Material", p, {options = {"Custom", "Flat", "ForceField"}}, "Material"},
            [3] = {"Slider", "Life Time", p, {min = 0, max = 5, precise = true, default = 5}, "Life_Time"},
            [4] = {"Colorpicker", "Impact Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Impact_Color"},
            [5] = {"Slider", "Thickness", p, {min = 1, max = 3, precise = true, default = 1}, "Thickness"}
        },
        [10] = {
            name = "Particles",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Dropdown", "Type", p, {options = {"Rain", "Snow"}}, "Type"},
            [3] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Color"}
        },
        [11] = {
            name = "Better Crosshair",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Checkbox", "Override Length", p, {}, "Override_Length"},
            [3] = {"Slider", "Length", p, {min = 1, max = 15, precise = true, default = 10}, "Length"},
            [4] = {"Checkbox", "Border", p, {}, "Border"},
            [5] = {"Slider", "Thickness", p, {min = 1, max = 3, precise = true, default = 1}, "Border_Thickness"},
            [6] = {"Colorpicker", "Border Color", p, {color = Color3.fromRGB(0, 0, 0)}, "Border_Color"}
        },
        [12] = {
            name = "Hit Chams",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Dropdown", "Type", p, {options = {"Hitbox", "Full Body"}}, "Type"},
            [3] = {"Colorpicker", "Color", p, {color = Color3.fromRGB(255, 255, 255)}, "Color"},
            [4] = {"Slider", "Transparency", p, {min = 0, max = 100, precise = true, default = 0}, "Transparency"},
            [5] = {"Slider", "Life Time", p, {min = 1, max = 10, precise = true, default = 5}, "Life Time"}
        },
        [13] = {name = "Your mom is gay"}
    },
    [4] = {
        name = "Misc",
        [1] = {
            name = "Bunny Hop",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
            [2] = {"Slider", "Speed", p, {min = 30, max = 200, precise = true, default = 40}, "Speed"}
        },
        [2] = {
            name = "Anti-Damage",
            [1] = {"Checkbox", "Anti-Fire Damage", p, {}, "Anti_Fire"},
            [2] = {"Checkbox", "Anti-Fall Damage", p, {}, "Anti_Fall"}
        },
        [3] = {
            name = "Themes",
            [1] = {"Checkbox", "Enabled", p, {}, "Enabled"},
        }
    },
    [5] = {
        name = "Configs",
        [1] = {
            name = "Configs",
            [1] = {"Textbox", "Config Name", p, {placeholder = "CONFIG NAME"}, "Configs_Name"},
            [2] = {"Button", "Save Config", function()
                    game:GetService("Kermit's Sex Dungeon").ConfigEvent:Fire(
                        "SaveConfig",
                        o["Configs"]["Configs"]["Configs_Name"]
                    )
                end, {text = "Save"}, "Save_Config"},
            [3] = {"Button", "Load Config", function()
                    game:GetService("Kermit's Sex Dungeon").ConfigEvent:Fire(
                        "LoadConfig",
                        o["Configs"]["Configs"]["Configs_Name"]
                    )
                end, {text = "Load"}, "Load_Config"}
        }
    }
}
local C
local D = false
if A then
    local E = library.new(A.darkmode, A.name)
    E.ChangeToggleKey(A.togglekey)
    if not game:FindFirstChild(A.name) then
        local F, G, H = Instance.new("Model"), Instance.new("BindableEvent"), Instance.new("BindableEvent")
        F.Name, G.Name, H.Name = A.name, "ConfigEvent", "ApiEvent"
        local I = Instance.new("BindableEvent")
        I.Name = "LuaEvent"
        I.Parent = F
        F.Parent, G.Parent, H.Parent = game, F, F
    end
    game[A.name].ConfigEvent.Event:Connect(
        function(...)
            local J = {...}
            if J[2] and D then
                if J[1] == "SaveConfig" then
                    writefile(J[2] .. ".txt", game:GetService("HttpService"):JSONEncode(o))
                end
            end
        end
    )
    for K = 1, #A do
        local L = E:Category(A[K].name)
        o[A[K].name] = {}
        for M = 1, #A[K] do
            local N = L:Sector(A[K][M].name)
            o[A[K].name][A[K][M].name] = {}
            if A[K][M].isLua then
                z = N
            end
            for v = 1, #A[K][M] do
                local y = A[K][M][v]
                local O =
                    N:Cheat(
                    y[1],
                    y[2],
                    function(P)
                        o[A[K].name][A[K][M].name][y[5]] = y[1] == "Colorpicker" and fromcolor(P) or P
                        y[3](P)
                    end,
                    y[4]
                )
                o[A[K].name][A[K][M].name][y[5]] = y[1] == "Colorpicker" and fromcolor(O.value) or O.value
                game[A.name].ConfigEvent.Event:Connect(
                    function(...)
                        local J = {...}
                        if D and J[1] == "LoadConfig" then
                            if J[2] and isfile(J[2] .. ".txt") then
                                local Q = game:GetService("HttpService"):JSONDecode(readfile(J[2] .. ".txt"))
                                if Q[A[K].name][A[K][M].name] ~= nil and Q[A[K].name][A[K][M].name][y[5]] ~= nil then
                                    if y[1] ~= "Button" and y[1] ~= "Colorpicker" then
                                        O:SetValue(Q[A[K].name][A[K][M].name][y[5]])
                                    end
                                    if y[1] == "Colorpicker" then
                                        O:SetValue(tocolor(Q[A[K].name][A[K][M].name][y[5]]))
                                    end
                                end
                            end
                        end
                    end
                )
            end
            D = true
        end
    end
end
repeat
    wait()
until D
y.api = function()
    local H = game[A.name].ApiEvent
    H.Event:Connect(
        function(...)
        end
    )
    local I = game[A.name].LuaEvent
    I.Event:Connect(
        function(...)
            local J = {...}
            if isfile(J[2]) and readfile(J[2]).lua.onLoad ~= nil and readfile(J[2]).lua.onUnload ~= nil then
                local R = readfile(J[2])
                if J[1] == "Load" then
                    R.onLoad()
                else
                    R.onUnload()
                end
            end
        end
    )
end
y.initiate = function()
    local S
    local T = false
    y.api()
    game:GetService("ReplicatedStorage").Viewmodels["v_M4A4"].AnimSaves:Destroy()
    local U = {
        side = "none",
        filter = false,
        thirdperson = false,
        edown = false,
        jitter = false,
        spin = 0,
        hopping = false,
        hit = tick(),
        dt = false,
        candt = false,
        forcebaim = false,
        direc = "back"
    }
    local V = {
        Skeet = "rbxassetid://5447626464",
        Minecraft = "rbxassetid://4018616850",
        Terraria = "rbxassetid://1347140027",
        HitMarker = "rbxassetid://287062939",
        Custom = ""
    }
    e.__namecall =
        newcclosure(
        function(self, ...)
            local W = tostring(getnamecallmethod())
            local J = {...}
            if W == "GetService" then
                if J[1] == A.name then
                    return game[A.name]
                end
            end
            if W == "SetPrimaryPartCFrame" then
                J[1] =
                    J[1] *
                    CFrame.new(
                        o["Visuals"]["Viewmodel"]["X_Offset"] / 200,
                        -o["Visuals"]["Viewmodel"]["Y_Offset"] / 200,
                        -o["Visuals"]["Viewmodel"]["Z_Offset"] / 100
                    )
            end
            if W == "FireServer" and self.Name == "HitPart" then
                if o["Rage"]["Exploits"]["Boost_Damage"] then
                    J[8] = J[8] * o["Rage"]["Exploits"]["Multiplier"]
                end
                if o["Rage"]["Exploits"]["Always_Hit"] and S ~= nil then
                    J[1] = S
                    J[2] = S.Position
                end
                spawn(
                    function()
                        if o["Visuals"]["World"]["Hitsound"] then
                            if J[1].Parent ~= nil and J[1].Parent.Parent == workspace then
                                if V[o["Visuals"]["World"]["Hitsound_Sound"]] == "Custom" then
                                    V["Custom"] = tostring(o["Visuals"]["World"]["Custom_ID"])
                                end
                                local X = Instance.new("Sound", workspace)
                                X.SoundId = V[o["Visuals"]["World"]["Hitsound_Sound"]]
                                X.PlayOnRemove = true
                                X.Volume = 3
                                X:Destroy()
                            end
                        end
                    end
                )
                spawn(
                    function()
                        if
                            o["Visuals"]["Hit Chams"]["Enabled"] and J[1].Parent ~= nil and
                                J[1].Parent.Parent == workspace
                         then
                            if o["Visuals"]["Hit Chams"]["Type"] == "Hitbox" then
                                local w = Instance.new("Part")
                                w.CFrame = J[1].CFrame
                                w.Anchored = true
                                w.CanCollide = false
                                w.Material = Enum.Material.ForceField
                                w.Color = tocolor(o["Visuals"]["Hit Chams"]["Color"])
                                w.Size = J[1].Size
                                w.Transparency = o["Visuals"]["Hit Chams"]["Transparency"] / 100
                                w.Parent = workspace.Debris
                                wait(o["Visuals"]["Hit Chams"]["Life Time"])
                                w:Destroy()
                            else
                                for u, Y in pairs(J[1].Parent:GetChildren()) do
                                    if Y:IsA("MeshPart") or Y.Name == "Head" then
                                        spawn(
                                            function()
                                                local w = Instance.new("Part")
                                                w.CFrame = Y.CFrame
                                                w.Anchored = true
                                                w.CanCollide = false
                                                w.Material = Enum.Material.ForceField
                                                w.Color = tocolor(o["Visuals"]["Hit Chams"]["Color"])
                                                w.Transparency = o["Visuals"]["Hit Chams"]["Transparency"] / 100
                                                w.Size = Y.Size
                                                w.Parent = workspace.Debris
                                                wait(o["Visuals"]["Hit Chams"]["Life Time"])
                                                w:Destroy()
                                            end
                                        )
                                    end
                                end
                            end
                        end
                    end
                )
            end
            if W == "FireServer" and self.Name == "HitPart" and tick() - U.hit > 0.005 then
                U.hit = tick()
                spawn(
                    function()
                        if o["Visuals"]["Bullet Tracers"]["Enabled"] then
                            local Z = Instance.new("Part")
                            Z.Anchored = true
                            Z.CanCollide = false
                            Z.Material =
                                o["Visuals"]["Bullet Tracers"]["Material"] == "Custom" and Enum.Material.SmoothPlastic or
                                o["Visuals"]["Bullet Tracers"]["Material"] == "Flat" and Enum.Material.Neon or
                                o["Visuals"]["Bullet Tracers"]["Material"] == "ForceField" and Enum.Material.ForceField
                            Z.Color = tocolor(o["Visuals"]["Bullet Tracers"]["Tracer_Color"])
                            Z.Size =
                                Vector3.new(
                                o["Visuals"]["Bullet Tracers"]["Thickness"] / 10,
                                o["Visuals"]["Bullet Tracers"]["Thickness"] / 10,
                                (cam.CFrame.p - J[2]).magnitude
                            )
                            Z.CFrame = CFrame.new(cam.CFrame.p, J[2]) * CFrame.new(0, 0, -Z.Size.Z / 2)
                            Z.Parent = workspace.Debris
                            wait(o["Visuals"]["Bullet Tracers"]["Life_Time"])
                            Z:Destroy()
                        end
                    end
                )
                spawn(
                    function()
                        if o["Visuals"]["Bullet Impacts"]["Enabled"] then
                            local w = Instance.new("Part")
                            w.Anchored = true
                            w.CanCollide = false
                            w.Material =
                                o["Visuals"]["Bullet Impacts"]["Material"] == "Custom" and Enum.Material.SmoothPlastic or
                                o["Visuals"]["Bullet Impacts"]["Material"] == "Flat" and Enum.Material.Neon or
                                o["Visuals"]["Bullet Impacts"]["Material"] == "ForceField" and Enum.Material.ForceField
                            w.Size =
                                Vector3.new(
                                o["Visuals"]["Bullet Impacts"]["Thickness"] / 10,
                                o["Visuals"]["Bullet Impacts"]["Thickness"] / 10,
                                o["Visuals"]["Bullet Impacts"]["Thickness"] / 10
                            )
                            w.Position = J[2]
                            w.Color = tocolor(o["Visuals"]["Bullet Impacts"]["Impact_Color"])
                            w.Parent = workspace.Debris
                            wait(o["Visuals"]["Bullet Impacts"]["Life_Time"])
                            w:Destroy()
                        end
                    end
                )
            end
            if W == "FindPartOnRayWithIgnoreList" and S ~= nil and J[2][7] ~= nil and j.gun ~= nil and j.gun ~= "none" then
                if not checkcaller() or T then
                    local _ =
                        o["Rage"]["Main"]["Origin"] == "Camera" and cam.CFrame.p or
                        o["Rage"]["Main"]["Origin"] == "Head" and c.Character.Head.Position or
                        o["Rage"]["Main"]["Origin"] == "Real Head" and
                            c.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1.4, 0)
                    J[1] = Ray.new(_, (S.CFrame.p - _).unit * math.clamp(j.gun.Range.Value, 5, 400))
                end
            end
            if self.Name == "BURNME" then
                if o["Misc"]["Anti-Damage"]["Anti_Fire"] then
                    return
                end
            end
            if self.Name == "FallDamage" then
                if o["Misc"]["Anti-Damage"]["Anti_Fall"] then
                    return
                end
            end
            if W == "FireServer" and self.Name == "ControlTurn" then
                if o["Anti-Aim"]["Angles"]["Enabled"] then
                    if o["Anti-Aim"]["Angles"]["Pitch"] ~= nil then
                        if
                            o["Anti-Aim"]["Extra"]["Disable_On_E"] and not U.edown or
                                not o["Anti-Aim"]["Extra"]["Disable_On_E"]
                         then
                            if o["Anti-Aim"]["Angles"]["Pitch"] == "Down" then
                                J[1] = -1
                                if o["Anti-Aim"]["Angles"]["Pitch_Extend"] then
                                    J[1] = -2.3
                                end
                            end
                            if o["Anti-Aim"]["Angles"]["Pitch"] == "Up" then
                                J[1] = 1
                                if o["Anti-Aim"]["Angles"]["Pitch_Extend"] then
                                    J[1] = 2.3
                                end
                            end
                            if o["Anti-Aim"]["Angles"]["Pitch"] == "Zero" then
                                J[1] = 0
                            end
                            if o["Anti-Aim"]["Angles"]["Pitch"] == "Random" then
                                J[1] = math.random(-1, 1)
                                if o["Anti-Aim"]["Angles"]["Pitch_Extend"] then
                                    J[1] = math.random(-2.3, 2.3)
                                end
                            end
                        else
                            J[1] = math.clamp(math.asin(cam.CFrame.LookVector.y), -1, 1)
                        end
                    end
                end
            end
            if W == "LoadAnimation" and self.Name == "Humanoid" then
                if o["Anti-Aim"]["Extra"]["Slide_Walk"] then
                    if string.find(J[1].Name, "Walk") or string.find(J[1].Name, "Run") then
                        J[1] = i
                    end
                end
                if o["Anti-Aim"]["Extra"]["No_Animations"] then
                    J[1] = i
                end
            end
            if W == "GetState" then
                return Enum.HumanoidStateType.Physics
            end
            if W == "InvokeServer" and self.Name == "Hugh" then
                return
            end
            return f(self, unpack(J))
        end
    )
    e.__index =
        newcclosure(
        function(self, a0)
            if not checkcaller() and a0 == "WalkSpeed" and self == c.Character.Humanoid then
                if o["Anti-Aim"]["Exploits"]["Slow_Walk"] then
                    if
                        o["Anti-Aim"]["Exploits"]["Slow_Walk_Bind"] ~= nil and
                            game:GetService("UserInputService"):IsKeyDown(o["Anti-Aim"]["Exploits"]["Slow_Walk_Bind"])
                     then
                        return o["Anti-Aim"]["Exploits"]["Slow_Walk_Speed"]
                    end
                end
                if U.hopping then
                    c.Character.Humanoid.WalkSpeed = o["Misc"]["Bunny Hop"]["Speed"]
                    return 3
                end
            end
            return g(self, a0)
        end
    )
    e.__newindex =
        newcclosure(
        function(self, a1, a2)
            if o["Anti-Aim"]["Exploits"]["Fake_Duck"] and self:IsA("Humanoid") and a1 == "CameraOffset" then
                if
                    o["Anti-Aim"]["Exploits"]["Fake_Duck_Bind"] ~= nil and
                        game:GetService("UserInputService"):IsKeyDown(o["Anti-Aim"]["Exploits"]["Fake_Duck_Bind"])
                 then
                    a2 = Vector3.new(0, 0.05, 0)
                end
            end
            return h(self, a1, a2)
        end
    )
    local H = game[A.name].ApiEvent
    y.keydown =
        game:GetService("UserInputService").InputBegan:Connect(
        function(a3, a4)
            if o["Visuals"]["Self"]["Third_Person"] and o["Visuals"]["Self"]["Third_Person_Key"] ~= nil then
                if a3.KeyCode == Enum.KeyCode[o["Visuals"]["Self"]["Third_Person_Key"]] then
                    U.thirdperson = not U.thirdperson
                end
            end
            if o["Anti-Aim"]["Manual Binds"]["Left"] ~= nil then
                if a3.KeyCode == Enum.KeyCode[o["Anti-Aim"]["Manual Binds"]["Left"]] then
                    if U.side == "left" then
                        U.side = "none"
                    else
                        U.side = "left"
                    end
                end
            end
            if o["Anti-Aim"]["Manual Binds"]["Right"] ~= nil then
                if a3.KeyCode == Enum.KeyCode[o["Anti-Aim"]["Manual Binds"]["Right"]] then
                    if U.side == "right" then
                        U.side = "none"
                    else
                        U.side = "right"
                    end
                end
            end
        end
    )
    y.keyup =
        game:GetService("UserInputService").InputEnded:Connect(
        function(a3, a4)
        end
    )
    local a5 = j.firebullet
    j.firebullet = function(self, ...)
        local J = {...}
        U.dt = J[1] ~= "SKEETBETACRACK" and true or false
        if U.dt and U.candt then
            game:GetService("RunService").RenderStepped:wait()
            a5("SKEETBETACRACK")
        end
        return a5(self, unpack(J))
    end
    local a6 = j.updateads
    j.updateads =
        newcclosure(
        function(self, ...)
            local J = {...}
            spawn(
                function()
                    if c.Character ~= nil then
                        game:GetService("RunService").RenderStepped:wait()
                        for u, w in pairs(c.Character:GetDescendants()) do
                            if w:IsA("Part") or w:IsA("MeshPart") then
                                if w.Transparency ~= 1 then
                                    w.Transparency =
                                        c.PlayerGui.GUI.Crosshairs.Scope.Visible == true and
                                        o["Visuals"]["Self"]["Scope_Blend"] / 100 or
                                        0
                                end
                            end
                            if w:IsA("Accessory") then
                                w.Handle.Transparency =
                                    c.PlayerGui.GUI.Crosshairs.Scope.Visible == true and
                                    o["Visuals"]["Self"]["Scope_Blend"] / 100 or
                                    0
                            end
                        end
                    end
                end
            )
            return a6(self, ...)
        end
    )
    k.ChildAdded:Connect(
        function(a7)
            if o["Visuals"]["Self"]["Override_Skybox"] and a7:IsA("Sky") then
                local t = a7
                t.SkyboxLf = s[o["Visuals"]["Self"]["Skybox"]].SkyboxLf
                t.SkyboxBk = s[o["Visuals"]["Self"]["Skybox"]].SkyboxBk
                t.SkyboxDn = s[o["Visuals"]["Self"]["Skybox"]].SkyboxDn
                t.SkyboxFt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxFt
                t.SkyboxRt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxRt
                t.SkyboxUp = s[o["Visuals"]["Self"]["Skybox"]].SkyboxUp
            end
        end
    )
    workspace:WaitForChild("Ray_Ignore").ChildAdded:Connect(
        function(v)
            if v.Name == "Fires" then
                v.ChildAdded:Connect(
                    function(a8)
                        if o["Visuals"]["World"]["Fire_Radius"] then
                            a8.Transparency = 0.7
                            a8.Color = tocolor(o["Visuals"]["World"]["Fire_Radius_Color"])
                        end
                    end
                )
            end
            if v.Name == "Smokes" then
                v.ChildAdded:Connect(
                    function(a9)
                        a9:WaitForChild("ParticleEmitter").Rate = 310 - o["Visuals"]["World"]["Reduce_Smoke"] * 3.1
                        if o["Visuals"]["World"]["Smoke_Radius"] then
                            a9.Transparency = 0
                            a9.Material = Enum.Material.ForceField
                            a9.Color = tocolor(o["Visuals"]["World"]["Smoke_Radius_Color"])
                        end
                    end
                )
            end
        end
    )
    workspace.Debris.ChildAdded:Connect(
        function(v)
            spawn(
                function()
                    if o["Visuals"]["Others"]["Dropped_Weapons"] and v:IsA("Part") then
                        for u, w in pairs(v:GetChildren()) do
                            if w:IsA("MeshPart") then
                                if w.Transparency ~= 1 then
                                    w.TextureID = ""
                                    w.Material =
                                        o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "Custom" and
                                        Enum.Material.SmoothPlastic or
                                        o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "Flat" and
                                            Enum.Material.Neon or
                                        o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "ForceField" and
                                            Enum.Material.ForceField
                                    w.Color = tocolor(o["Visuals"]["Others"]["Dropped_Weapons_Color"])
                                    w.Transparency = o["Visuals"]["Others"]["Dropped_Weapons_Transparency"] / 100
                                end
                            end
                            if w:IsA("Part") then
                                if w.Transparency ~= 1 then
                                    w.Material =
                                        o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "Custom" and
                                        Enum.Material.SmoothPlastic or
                                        o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "Flat" and
                                            Enum.Material.Neon or
                                        o["Visuals"]["Others"]["Dropped_Weapons_Material"] == "ForceField" and
                                            Enum.Material.ForceField
                                    w.Color = tocolor(o["Visuals"]["Others"]["Dropped_Weapons_Color"])
                                    w.Transparency = o["Visuals"]["Others"]["Dropped_Weapons_Transparency"] / 100
                                end
                            end
                        end
                    end
                    if o["Visuals"]["Others"]["Disable_Bullet_Holes"] and v.Name == "Bullet" then
                        v:Destroy()
                    end
                end
            )
        end
    )
    workspace.Camera.Debris.ChildAdded:Connect(
        function(v)
            spawn(
                function()
                    if v.Name == "Blood" then
                        if o["Visuals"]["Other"]["Disable_Blood"] then
                            v:Destroy()
                        end
                    end
                end
            )
        end
    )
    spawn(
        function()
            while true do
                wait(1)
                for u, aa in pairs(a:GetPlayers()) do
                    if aa.Character and aa.Character:FindFirstChild("UpperTorso") then
                        if aa.Team ~= c.Team then
                            if o["Visuals"]["Chams"]["Enabled"] then
                                for u, w in pairs(aa.Character:GetChildren()) do
                                    if w:IsA("MeshPart") or w.Name == "Head" then
                                        if not w:FindFirstChild("Chams") then
                                            local ab = Instance.new("BoxHandleAdornment")
                                            ab.Name = "Chams"
                                            ab.Adornee = w
                                            ab.Color3 = tocolor(o["Visuals"]["Chams"]["Color"])
                                            ab.AlwaysOnTop = o["Visuals"]["Chams"]["Through_Walls"]
                                            ab.ZIndex = 5
                                            ab.Transparency = o["Visuals"]["Chams"]["Transparency"] / 100
                                            ab.Size = w.Size + Vector3.new(0.03, 0.03, 0.03)
                                            ab.Parent = w
                                        else
                                            if w:FindFirstChild("Chams") then
                                                local ab = w.Chams
                                                ab.Color3 = tocolor(o["Visuals"]["Chams"]["Color"])
                                                ab.Transparency = o["Visuals"]["Chams"]["Transparency"] / 100
                                                ab.AlwaysOnTop = o["Visuals"]["Chams"]["Through_Walls"]
                                            end
                                        end
                                    end
                                end
                            else
                                for u, w in pairs(aa.Character:GetDescendants()) do
                                    if w.Name == "Chams" then
                                        w:Destroy()
                                    end
                                end
                            end
                        else
                            for u, w in pairs(aa.Character:GetDescendants()) do
                                if w.Name == "Chams" then
                                    w:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    )
    local function ac(ad)
        return Vector3.new(ad.r, ad.g, ad.b)
    end
    local ae = {
        ["Head"] = {
            [1] = Vector3.new(0.5, 0, 0),
            [2] = Vector3.new(-0.5, 0, 0),
            [3] = Vector3.new(0, 0, 0.5),
            [4] = Vector3.new(0, 0, -0.5),
            [5] = Vector3.new(0, 0.5, 0)
        }
    }
    ae.create = function()
        local af = Instance.new("Part")
        af.Size = Vector3.new(0.1, 0.1, 0.1)
        af.Anchored = true
        af.CanCollide = false
        af.Transparency = 1
        return af
    end
    local ag = {
        ["Head"] = 4,
        ["FakeHead"] = 4,
        ["HeadHB"] = 4,
        ["UpperTorso"] = 1,
        ["LowerTorso"] = 1.25,
        ["LeftUpperArm"] = 1,
        ["LeftLowerArm"] = 1,
        ["LeftHand"] = 1,
        ["RightUpperArm"] = 1,
        ["RightLowerArm"] = 1,
        ["RightHand"] = 1,
        ["LeftUpperLeg"] = 0.75,
        ["LeftLowerLeg"] = 0.75,
        ["LeftFoot"] = 0.75,
        ["RightUpperLeg"] = 0.75,
        ["RightLowerLeg"] = 0.75,
        ["RightFoot"] = 0.75
    }
    local ah = Instance.new("ScreenGui")
    local ai = Instance.new("Frame")
    local aj = Instance.new("UIListLayout")
    local ak = Instance.new("TextLabel")
    local al = Instance.new("TextLabel")
    local am = Instance.new("TextLabel")
    local an = Instance.new("TextLabel")
    ah.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ai.Parent = ah
    ai.BackgroundTransparency = 1
    ai.Size = UDim2.new(0, 124, 0, 74)
    aj.Parent = ai
    aj.SortOrder = Enum.SortOrder.LayoutOrder
    ak.Parent = ai
    ak.BackgroundTransparency = 1
    ak.Size = UDim2.new(0, 124, 0, 18)
    ak.Font = Enum.Font.GothamBold
    ak.Text = "DT"
    ak.TextColor3 = Color3.fromRGB(255, 0, 0)
    ak.TextSize = 20
    ak.TextStrokeTransparency = 0.5
    al.Parent = ai
    al.BackgroundTransparency = 1
    al.Size = UDim2.new(0, 124, 0, 18)
    al.Font = Enum.Font.GothamBold
    al.Text = "Baim"
    al.TextColor3 = Color3.fromRGB(255, 0, 0)
    al.TextSize = 20
    al.TextStrokeTransparency = 0.5
    am.Parent = ai
    am.BackgroundTransparency = 1
    am.Size = UDim2.new(0, 124, 0, 18)
    am.Font = Enum.Font.GothamBold
    am.Text = "Min: 0"
    am.TextColor3 = Color3.fromRGB(255, 0, 0)
    am.TextSize = 20
    am.TextStrokeTransparency = 0.5
    an.Parent = ai
    an.BackgroundTransparency = 1
    an.Size = UDim2.new(0, 124, 0, 18)
    an.Font = Enum.Font.GothamBold
    an.Text = "No Target"
    an.TextColor3 = Color3.fromRGB(255, 0, 0)
    an.TextSize = 20
    an.TextStrokeTransparency = 0.5
    ah.Parent = game.CoreGui
    local ao = false
    game:GetService("RunService").RenderStepped:Connect(
        function()
            ai.Position = UDim2.new(0.5, -62, 0.5, 2)
            ai.Visible = o["Rage"]["Other"]["Indicators"]
            if o["Rage"]["Exploits"]["Double_Tap"] ~= true or o["Rage"]["Exploits"]["DT_Key"] == nil then
                ak.TextColor3 = Color3.fromRGB(255, 0, 0)
                ao = false
            end
            if o["Rage"]["Baim"]["Key"] == nil then
                al.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
            am.Text = "Min: " .. o["Rage"]["Other"]["Override_Amount"]
            if o["Rage"]["Other"]["DMG_Override"] == nil then
                am.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
    )
    local a5 = j.firebullet
    j.firebullet = function(self, ...)
        local J = {...}
        if J[2] ~= "nixusdt" and ao then
            game:GetService("RunService").RenderStepped:wait()
            a5(nil, "nixusdt")
        end
        return a5(self, unpack(J))
    end
    game:GetService("UserInputService").InputBegan:Connect(
        function(a0, ap)
            if not ap then
                if o["Rage"]["Exploits"]["Double_Tap"] == true and o["Rage"]["Exploits"]["DT_Key"] ~= nil then
                    if a0.KeyCode == Enum.KeyCode[o["Rage"]["Exploits"]["DT_Key"]] then
                        ak.TextColor3 =
                            ak.TextColor3 == Color3.fromRGB(190, 255, 48) and Color3.fromRGB(255, 0, 0) or
                            Color3.fromRGB(190, 255, 48)
                        ao = ak.TextColor3 == Color3.fromRGB(190, 255, 48) and true or false
                    end
                end
                if o["Rage"]["Baim"]["Key"] ~= nil then
                    if a0.KeyCode == Enum.KeyCode[o["Rage"]["Baim"]["Key"]] then
                        al.TextColor3 =
                            al.TextColor3 == Color3.fromRGB(190, 255, 48) and Color3.fromRGB(255, 0, 0) or
                            Color3.fromRGB(190, 255, 48)
                    end
                end
                if o["Rage"]["Other"]["DMG_Override"] ~= nil then
                    if a0.KeyCode == Enum.KeyCode[o["Rage"]["Other"]["DMG_Override"]] then
                        am.TextColor3 =
                            am.TextColor3 == Color3.fromRGB(190, 255, 48) and Color3.fromRGB(255, 0, 0) or
                            Color3.fromRGB(190, 255, 48)
                    end
                end
            end
        end
    )
    local aq =
        game:GetService("RunService").RenderStepped:Connect(
        function()
            S = nil
            if
                o["Rage"]["Main"]["Enabled"] and j.gun ~= "none" and workspace:FindFirstChild("Map") ~= nil and
                    c.Character ~= nil and
                    c.Character:FindFirstChild("Humanoid")
             then
                if o["Rage"]["Exploits"]["Remove_Recoil"] then
                    j.resetaccuracy()
                    j.RecoilX = 0
                    j.RecoilY = 0
                end
                local _ =
                    o["Rage"]["Main"]["Origin"] == "Camera" and cam.CFrame.p or
                    o["Rage"]["Main"]["Origin"] == "Head" and c.Character.Head.Position or
                    o["Rage"]["Main"]["Origin"] == "Real Head" and
                        c.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 1.4, 0)
                for u, aa in pairs(a:GetPlayers()) do
                    if
                        aa.Character ~= nil and aa.Character:FindFirstChildOfClass("ForceField") == nil and
                            aa.Team ~= c.Team
                     then
                        if
                            aa.Character:FindFirstChild("UpperTorso") ~= nil and
                                aa.Character:FindFirstChild("Humanoid") ~= nil
                         then
                            local ar = {unpack(collision)}
                            table.insert(ar, workspace.Map:WaitForChild("Clips"))
                            table.insert(ar, workspace.Map:WaitForChild("SpawnPoints"))
                            table.insert(ar, c.Character)
                            table.insert(ar, cam)
                            table.insert(ar, aa.Character.HumanoidRootPart)
                            if aa.Character:FindFirstChild("BackC4") then
                                table.insert(ar, aa.Character.BackC4)
                            end
                            if aa.Character:FindFirstChild("Gun") then
                                table.insert(ar, aa.Character.Gun)
                            end
                            if o["Rage"]["Exploits"]["Force_Pitch"] ~= "Off" then
                                aa.Character.UpperTorso.Waist.C0 =
                                    o["Rage"]["Exploits"]["Force_Pitch"] == "Up" and
                                    CFrame.new(Vector3.new(0, 0.6, 0)) * CFrame.Angles(0.7, 0, 0) or
                                    o["Rage"]["Exploits"]["Force_Pitch"] == "Down" and
                                        CFrame.new(Vector3.new(0, 0.6, 0)) * CFrame.Angles(-0.7, 0, 0) or
                                    o["Rage"]["Exploits"]["Force_Pitch"] == "Zero" and
                                        CFrame.new(Vector3.new(0, 0.6, 0)) * CFrame.Angles(0, 0, 0)
                            end
                            local as = {}
                            if o["Rage"]["Hitboxes"]["Head"] then
                                if
                                    not o["Rage"]["Baim"]["On_Head_Break"] or
                                        o["Rage"]["Baim"]["On_Head_Break"] and
                                            aa.Character:FindFirstChild("FakeHead") ~= nil
                                 then
                                    if
                                        not o["Rage"]["Baim"]["On_HP"] or
                                            o["Rage"]["Baim"]["On_HP"] and
                                                aa.Character.Humanoid.Health > o["Rage"]["Baim"]["HP_Amount"]
                                     then
                                        if al.TextColor3 ~= Color3.fromRGB(190, 255, 48) then
                                            table.insert(as, aa.Character.Head)
                                        end
                                    end
                                end
                            end
                            if
                                o["Rage"]["Hitboxes"]["Torso"] or
                                    o["Rage"]["Baim"]["On_HP"] and
                                        aa.Character.Humanoid.Health <= o["Rage"]["Baim"]["HP_Amount"] or
                                    o["Rage"]["Baim"]["On_Head_Break"] and
                                        aa.Character:FindFirstChild("FakeHead") == nil or
                                    al.TextColor3 == Color3.fromRGB(190, 255, 48)
                             then
                                table.insert(as, aa.Character.UpperTorso)
                            end
                            if o["Rage"]["Hitboxes"]["Pelvis"] then
                                table.insert(as, aa.Character.LowerTorso)
                            end
                            for u, Y in ipairs(as) do
                                local at = {unpack(ar)}
                                if o["Rage"]["Main"]["Autowall"] then
                                    local au = {}
                                    local av, aw, ax
                                    local ay = j.gun.Penetration.Value * 0.01
                                    repeat
                                        local az =
                                            Ray.new(_, (Y.CFrame.p - _).unit * math.clamp(j.gun.Range.Value, 1, 300))
                                        aw, ax = workspace:FindPartOnRayWithIgnoreList(az, at, false, true)
                                        if aw ~= nil and aw.Parent ~= nil then
                                            if
                                                aw:FindFirstAncestor(aa.Name) or
                                                    o["Rage"]["Other"]["Safepoint"] and Y == aw
                                             then
                                                av = aw
                                            else
                                                table.insert(at, aw)
                                                table.insert(au, {["Position"] = ax, ["Hit"] = aw})
                                            end
                                        end
                                    until av ~= nil or #au >= 4 or aw == nil
                                    if av ~= nil then
                                        local aA = 1
                                        if #au == 0 then
                                            if ag[av.Name] ~= nil then
                                                local aA = j.gun.DMG.Value * ag[av.Name]
                                                if aa:FindFirstChild("Kevlar") then
                                                    if string.find(av.Name, "Head") then
                                                        if aa:FindFirstChild("Helmet") then
                                                            aA = aA / 100 * j.gun.ArmorPenetration.Value
                                                        end
                                                    else
                                                        aA = aA / 100 * j.gun.ArmorPenetration.Value
                                                    end
                                                end
                                                if
                                                    am.TextColor3 == Color3.fromRGB(190, 255, 48) and
                                                        aA >= o["Rage"]["Other"]["Override_Amount"] or
                                                        am.TextColor3 == Color3.fromRGB(255, 0, 0) and
                                                            aA >= o["Rage"]["Main"]["Min_Damage"]
                                                 then
                                                    S = av
                                                    if not o["Rage"]["Main"]["Silent Aim"] then
                                                        cam.CFrame = CFrame.new(cam.CFrame.Position, av.Position)
                                                    end
                                                    if o["Rage"]["Main"]["Autoshoot"] and j.DISABLED == false then
                                                        T = true
                                                        j.firebullet()
                                                        T = false
                                                    end
                                                end
                                            end
                                        else
                                            local aB = 0
                                            local aC = 1
                                            for a1 = 1, #au do
                                                local aD = au[a1]
                                                local w = aD["Hit"]
                                                local ax = aD["Position"]
                                                local aE = 1
                                                if w.Material == Enum.Material.DiamondPlate then
                                                    aE = 3
                                                end
                                                if
                                                    w.Material == Enum.Material.CorrodedMetal or
                                                        w.Material == Enum.Material.Metal or
                                                        w.Material == Enum.Material.Concrete or
                                                        w.Material == Enum.Material.Brick
                                                 then
                                                    aE = 2
                                                end
                                                if
                                                    w.Name == "Grate" or w.Material == Enum.Material.Wood or
                                                        w.Material == Enum.Material.WoodPlanks
                                                 then
                                                    aE = 0.1
                                                end
                                                if w.Name == "nowallbang" then
                                                    aE = 100
                                                end
                                                if w:FindFirstChild("PartModifier") then
                                                    aE = w.PartModifier.Value
                                                end
                                                if
                                                    w.Transparency == 1 or w.CanCollide == false or w.Name == "Glass" or
                                                        w.Name == "Cardboard"
                                                 then
                                                    aE = 0
                                                end
                                                local aF =
                                                    (Y.CFrame.p - ax).unit * math.clamp(j.gun.Range.Value, 1, 100)
                                                local az = Ray.new(ax + aF * 1, aF * -2)
                                                local u, aG = workspace:FindPartOnRayWithWhitelist(az, {w}, true)
                                                local aH = (aG - ax).Magnitude
                                                aH = aH * aE
                                                aB = math.min(ay, aB + aH)
                                                aC = 1 - aB / ay
                                            end
                                            if ag[av.Name] ~= nil and aB > 0 and aC > 0 then
                                                local aA = j.gun.DMG.Value * ag[av.Name] * aC
                                                an.Text = aA
                                                if aa:FindFirstChild("Kevlar") then
                                                    if string.find(av.Name, "Head") then
                                                        if aa:FindFirstChild("Helmet") then
                                                            aA = aA / 100 * j.gun.ArmorPenetration.Value
                                                        end
                                                    else
                                                        aA = aA / 100 * j.gun.ArmorPenetration.Value
                                                    end
                                                end
                                                if
                                                    am.TextColor3 == Color3.fromRGB(190, 255, 48) and
                                                        aA >= o["Rage"]["Other"]["Override_Amount"] or
                                                        am.TextColor3 == Color3.fromRGB(255, 0, 0) and
                                                            aA >= o["Rage"]["Main"]["Min_Damage_Wall"]
                                                 then
                                                    S = av
                                                    if not o["Rage"]["Main"]["Silent Aim"] then
                                                        cam.CFrame = CFrame.new(cam.CFrame.Position, av.Position)
                                                    end
                                                    if o["Rage"]["Main"]["Autoshoot"] and j.DISABLED == false then
                                                        T = true
                                                        j.firebullet()
                                                        T = false
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    local az = Ray.new(_, (Y.CFrame.p - _).unit * math.clamp(j.gun.Range.Value, 1, 300))
                                    local aw, ax = workspace:FindPartOnRayWithIgnoreList(az, ar, false, true)
                                    if aw and aw:FindFirstAncestor(aa.Name) then
                                        if ag[aw.Name] ~= nil then
                                            local aA = j.gun.DMG.Value * ag[aw.Name]
                                            if aa:FindFirstChild("Kevlar") then
                                                if string.find(aw.Name, "Head") then
                                                    if aa:FindFirstChild("Helmet") then
                                                        aA = aA / 100 * j.gun.ArmorPenetration.Value
                                                    end
                                                else
                                                    aA = aA / 100 * j.gun.ArmorPenetration.Value
                                                end
                                            end
                                            if
                                                am.TextColor3 == Color3.fromRGB(190, 255, 48) and
                                                    aA >= o["Rage"]["Other"]["Override_Amount"] or
                                                    am.TextColor3 == Color3.fromRGB(255, 0, 0) and
                                                        aA >= o["Rage"]["Main"]["Min_Damage"]
                                             then
                                                S = aw
                                                if not o["Rage"]["Main"]["Silent Aim"] then
                                                    cam.CFrame = CFrame.new(cam.CFrame.Position, aw.Position)
                                                end
                                                if o["Rage"]["Main"]["Autoshoot"] and j.DISABLED == false then
                                                    T = true
                                                    j.firebullet()
                                                    T = false
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    )
    local aI = Instance.new("Part")
    aI.Anchored = true
    aI.Transparency = 1
    aI.Size = Vector3.new(100, 1, 100)
    aI.Parent = workspace
    local aJ = Instance.new("ParticleEmitter")
    aJ.Texture = "rbxassetid://304777684"
    aJ.Lifetime = NumberRange.new(200)
    aJ.Rate = 300
    aJ.Speed = NumberRange.new(5)
    aJ.EmissionDirection = "Bottom"
    aJ.LightInfluence = 25
    aJ.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.5)})
    aJ.Parent = aI
    local aK =
        game:GetService("RunService").RenderStepped:Connect(
        function()
            aI.Position = workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 40, 0)
            aJ.Enabled = o["Visuals"]["Particles"]["Enabled"]
            aJ.Color = ColorSequence.new(tocolor(o["Visuals"]["Particles"]["Color"]))
            aJ.Texture =
                o["Visuals"]["Particles"]["Type"] == "Snow" and "rbxassetid://304777684" or "rbxassetid://419625073"
            local aL = c.PlayerGui.GUI.Crosshairs.Crosshair
            for u, aM in pairs(aL:GetChildren()) do
                if string.find(aM.Name, "Frame") then
                    aM.BorderSizePixel = 0
                    if o["Visuals"]["Better Crosshair"]["Enabled"] then
                        local aL = c.PlayerGui.GUI.Crosshairs.Crosshair
                        aL.LeftFrame.Size = UDim2.new(0, 10, 0, 2)
                        aL.RightFrame.Size = UDim2.new(0, 10, 0, 2)
                        aL.TopFrame.Size = UDim2.new(0, 2, 0, 10)
                        aL.BottomFrame.Size = UDim2.new(0, 2, 0, 10)
                        if o["Visuals"]["Better Crosshair"]["Border"] then
                            aM.BorderSizePixel = o["Visuals"]["Better Crosshair"]["Border_Thickness"]
                            aM.BorderColor3 = tocolor(o["Visuals"]["Better Crosshair"]["Border_Color"])
                        end
                        if o["Visuals"]["Better Crosshair"]["Override_Length"] then
                            aL.LeftFrame.Size = UDim2.new(0, o["Visuals"]["Better Crosshair"]["Length"], 0, 2)
                            aL.RightFrame.Size = UDim2.new(0, o["Visuals"]["Better Crosshair"]["Length"], 0, 2)
                            aL.TopFrame.Size = UDim2.new(0, 2, 0, o["Visuals"]["Better Crosshair"]["Length"])
                            aL.BottomFrame.Size = UDim2.new(0, 2, 0, o["Visuals"]["Better Crosshair"]["Length"])
                        end
                    end
                end
            end
            if o["Visuals"]["Self"]["Override_Skybox"] then
                local t = k:FindFirstChildOfClass("Sky")
                if not t then
                    t = Instance.new("Sky")
                    t.SkyboxLf = s[o["Visuals"]["Self"]["Skybox"]].SkyboxLf
                    t.SkyboxBk = s[o["Visuals"]["Self"]["Skybox"]].SkyboxBk
                    t.SkyboxDn = s[o["Visuals"]["Self"]["Skybox"]].SkyboxDn
                    t.SkyboxFt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxFt
                    t.SkyboxRt = s[o["Visuals"]["Self"]["Skybox"]].SkyboxRt
                    t.SkyboxUp = s[o["Visuals"]["Self"]["Skybox"]].SkyboxUp
                    t.Parent = k
                end
            end
            if cam:FindFirstChild("Arms") and o["Visuals"]["Hand Chams"]["Enabled"] then
                if o["Visuals"]["Hand Chams"]["Gun"] then
                    for u, w in pairs(cam.Arms:GetChildren()) do
                        if w:IsA("MeshPart") and w.Transparency ~= 1 then
                            w.TextureID = ""
                            w.Color = tocolor(o["Visuals"]["Hand Chams"]["Gun_Color"])
                            w.Material =
                                o["Visuals"]["Hand Chams"]["Gun_Material"] == "Custom" and Enum.Material.SmoothPlastic or
                                o["Visuals"]["Hand Chams"]["Gun_Material"] == "Flat" and Enum.Material.Neon or
                                o["Visuals"]["Hand Chams"]["Gun_Material"] == "ForceField" and Enum.Material.ForceField
                            w.Transparency = o["Visuals"]["Hand Chams"]["Gun_Transparency"] / 100
                            w.Reflectance = o["Visuals"]["Hand Chams"]["Gun_Reflectance"]
                        end
                    end
                end
                for u, v in pairs(cam.Arms:GetChildren()) do
                    if v:IsA("Model") then
                        for u, w in pairs(v:GetDescendants()) do
                            if o["Visuals"]["Hand Chams"]["Hands"] then
                                if string.find(w.Name, "Glove") and w:IsA("Part") then
                                    if o["Visuals"]["Hand Chams"]["Remove_Gloves"] then
                                        w:Destroy()
                                    else
                                        w.Material = Enum.Material.ForceField
                                        w.Mesh.VertexColor = ac(tocolor(o["Visuals"]["Hand Chams"]["Hand_Color"]))
                                    end
                                end
                                if string.find(w.Name, "Sleeve") and w:IsA("Part") then
                                    if o["Visuals"]["Hand Chams"]["Remove_Sleeves"] then
                                        w:Destroy()
                                    else
                                        w.Material = Enum.Material.ForceField
                                        w.Mesh.VertexColor = ac(tocolor(o["Visuals"]["Hand Chams"]["Hand_Color"]))
                                    end
                                end
                            end
                            if o["Visuals"]["Hand Chams"]["Skin"] then
                                if string.find(w.Name, "Arm") and w:IsA("Part") then
                                    w.Color = tocolor(o["Visuals"]["Hand Chams"]["Skin_Color"])
                                    w.Transparency = o["Visuals"]["Hand Chams"]["Skin_Transparency"] / 100
                                end
                            end
                        end
                    end
                end
            end
        end
    )
    y.mainloop =
        game:GetService("RunService").RenderStepped:Connect(
        function()
            U.spin = U.spin + o["Anti-Aim"]["Yaw"]["Spin_Increment"]
            U.spin = math.clamp(U.spin, 0, o["Anti-Aim"]["Yaw"]["Spin_Range"])
            U.jitter = not U.jitter
            U.edown = game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.E)
            if U.spin == o["Anti-Aim"]["Yaw"]["Spin_Range"] then
                U.spin = 0
            end
            if U.edown or o["Anti-Aim"]["Angles"]["Enabled"] and o["Anti-Aim"]["Angles"]["Pitch"] ~= "Off" then
                q()
            end
            if
                game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) and
                    game:GetService("UserInputService"):GetFocusedTextBox() == nil and
                    o["Misc"]["Bunny Hop"]["Enabled"]
             then
                U.hopping = true
                if
                    c.Character and c.Character:FindFirstChild("Humanoid") and
                        c.Character:FindFirstChild("Humanoid").Health > 0
                 then
                    c.Character.Humanoid.Jump = true
                end
            else
                if U.hopping == true then
                    U.hopping = false
                end
            end
            if o["Visuals"]["Self"]["Override_FOV"] then
                cam.FieldOfView = o["Visuals"]["Self"]["FOV_Amount"]
            end
            if o["Visuals"]["World"]["No_Scope"] then
                pcall(
                    function()
                        c.PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 1
                        c.PlayerGui.GUI.Crosshairs.Scope.Scope.ImageTransparency = 1
                        c.PlayerGui.GUI.Crosshairs.Scope.Scope.Blur.ImageTransparency = 1
                        c.PlayerGui.GUI.Crosshairs.Scope.Scope.Blur.Blur.ImageTransparency = 1
                        c.PlayerGui.GUI.Crosshairs.Frame1.Transparency = 1
                        c.PlayerGui.GUI.Crosshairs.Frame2.Transparency = 1
                        c.PlayerGui.GUI.Crosshairs.Frame3.Transparency = 1
                        c.PlayerGui.GUI.Crosshairs.Frame4.Transparency = 1
                    end
                )
            end
            if o["Visuals"]["World"]["No_Flash"] then
                game.Players.LocalPlayer.PlayerGui.Blnd.Blind.Visible = false
            else
                game.Players.LocalPlayer.PlayerGui.Blnd.Blind.Visible = true
            end
            if o["Visuals"]["World"]["Time_Of_Day"] then
                k.TimeOfDay = o["Visuals"]["World"]["Time"]
            else
                k.TimeOfDay = 12
            end
            if o["Visuals"]["World"]["Night_Mode"] then
                k.Ambient =
                    Color3.fromRGB(
                    255 - o["Visuals"]["World"]["Night_Mode_Strength"],
                    255 - o["Visuals"]["World"]["Night_Mode_Strength"],
                    255 - o["Visuals"]["World"]["Night_Mode_Strength"]
                )
            else
                k.Ambient = Color3.fromRGB(127, 127, 127)
            end
            if o["Visuals"]["World"]["World_Color"] then
                k.OutdoorAmbient = tocolor(o["Visuals"]["World"]["World_Color_Color"])
            end
            if o["Anti-Aim"]["Extra"]["No_Head"] then
                pcall(
                    function()
                        if c.Character:FindFirstChild("FakeHead") then
                            c.Character.FakeHead:Destroy()
                        end
                        if c.Character:FindFirstChild("HeadHB") then
                            c.Character.HeadHB:Destroy()
                        end
                    end
                )
            end
            if o["Anti-Aim"]["Angles"]["Yaw"] ~= "Off" and o["Anti-Aim"]["Angles"]["Enabled"] then
                local aN =
                    o["Anti-Aim"]["Angles"]["Yaw"] == "Left" and 0 or o["Anti-Aim"]["Angles"]["Yaw"] == "Right" and 180 or
                    o["Anti-Aim"]["Angles"]["Yaw"] == "Back" and 90 or
                    o["Anti-Aim"]["Angles"]["Yaw"] == "Custom" and o["Anti-Aim"]["Angles"]["Custom_Yaw"] or
                    o["Anti-Aim"]["Angles"]["Yaw"] == "Random" and math.random(0, 360) or
                    0
                if o["Anti-Aim"]["Yaw"]["Spin"] then
                    aN = aN + U.spin
                end
                if U.side ~= "none" then
                    if U.side == "left" then
                        aN = 0
                    else
                        aN = 180
                    end
                end
                pcall(
                    function()
                        c.Character.Humanoid.AutoRotate = false
                        local aO = c.Character.HumanoidRootPart
                        local aP = cam.CFrame.LookVector
                        local aQ = -math.atan2(aP.Z, aP.X) + math.rad(aN)
                        if
                            o["Anti-Aim"]["Extra"]["Disable_On_E"] and not U.edown or
                                not o["Anti-Aim"]["Extra"]["Disable_On_E"]
                         then
                            if o["Anti-Aim"]["Yaw"]["Jitter"] and U.jitter then
                                if o["Anti-Aim"]["Yaw"]["Randomize_Jitter"] then
                                    aQ =
                                        -math.atan2(aP.Z, aP.X) +
                                        math.rad(
                                            math.random(
                                                math.clamp(
                                                    o["Anti-Aim"]["Yaw"]["Randomize_Jitter_Min"],
                                                    0,
                                                    o["Anti-Aim"]["Yaw"]["Jitter_Range"]
                                                ),
                                                o["Anti-Aim"]["Yaw"]["Jitter_Range"]
                                            )
                                        )
                                else
                                    aQ = -math.atan2(aP.Z, aP.X) + math.rad(o["Anti-Aim"]["Yaw"]["Jitter_Range"])
                                end
                                if o["Anti-Aim"]["Angles"]["At Targets"] and S ~= nil then
                                    aO.CFrame =
                                        CFrame.new(aO.Position, S.Parent.HumanoidRootPart.Position) *
                                        CFrame.Angles(0, math.rad(180), 0)
                                else
                                    aO.CFrame = CFrame.new(aO.Position) * CFrame.Angles(0, aQ, 0)
                                end
                            else
                                if o["Anti-Aim"]["Angles"]["At Targets"] and S ~= nil then
                                    aO.CFrame =
                                        CFrame.new(aO.Position, S.Parent.HumanoidRootPart.Position) *
                                        CFrame.Angles(0, math.rad(180), 0)
                                else
                                    aO.CFrame = CFrame.new(aO.Position) * CFrame.Angles(0, aQ, 0)
                                end
                            end
                        else
                            aO.CFrame =
                                CFrame.new(aO.Position) * CFrame.Angles(0, -math.atan2(aP.Z, aP.X) + math.rad(270), 0)
                        end
                    end
                )
            else
                pcall(
                    function()
                        c.Character.Humanoid.AutoRotate = true
                    end
                )
            end
            c.CameraMaxZoomDistance =
                o["Visuals"]["Self"]["Third_Person"] and c.Status.Alive.Value == true and U.thirdperson and
                o["Visuals"]["Self"]["Third_Person_Distance"] or
                c.Status.Alive.Value == true and 0 or
                c.CameraMaxZoomDistance
            c.CameraMinZoomDistance =
                o["Visuals"]["Self"]["Third_Person"] and c.Status.Alive.Value == true and U.thirdperson and
                o["Visuals"]["Self"]["Third_Person_Distance"] or
                c.Status.Alive.Value == true and 0 or
                c.CameraMinZoomDistance
            if cam:FindFirstChild("Arms") ~= nil then
                cam.Arms.HumanoidRootPart.Transparency = 1
            end
        end
    )
    spawn(
        function()
            while wait(0.1) do
                for u, aa in pairs(a:GetPlayers()) do
                    pcall(
                        function()
                            if aa:FindFirstChild("Status") and aa:FindFirstChild("Status").Alive.Value == true then
                                if aa.Team ~= c.Team and aa.Character:FindFirstChild("HumanoidRootPart") then
                                    if aa.Character.HumanoidRootPart:FindFirstChild("Box") then
                                        aa.Character.HumanoidRootPart:FindFirstChild("Box"):Destroy()
                                    end
                                    if aa.Character.HumanoidRootPart:FindFirstChild("Name") then
                                        aa.Character.HumanoidRootPart:FindFirstChild("Name"):Destroy()
                                    end
                                    if aa.Character.HumanoidRootPart:FindFirstChild("Health") then
                                        aa.Character.HumanoidRootPart:FindFirstChild("Health"):Destroy()
                                    end
                                    if o["Visuals"]["Enemies"]["Box"] then
                                        local aR = Instance.new("BillboardGui")
                                        local ai = Instance.new("Frame")
                                        local aS = Instance.new("Frame")
                                        local aT = Instance.new("Frame")
                                        local aU = Instance.new("Frame")
                                        local aV = Instance.new("Frame")
                                        local aW = Instance.new("Frame")
                                        local aX = Instance.new("Frame")
                                        local aY = Instance.new("Frame")
                                        local aZ = Instance.new("Frame")
                                        local a_ = Instance.new("Frame")
                                        local b0 = Instance.new("Frame")
                                        local b1 = Instance.new("Frame")
                                        aR.Name = "Box"
                                        aR.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                        aR.Active = true
                                        aR.AlwaysOnTop = true
                                        aR.ExtentsOffset = Vector3.new(0, -0.5, 0)
                                        aR.LightInfluence = 1.000
                                        aR.Size = UDim2.new(o["Visuals"]["Enemies"]["Box_X"] / 10, 0, 5.5, 0)
                                        ai.BackgroundColor3 = tocolor(o["Visuals"]["Enemies"]["Box_Color"])
                                        ai.BorderSizePixel = 0
                                        ai.Position = UDim2.new(0, 0, 0, 1)
                                        ai.Size = UDim2.new(1, 0, 0, 1)
                                        ai.BackgroundTransparency = 0
                                        ai.Parent = aR
                                        aS.BackgroundColor3 = tocolor(o["Visuals"]["Enemies"]["Box_Color"])
                                        aS.BorderSizePixel = 0
                                        aS.Position = UDim2.new(0, 1, 0, 0)
                                        aS.Size = UDim2.new(0, 1, 1, 0)
                                        aS.BackgroundTransparency = 0
                                        aS.Parent = aR
                                        aT.BackgroundColor3 = tocolor(o["Visuals"]["Enemies"]["Box_Color"])
                                        aT.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        aT.BorderSizePixel = 0
                                        aT.Position = UDim2.new(1, -2, 0, 0)
                                        aT.Size = UDim2.new(0, 1, 1, 0)
                                        aT.BackgroundTransparency = 0
                                        aT.Parent = aR
                                        aU.BackgroundColor3 = tocolor(o["Visuals"]["Enemies"]["Box_Color"])
                                        aU.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        aU.BorderSizePixel = 0
                                        aU.Position = UDim2.new(0, 0, 1, -2)
                                        aU.Size = UDim2.new(1, 0, 0, 1)
                                        aU.BackgroundTransparency = 0
                                        aU.Parent = aR
                                        aV.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        aV.BorderSizePixel = 0
                                        aV.Position = UDim2.new(0, 2, 0, 2)
                                        aV.Size = UDim2.new(0, 1, 1, -4)
                                        aV.Parent = aR
                                        aW.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        aW.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        aW.BorderSizePixel = 0
                                        aW.Position = UDim2.new(1, -3, 0, 2)
                                        aW.Size = UDim2.new(0, 1, 1, -4)
                                        aW.Parent = aR
                                        aX.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        aX.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        aX.BorderSizePixel = 0
                                        aX.Position = UDim2.new(0, 0, 1, -1)
                                        aX.Size = UDim2.new(1, 0, 0, 1)
                                        aX.Parent = aR
                                        aY.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        aY.BorderSizePixel = 0
                                        aY.Position = UDim2.new(0, 2, 0, 2)
                                        aY.Size = UDim2.new(1, -4, 0, 1)
                                        aY.Parent = aR
                                        aZ.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        aZ.BorderSizePixel = 0
                                        aZ.Size = UDim2.new(1, 0, 0, 1)
                                        aZ.Parent = aR
                                        a_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        a_.BorderSizePixel = 0
                                        a_.Size = UDim2.new(0, 1, 1, 0)
                                        a_.Parent = aR
                                        b0.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        b0.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        b0.BorderSizePixel = 0
                                        b0.Position = UDim2.new(1, -1, 0, 0)
                                        b0.Size = UDim2.new(0, 1, 1, 0)
                                        b0.Parent = aR
                                        b1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        b1.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        b1.BorderSizePixel = 0
                                        b1.Position = UDim2.new(0, 2, 1, -3)
                                        b1.Size = UDim2.new(1, -4, 0, 1)
                                        b1.Parent = aR
                                        aR.Adornee = aa.Character.HumanoidRootPart
                                        aR.Parent = aa.Character.HumanoidRootPart
                                    end
                                    if o["Visuals"]["Enemies"]["Name"] then
                                        local b2 = Instance.new("BillboardGui")
                                        local b3 = Instance.new("TextLabel")
                                        b2.Name = "Name"
                                        b2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                        b2.Active = true
                                        b2.AlwaysOnTop = true
                                        b2.ExtentsOffset = Vector3.new(0, -0.5, 0)
                                        b2.LightInfluence = 1.000
                                        b2.Size = UDim2.new(4.5, 0, 2, 0)
                                        b2.StudsOffset = Vector3.new(0, o["Visuals"]["Enemies"]["Name_Offset"], 0)
                                        b3.Name = "name"
                                        b3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        b3.BackgroundTransparency = 1.000
                                        b3.Size = UDim2.new(1, 0, 1, 0)
                                        b3.Font = o["Visuals"]["Enemies"]["Name_Font"]
                                        b3.Text = aa.Name
                                        b3.TextColor3 = tocolor(o["Visuals"]["Enemies"]["Name_Color"])
                                        b3.TextSize = o["Visuals"]["Enemies"]["Name_Font_Size"]
                                        b3.TextStrokeTransparency = 0.100
                                        b3.TextYAlignment = Enum.TextYAlignment.Bottom
                                        b3.TextTransparency = 0
                                        b2.Adornee = aa.Character.HumanoidRootPart
                                        b3.Parent = b2
                                        b2.Parent = aa.Character.HumanoidRootPart
                                    end
                                    if o["Visuals"]["Enemies"]["Health"] then
                                        local b4 = Instance.new("BillboardGui")
                                        local b5 = Instance.new("Frame")
                                        local b6 = Instance.new("Frame")
                                        b4.Name = "Health"
                                        b4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                        b4.Active = true
                                        b4.AlwaysOnTop = true
                                        b4.ExtentsOffset = Vector3.new(0, -0.5, 0)
                                        b4.LightInfluence = 1.000
                                        b4.Size = UDim2.new(1, 0, 5.5, 0)
                                        b4.StudsOffset = Vector3.new(-o["Visuals"]["Enemies"]["Health_Offset"], 0, 0)
                                        b5.Name = "green"
                                        b5.AnchorPoint = Vector2.new(0, 1)
                                        b5.BackgroundColor3 = tocolor(o["Visuals"]["Enemies"]["Health_Color"])
                                        b5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        b5.BorderSizePixel = 0
                                        b5.Position =
                                            UDim2.new(1, -o["Visuals"]["Enemies"]["Health_Thickness"] - 1, 1, -1)
                                        b5.Size =
                                            UDim2.new(
                                            0,
                                            o["Visuals"]["Enemies"]["Health_Thickness"],
                                            aa.Character.Humanoid.Health / 100,
                                            -2
                                        )
                                        b5.ZIndex = 3
                                        b5.Parent = b4
                                        b6.Name = "white"
                                        b6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        b6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        b6.Position =
                                            UDim2.new(1, -o["Visuals"]["Enemies"]["Health_Thickness"] - 1, 0, 1)
                                        b6.Size = UDim2.new(0, o["Visuals"]["Enemies"]["Health_Thickness"], 1, -2)
                                        b6.ZIndex = 2
                                        b6.Parent = b4
                                        b4.Adornee = aa.Character.HumanoidRootPart
                                        b4.Parent = aa.Character.HumanoidRootPart
                                    end
                                else
                                    pcall(
                                        function()
                                            if aa.Character.HumanoidRootPart:FindFirstChild("Box") then
                                                aa.Character.HumanoidRootPart:FindFirstChild("Box"):Destroy()
                                            end
                                            if aa.Character.HumanoidRootPart:FindFirstChild("Name") then
                                                aa.Character.HumanoidRootPart:FindFirstChild("Name"):Destroy()
                                            end
                                            if aa.Character.HumanoidRootPart:FindFirstChild("Health") then
                                                aa.Character.HumanoidRootPart:FindFirstChild("Health"):Destroy()
                                            end
                                        end
                                    )
                                end
                            end
                        end
                    )
                end
            end
        end
    )
end
a.PlayerAdded:Connect(
    function(b7)
        b7.CharacterAdded:Connect(
            function(b8)
                b8.ChildAdded:Connect(
                    function(v)
                        wait(1)
                        spawn(
                            function()
                                if v:IsA("Accessory") then
                                    table.insert(collision, v)
                                end
                                if v:IsA("Part") then
                                    spawn(
                                        function()
                                            if v ~= nil then
                                                if v.Name ~= "HeadHB" and v.Name ~= "FakeHead" then
                                                    table.insert(collision, v)
                                                end
                                            end
                                        end
                                    )
                                end
                            end
                        )
                    end
                )
            end
        )
    end
)
if c.Character and c.Character:FindFirstChild("Humanoid") and c.Character:FindFirstChild("UpperTorso") then
    for u, aa in pairs(a:GetPlayers()) do
        if aa.Character ~= nil then
            for u, v in pairs(aa.Character:GetChildren()) do
                if v:IsA("Accessory") then
                    table.insert(collision, v)
                end
                if v:IsA("Part") then
                    spawn(
                        function()
                            if v ~= nil then
                                if v.Name ~= "HeadHB" and v.Name ~= "FakeHead" then
                                    table.insert(collision, v)
                                end
                            end
                        end
                    )
                end
            end
        end
    end
end
y.initiate()
C = true
