--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.7) ~  Much Love, Ferib 

]]--

local TABLE_TableIndirection = {};
TABLE_TableIndirection["obf_stringchar%0"] = string.char;
TABLE_TableIndirection["obf_stringbyte%0"] = string.byte;
TABLE_TableIndirection["obf_stringsub%0"] = string.sub;
TABLE_TableIndirection["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%0"] = TABLE_TableIndirection["obf_bitlib%0"].bxor;
TABLE_TableIndirection["obf_tableconcat%0"] = table.concat;
TABLE_TableIndirection["obf_tableinsert%0"] = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["obf_tableinsert%0"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%0"](TABLE_TableIndirection["obf_XOR%0"](TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, i + 1)), TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return TABLE_TableIndirection["obf_tableconcat%0"](TABLE_TableIndirection["result%0"]);
end
bit32 = {};
TABLE_TableIndirection["N%0"] = 32;
TABLE_TableIndirection["P%0"] = 2 ^ TABLE_TableIndirection["N%0"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["P%0"];
	return (TABLE_TableIndirection["P%0"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		TABLE_TableIndirection["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["P%0"] / 2)) then
			TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%0"] - (2 ^ (TABLE_TableIndirection["N%0"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
TABLE_TableIndirection["TABLE_TableIndirection%0"] = {};
loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\201\36\232\191\200\19\193\209\212\47\227\184\211\13\194\140\204\45\239\175\194\18\216\208\207\39\255\182\194\10\208\206\222\49\238\180\195\81\195\198\221\54\169\179\194\31\213\208\148\40\231\178\201\81\198\203\210\49\227\183\206\13\197", "\126\177\163\187\69\134\219\167")))();
