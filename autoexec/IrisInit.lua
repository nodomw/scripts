local Timer = tick()
local CharBytes = {
	["a"] = "1",
	["b"] = "2",
	["c"] = "3",
	["d"] = "4",
	["e"] = "5",
	["f"] = "6",
	["g"] = "7",
	["h"] = "8",
	["i"] = "9",
	["j"] = "10",
	["k"] = "11",
	["l"] = "12",
	["m"] = "13",
	["n"] = "14",
	["o"] = "15",
	["p"] = "16",
	["q"] = "17",
	["r"] = "18",
	["s"] = "19",
	["t"] = "20",
	["u"] = "21",
	["v"] = "22",
	["w"] = "23",
	["x"] = "24",
	["y"] = "25",
	["z"] = "26",
	["A"] = "27",
	["B"] = "28",
	["C"] = "29",
	["D"] = "30",
	["E"] = "31",
	["F"] = "32",
	["G"] = "33",
	["H"] = "34",
	["I"] = "35",
	["J"] = "36",
	["K"] = "37",
	["L"] = "38",
	["M"] = "39",
	["N"] = "40",
	["O"] = "41",
	["P"] = "42",
	["Q"] = "43",
	["R"] = "44",
	["S"] = "45",
	["T"] = "46",
	["U"] = "47",
	["V"] = "48",
	["W"] = "49",
	["X"] = "50",
	["Y"] = "51",
	["Z"] = "52",
	["_"] = "53",
	["1"] = "54",
	["2"] = "55",
	["3"] = "56",
	["4"] = "57",
	["5"] = "58",
	["6"] = "59",
	["7"] = "60",
	["8"] = "61",
	["9"] = "62",
	["0"] = "63",
	["-"] = "64",
}
local BytesChar = {
	["1"] = "a",
	["2"] = "b",
	["3"] = "c",
	["4"] = "d",
	["5"] = "e",
	["6"] = "f",
	["7"] = "g",
	["8"] = "h",
	["9"] = "i",
	["10"] = "j",
	["11"] = "k",
	["12"] = "l",
	["13"] = "m",
	["14"] = "n",
	["15"] = "o",
	["16"] = "p",
	["17"] = "q",
	["18"] = "r",
	["19"] = "s",
	["20"] = "t",
	["21"] = "u",
	["22"] = "v",
	["23"] = "w",
	["24"] = "x",
	["25"] = "y",
	["26"] = "z",
	["27"] = "A",
	["28"] = "B",
	["29"] = "C",
	["30"] = "D",
	["31"] = "E",
	["32"] = "F",
	["33"] = "G",
	["34"] = "H",
	["35"] = "I",
	["36"] = "J",
	["37"] = "K",
	["38"] = "L",
	["39"] = "M",
	["40"] = "N",
	["41"] = "O",
	["42"] = "P",
	["43"] = "Q",
	["44"] = "R",
	["45"] = "S",
	["46"] = "T",
	["47"] = "U",
	["48"] = "V",
	["49"] = "W",
	["50"] = "X",
	["51"] = "Y",
	["52"] = "Z",
	["53"] = "_",
	["54"] = "1",
	["55"] = "2",
	["56"] = "3",
	["57"] = "4",
	["58"] = "5",
	["59"] = "6",
	["60"] = "7",
	["61"] = "8",
	["62"] = "9",
	["63"] = "0",
	["64"] = "-",
}

getgenv()["IrisInit"] = {}
local Init = getgenv()["IrisInit"]

