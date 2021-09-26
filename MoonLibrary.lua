local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ItsTsunamix/UiLibrary/main/Moon.lua", true))();

local a = library:Create("Moon Library")
local b = a:CreateTab("First Tab")
local c = a:CreateTab("Second Tab")

b:CreateLabel("Moon Library made by TheProxide#6087")

b:CreateButton("Button", function()
	print("Hello World!")
end)

b:CreateToggle("Toggle", true, function(state)
	local bool = state
	print(bool)
end)

local dropdown = b:CreateDropdown("Dropdown")

dropdown:AddButton("Option 1", function()
	print("You clicked the first option")
end)

dropdown:AddButton("Option 2", function()
	print("You clicked the second option")
end)

dropdown:AddButton("Option 3", function()
	print("You clicked the third option")
end)

b:CreateLabel("Kinda useless, still cool though")

c:CreateLabel("Note: There are a few bugs, might add things soon")
