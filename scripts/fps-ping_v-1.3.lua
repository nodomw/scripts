_G.Rainbow_Enabled = false -- enables rainbow line

_G.Low_FPS_Enabled = {
    true, -- true/false
    15, -- amount of frames before changing colors
    Color3.fromRGB(255,0,0) -- color for Low_FPS
}

_G.High_Ping_Enabled = {
    true, -- true/false
    375, -- amount of ping before changing colors
    Color3.fromRGB(255,0,0) -- color for High_Ping
}

_G.Time_Format = 12 -- 24/12

loadstring(syn.request({url = "https://raw.githubusercontent.com/IiIIiIiIIIiiIiiIIiIIIii-warrior/scripts/master/fps.lua", Method = "GET"}).Body)()