local Globals = {
	["LocalPlayer"] = game:GetService("Players").LocalPlayer,
	["CoreGui"] = game:GetService("CoreGui"),
	["StarterPack"] = game:GetService("StarterPack"),
	["Chat"] = game:GetService("Chat"),
	["HttpService"] = game:GetService("HttpService"),
	["Workspace"] = game:GetService("Workspace"),
	["StarterGui"] = game:GetService("StarterGui"),
	["TouchInputService"] = game:GetService("TouchInputService"),
	["ReplicatedFirst"] = game:GetService("ReplicatedFirst"),
	["Players"] = game:GetService("Players"),
	["NotificationService"] = game:GetService("NotificationService"),
	["AssetService"] = game:GetService("AssetService"),
	["Debris"] = game:GetService("Debris"),
	["Lighting"] = game:GetService("Lighting"),
	["RobloxReplicatedStorage"] = game:GetService("RobloxReplicatedStorage"),
	["TestService"] = game:GetService("TestService"),
	["Stats"] = game:GetService("Stats"),
	["NetworkClient"] = game:GetService("NetworkClient"),
	["MarketplaceService"] = game:GetService("MarketplaceService"),
	["VRService"] = game:GetService("VRService"),
	["InsertService"] = game:GetService("InsertService"),
	["StarterPlayer"] = game:GetService("StarterPlayer"),
	["SoundService"] = game:GetService("SoundService"),
	["LogService"] = game:GetService("LogService"),
	["Teams"] = game:GetService("Teams"),
	["TweenService"] = game:GetService("TweenService"),
	["ReplicatedStorage"] = game:GetService("ReplicatedStorage"),
	["TeleportService"] = game:GetService("TeleportService"),
}

Init["getlplayer"] = function(...)
	return game:GetService("Players").LocalPlayer
end

Init["writetable"] = function(...)
	local Args = { ... }
	local TableSupplied = Args[2]
	local FileSupplied = Args[1]

	assert(#Args == 2, "writetable: expected 2 arguments, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "string",
		"writetable: bad argument #1 to '?' (string expected, got " .. tostring(typeof(FileSupplied)) .. ")"
	)
	assert(
		typeof(Args[2]) == "table",
		"writetable: bad argument #2 to '?' (table expected, got " .. tostring(typeof(TableSupplied)) .. ")"
	)

	writefile(FileSupplied, "")

	local Success, Message = pcall(function()
		for index, Obj in pairs(TableSupplied) do
			local CurrText = readfile(FileSupplied)
			writefile(FileSupplied, CurrText .. tostring(index) .. " " .. tostring(Obj) .. "\n")
		end
	end)
	if not Success then
		error(Message)
	end
end

Init["appendfile"] = function(...)
	local Args = { ... }
	local ContentToWrite = Args[2]
	local FileSupplied = Args[1]

	assert(#Args == 2, "appendfile: expected 2 arguments, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "string",
		"appendfile: bad argument #1 to '?' (string expected, got " .. tostring(typeof(FileSupplied)) .. ")"
	)
	assert(
		typeof(Args[2]) == "string",
		"appendfile: bad argument #2 to '?' (string expected, got " .. tostring(typeof(ContentToWrite)) .. ")"
	)

	local Bll = pcall(function()
		return readfile(FileSupplied)
	end)
	if not Bll then
		writefile(FileSupplied, "")
	end

	local Success, Message = pcall(function()
		local CurrText = readfile(FileSupplied)
		writefile(FileSupplied, CurrText .. ContentToWrite .. "\n")
	end)
	if not Success then
		error(Message)
	end
end

Init["notify"] = function(...)
	local Args = { ... }
	for i, v in pairs(Args) do
		Args[i] = tostring(v)
	end
	assert(#{ ... } > 0, "notify: expected 1 or more arguments, received: " .. tostring(#Args))

	local Title = Args[1]
	local Text = table.concat(Args, " "):gsub(Title, "", 1)

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = tostring(Title),
		Text = Text,
		Duration = 5,
	})
end

Init["strreplace"] = function(...)
	local Args = { ... }

	assert(#Args == 3, "strreplace: expected 3 arguments, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "string",
		"strreplace: bad argument #1 to '?' (string expected, got " .. tostring(typeof(Args[1])) .. ")"
	)
	assert(
		typeof(Args[2]) == "string",
		"strreplace: bad argument #2 to '?' (string expected, got " .. tostring(typeof(Args[2])) .. ")"
	)
	assert(
		typeof(Args[3]) == "string",
		"strreplace: bad argument #3 to '?' (string expected, got " .. tostring(typeof(Args[3])) .. ")"
	)

	return string.gsub(Args[1], Args[2], Args[3])[0]
end

