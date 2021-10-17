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

Dropdowns have been updated and better than before; changes are:

+ 1 Parameter (CloseWhenClicked) a bool, true will close the dropdown when an option has been clicked
+ 1 Parameter (ZIndex) a integer; this is to solve the problem of dropdowns crossing over eachother.

I might add stuff to it later
