--[[
Written by Tsunamix/Proxide

Documentary can be found at: https://github.com/ItsTsunamix/UiLibrary/blob/main/Documentary.md
]]

local function dragify(Frame)
	local dragToggle = nil
	local dragSpeed = .25
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local startPos = nil

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

local library = {};

function library:Create(Name)
	Name = Name or "Moon"

	local Library = Instance.new("ScreenGui")
	local Descendant = Instance.new("Frame")
	local FirstBorder = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Main = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Line = Instance.new("Frame")
	local Tabs = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local Title = Instance.new("TextLabel")
	local left = Instance.new("Frame")
	local right = Instance.new("Frame")
	local top = Instance.new("Frame")
	local bottom = Instance.new("Frame")
	local Tabs_Frame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Library.Name = "Library"
	Library.Parent = game.CoreGui

	Descendant.Name = "Descendant"
	Descendant.Parent = Library
	Descendant.Active = true
	Descendant.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Descendant.BackgroundTransparency = 1.000
	Descendant.ClipsDescendants = true
	Descendant.Position = UDim2.new(0.290598303, 0, 0.270764112, 0)
	Descendant.Size = UDim2.new(0, 490, 0, 275)
	dragify(Descendant)

	FirstBorder.Name = "FirstBorder"
	FirstBorder.Parent = Descendant
	FirstBorder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	FirstBorder.Position = UDim2.new(-0.0367346928, 0, -0.0545454547, 0)
	FirstBorder.Size = UDim2.new(0, 525, 0, 305)

	UICorner.CornerRadius = UDim.new(0, 63)
	UICorner.Parent = FirstBorder

	Main.Name = "Main"
	Main.Parent = FirstBorder
	Main.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	Main.Position = UDim2.new(0.00999999978, 0, 0.0149999997, 0)
	Main.Size = UDim2.new(0, 515, 0, 295)

	UICorner_2.CornerRadius = UDim.new(0, 63)
	UICorner_2.Parent = Main

	Line.Name = "Line"
	Line.Parent = Main
	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0.0500000007, 0, 0.151999995, 0)
	Line.Size = UDim2.new(0, 80, 0, 1)

	Tabs.Name = "Tabs"
	Tabs.Parent = Main
	Tabs.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0.0504854359, 0, 0.254237294, 0)
	Tabs.Size = UDim2.new(0, 80, 0, 199)

	UICorner_3.CornerRadius = UDim.new(0, 3)
	UICorner_3.Parent = Tabs

	Tabs_Frame.Name = "Tabs_Frame"
	Tabs_Frame.Parent = Main
	Tabs_Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs_Frame.BackgroundTransparency = 1.000
	Tabs_Frame.Position = UDim2.new(0.223000005, 0, 0.0700000003, 0)
	Tabs_Frame.Size = UDim2.new(0, 378, 0, 253)
	Tabs_Frame.Visible = true

	ScrollingFrame.Parent = Tabs
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Size = UDim2.new(0, 80, 0, 199)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 2

	UIPadding.Parent = ScrollingFrame
	UIPadding.PaddingTop = UDim.new(0, 4)

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 2)
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		local AbsoluteSize = UIListLayout.AbsoluteContentSize;
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, AbsoluteSize.Y + 8);
	end);

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0599999987, 0, 0.074000001, 0)
	Title.Size = UDim2.new(0, 70, 0, 30)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = Name
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 15.000
	Title.TextWrapped = false

	left.Name = "left"
	left.Parent = FirstBorder
	left.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	left.BorderSizePixel = 0
	left.Position = UDim2.new(0.0362584852, 0, 0.073658824, 0)
	left.Size = UDim2.new(0, 5, 0, 261)

	right.Name = "right"
	right.Parent = FirstBorder
	right.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	right.BorderSizePixel = 0
	right.Position = UDim2.new(0.956258476, 0, 0.073658824, 0)
	right.Size = UDim2.new(0, 5, 0, 261)

	top.Name = "top"
	top.Parent = FirstBorder
	top.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	top.BorderSizePixel = 0
	top.Position = UDim2.new(0.0457822978, 0, 0.0507080071, 0)
	top.Size = UDim2.new(0, 478, 0, 6)

	bottom.Name = "bottom"
	bottom.Parent = FirstBorder
	bottom.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	bottom.BorderSizePixel = 0
	bottom.Position = UDim2.new(0.0460000001, 0, 0.935000002, 0)
	bottom.Size = UDim2.new(0, 478, 0, 4)

	local _Gui = {};

	function _Gui:CreateTab(Name)
		local Tab = Instance.new("TextButton")
		local UICorner_4 = Instance.new("UICorner")
		local ScrollingFrame_2 = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_2 = Instance.new("UIPadding")
		local Home_2 = Instance.new("Frame")
		local Tab_2 = Instance.new("Frame")
		local inner = Instance.new("Frame")
		local UICorner_6 = Instance.new("UICorner")
		local _TabName = Instance.new("TextLabel")

		Tab.Name = Name
		Tab.Parent = ScrollingFrame
		Tab.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
		Tab.Size = UDim2.new(0, 74, 0, 20)
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = Name
		Tab.TextColor3 = Color3.fromRGB(200, 200, 200)
		Tab.TextSize = 14.000

		UICorner_4.CornerRadius = UDim.new(0, 3)
		UICorner_4.Parent = Tab

		inner.Name = "inner"
		inner.Parent = Tab_2
		inner.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		inner.BorderSizePixel = 0
		inner.Position = UDim2.new(0.014005146, 0, 0.0976679474, 0)
		inner.Size = UDim2.new(0, 368, 0, 224)

		ScrollingFrame_2.Parent = inner
		ScrollingFrame_2.Active = true
		ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame_2.BackgroundTransparency = 1.000
		ScrollingFrame_2.BorderSizePixel = 0
		ScrollingFrame_2.Size = UDim2.new(0, 368, 0, 224)
		ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame_2.ScrollBarThickness = 5

		UIPadding_2.Parent = ScrollingFrame_2
		UIPadding_2.PaddingTop = UDim.new(0, 8)

		UIListLayout_2.Parent = ScrollingFrame_2
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)
		UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local AbsoluteSize = UIListLayout_2.AbsoluteContentSize;
			ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, AbsoluteSize.Y + 16);
		end);

		Tab_2.Name = Name
		Tab_2.Parent = Tabs_Frame
		Tab_2.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		Tab_2.BorderSizePixel = 0
		Tab_2.Size = UDim2.new(0, 378, 0, 253)
		Tab_2.Visible = false

		UICorner_6.CornerRadius = UDim.new(0, 3)
		UICorner_6.Parent = inner

		_TabName.Parent = Tab_2
		_TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		_TabName.BackgroundTransparency = 1.000
		_TabName.Position = UDim2.new(0.0158730168, 0, 0, 0)
		_TabName.Size = UDim2.new(0, 372, 0, 25)
		_TabName.Font = Enum.Font.SourceSans
		_TabName.Text = Name
		_TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
		_TabName.TextSize = 14.000
		_TabName.TextXAlignment = Enum.TextXAlignment.Left

		local tabbtns = ScrollingFrame;
		local tabsmain = Tabs_Frame;

		for i, v in next, tabbtns:GetChildren() do
			if v.ClassName == "TextButton" then
				v.MouseButton1Click:Connect(function()
					for _, k in next, tabsmain:GetChildren() do
						if k.Name == v.Name then
							k.Visible = true;
						else
							k.Visible = false;
						end;
					end;
					for _j, j in next, tabbtns:GetChildren() do
						if j.ClassName == "TextButton" then
							if j.Name ~= v.Name then
								j.BackgroundColor3 = Color3.fromRGB(33, 33, 33);
								j.TextColor3 = Color3.fromRGB(200, 200, 200);
								j.Font = "SourceSans";
							else
								j.BackgroundColor3 = Color3.fromRGB(37, 37, 37);
								j.TextColor3 = Color3.fromRGB(255, 255, 255);
								j.Font = "SourceSansBold";
							end;
						end;
					end;
				end);
			end;
		end;

		local _Tabs = {};

		function _Tabs:CreateButton(Name, Callback)

			local Button = Instance.new("TextButton")
			local UICorner_7 = Instance.new("UICorner")
			local Sample = Instance.new("ImageLabel")

			Button.Name = "Button"
			Button.Parent = ScrollingFrame_2
			Button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Button.ClipsDescendants = true
			Button.Position = UDim2.new(0.0244565215, 0, 0.111607142, 0)
			Button.Size = UDim2.new(0, 350, 0, 29)
			Button.Font = Enum.Font.SourceSansBold
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.Text = Name
			Button.MouseButton1Click:Connect(function()
				Callback()
			end)

			UICorner_7.CornerRadius = UDim.new(0, 4)
			UICorner_7.Parent = Button

			Sample.Name = "Sample"
			Sample.Parent = Button
			Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sample.BackgroundTransparency = 1.000
			Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
			Sample.ImageTransparency = 0.600

			Button.MouseButton1Click:Connect(function()
				local c = Sample:Clone()
				c.Parent = Button
				local x, y = (game.Players.LocalPlayer:GetMouse().X - c.AbsolutePosition.X), (game.Players.LocalPlayer:GetMouse().Y - c.AbsolutePosition.Y)
				c.Position = UDim2.new(0, x, 0, y)
				local len, size = 0.35, nil
				if Button.AbsoluteSize.X >= Button.AbsoluteSize.Y then
					size = (Button.AbsoluteSize.X * 1.5)
				else
					size = (Button.AbsoluteSize.Y * 1.5)
				end
				c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
				for i = 1, 10 do
					c.ImageTransparency = c.ImageTransparency + 0.05
					wait(len / 12)
				end
				c:Destroy()
			end)
		end

		function _Tabs:CreateToggle(Name, Activated, Callback)
			Activated = Activated or false;

			local Toggle = Instance.new("TextButton")
			local UICorner_8 = Instance.new("UICorner")
			local TextLabel_2 = Instance.new("TextLabel")
			local Sample_2 = Instance.new("ImageLabel")
			local Checked = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")

			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollingFrame_2
			Toggle.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Toggle.ClipsDescendants = true
			Toggle.Position = UDim2.new(0.0244565215, 0, 0.111607142, 0)
			Toggle.Size = UDim2.new(0, 350, 0, 29)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			local State = Activated
			local tween = game:GetService("TweenService")

			Toggle.MouseButton1Click:Connect(function()
				State = not State
				Callback(State)
				if State == true then
					tween:Create(Checked,TweenInfo.new(.2,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(0, 200, 255)}):Play()
					local c = Sample_2:Clone()
					c.Parent = Toggle
					local x, y = (game.Players.LocalPlayer:GetMouse().X - c.AbsolutePosition.X), (game.Players.LocalPlayer:GetMouse().Y - c.AbsolutePosition.Y)
					c.Position = UDim2.new(0, x, 0, y)
					local len, size = 0.35, nil
					if Toggle.AbsoluteSize.X >= Toggle.AbsoluteSize.Y then
						size = (Toggle.AbsoluteSize.X * 1.5)
					else
						size = (Toggle.AbsoluteSize.Y * 1.5)
					end
					c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
					for i = 1, 10 do
						c.ImageTransparency = c.ImageTransparency + 0.05
						wait(len / 12)
					end
					c:Destroy()
				else
					tween:Create(Checked,TweenInfo.new(.2,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(65, 65, 65)}):Play()
					local c = Sample_2:Clone()
					c.Parent = Toggle
					local x, y = (game.Players.LocalPlayer:GetMouse().X - c.AbsolutePosition.X), (game.Players.LocalPlayer:GetMouse().Y - c.AbsolutePosition.Y)
					c.Position = UDim2.new(0, x, 0, y)
					local len, size = 0.35, nil
					if Toggle.AbsoluteSize.X >= Toggle.AbsoluteSize.Y then
						size = (Toggle.AbsoluteSize.X * 1.5)
					else
						size = (Toggle.AbsoluteSize.Y * 1.5)
					end
					c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
					for i = 1, 10 do
						c.ImageTransparency = c.ImageTransparency + 0.05
						wait(len / 12)
					end
					c:Destroy()
				end
			end)

			UICorner_8.CornerRadius = UDim.new(0, 4)
			UICorner_8.Parent = Toggle

			TextLabel_2.Parent = Toggle
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.Position = UDim2.new(0.0199999996, 0, 0, 0)
			TextLabel_2.Size = UDim2.new(0, 307, 0, 29)
			TextLabel_2.Font = Enum.Font.SourceSans
			TextLabel_2.Text = Name
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextSize = 14.000
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

			Sample_2.Name = "Sample"
			Sample_2.Parent = Toggle
			Sample_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sample_2.BackgroundTransparency = 1.000
			Sample_2.Image = "http://www.roblox.com/asset/?id=4560909609"
			Sample_2.ImageTransparency = 0.600

			Checked.Name = "Checked"
			Checked.Parent = Toggle
			if State == false then
				Checked.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
			else
				Checked.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
			end
			Checked.Position = UDim2.new(0.916999996, 0, 0.207000002, 0)
			Checked.Size = UDim2.new(0, 18, 0, 18)

			UICorner_9.CornerRadius = UDim.new(0, 4)
			UICorner_9.Parent = Checked
		end
		
		function _Tabs:CreateLabel(_Text)
			local Text = Instance.new("TextLabel")
			local UICorner_12 = Instance.new("UICorner")
			
			Text.Parent = ScrollingFrame_2
			Text.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Text.Size = UDim2.new(0, 350, 0, 29)
			Text.Font = Enum.Font.SourceSans
			Text.Text = _Text
			Text.TextColor3 = Color3.fromRGB(255, 255, 255)
			Text.TextSize = 14.000

			UICorner_12.CornerRadius = UDim.new(0, 4)
			UICorner_12.Parent = Text
		end
		
		function _Tabs:CreateDropdown(Name, ClosesWhenClicked, ZIndex)
			ClosesWhenClicked = ClosesWhenClicked or false;
			ZIndex = ZIndex or 5;
			
			local _Dropdown = {}
			
			local Dropdown = Instance.new("TextButton")
			local UICorner_10 = Instance.new("UICorner")
			local TextLabel_3 = Instance.new("TextLabel")
			local arrow_drop_down = Instance.new("ImageButton")
			local DropdownContent = Instance.new("Frame")
			

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = ScrollingFrame_2
			Dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Dropdown.Position = UDim2.new(0.0244565215, 0, 0.111607142, 0)
			Dropdown.Size = UDim2.new(0, 350, 0, 29)
			Dropdown.Font = Enum.Font.SourceSans
			Dropdown.Text = ""
			Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.TextSize = 14.000

			UICorner_10.CornerRadius = UDim.new(0, 4)
			UICorner_10.Parent = Dropdown

			TextLabel_3.Parent = Dropdown
			TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_3.BackgroundTransparency = 1.000
			TextLabel_3.Position = UDim2.new(0.0199999996, 0, 0, 0)
			TextLabel_3.Size = UDim2.new(0, 307, 0, 29)
			TextLabel_3.Font = Enum.Font.SourceSans
			TextLabel_3.Text = Name
			TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_3.TextSize = 14.000
			TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

			arrow_drop_down.Name = "arrow_drop_down"
			arrow_drop_down.Parent = Dropdown
			arrow_drop_down.BackgroundTransparency = 1.000
			arrow_drop_down.LayoutOrder = 2
			arrow_drop_down.Position = UDim2.new(0.905714273, 0, 0.0689655095, 0)
			arrow_drop_down.Size = UDim2.new(0, 25, 0, 25)
			arrow_drop_down.Image = "rbxassetid://3926307971"
			arrow_drop_down.ImageColor3 = Color3.fromRGB(70, 70, 70)
			arrow_drop_down.ImageRectOffset = Vector2.new(324, 524)
			arrow_drop_down.ImageRectSize = Vector2.new(36, 36)

			DropdownContent.Name = "DropdownContent"
			DropdownContent.Parent = Dropdown
			DropdownContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownContent.BackgroundTransparency = 1.000
			DropdownContent.BorderSizePixel = 0
			DropdownContent.ClipsDescendants = true
			DropdownContent.Position = UDim2.new(0, 0, 0, 34)
			DropdownContent.Size = UDim2.new(1, 0, 0, 0)
			DropdownContent.ZIndex = ZIndex
			
			Dropdown.MouseButton1Click:Connect(function()
				local tween = game:GetService("TweenService")
				if DropdownContent.Size == UDim2.new(1,0,0,0) then    
					local sizenew = #DropdownContent:GetChildren()
					local tweenp = tween:Create(DropdownContent,TweenInfo.new(.65,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Size = UDim2.new(1,0,0,1000)})
					local tweenp2 = tween:Create(arrow_drop_down,TweenInfo.new(.45,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Rotation = 180})
					tweenp2:Play()
					tweenp:Play()
				else
					local tweenp = tween:Create(DropdownContent,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0,0)})
					local tweenp2 = tween:Create(arrow_drop_down,TweenInfo.new(.45,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation = 0})
					tweenp2:Play()
					tweenp:Play()
				end   
			end)
			
			function _Dropdown:AddButton(Name, Callback)

				local DropdownTop = Instance.new("Frame")
				local DropdownBottom = Instance.new("Frame")
				local UICorner_11 = Instance.new("UICorner")
				local DropdownButton = Instance.new("TextButton")
				local UIListLayout_3 = Instance.new("UIListLayout")
				local TextLabel_4 = Instance.new("TextLabel")
				local Sample_3 = Instance.new("ImageLabel")

				DropdownTop.Name = "DropdownTop"
				DropdownTop.Parent = DropdownContent
				DropdownTop.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				DropdownTop.BorderSizePixel = 0
				DropdownTop.Size = UDim2.new(0, 350, 0, 4)
				DropdownTop.ZIndex = ZIndex

				DropdownBottom.Name = "DropdownBottom"
				DropdownBottom.Parent = DropdownTop
				DropdownBottom.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				DropdownBottom.BorderSizePixel = 0
				DropdownBottom.Position = UDim2.new(0, 0, 3.25, 0)
				DropdownBottom.Size = UDim2.new(0, 350, 0, 12)
				DropdownBottom.ZIndex = ZIndex

				UICorner_11.CornerRadius = UDim.new(0, 7)
				UICorner_11.Parent = DropdownBottom

				DropdownButton.Name = "DropdownButton"
				DropdownButton.Parent = DropdownTop
				DropdownButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				DropdownButton.BorderSizePixel = 0
				DropdownButton.ClipsDescendants = true
				DropdownButton.Position = UDim2.new(0, 0, 1, 0)
				DropdownButton.Size = UDim2.new(0, 350, 0, 16)
				DropdownButton.ZIndex = ZIndex
				DropdownButton.Font = Enum.Font.SourceSans
				DropdownButton.Text = ""
				DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownButton.TextSize = 14.000
				
				UIListLayout_3.Parent = DropdownContent
				UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_3.Padding = UDim.new(0, 15)

				TextLabel_4.Parent = DropdownButton
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.Position = UDim2.new(0.0199999996, 0, 0, 0)
				TextLabel_4.Size = UDim2.new(0, 343, 0, 16)
				TextLabel_4.ZIndex = ZIndex
				TextLabel_4.Font = Enum.Font.SourceSans
				TextLabel_4.Text = Name
				TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.TextSize = 14.000
				TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

				Sample_3.Name = "Sample"
				Sample_3.Parent = DropdownButton
				Sample_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Sample_3.BackgroundTransparency = 1.000
				Sample_3.Image = "http://www.roblox.com/asset/?id=4560909609"
				Sample_3.ImageTransparency = 0.600
				Sample_3.ZIndex = ZIndex
				
				DropdownButton.MouseButton1Click:Connect(function()
					Callback()
					
					local tween = game:GetService("TweenService")
					if ClosesWhenClicked then    
						local tweenp = tween:Create(DropdownContent,TweenInfo.new(.5,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0,0)})
						local tweenp2 = tween:Create(arrow_drop_down,TweenInfo.new(.45,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation = 0})
						tweenp2:Play()
						tweenp:Play()
					else
						--;
					end

					local c = Sample_3:Clone()
					c.Parent = DropdownButton
					local x, y = (game.Players.LocalPlayer:GetMouse().X - c.AbsolutePosition.X), (game.Players.LocalPlayer:GetMouse().Y - c.AbsolutePosition.Y)
					c.Position = UDim2.new(0, x, 0, y)
					local len, size = 0.35, nil
					if DropdownButton.AbsoluteSize.X >= DropdownButton.AbsoluteSize.Y then
						size = (DropdownButton.AbsoluteSize.X * 1.5)
					else
						size = (DropdownButton.AbsoluteSize.Y * 1.5)
					end
					c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
					for i = 1, 10 do
						c.ImageTransparency = c.ImageTransparency + 0.05
						wait(len / 12)
					end
					c:Destroy()
				end)
				
			end
			return _Dropdown
		end
		return _Tabs
	end
	return _Gui
end
return library
