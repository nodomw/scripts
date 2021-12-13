local network;

for index, garbage_collected in next, getgc(true) do
    if (type(garbage_collected) == "table" and rawget(garbage_collected, "send")) then
            network = garbage_collected;
        break;
            end
            end
local messages = {
"huge trollage, right now. ",
"really big trolling. ",
"stop. ",
"breaking hvh rules makes you an hvh outlaw. ",
"stop it. ",
"foxing hack best? ",
"Slam! ",
"loco "
        };
local last_tick = math.floor(tick());

game:GetService("RunService").RenderStepped:connect(function()
    local current_tick = math.floor(tick());
    if (current_tick % 3 == 0 and current_tick ~= last_tick) then
            local message = "";
        for index = 1, #messages do
                    message = message .. messages[math.random(1, #messages)];
                            end
        network:send("chatted", message);
        last_tick = current_tick;
            end
            end);
        