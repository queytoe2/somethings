local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local addPowerEvent = game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent

local TrainRate = 0.68
local TrainAmount = 20
local ninTickTime = tick()
local lastNin = TrainAmount


function AntiAfkFunc()
    Players.LocalPlayer.Idled:Connect(function()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

AntiAfkFunc()


local mainRun
mainRun = RunService.Heartbeat:Connect(function()
    if (tick() - ninTickTime) >= TrainRate then
        ninTickTime = tick()
        if lastNin ~= TrainAmount then
            addPowerEvent:FireServer("FromTraining",TrainAmount)
            lastNin = TrainAmount
        else
            addPowerEvent:FireServer("FromTraining",TrainAmount - 0.001)
            lastNin = TrainAmount - 0.001
        end
    end
end)

Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == ".kill" then
        mainRun:Disconnect()
    elseif msg == ".run" then
        mainRun = RunService.Heartbeat:Connect(function()
            if (tick() - ninTickTime) >= TrainRate then
                ninTickTime = tick()
                if lastNin ~= TrainAmount then
                    addPowerEvent:FireServer("FromTraining",TrainAmount)
                    lastNin = TrainAmount
                else
                    addPowerEvent:FireServer("FromTraining",TrainAmount - 0.001)
                    lastNin = TrainAmount - 0.001
                end
            end
        end)
    end
end)


local help = false

if game.Players.LocalPlayer.Character:FindFirstChild("Train") then
    help = true
end

if help then
    game.Players.LocalPlayer.Character:FindFirstChild("Train").Parent = game.Players.LocalPlayer.Backpack
end

for i,v in pairs(game.Players.LocalPlayer.Backpack.Train:GetChildren()) do
    if v.Name ~= "Handle" then
        v:Destroy()
    end
end

if help then
    game.Players.LocalPlayer.Backpack:FindFirstChild("Train").Parent = game.Players.LocalPlayer.Character
end

local firstTrial = {"SurfaceGui", "ImageLabel", "BodyVelocity", "TextLabel", "BillboardGui", "ScreenGui", "Frame", "Mesh", "SpecialMesh", "Sound", "Pants", "Shirt", "ParticleEmitter", "Trail", "Explosion", "Decal", "FaceControls", "WrapTarget", "Accessory", 'ForceField', 'Sparkles', 'Smoke', 'Fire'}
local secondTrial = {"Tool","Player","Model","Part","UnionOperation","MeshPart","CornerWedgePart","TrussPart","BasePart"}
local ancestors = {"CoreGui", "CorePackages", "ReplicatedStorage", "ReplicatedFirst", "StarterGui", "StarterPack", "StarterPlayer", "PlayerGui", "PlayerScripts", "Chat"}

local function ServiceCheck(child)
    local success,err = pcall(function()
        if game:GetService(child.Name) then
            return
        end
    end)
    if success then
        return true
    else
        return false
    end
end

local function AncestorCheck(child)
    for _,v in pairs(ancestors) do
        if child:FindFirstAncestor(v) then
            return true
        end
    end
    return false
end


local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass('Terrain')
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1
for i,v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    end
end
task.wait(0.5)
for _,child in pairs(game:GetDescendants()) do
    if not AncestorCheck(child) and not ServiceCheck(child) then
        if table.find(firstTrial,child.ClassName) then
            child:Destroy()
        elseif table.find(secondTrial,child.ClassName) then
            if child.Name ~= Players.LocalPlayer.Name and not child:FindFirstAncestor(Players.LocalPlayer.Name) and child.Name ~= "PRIMPART" then
                child:Destroy()
            end
        end
    end
end
for i,v in pairs(Lighting:GetDescendants()) do
    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
        v.Enabled = false
        v:Destroy()
    end
end
game.DescendantAdded:Connect(function(child)
    task.spawn(function()
        pcall(function()
            if not AncestorCheck(child) and not ServiceCheck(child) then
                if table.find(firstTrial,child.ClassName) then
                    RunService.Heartbeat:Wait()
                    child:Destroy()
                elseif table.find(secondTrial,child.ClassName) then
                    if child.Name ~= Players.LocalPlayer.Name and not child:FindFirstAncestor(Players.LocalPlayer.Name) and child.Name ~= "PRIMPART" then
                        RunService.Heartbeat:Wait()
                        child:Destroy()
                    end
                end
            end
        end)
    end)
end)



local newPart = Instance.new("Part",workspace)
newPart.CFrame = CFrame.new(-285, 339, -47)
newPart.Anchored = true
newPart.Name = "PRIMPART"

Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPart.Position + Vector3.new(0,2,0))

task.wait(0.5)

for _,v in pairs(Players.LocalPlayer.Backpack:GetDescendants()) do
    if v:IsA("Mesh") or v:IsA("SpecialMesh") or v:IsA("Attachment") or v:IsA("Trail") or v:IsA("Fire") then
        v:Destroy()
    end
end
for _,v in pairs(Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("Pants") or v:IsA("Shirt") then
        v:Destroy()
    end
end

task.wait(0.5)

Players.LocalPlayer.Backpack.Sword.Parent = Players.LocalPlayer.Character
task.wait(0.1)
Players.LocalPlayer.Character.Sword.Parent = Players.LocalPlayer.Backpack
task.wait(0.1)
Players.LocalPlayer.Backpack.Train.Parent = Players.LocalPlayer.Character

task.wait(0.5)

local newGui = Instance.new("ScreenGui",Players.LocalPlayer.PlayerGui)
newGui.Name = "WHITECREEN"
newGui.IgnoreGuiInset = true
newGui.ResetOnSpawn = false
newGui.Enabled = true

local newFrame = Instance.new("Frame",newGui)
newFrame.BackgroundColor3 = Color3.new(1,1,1)
newFrame.AnchorPoint = Vector2.new(0.5,0.5)
newFrame.Position = UDim2.new(0.5,0,0.5,0)
newFrame.Size = UDim2.new(5,0,5,0)
