-- ALittle Generate Lua
module("ALittle", package.seeall)

local ___thispath = select('1', ...):match("(.+[/\\]).+$") or ""
local ___pairs = pairs
local ___ipairs = ipairs


IHeapTimer = Lua.Class(nil, "ALittle.IHeapTimer")

function IHeapTimer:Add(delay_ms, loop, interval_ms)
	return 0
end

function IHeapTimer:Remove(id)
	return false
end

function IHeapTimer:Update(ms)
end

function IHeapTimer:Poll()
	return 0
end
