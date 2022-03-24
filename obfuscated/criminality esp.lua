local s, r = pcall(game.HttpGet, game, 'https://raw.githubusercontent.com/wally-rblx/roblox-scripts/main/criminality_esp.lua')
if s and loadstring(r) then
   pcall(loadstring(r))
else
   game.Players.LocalPlayer:Kick('failed to load')
end