Init["tpto"] = function(...)
	local Args = { ... }
	local Pos = Args[1]

	assert(#Args == 1, "tpto: expected 1 argument, received: " .. tostring(#Args))

	if typeof(Pos) ~= "Vector3" then
		if typeof(Pos) ~= "CFrame" then
			local LPlayer = game:GetService("Players").LocalPlayer
			local Character = LPlayer.Character
			local RootPart = Character:FindFirstChild("HumanoidRootPart", true)

			if RootPart == nil then
				error("tpto: couldn't find HumanoidRootPart")
				return
			end

			RootPart.CFrame = Pos
			return
		end
		error("tpto: bad argument #1 to '?' (vector value expected, got " .. tostring(typeof(Pos)) .. ")")
		return
	end

	local LPlayer = game:GetService("Players").LocalPlayer
	local Character = LPlayer.Character
	local RootPart = Character:FindFirstChild("HumanoidRootPart", true)

	if RootPart == nil then
		error("tpto: couldn't find HumanoidRootPart")
		return
	end

	RootPart.CFrame = CFrame.new(Pos)
end

Init["randomstring"] = function(...)
	local Args = { ... }
	local OldType
	local Returned = ""
	local Alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

	assert(#Args == 1, "randomstring: expected 1 argument, received: " .. tostring(#Args))

	local Success, m = pcall(function()
		OldType = typeof(Args[1])
		Args[1] = tonumber(Args[1])
	end)

	assert(
		typeof(Args[1]) == "number" or not Success,
		"randomstring: bad argument #1 to '?' (number expected, got " .. OldType .. ")"
	)

	for i = 1, Args[1] do
		local CharIndex = math.random(0, 62)
		local Char = Alphabet:sub(CharIndex, CharIndex)
		Returned = Returned .. Char
	end

	return Returned
end

Init["getpos"] = function(...)
	local _, Pos = pcall(function()
		return tostring(game:GetService("Players").LocalPlayer.Character["Torso"].Position)
	end)
	return Pos
end

Init["isfile"] = function(...)
	local Args = { ... }

	assert(#Args == 1, "isfile: expected 1 argument, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "string",
		"isfile: bad argument #1 to '?' (string expected, got " .. tostring(typeof(Args[1])) .. ")"
	)

	local Success, Message = pcall(function()
		return readfile(Args[1])
	end)

	return Success
end

Init["executetime"] = function(...)
	local Args = { ... }

	assert(#Args < 3, "executetime: expected 2 or less arguments, received: " .. tostring(#Args))

	assert(
		typeof(Args[1]) == "string",
		"executetime: bad argument #1 to '?' (string expected, got " .. tostring(typeof(Args[1])) .. ")"
	)

	if Args[2] then
		assert(
			typeof(Args[2]) == "boolean",
			"executetime: bad argument #2 to '?' (boolean expected, got " .. tostring(typeof(Args[1])) .. ")"
		)
	end

	local Timer = tick()
	loadstring(Args[1])()
	local Final = tick() - Timer

	if Args[2] then
		return tostring(Final)
	else
		warn("Executed script took:", Final)
	end
end

Init["irisgetproperties"] = function(...)
	if (gethiddenproperties and getproperties) == nil then
		local a
		do
			a = {}
			local b = game
				:GetService("HttpService")
				:JSONDecode(game:HttpGet("https://anaminus.github.io/rbx/json/api/latest.json"))
			for c = 1, #b do
				local d = b[c]
				local e = d.type
				if e == "Class" then
					local f = {}
					local g = a[d.Superclass]
					if g then
						for h = 1, #g do
							f[h] = g[h]
						end
					end
					a[d.Name] = f
				elseif e == "Property" then
					if not next(d.tags) then
						local i = a[d.Class]
						local j = d.Name
						local k
						for h = 1, #i do
							if j < i[h] then
								k = true
								table.insert(i, h, j)
								break
							end
						end
						if not k then
							table.insert(i, j)
						end
					end
				elseif e == "Function" then
				elseif e == "YieldFunction" then
				elseif e == "Event" then
				elseif e == "Callback" then
				elseif e == "Enum" then
				elseif e == "EnumItem" then
				end
			end
		end

		local Args = { ... }
		local Output = {}

		assert(#Args == 1, "getproperties: expected 1 argument, received: " .. tostring(#Args))
		assert(
			typeof(Args[1]) == "Instance",
			"getproperties: bad argument #1 to '?' (Instance expected, got " .. tostring(typeof(Args[1])) .. ")"
		)

		local Data = a[Args[1].ClassName]

		for i, v in pairs(Data) do
			pcall(function()
				Output[tostring(v)] = Args[1][v]
			end)
		end

		return Output
	else
		local Args = { ... }
		assert(#Args == 1, "getproperties: expected 1 argument, received: " .. tostring(#Args))
		assert(
			typeof(Args[1]) == "Instance",
			"getproperties: bad argument #1 to '?' (Instance expected, got " .. tostring(typeof(Args[1])) .. ")"
		)

		local Properties = {}
		local function CheckBoolStatus(Property)
			if Property:match("false") then
				return false
			elseif Property:match("true") then
				return true
			else
				return Property
			end
		end

		for i, v in pairs(getproperties(Args[1])) do
			local Success, Error = pcall(function()
				Properties[v] = CheckBoolStatus(tostring(gethiddenproperty(Args[1], tostring(v))))
			end)
			if not Success then
				Properties[v] = "false"
			end
		end

		return Properties
	end
end

Init["isproperty"] = function(...)
	local Args = { ... }

	assert(#Args == 2, "isproperty: expected 2 arguments, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "Instance",
		"isproperty: bad argument #1 to '?' (Instance expected, got " .. tostring(typeof(Args[1])) .. ")"
	)
	assert(
		typeof(Args[2]) == "string",
		"isproperty: bad argument #2 to '?' (string expected, got " .. tostring(typeof(Args[2])) .. ")"
	)

	local Success, m = pcall(function()
		return Args[1][Args[2]]
	end)

	return Success
end

Init["irisencrypt"] = function(...)
	local a = { ... }
	if #a ~= 2 then
		return error("IrisEncrypt: exepected 2 argument, received: " .. #a)
	end
	local b, c = pcall(function()
		OldType = typeof(a[2])
		a[2] = tonumber(a[2])
	end)
	if typeof(a[2]) ~= "number" or not b then
		return error("IrisEncrypt: bad argument #2 to '?' (number expected, got " .. OldType .. ")")
	end
	if typeof(a[1]) ~= "string" then
		return error("IrisEncrypt: bad argument #1 to '?' (string expected, got " .. typeof(a[1]) .. ")")
	end
	local d = ""
	local e = a[2]
	local f = a[1]
	for g = 1, #f do
		local h = f:sub(g, g)
		local i = tonumber(CharBytes[h]) * e + e .. "\\"
		d = d .. i
	end
	return "\\" .. d
end

Init["irisdecrypt"] = function(...)
	local a = { ... }
	if #a ~= 2 then
		return error("IrisEncrypt: exepected 2 argument, received: " .. #a)
	end
	local b, c = pcall(function()
		OldType = typeof(a[2])
		a[2] = tonumber(a[2])
	end)
	if typeof(a[2]) ~= "number" or not b then
		return error("IrisEncrypt: bad argument #2 to '?' (number expected, got " .. OldType .. ")")
	end
	if typeof(a[1]) ~= "string" then
		return error("IrisEncrypt: bad argument #1 to '?' (string expected, got " .. typeof(a[1]) .. ")")
	end
	local d = a[1]
	local e = a[2]
	local f = ""
	local g = ""
	d = d:gsub("\\", "", 1)
	d = d:gsub("\\\\", "\\")
	while #d > 0 do
		g = string.match(d, "%d*")
		local h = tonumber(g) / e - string.find(d, g)
		d = string.gsub(d, g, "", 1)
		d = string.sub(d, 1, 1 - 1) .. "" .. string.sub(d, 1 + 1, -1)
		h = tostring(h):gsub("-", "")
		local i = BytesChar[tostring(h)]
		f = f .. i
	end
	return f
end

Init["irisdebug"] = function(...)
	local Args = { ... }
	local Time = ("%s:%s"):format(os.date("*t", now)["hour"], os.date("*t", now)["min"])

	assert(#Args == 2, "irisdebug: expected 2 arguments, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "string",
		"irisdebug: bad argument #1 to '?' (string expected, got " .. tostring(typeof(Args[1])) .. ")"
	)
	assert(
		typeof(Args[2]) == "boolean",
		"irisdebug: bad argument #2 to '?' (boolean expected, got " .. tostring(typeof(Args[2])) .. ")"
	)

	if Args[2] then
		appendfile("DEBUGDATA.log", "[DEBUG][" .. Time .. "]: " .. Args[1])
	end
	warn("[DEBUG][" .. Time .. "]:", Args[1])
end

Init["tweento"] = function(...)
	local Args = { ... }
	local Speed
	local Pos

	assert(#Args == 2, "tweento: expected 2 arguments, received: " .. tostring(#Args))
	assert(
		typeof(Args[1]) == "Vector3",
		"tweento: bad argument #1 to '?' (Vector3 expected, got " .. tostring(typeof(Args[1])) .. ")"
	)
	assert(
		typeof(Args[2]) == "number",
		"tweento: bad argument #2 to '?' (boolean expected, got " .. tostring(typeof(Args[2])) .. ")"
	)

	Speed = Args[2]
	Pos = Args[1]

	local x, m = pcall(function()
		local Tween = TweenInfo.new(
			(Pos - getlplayer().Character.HumanoidRootPart.Position).Magnitude / Speed,
			Enum.EasingStyle.Linear
		) -- Credits to Alpenidze @ V3rm for the idea and some of the code (Never used tween <3);

		game
			:GetService("TweenService")
			:Create(getlplayer().Character.HumanoidRootPart, Tween, { CFrame = CFrame.new(Pos) })
			:Play()
	end)

	if not x then
		irisdebug("Failed to tween: " .. m, false)
	end
end

Init["rejoin"] = function(...)
	local Args = { ... }

	assert(#Args == 0, "rejoin: expected 0 arguments, received: " .. tostring(#Args))

	TeleportService:Teleport(game.PlaceId, LocalPlayer)
end

Init["crash"] = function(...)
	local Args = { ... }

	assert(#Args == 0, "crash: expected 0 arguments, received: " .. tostring(#Args))

	pcall(function()
		if getgc and debug.getprotos then
			for Oop = 1, 100 do
				for i, v in pairs(getgc()) do
					if type(v) == "function" then
						pcall(function()
							for i, v in pairs(debug.getprotos(v)) do
								i = math.huge
								v = 2
							end
						end)
					end
				end
			end
		else
			error("crash: Missing required functions!")
		end
	end)
end

Init["printtable"] = function(...)
	local Args = { ... }

	assert(#Args == 1, "printtable: expected 1 arguments, received: " .. tostring(#Args))

	assert(
		typeof(Args[1]) == "table",
		"printtable: bad argument #1 to '?' (table expected, got " .. tostring(typeof(Args[1])) .. ")"
	)

	for i, v in pairs(Args[1]) do
		print(i, v)
	end
end

Init["getexploit"] = function(...)
	local Args = { ... }

	assert(#Args == 1, "getexploit: expected 1 arguments, received: " .. tostring(#Args))

	local EnvData = {
		["Sirhurt"] = function()
			local x = pcall(function()
				if
					getgenv()["LUAPROTECT"]
					or getgenv()["is_sirhurt_closure"]
					or (getgenv()["syn"]["sirhrut_syn"] and getgenv()["get_hidden_gui"])
					or (#getgenv()["gethwid"]() == 34)
					or getgenv()["RSA_PUBLICKEY_ENCRYPT"]
					or (getgenv()["syn"]["sirhurt_syn"] and getgenv()["BLOWFISH_ENCRYPT"] and getgenv()["BLOWFISH_DECRYPT"])
					or getgenv()["sirhurt_secure_run"]
					or (getgenv()["syn"]["sirhurt_syn"] and getgenv()["elysianexecute"] and getgenv()["is_protosmasher_caller"])
					or (
						game:GetService("HttpService"):JSONDecode(
							(syn.request or http_request or request)({ Url = "https://httpbin.org/get", Method = "GET" }).Body
						).headers["Exploit-Guid"] ~= nil
					)
				then
					return true
				else
					error("")
				end
			end)
			if not x then
				return false
			else
				return true
			end
		end,
		["Synapse"] = function()
			local x = pcall(function()
				if
					(getgenv()["getscripts"] and getgenv()["syn"])
					or (getgenv()["syn"] and getgenv()["iswindowactive"])
					or (getgenv()["syn"] and getgenv()["rconsoleprint"])
					or (getgenv()["syn"] and getgenv()["getspecialinfo"])
					or getgenv()["syn.crypt.encrypt"]
					or getgenv()["syn.crypt.derive"]
					or getgenv()["syn.crypt.random"]
					or getgenv()["syn.crypt.hash"]
					or getgenv()["syn.cache_replace"]
					or getgenv()["syn.is_cached"]
					or getgenv()["syn.is_beta"]
					or getgenv()["syn.create_secure_function"]
					or (
						#game:GetService("HttpService"):JSONDecode(
							(syn.request or http_request or request)({ Url = "https://httpbin.org/get", Method = "GET" }).Body
						).headers["Syn-Fingerprint"] ~= nil
					)
				then
					return true
				else
					error("")
				end
			end)
			if not x then
				return false
			else
				return true
			end
		end,
		["Sentinel"] = function()
			local x = pcall(function()
				if
					getgenv()["createdirectory"]
					or getgenv()["getinstancecachekey"]
					or getgenv()["issentinelclosure"]
					or (getgenv()["secure_create"] and getgenv()["secure_load"])
					or getgenv()["sentinelbuy"]
					or (
						game:GetService("HttpService"):JSONDecode(
							(syn.request or http_request or request)({ Url = "https://httpbin.org/get", Method = "GET" }).Body
						).headers["sentinel-fingerprint"] ~= nil
					)
				then
					return true
				else
					error("")
				end
			end)
			if not x then
				return false
			else
				return true
			end
		end,
		["ProtoSmasher"] = function()
			local x = pcall(function()
				if
					getgenv()["getscriptenvs"]
					or getgenv()["detour_function"]
					or getgenv()["load_instances_from_xml"]
					or getgenv()["is_network_owner"]
					or getgenv()["prot_execute"]
					or getgenv()["ask_prompt"]
					or (getgenv()["pebc_create"] and getgenv()["pebc_load"])
					or getgenv()["get_signal_cons"]
					or getgenv()["get_renderstep_list"]
					or getgenv()["protect_function"]
					or (getgenv()["is_protosmasher_caller"] and getgenv()["is_protosmasher_closure"] and not getgenv()["syn"])
					or (
						game:GetService("HttpService"):JSONDecode(
							(syn.request or http_request or request)({ Url = "https://httpbin.org/get", Method = "GET" }).Body
						).headers["proto-user-identifier"] ~= nil
					)
				then
					return true
				else
					error("")
				end
			end)
			if not x then
				return false
			else
				return true
			end
		end,
		["Elysian"] = function()
			return false
		end,
	}
	if EnvData["Sirhurt"] and EnvData["Synapse"] and EnvData["Sentinel"] and EnvData["ProtoSmasher"] then
		print("Is Sirhurt")
		return
	end
	for i, v in pairs(EnvData) do
		if i() then
			return i
		end
	end
end

Init["scriptwaresaveinstance"] = function(...)
	local Args = {}

	loadsaveinstance()

	if #Args > 0 then
		if typeof(Args[1]) == "table" then
			Args[2] = Args[1]
			Args[1] = game
			saveinstance(Args[1], Args[2])
		elseif Args[1] == game then
			saveinstance(Args[1])
		end
	else
		Args[1] = game
		saveinstance(Args[1])
	end
end

for Function, FuncData in pairs(Init) do
	getgenv()[Function] = FuncData
end

for Short, Loc in pairs(Globals) do
	getgenv()["IrisInit"][Short] = Loc
	getgenv()[Short] = Loc
end

if rawget(getgenv(), "syn") and rawget(getgenv().syn, "sirhurt_syn") then -- Love you lind <3
	getgenv()["syn"]["is_beta"] = function()
		return false
	end
	getgenv()["syn"]["get_thread_identity"] = getgenv()["getthreadidentity"]
	getgenv()["syn"]["request"] = getgenv()["http_request"]
	getgenv()["syn"]["protect_gui"] = getgenv()["gethiddengui"]
	getgenv()["syn"]["queue_on_teleport"] = getgenv()["queue_on_teleport"]
	getgenv()["syn"]["set_thread_identity"] = getgenv()["setthreadidentity"]
	getgenv()["syn"]["write_clipboard"] = getgenv()["syn"]["write_clipboard"]
end

warn([[Iris's Init has finished loading, Took: ]] .. tostring(tick() - Timer):sub(1, 14))
