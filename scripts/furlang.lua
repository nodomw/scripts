local owos = {
    "'w'",
    "OwO",
    "owo",
    "UwU",
    "uwu",
    "^w^",
    ">w<",
    "(´•ω•`)",
}

local hyper_links = {}
local players = game:GetService("Players")

local function replace_link(string)
    table.insert(hyper_links, string)
    return "owo" .. #hyper_links
end

local function trim(string)
    return string.match(string, "^%s*(.-)%s*$")
end

local function owo_convert(speech)
    local selected_owo = owos[math.random(1, #owos)]
    local modifier = math.random(1, 5)
    local output = ""

    output = speech:gsub("|c.-|r", replace_link)

    output = output:gsub("[LR]", "W")
    output = output:gsub("[lr]", "w")

    if modifier < 5 then
        output = output:gsub("U([^VW])", "UW%1")
        output = output:gsub("u([^vw])", "uw%1")
    end

    output = output:gsub("ith " , "if ")
    output = output:gsub("([fps])([aeio]%w+)", "%1w%2") or output
    output = output:gsub("n([aeiou]%w)", "ny%1") or output
    output = output:gsub(" th", " d") or output

    output = string.format(" %s ", output)

    for character in string.gmatch(output, "%a+") do
        if math.random(1, 5) == 5 then
            local first_character = character:sub(1, 1)
            output = output:gsub(string.format(" %s ", character), string.format(" %s-%s ", first_character, character))
        end
    end

    output = trim(output)
    output = modifier == 5 and output .. " " .. selected_owo or output:gsub("!$", " " .. selected_owo)

    return output
end

local chat_remotes = {
    "SayMessageRequest",
    "PlayerChatted",
    "Chatted"
}

local meta_table = getrawmetatable(game)
local namecall = meta_table.__namecall
setreadonly(meta_table, false)

meta_table.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "FireServer" then
        for index, name in pairs(chat_remotes) do
            if self.Name == name then
                args[1] = owo_convert(args[1])
            end
        end
    end

    return namecall(self, unpack(args))
end)
