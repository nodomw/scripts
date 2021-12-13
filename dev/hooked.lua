rconsolename("Hooked!")
rconsoleclear()
rconsoleprint("@@WHITE@@")
rconsoleprint("---------------------------------------------------\n")
rconsoleprint("@@RED@@")
rconsoleprint([[
  _    _                   _                 _   _ 
 | |  | |                 | |               | | | |
 | |__| |   ___     ___   | | __   ___    __| | | |
 |  __  |  / _ \   / _ \  | |/ /  / _ \  / _` | | |
 | |  | | | (_) | | (_) | |   <  |  __/ | (_| | |_|
 |_|  |_|  \___/   \___/  |_|\_\  \___|  \__,_| (_)
 
]])
rconsoleprint("@@WHITE@@")
rconsoleprint("---------------------------------------------------\n")

local Commands = {
    new = function(params)
        local Hooked
        local Hooked_Title = params[1]
        local Hooked_Function = loadstring("return ".. Hooked_Title)()
        Hooked = hookfunction(Hooked_Function,function(self,...)
            local Length = string.len(Hooked_Title.. " was called!\n")
            for k,v in pairs({...}) do
                local Output = " "..k..". "..tostring(v).."\n"
                if string.len(Output) > Length then
                    Length = string.len(Output)
                end
            end
            rconsoleprint(string.rep("-",Length).."\n")
            rconsoleprint(Hooked_Title.. " was called!\n")
            for k,v in pairs({...}) do
                rconsoleprint(" "..k..". "..tostring(v).."\n")
            end
            rconsoleprint(string.rep("-",Length).."\n")
            return Hooked(self,...)
        end) 
        pcall(function()
            local OldFunction = getgenv()[params[1]]
            getgenv()[params[1]] = function(...)
                local Length = string.len(Hooked_Title.. " was called!\n")
                for k,v in pairs({...}) do
                    local Output = " "..k..". "..tostring(v).."\n"
                    if string.len(Output) > Length then
                        Length = string.len(Output)
                    end
                end
                rconsoleprint(string.rep("-",Length).."\n")
                rconsoleprint(Hooked_Title.. " was called!\n")
                for k,v in pairs({...}) do
                    rconsoleprint(" "..k..". "..tostring(v).."\n")
                end
                rconsoleprint(string.rep("-",Length).."\n")
                return OldFunction(...) 
            end
        end)
        rconsoleprint("Added!\n")
    end,
    help = function()
        local LongestCommand = "new [function] - Hook a function."
        rconsoleprint(string.rep("-",string.len(LongestCommand)).."\n")
        rconsoleprint("new [function] - Hook a function.\n")
        rconsoleprint("help - Commands.\n")
        rconsoleprint(string.rep("-",string.len(LongestCommand)).."\n")
    end
}

function HandleInput()
    local Response = rconsoleinput()
    local SplitParams = string.split(Response," ")
    if Commands[SplitParams[1]] then
        local RefinedParams = {}
        for k,v in pairs(SplitParams) do
            if k ~= 1 then
                RefinedParams[k-1] = v 
            end
        end
        Commands[SplitParams[1]](RefinedParams) 
    end
    HandleInput()
end

HandleInput()