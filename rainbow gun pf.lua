game:GetService("RunService").Stepped:Connect(function()
for a,b in pairs(workspace.Camera:GetChildren()) do 
for c,d in pairs(game:GetService("ReplicatedStorage").GunModels:GetChildren()) do 
if b.Name == d.Name then 
for e,f in pairs(b:GetChildren()) do 
if f:IsA("BasePart") then 
f.Color = Color3.fromHSV(tick()%5/5,1,1)
end
end
end
end
end
end)
