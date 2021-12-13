local tokens = {
    arguments = {}
 };
 
 function tokens:push(byte)
    table.insert(self, byte);
 end
 
 function tokens:pop()
    local token = self[1];
    table.remove(self, 1);
 
    return token;
 end
 
 function tokens:popAndPush(byte)
    local token = self[1];
    table.remove(self, 1);
    table.insert(self, byte);
 
    return token;
 end
 
 function tokens:pushArguments()
    tokens.arguments[1] = tokens:pop();
    tokens.arguments[2] = tokens:pop();
    tokens.arguments[3] = tokens:pop();
 end
 
 function tokens:formatArguments()
    return table.concat(tokens.arguments, " ");
 end
 
 function tokens:popAndFormatArguments()
    local argument1 = tokens:pop();
    local argument2 = tokens:pop();
    local argument3 = tokens:pop();
    tokens.arguments[1] = tonumber(argument1) or argument1:gsub("%d", "");
    tokens.arguments[2] = tonumber(argument2) or argument2:gsub("%d", "");
    tokens.arguments[3] = tonumber(argument3) or argument3:gsub("%d", "");
 
    return table.concat(tokens.arguments, " ");
 end
 
 local function switch(statement, cases)
    local case = cases[statement];
    local default = cases.default;
    local always = cases.always;
 
    if (always) then
        always();
    end
 
    if (case) then
        case();
    elseif (default) then
        default();
    end
 end
 
 local opcodes = {
    ["F1"] = "eq",
    ["9A"] = "neq",
    ["B7"] = "lt",
    ["D4"] = "le",
    ["60"] = "nlt",
    ["7D"] = "nle",
    ["35"] = "getglobal",
    ["A4"] = "getglobal_opt",
    ["FB"] = "getupval",
    ["87"] = "gettable",
    ["4D"] = "gettablek",
    ["6F"] = "loadk",
    ["A9"] = "loadbool",
    ["8C"] = "loadnumber",
    ["C6"] = "loadnil",
    ["D9"] = "closure",
    ["9F"] = "call",
    ["82"] = "return",
    ["65"] = "jmp",
    ["48"] = "jmpback",
    ["89"] = "longjmp",
    ["52"] = "move",
    ["18"] = "setglobal",
    ["DE"] = "setupval",
    ["C5"] = "setlist",
    ["6A"] = "settable",
    ["30"] = "settablek",
    ["43"] = "add",
    ["95"] = "addk",
    ["26"] = "sub",
    ["78"] = "subk",
    ["9"] = "mul",
    ["5B"] = "mulk",
    ["EC"] = "div",
    ["3E"] = "divk",
    ["B2"] = "pow",
    ["4"] = "powk",
    ["CF"] = "mod",
    ["21"] = "modk",
    ["39"] = "unm",
    ["BC"] = "self",
    ["C1"] = "close",
    ["1C"] = "len",
    ["73"] = "concat",
    ["A8"] = "forprep",
    ["17"] = "tforprep",
    ["8B"] = "forloop",
    ["DD"] = "vararg",
    ["FF"] = "newtable",
    ["56"] = "not",
    ["FA"] = "tforloop",
    ["e"] = "testand",
    ["1A"] = "testor",
    ["A3"] = "clearstack",
    ["C0"] = "clearstack_nva"
 };
 
 local function disassemble(bytecode)
    for index, byte in next, bytecode:split(" ") do
        tokens:push(byte);
    end
 
    local compiled = tokens:pop();
    local constant_pool_size = tokens:pop();
    local constants = {};
 
    rconsoleprint("; compiled: " .. tostring(compiled == "01") .. "\n; nconstants: " .. tonumber(constant_pool_size) .. "\n\n");
 
    for index = 1, constant_pool_size do
        local constant_length = tokens:pop();
        local constant = "";
        
        for index = 1, constant_length do
            local byte = tokens:pop();
 
            constant = constant .. byte:gsub("%x%x", function(character)
                return byte.char(tonumber(byte, 16))
            end);
        end
 
        rconsoleprint(".constant " .. constant .. "\n");
        table.insert(constants, constant);
    end
 
    rconsoleprint("\n");
 
    for index = 1, #tokens do
        local byte = tokens:pop();
        local opcode = opcodes[byte];
 
        if (opcode) then
            switch(opcode, {
                ["always"] = function()
                    rconsoleprint("00" .. byte .. "\t[" .. (index < 10 and "0" .. index or index) .. "] " .. opcode .. (opcode:len() >= 11 and "\t" or "\t\t"));
                end,
                ["default"] = function()
                    rconsoleprint("\n");
                end,
                ["return"] = function()
                    rconsoleprint(tokens:popAndFormatArguments() .. "\n");
                end
            });
        end
    end
 end
 
 rconsoleclear();
 
 --[[
    usage:
    disassemble(<string> bytecode);
 
    example:
    disassemble("01 02 05 70 72 69 6E 74 04 77 61 72 6E 01 05 00 00 01 0F A3 00 00 00 8C 02 01 00 8C 00 0A 00 8C 01 01 00 A8 00 09 00 A4 03 01 00 00 00 00 40 52 04 02 00 9F 03 02 01 A4 03 03 00 00 00 20 40 52 04 02 00 9F 03 02 01 8B 00 F7 FF 82 00 01 00 04 03 01 04 00 00 00 40 03 02 04 00 00 20 40 00 00 01 18 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 01 00 00 00 00 00");
 ]]