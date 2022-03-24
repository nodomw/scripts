local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local hold=false

--settings
local keybind=Enum.KeyCode.E
local enablepconsole=true
local fov=250
local teamcheck=true

if enablepconsole then
   rconsoleprint("third person aimbot loaded")
else
   warn("third person aimbot loaded")
end

if teamcheck then
   if #game.Teams:GetChildren()<2 then
       if enablepconsole then
           rconsoleprint("\nthere are less then 2 teams in this game! disabled teamcheck")
       else
           warn("there are less then 2 teams in this game! disabled teamcheck")
       end
       teamcheck=false
   end
end

function getnearest()
   local nearest
   local kanker=math.huge
   for i,v in next, game:GetService("Players"):GetChildren() do
       if v and v.Character and v~=game:GetService("Players").LocalPlayer and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health>0 then
           if teamcheck then
               if v.Team ~= game.Players.LocalPlayer.Team then
                   local worldPoint = v.Character.Head.Position
                   local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(worldPoint)
                   local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
                   if kanker>magnitude and onScreen and magnitude<fov then
                       kanker=magnitude
                       nearest=v
                   end
               end
           else
               local worldPoint = v.Character.Head.Position
               local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(worldPoint)
               local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
               if kanker>magnitude and onScreen and magnitude<fov then
                   kanker=magnitude
                   nearest=v
               end
           end
       end
   end
   return nearest
end

game:GetService("UserInputService").InputBegan:connect(function(input)
   if input.KeyCode == keybind then
       hold=true
       if enablepconsole then
           rconsoleprint("\npressed button")
       end
   end
end)

game:GetService("UserInputService").InputEnded:connect(function(input)
   if input.KeyCode == keybind then
       hold=false
       if enablepconsole then
           rconsoleprint("\nreleased button")
       end
   end
end)

game:GetService("RunService").RenderStepped:connect(function()
   if hold then
       if getnearest() then
           local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(getnearest().Character.Head.Position)
           local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(mouse.X,mouse.Y)).Magnitude
           local magnitudeX = mouse.X - vector.X
           local magnitudeY = mouse.Y - vector.Y
           mousemoverel(-magnitudeX*0.5,-magnitudeY*0.5)
           if enablepconsole then
               rconsoleprint("\nmoved "..math.floor(magnitudeX)+magnitudeX-math.floor(magnitudeX).." "..math.floor(magnitudeY)+magnitudeY-math.floor(magnitudeY).." to "..getnearest().Character.Name)
           end
           wait(0.01)
       end
   end
end)