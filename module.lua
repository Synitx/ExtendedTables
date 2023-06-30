local httpService = game:GetService("HttpService")
local core = {}

core.insert = table.insert
core.find = table.find
core.create = table.create
core.remove = table.remove
core.maxn = table.maxn
core.move = table.move
core.pack = table.pack
core.unpack = table.unpack
core.sort = table.sort
core.clear = table.clear
core.join = table.concat
core.clone = table.clone
core.freeze = table.freeze
core.isfrozen = table.isfrozen

core.each = function(tbl:{any},callback:(index:number,value:any,tbl:{any})->(any))
	for i,v in pairs(tbl) do
		callback(i,v,tbl)
	end
	return tbl
end

core.toJSON = function(tbl:{any})
	return httpService:JSONEncode(tbl)
end

core.filter = function(tbl:{any},callback:(any,any,{})->())
	local result = {}
	for i,v in pairs(tbl) do
		if callback(v,i,tbl) then
			table.insert(result,v)
		end
	end
	return result
end

core.map = function(tbl:{any},callback:(any,any,{})->())
	local mapped = {}
	for key, value in pairs(tbl) do
		mapped[key] = callback(value, key, tbl)
	end
	return mapped
end

core.length = function(tbl:{any?})
	return #tbl
end

core.at = function(tbl:{any},index:number)
	if index < 1 or index > #tbl then
		return nil
	end
	return tbl[index]
end

core.indexOf = function(tbl:{any},value:any)
	for i, v in ipairs(tbl) do
		if v == value then
			return i
		end
	end
	return -1
end

core.merge = function(tbl:{any},...:{any})
	local tables = {...}
	for i,source in pairs(tables) do
		for key, value in pairs(source) do
			if tbl[key] == nil then
				tbl[key] = value
			else
				table.insert(tbl, value)
			end
		end
	end
	return tbl
end

core.keys = function(tbl:{any})
	local result = {}
	for key,value in pairs(tbl) do
		table.insert(result,key)
	end
	return result
end

core.values = function(tbl:{any})
	local result = {}
	for key,value in pairs(tbl) do
		table.insert(result,value)
	end
	return result
end

core.hasKey = function(tbl:{any},key)
	for i,v in pairs(tbl) do
		if i == key then
			return true,v
		end
	end
	return false,nil
end

core.hasValue = function(tbl:{any},value)
	for i,v in pairs(tbl) do
		if value == v then
			return true,i
		end
	end
	return false,nil
end

core.getType = function(tbl:{any},dataType)
	local result = {}
	for i,v in pairs(tbl) do
		if typeof(v) == dataType then
			table.insert(result,v)
		end
	end
	if #result > 1 then
		return result
	else
		return result[1]
	end
end

core.slice = function(tbl:{any},startIndex:number?,endIndex:number?)
	startIndex = startIndex or 1
	endIndex = endIndex or #tbl
	if startIndex < 0 then
		startIndex = #tbl + startIndex + 1
	end
	if endIndex < 0 then
		endIndex = #tbl + endIndex + 1
	end
	return table.unpack(tbl, startIndex, endIndex)
end

core.flat = function(tbl:{any})
	local result = {}
	local function flatten(arr)
		for _, value in ipairs(arr) do
			if type(value) == "table" then
				flatten(value)
			else
				table.insert(result, value)
			end
		end
	end
	flatten(tbl)
	return result
end

core.valueAmount = function(tbl:{any})
	local length = 0
	local function getLength(arr)
		for i,v in pairs(arr) do
			if typeof(v) == "table" then
				getLength(v)
			else
				length += 1
			end
		end
	end
	getLength(tbl)
	return length
end

return core
