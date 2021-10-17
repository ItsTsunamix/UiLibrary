# About

Hello, welcome to my respiratory, this is where all my ui libraries will be;

# MoonLibrary - Documentary

```Create(<string> Name)```

Creates the library, the "Name" parameter is the name of the library

```CreateTab(<string> Name)```

Creates a tab, the "Name" parameter is the name of the tab

```CreateButton(<string> Name, <void> Callback)```

Creates a button, "Name" parameter is the text of the button, "Callback" is what the function

```CreateToggle(<string> Name, <bool> Activated, <void> Callback)```

"Name" is the text of the toggle; if Activated is false, toggle color will be grey, if true it will be green

```CreateLabel(<string> Text)```

Creates a label, "Text" parameter is the text, pretty self explainatory

```CreateDropdown(<string> Name, <bool> CloseWhenClicked, <int>ZIndex)```

"Name" is the text of the dropdown, "CloseWhenClicked" simply closes the dropdown when an option has been clicked, and ZIndex is the ZIndex of the dropdown

```Dropdown:AddButton(<string> Name, <void> Callback)```

Unlike any dropdowns, I use a different method, exact same steps as creating a library, here is an example: 

```
local Dropdown = library:CreateDropdown("Dropdown", true, 1);
Dropdown:AddButton("Option", function()
  print("Clicked"); 
end);
```

# MoonLibrary - Other

Unfortunately, the dropdowns are probably one of the more buggy tools along with the toggles, if it's at the very bottom, it cuts off the options, placing at very top is best recommended, might find something to tackle this later, but for now place it at them very top;

I might add stuff to it later
