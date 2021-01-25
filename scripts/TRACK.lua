for i, Players in pairs(game.Players:GetChildren()) do
    Players.ChildAdded:Connect(function(AddedItem)
        if AddedItem:IsA("BillboardGui") then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Client Alert"; -- Required. Has to be a string!
                Text = "BillboardGui Detected Beware"; -- Required. Has to be a string!
                Icon = ""; -- Optional, defaults to "" (no icon)
                Duration = 6; -- Optional, defaults to 5 seconds
            })
        end
    end)
end