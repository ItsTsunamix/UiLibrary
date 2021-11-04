--Written by Proxide
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pandora37/UiLibrary/main/MoonLibrary.lua", true))();
-- //////////////////////////////////////////////////////////////////////
local libraryname = library:Create("Moon Library"); --name of lib

local main = libraryname:CreateTab("Features") --tab

main:CreateLabel("Library made by Tsunamix/Proxide") --creates a label

local dropdown = main:CreateDropdown("Dropdown", true, 2) --creates dropdown, if it's far down and gets cut off, you can use tabname:ExpandBy(<int> amount_to_expand)

dropdown:AddButton("Dropdown Option", function() --unlike any other libraries, moonlibrary uses another method to add dropdown options
	print("You clicked on the dropdown option.")
end)

dropdown:AddButton("Dropdown Option 2", function()
	print("You clicked on the second dropdown option.")
end)


main:CreateButton("Button", function() --creates a button
	print("Hello")
end)

main:CreateToggle("Toggle", true, function(ToggleState) --creates a toggle (MAKE SURE that "ToggleState" is a different name for each one, otherwise it will break)
	if ToggleState == true then
		print("Enabled.")
	else
		print("Disabled.")
	end
end)

main:CreateTextBox("TextBox", "Enter Text", true, function(Text) --1st param is the text by default, 2nd is placeholder, 3rd is if it resets text when clicked
	print("Player typed:", Text) --because the ClearOnFocus(3) parameter is false, whenever you click on the text box it won't reset the text
end)

main:CreateTextFunction("Textbox Function", "Text", "Text", true, function(amount) --1st param is the text, 2nd is the placeholder for the box, 3rd is the default text, 4th is if it clears when clicked
	print(amount)
end)


