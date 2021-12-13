if not game:IsLoaded() then
	game.Loaded:Wait()
end
game.Players.ChildAdded:Connect(function(player)
    	game:GetService('StarterGui'):SetCore('SendNotification', {
				Title = player.Name,
				Text = 'has joined the server. .\n[AGE: ' ..player.AccountAge.. ']',
				Icon = [[http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userName=]]..player.Name..[[&RAND]] .. math.random(1,100000000),
				Duration = 5,
			})
end)

game.Players.ChildRemoved:Connect(function(player)
    	game:GetService('StarterGui'):SetCore('SendNotification', {
				Title = player.Name,
				Text = 'has left the server. .\n[AGE: ' ..player.AccountAge.. ']',
				Icon = [[http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&userName=]]..player.Name..[[&RAND]] .. math.random(1,100000000),
				Duration = 5,
			})
    end)
