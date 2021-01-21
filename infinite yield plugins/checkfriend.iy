local Plugin = {
    ["PluginName"] = "Check Friend",
    ["PluginDescription"] = "Check if somone is friend with [UserId]",
    ["Commands"] = {
        ["checkfriend"] = {
            ["ListName"] = "CheckFriend [Plr] [UserId]",
            ["Description"] = "",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                for i,plr in pairs(getPlayer(args[1],speaker))do
                    plr = game:GetService("Players")[plr]

                   if plr:IsFriendsWith(args[2]) then
                    notify(plr.name.." Is Friend With ".. args[2])
                   else
                    notify(plr.name.." Is Not Friend With ".. args[2])
            end
        end
    end
            }
    }
}

return Plugin