
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local function activateBuso()
if not character:FindFirstChild("Buso") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end
local function onHumanoidDied()
humanoid.Died:Connect(function()
character = player.Character or player.CharacterAdded:Wait()
humanoid = character:WaitForChild("Humanoid")
wait(5)
activateBuso()
end)
end
onHumanoidDied()
player.CharacterAdded:Connect(function(newCharacter)
character = newCharacter
humanoid = newCharacter:WaitForChild("Humanoid")
onHumanoidDied()
end)