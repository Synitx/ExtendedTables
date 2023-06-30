# ExtendedTables

## - Description -
ExtendedTables is a module that enhances the capabilities of tables with a collection of 16 powerful new functions. Inspired by the functionality of JavaScript Arrays, these functions empower you to perform advanced operations on tables effortlessly. Whether you need to manipulate, filter, or transform table data.

## -  Installation -
- Get the module from [here](https://www.roblox.com/library/13907455566/ExtendedTables)
- Import the module
```
local table = require(path.to.module)
```

## - Functions -
> `table.each(table:{any}, callback:(index,value,table) -> ())` 

Loop through a table.

Example:
```
local tbl = {"string", true, 123, Vector3.zero}
table.each(tbl, function(index,value,tbl) 
    print(index) -- 1
    print(value) -- "string"
    print(tbl) -- {"string", true, 123, Vector3.zero}
end)
```
---
> `table.toJSON(table:{})`

Return table in JSON string format.

---

>`table.filter(table:{any}, callback:(value,index,table)->())`

This method is used to create a new table with all elements that pass a certain condition. It takes a callback function as an argument, which is executed for each element in the table. The callback function should return `true` or `false` to indicate whether the element should be included in the new table.

[_`Read more about filters..`_](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)

Example:
```
local numbers = {1,2,3,4,5,6,7,8,9,10}
local evenNumbers = table.filter(numbers, function(value)
   return (value % 2) == 0
end)

print(evenNumbers) -- {2,4,6,8,10}
```
Another example:
```
local data = {
	{name="Roblox",cash=2155},
	{name="Synitx",cash=25815},
	{name="builderman",cash=98}
}
local filteredVal = table.filter(data,function(value)
	return value.name:lower() == "synitx"
end) -- Returns { {name="Synitx", cash=25815} }

local info = filteredVal[1]
print(`Name is {info.name} with cash {info.cash}`)
-- Name is Synitx with cash 25815
```
---
>`table.map(table:{any}, callback: (value,key,table) -> ())`

Returns a modified table.
[_`Read more about map..`_](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

Example:
```
local numbers = {1,2,3,4,5,6,7,8,9,10}
local doubled = table.map(numbers,function(value)
   return value * 2
end)

print(doubled) -- {2,4,6,8,10,12,14,16,18,20}
```
---
> `table.length(table:{any})`

Returns table length.

Example:
```
print( table.length( {1,2,3,4} ) ) -- 4
```
---

> `table.at(table:{any}, index:number)`

Returns the given index's value.

Example:
```
local dataTypes = {"string", true, 123, Vector3.zero}

print( table.at(dataTypes,2) ) --  true
print( table.at(dataTypes,3) ) --  123
```

---
>`table.indexOf(table:{any}, value:any)`

Returns the given value's index.

Example:
```
local dataTypes = {"string", true, 123, Vector3.zero}

print( table.indexOf(dataTypes, "string") ) --  1
```
---
>`table.merge(table:{any}, ... {any} )`

Merges table together.

Example:
```
local numbers = {1,2,3,4,5,6,7,8,9,10}
local a = {15251,26,66,7,{632,36,32,237,27,7,{3266,27,7,47}}}

print( table.merge( {a="string",b={true} }, numbers, a) )
```

[details="Output"]
![image|204x500](upload://6kFUkAmpxT8386PxkasN9k5LGG8.png)
[/details]

---
>`table.keys(table:{any})`

Displays all the keys in the given table.

Example:
```
local data = {
  ["Key1"] = true,
  ["Key2"] = {1,2,3},
  ["Key3"] = 123,
  ["Key4"] = "string"
}

print( table.keys(data) ) -- {"Key1", "Key2" .. etc}
```
---

> `table.values(table:{any})`

Displays all the values
```
local data = {
  ["Key1"] = true,
  ["Key2"] = {1,2,3},
  ["Key3"] = 123,
  ["Key4"] = "string"
}

print( table.values(data) ) -- {true, {1,2,3}, 123, "string"}
```
---

> `table.hasKey(table:{any}, key)`

Returns true/false with key's value.

Example:
```
local data = {
  ["Key1"] = true,
  ["Key2"] = {1,2,3},
  ["Key3"] = 123,
  ["Key4"] = "string"
}

local exists, value = table.hasKey(data, "Key3")
print(exists, value) -- true, 123
```

---

> `table.hasValue(table:{any}, value:any)`

Returns true/false with value's key.

Example:
```
local data = {
  ["Key1"] = true,
  ["Key2"] = {1,2,3},
  ["Key3"] = 123,
  ["Key4"] = "string"
}

local exists, key = table.hasValue(data, 123)
print(exists, key) -- true, "Key3"
```
---
>`table.getType(table:{any}, type)`

Returns values of a give type.
If value is more than 1 then it will return it in a table.

Example: 
```
local data = {
	["Key1"] = true,
	["Key2"] = {1,2,3},
	["Key3"] = 123,
	["Key4"] = "hi",
	["Key5"] = 596,
    ["Key6"] = false
}

print(table.getType(data,"number")) -- {123, 596}
print(table.getType(data,"boolean")) -- {true, false}
print(table.getType(data,"string")) -- hi
```

---

> `table.slice(table:{any}, startIndex:number?, endIndex:number?)`

Returns a specific portion of a table.
[_`Read more about slice..`_](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice)

Example:
```
local data = {
	"dog",
	"cat",
	"cow",
	"bird",
	"whale",
	"fish",
	"flamingo"
}

print(table.slice(data,3)) --  starts from index of 3 which is cow
-- output: {"cow","bird","whale","fish","flamingo"}

print(table.slice(data,3,4)) -- starts from index of 3 and ends at index 4
-- output: {"cow","bird"}
```

---

>`table.flat(table:{any})`

table.flat is a function that recursively flattens a table by merging its nested tables into a single level.

[_`Read more about flat..`_](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat)

Example:
```
local a = {15251,26,66,7,{632,36,32,237,27,7,{3266,27,7,47}}}
print( table.flat(a) )
```

[details="Output"]
![image|113x229](upload://wXcXOW6fZWKR7rXg7jCqHjsx8Pf.png)
[/details]

---

> `table.valueAmount(table:{})`

Returns total amount of values in a table (including nested tables)

Example:
```
local a = {15251,26,66,7,{632,36,32,237,27,7,{3266,27,7,47}}}
print( table.valueAmount(a) ) -- 14
```
