local Chat = game:GetService("Chat")

for i,v in pairs(game.Players:GetPlayers())do
   v.Chatted:Connect(function(msg)
       rconsoleinfo("["..v.Name.."] "..msg)
   end)
end

game.Players.PlayerAdded:Connect(function(player)
   rconsolewarn(player.Name.." joined the game!")
   
   player.Chatted:Connect(function(msg)
       rconsoleinfo("["..player.Name.."] "..msg)
   end)
end)

game.Players.PlayerRemoving:Connect(function(player)
   rconsolewarn(player.Name.." left the game!")
end)