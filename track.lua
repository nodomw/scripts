for i, Players in pairs(game.Players:GetChildren()) do
    Players.ChildAdded:Connect(function(AddedItem)
        if AddedItem:IsA("BillboardGui") then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Client Alert";
                Text = "BillboardGui Detected Beware";
                Icon = "";
                Duration = 6;
            })
        end
    end)
end