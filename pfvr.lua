local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local newCF = CFrame.new()

if VRService.VREnabled then
    StarterGui:SetCore("VRLaserPointerMode",0)
    StarterGui:SetCore("VREnableControllerModels",false)
    StarterGui:SetCore("TopbarEnabled", false)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat,false)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health,false)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack,false)
    RunService.RenderStepped:Connect(function()
        if LocalPlayer.Character then
            local weap
            for i,v in next, Camera:GetChildren() do
                if not string.find(v.Name,"Arm") then
                    weap = v
                else
                    for _i,_v in next, v:GetDescendants() do
                        if _v:IsA"BasePart" then
                            _v.Transparency = 1
                        end
                    end
                end
            end
            if weap and weap:FindFirstChild("Trigger") then
                for i,v in next, weap:GetDescendants() do
                    if v:IsA"Part" then
                        v.Anchored = true
                    elseif v.Name == "Motor6D" then
                        v.Part0 = nil
                        v.Part1 = nil 
                    end
                end
                local userRightHandCFrame = UserInputService:GetUserCFrame(Enum.UserCFrame.RightHand)
                local head = Camera:GetRenderCFrame()
                if userRightHandCFrame == newCF then
                    userRightHandCFrame = head * CFrame.new(0.2,-0.5,-1) * CFrame.Angles(0,0,0)
                else
                    userRightHandCFrame = Camera.CoordinateFrame * userRightHandCFrame * CFrame.new(0,0,0.3) * CFrame.Angles(-math.pi*.25,0,0)
                end
                weap.PrimaryPart = weap.Trigger
                weap:SetPrimaryPartCFrame(userRightHandCFrame)
            end
        end
    end)
else
    warn("really -_-")
end
