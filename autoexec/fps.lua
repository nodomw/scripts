_G.Rainbow_Enabled = true -- enables rainbow line

_G.Low_FPS_Enabled = {
    true, -- true/false
    30, -- amount of frames before changing colors
    Color3.fromRGB(255,0,0) -- color for Low_FPS
}

_G.High_Ping_Enabled = {
    true, -- true/false
    200, -- amount of ping before changing colors
    Color3.fromRGB(255,0,0) -- color for High_Ping
}

_G.Time_Format = 24 -- 24/12
wait(math.random(10, 20))
loadstring(game:HttpGet(("https://raw.githubusercontent.com/IiIIiIiIIIiiIiiIIiIIIii-warrior/scripts/master/fps.lua"), true))()