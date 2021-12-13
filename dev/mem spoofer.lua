local metatable = getrawmetatable(game)
local namecall  = metatable.__namecall
make_writeable(metatable);
local MemCache = game:GetService("Stats"):GetTotalMemoryUsageMb();

function GenerateFakeMemory()
    local random = math.random(1, 2);
    local method = (random == 1 and "-") or "+";

    return (method == "-" and (MemCache - (random / math.random(100, 200)))) or (MemCache + (random / math.random(100, 200)));
end

metatable.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod();
    if method == "GetTotalMemoryUsageMb" then
        return GenerateFakeMemory();
    end
    return namecall(self, ...)
end)

local GetTotalMemoryUsageMb;
GetTotalMemoryUsageMb = hookfunction(game:GetService("Stats").GetTotalMemoryUsageMb, function(Stats)
    return GenerateFakeMemory();
end)

make_readonly(metatable);