BloodlustMusicRemix = { };

--function to set the main table to default values
local function BloodlustSongObjectTableDefault()
	BloodlustSongObjectTable = {}
	for a, c in ipairs(BloodlustMusicRemix.DefaultSongTable) do
		BloodlustSongObjectTable[a] = BloodlustMusicRemix.DefaultSongTable[a]
	end

end

--function to set the friend table to the default value
local function BloodlustFavoredFriendTableDefault()
	BloodlustFavoredFriendTable = {}
	for a, c in ipairs(BloodlustMusicRemix.DefaultFavoredFriendTable) do
		BloodlustFavoredFriendTable[a] = BloodlustMusicRemix.DefaultFavoredFriendTable[a]
	end

end

--Creating a friendpanel to input changes to the friendlist
local function FriendPanelCreation()
	BloodlustMusicRemix.FriendPanel = CreateFrame("Frame", "FriendPanel", UIParent, "UIPanelDialogTemplate")
	BloodlustMusicRemix.FriendPanel.text = "Testing Friends"
	BloodlustMusicRemix.FriendPanel:SetSize(400, 400)
	BloodlustMusicRemix.FriendPanel:SetPoint("CENTER")
	BloodlustMusicRemix.FriendPanel:SetToplevel(true)
	BloodlustMusicRemix.FriendPanel:SetFrameStrata("DIALOG")
	BloodlustMusicRemix.FriendPanel:EnableMouse(true)
	BloodlustMusicRemix.FriendPanel:SetMovable(false)
	BloodlustMusicRemix.FriendPanel:Hide()

	BloodlustMusicRemix.FriendPanel.Maintext = BloodlustMusicRemix.FriendPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BloodlustMusicRemix.FriendPanel.Maintext:SetPoint("TOP", BloodlustMusicRemix.FriendPanel, "TOP", 0 , -9)
	BloodlustMusicRemix.FriendPanel.Maintext:SetText("Bloodlust Music Remix")

	BloodlustMusicRemix.FriendPanel.Nametext = BloodlustMusicRemix.FriendPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusicRemix.FriendPanel.Nametext:SetPoint("TOP", BloodlustMusicRemix.FriendPanel, "TOP", 0 , -40)
	BloodlustMusicRemix.FriendPanel.Nametext:SetText("Favored Friend Name: ")
	BloodlustMusicRemix.FriendPanel.Nametext:SetWordWrap(true)

	BloodlustMusicRemix.FriendPanel.NameEditbox = CreateFrame("EditBox", "FriendPanelNameEditbox", BloodlustMusicRemix.FriendPanel, "InputBoxTemplate")
	BloodlustMusicRemix.FriendPanel.NameEditbox:SetWidth(250)
	BloodlustMusicRemix.FriendPanel.NameEditbox:SetHeight(20)
	BloodlustMusicRemix.FriendPanel.NameEditbox:SetMaxLetters(50)

	BloodlustMusicRemix.FriendPanel.NameEditbox:SetPoint("TOP", BloodlustMusicRemix.FriendPanel.Nametext, "BOTTOM", 0 , -10)
	BloodlustMusicRemix.FriendPanel.NameEditbox:SetAutoFocus(false)
	BloodlustMusicRemix.FriendPanel.NameEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusicRemix.FriendPanel.Titletext = BloodlustMusicRemix.FriendPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusicRemix.FriendPanel.Titletext:SetPoint("TOP", BloodlustMusicRemix.FriendPanel.NameEditbox, "BOTTOM", 0 , -20)
	BloodlustMusicRemix.FriendPanel.Titletext:SetText("Favored Friend Song Title: ")
	BloodlustMusicRemix.FriendPanel.Titletext:SetWordWrap(true)

	BloodlustMusicRemix.FriendPanel.TitleEditbox = CreateFrame("EditBox", "FriendPanelTitleEditbox", BloodlustMusicRemix.FriendPanel, "InputBoxTemplate")
	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetWidth(250)
	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetHeight(20)
	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetMaxLetters(50)

	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetPoint("TOP", BloodlustMusicRemix.FriendPanel.Titletext, "BOTTOM", 0 , -10)
	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetAutoFocus(false)
	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusicRemix.FriendPanel.Pathtext = BloodlustMusicRemix.FriendPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusicRemix.FriendPanel.Pathtext:SetPoint("TOP", BloodlustMusicRemix.FriendPanel.TitleEditbox, "BOTTOM", 0, -20)
	BloodlustMusicRemix.FriendPanel.Pathtext:SetWidth(350)
	BloodlustMusicRemix.FriendPanel.Pathtext:SetText("Favored Friend filename: \n |cFFFFD100(NB: Needs filetype in the name, .ogg is most common. Also make sure the file for any custom song is in the 'customsongs' folder, not the 'sounds' folder)|r")
	BloodlustMusicRemix.FriendPanel.Pathtext:SetWordWrap(true)

	BloodlustMusicRemix.FriendPanel.PathEditbox = CreateFrame("EditBox", "FriendPanelPathEditbox", BloodlustMusicRemix.FriendPanel, "InputBoxTemplate")
	BloodlustMusicRemix.FriendPanel.PathEditbox:SetWidth(250)
	BloodlustMusicRemix.FriendPanel.PathEditbox:SetHeight(20)
	BloodlustMusicRemix.FriendPanel.PathEditbox:SetMaxLetters(50)

	BloodlustMusicRemix.FriendPanel.PathEditbox:SetPoint("TOP", BloodlustMusicRemix.FriendPanel.Pathtext, "BOTTOM", 0 , -10)
	BloodlustMusicRemix.FriendPanel.PathEditbox:SetAutoFocus(false)
	BloodlustMusicRemix.FriendPanel.PathEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusicRemix.FriendPanel.DefaultButton = CreateFrame("Button", "FriendPanelDefaultButton", BloodlustMusicRemix.FriendPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.FriendPanel.DefaultButton:SetText("Reset to Default")
	BloodlustMusicRemix.FriendPanel.DefaultButton:SetWidth(128)
	BloodlustMusicRemix.FriendPanel.DefaultButton:SetPoint("BOTTOM", BloodlustMusicRemix.FriendPanel, "BOTTOM", 0, 100)

	BloodlustMusicRemix.FriendPanel.AcceptButton = CreateFrame("Button", "FriendPanelAcceptButton", BloodlustMusicRemix.FriendPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.FriendPanel.AcceptButton:SetText("Accept")
	BloodlustMusicRemix.FriendPanel.AcceptButton:SetWidth(128)
	BloodlustMusicRemix.FriendPanel.AcceptButton:SetPoint("BOTTOMLEFT", BloodlustMusicRemix.FriendPanel, "BOTTOMLEFT", 30, 30)

	BloodlustMusicRemix.FriendPanel.CancelButton = CreateFrame("Button", "FriendPanelCancelButton", BloodlustMusicRemix.FriendPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.FriendPanel.CancelButton:SetText("Cancel")
	BloodlustMusicRemix.FriendPanel.CancelButton:SetWidth(128)
	BloodlustMusicRemix.FriendPanel.CancelButton:SetPoint("BOTTOMRIGHT", BloodlustMusicRemix.FriendPanel, "BOTTOMRIGHT", -30, 30)
	BloodlustMusicRemix.FriendPanel.CancelButton:SetScript("OnClick", function()
		BloodlustMusicRemix.FriendPanel:Hide()
	end)

end

--Creating the panel to input changes to songs, massive spaghetti
local function InputPanelCreation()
	BloodlustMusicRemix.InputPanel = CreateFrame("Frame", "InputPanel", UIParent, "UIPanelDialogTemplate")
	BloodlustMusicRemix.InputPanel.text = "Testing Input"
	BloodlustMusicRemix.InputPanel:SetSize(400, 400)
	BloodlustMusicRemix.InputPanel:SetPoint("CENTER")
	BloodlustMusicRemix.InputPanel:SetToplevel(true)
	BloodlustMusicRemix.InputPanel:SetFrameStrata("DIALOG")
	BloodlustMusicRemix.InputPanel:EnableMouse(true)
	BloodlustMusicRemix.InputPanel:SetMovable(false)
	BloodlustMusicRemix.InputPanel:Hide()

	BloodlustMusicRemix.InputPanel.Maintext = BloodlustMusicRemix.InputPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BloodlustMusicRemix.InputPanel.Maintext:SetPoint("TOP", BloodlustMusicRemix.InputPanel, "TOP", 0 , -9)
	BloodlustMusicRemix.InputPanel.Maintext:SetText("Bloodlust Music Remix")

	BloodlustMusicRemix.InputPanel.Titletext = BloodlustMusicRemix.InputPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusicRemix.InputPanel.Titletext:SetPoint("TOP", BloodlustMusicRemix.InputPanel, "TOP", 0 , -80)
	BloodlustMusicRemix.InputPanel.Titletext:SetText("Change Title to: ")
	BloodlustMusicRemix.InputPanel.Titletext:SetWordWrap(true)

	BloodlustMusicRemix.InputPanel.TitleEditbox = CreateFrame("EditBox", "InputPanelTitleEditbox", BloodlustMusicRemix.InputPanel, "InputBoxTemplate")
	BloodlustMusicRemix.InputPanel.TitleEditbox:SetWidth(250)
	BloodlustMusicRemix.InputPanel.TitleEditbox:SetHeight(20)
	BloodlustMusicRemix.InputPanel.TitleEditbox:SetMaxLetters(50)

	BloodlustMusicRemix.InputPanel.TitleEditbox:SetPoint("TOP", BloodlustMusicRemix.InputPanel.Titletext, "BOTTOM", 0 , -10)
	BloodlustMusicRemix.InputPanel.TitleEditbox:SetAutoFocus(false)
	BloodlustMusicRemix.InputPanel.TitleEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusicRemix.InputPanel.Pathtext = BloodlustMusicRemix.InputPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusicRemix.InputPanel.Pathtext:SetPoint("TOP", BloodlustMusicRemix.InputPanel.TitleEditbox, "BOTTOM", 0, -50)
	BloodlustMusicRemix.InputPanel.Pathtext:SetWidth(350)
	BloodlustMusicRemix.InputPanel.Pathtext:SetText("Change Song filename to: \n |cFFFFD100(NB: Needs filetype in the name, .ogg is most common. Also make sure the file for any custom song is in the 'customsongs' folder, not the 'sounds' folder)|r")
	BloodlustMusicRemix.InputPanel.Pathtext:SetWordWrap(true)

	BloodlustMusicRemix.InputPanel.PathEditbox = CreateFrame("EditBox", "InputPanelPathEditbox", BloodlustMusicRemix.InputPanel, "InputBoxTemplate")
	BloodlustMusicRemix.InputPanel.PathEditbox:SetWidth(250)
	BloodlustMusicRemix.InputPanel.PathEditbox:SetHeight(20)
	BloodlustMusicRemix.InputPanel.PathEditbox:SetMaxLetters(50)

	BloodlustMusicRemix.InputPanel.PathEditbox:SetPoint("TOP", BloodlustMusicRemix.InputPanel.Pathtext, "BOTTOM", 0 , -10)
	BloodlustMusicRemix.InputPanel.PathEditbox:SetAutoFocus(false)
	BloodlustMusicRemix.InputPanel.PathEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	BloodlustMusicRemix.InputPanel.DefaultButton = CreateFrame("Button", "InputPanelDefaultButton", BloodlustMusicRemix.InputPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.InputPanel.DefaultButton:SetText("Reset to Default")
	BloodlustMusicRemix.InputPanel.DefaultButton:SetWidth(128)
	BloodlustMusicRemix.InputPanel.DefaultButton:SetPoint("BOTTOM", BloodlustMusicRemix.InputPanel, "BOTTOM", 0, 100)

	BloodlustMusicRemix.InputPanel.AcceptButton = CreateFrame("Button", "InputPanelAcceptButton", BloodlustMusicRemix.InputPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.InputPanel.AcceptButton:SetText("Accept")
	BloodlustMusicRemix.InputPanel.AcceptButton:SetWidth(128)
	BloodlustMusicRemix.InputPanel.AcceptButton:SetPoint("BOTTOMLEFT", BloodlustMusicRemix.InputPanel, "BOTTOMLEFT", 30, 30)

	BloodlustMusicRemix.InputPanel.CancelButton = CreateFrame("Button", "InputPanelCancelButton", BloodlustMusicRemix.InputPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.InputPanel.CancelButton:SetText("Cancel")
	BloodlustMusicRemix.InputPanel.CancelButton:SetWidth(128)
	BloodlustMusicRemix.InputPanel.CancelButton:SetPoint("BOTTOMRIGHT", BloodlustMusicRemix.InputPanel, "BOTTOMRIGHT", -30, 30)
	BloodlustMusicRemix.InputPanel.CancelButton:SetScript("OnClick", function()
		BloodlustMusicRemix.InputPanel:Hide()
	end)

end

--creates a panel to confirm pending changes
local function ConfirmPanelCreation()
	BloodlustMusicRemix.ConfirmPanel = CreateFrame("Frame", "ConfirmPanel", UIParent, "UIPanelDialogTemplate")
	BloodlustMusicRemix.ConfirmPanel.text = "Testing Input"
	BloodlustMusicRemix.ConfirmPanel:SetSize(400, 400)
	BloodlustMusicRemix.ConfirmPanel:SetPoint("CENTER")
	BloodlustMusicRemix.ConfirmPanel:SetToplevel(true)
	BloodlustMusicRemix.ConfirmPanel:SetFrameStrata("DIALOG")
	BloodlustMusicRemix.ConfirmPanel:EnableMouse(true)
	BloodlustMusicRemix.ConfirmPanel:SetMovable(false)
	BloodlustMusicRemix.ConfirmPanel:Hide()

	BloodlustMusicRemix.ConfirmPanel.Maintext = BloodlustMusicRemix.ConfirmPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	BloodlustMusicRemix.ConfirmPanel.Maintext:SetPoint("TOP", BloodlustMusicRemix.ConfirmPanel, "TOP", 0 , -9)
	BloodlustMusicRemix.ConfirmPanel.Maintext:SetText("Bloodlust Music Remix")

	BloodlustMusicRemix.ConfirmPanel.Infotext = BloodlustMusicRemix.ConfirmPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	BloodlustMusicRemix.ConfirmPanel.Infotext:SetPoint("CENTER", 0, 50)
	BloodlustMusicRemix.ConfirmPanel.Infotext:SetWidth(300)
	BloodlustMusicRemix.ConfirmPanel.Infotext:SetNonSpaceWrap(true)

	BloodlustMusicRemix.ConfirmPanel.AcceptButton = CreateFrame("Button", "InputPanelAcceptButton", BloodlustMusicRemix.ConfirmPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetText("Accept")
	BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetWidth(128)
	BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetPoint("BOTTOMLEFT", BloodlustMusicRemix.ConfirmPanel, "BOTTOMLEFT", 30, 30)

	BloodlustMusicRemix.ConfirmPanel.CancelButton = CreateFrame("Button", "InputPanelCancelButton", BloodlustMusicRemix.ConfirmPanel, "UIPanelButtonTemplate")
	BloodlustMusicRemix.ConfirmPanel.CancelButton:SetText("Cancel")
	BloodlustMusicRemix.ConfirmPanel.CancelButton:SetWidth(128)
	BloodlustMusicRemix.ConfirmPanel.CancelButton:SetPoint("BOTTOMRIGHT", BloodlustMusicRemix.ConfirmPanel, "BOTTOMRIGHT", -30, 30)
	BloodlustMusicRemix.ConfirmPanel.CancelButton:SetScript("OnClick", function()
		BloodlustMusicRemix.ConfirmPanel:Hide()
	end)

end

--shows the Confirmpanel
local function ConfirmPanel(index, behaviour, text)
	BloodlustMusicRemix.ConfirmPanel:Hide()
	BloodlustMusicRemix.ConfirmPanel.Infotext:SetText(text)
	
	if behaviour == "Accept" then
		BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
			BloodlustSongObjectTable[index]["Title"] = tostring(BloodlustMusicRemix.InputPanel.TitleEditbox:GetText())
			BloodlustSongObjectTable[index]["Path"] = tostring(BloodlustMusicRemix.InputPanel.PathEditbox:GetText())
			BloodlustMusicRemixShowPanelAfterReload = true
			ReloadUI();
		end)
	elseif behaviour == "AcceptFriend" then
		BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
			BloodlustFavoredFriendTable[index]["Name"] = tostring(BloodlustMusicRemix.FriendPanel.NameEditbox:GetText())	
			BloodlustFavoredFriendTable[index]["Title"] = tostring(BloodlustMusicRemix.FriendPanel.TitleEditbox:GetText())
			BloodlustFavoredFriendTable[index]["Path"] = tostring(BloodlustMusicRemix.FriendPanel.PathEditbox:GetText())
			BloodlustFavoredFriendTable[index]["Enabled"] = true;
			BloodlustMusicRemixShowPanelAfterReload = true
			ReloadUI();
		end)		
	elseif behaviour == "Default" then
			BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
			BloodlustSongObjectTableDefault()
			BloodlustMusicRemixShowPanelAfterReload = true
			ReloadUI();
		end)
	elseif behaviour == "DefaultSong" then
		BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
			BloodlustSongObjectTable[index]["Title"] = BloodlustMusicRemix.DefaultSongTable[index]["Title"]
			BloodlustSongObjectTable[index]["Path"] = BloodlustMusicRemix.DefaultSongTable[index]["Path"]
			BloodlustSongObjectTable[index]["Enabled"] = BloodlustMusicRemix.DefaultSongTable[index]["Enabled"]
			BloodlustMusicRemixShowPanelAfterReload = true
			ReloadUI();
		end)
	elseif behaviour == "DefaultFriend" then
		BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
			BloodlustFavoredFriendTable[index]["Name"] = BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Name"]	
			BloodlustFavoredFriendTable[index]["Title"] = BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Title"]
			BloodlustFavoredFriendTable[index]["Path"] = BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Path"]
			BloodlustFavoredFriendTable[index]["Enabled"] = BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Enabled"]
			BloodlustMusicRemixShowPanelAfterReload = true
			ReloadUI();
		end)	
	elseif behaviour == "DefaultAllFriends" then
		BloodlustMusicRemix.ConfirmPanel.AcceptButton:SetScript("OnClick", function()
			BloodlustFavoredFriendTableDefault()
			BloodlustMusicRemixShowPanelAfterReload = true
			ReloadUI();
		end)		
	end

	BloodlustMusicRemix.ConfirmPanel:Show()
end

--shows the FriendPanel
local function FriendPanel(index)
	BloodlustMusicRemix.FriendPanel:Hide()

	BloodlustMusicRemix.FriendPanel.NameEditbox:SetText(BloodlustFavoredFriendTable[index]["Name"])
	BloodlustMusicRemix.FriendPanel.TitleEditbox:SetText(BloodlustFavoredFriendTable[index]["Title"])
	BloodlustMusicRemix.FriendPanel.PathEditbox:SetText(BloodlustFavoredFriendTable[index]["Path"])

	BloodlustMusicRemix.FriendPanel.DefaultButton:SetScript("OnClick", function()
		ConfirmPanel(index, "DefaultFriend", "\n \nThis will set this song back to its default, hard-coded values. \n \n|cFFFFD100'" .. BloodlustFavoredFriendTable[index]["Name"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Name"] .. "'|r \n \n \n|cFFFFD100'" .. BloodlustFavoredFriendTable[index]["Title"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Title"] .. "'|r \n \n \n|cFFFFD100'" .. BloodlustFavoredFriendTable[index]["Path"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusicRemix.DefaultFavoredFriendTable[index]["Path"] .. "'|r\n \n \n Accept and reload?")
	end)

	BloodlustMusicRemix.FriendPanel.AcceptButton:SetScript("OnClick", function()
		ConfirmPanel(index, "AcceptFriend", "\n \nPending changes: \n \n|cFFFFD100'" .. BloodlustFavoredFriendTable[index]["Name"] .. "'|r\n becomes \n|cFFFFD100'" .. tostring(BloodlustMusicRemix.FriendPanel.NameEditbox:GetText()) .. "'|r \n \n \n|cFFFFD100'" .. BloodlustFavoredFriendTable[index]["Title"] .. "'|r\n  becomes  \n|cFFFFD100'" .. tostring(BloodlustMusicRemix.FriendPanel.TitleEditbox:GetText()) .. "'|r \n \n \n|cFFFFD100'" .. BloodlustFavoredFriendTable[index]["Path"] .. "'|r\n  becomes  \n|cFFFFD100'" .. tostring(BloodlustMusicRemix.FriendPanel.PathEditbox:GetText()) .. "'|r\n \n \n Accept and reload?")
	end)

	BloodlustMusicRemix.FriendPanel:Show()
end



--shows the InputPanel
local function InputPanel(index)
	BloodlustMusicRemix.InputPanel:Hide()

	BloodlustMusicRemix.InputPanel.TitleEditbox:SetText(BloodlustSongObjectTable[index]["Title"])
	BloodlustMusicRemix.InputPanel.PathEditbox:SetText(BloodlustSongObjectTable[index]["Path"])

	BloodlustMusicRemix.InputPanel.DefaultButton:SetScript("OnClick", function()
		ConfirmPanel(index, "DefaultSong", "This will set this song back to its default, hard-coded values. \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Title"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusicRemix.DefaultSongTable[index]["Title"] .. "'|r \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Path"] .. "'|r\n turns back to \n|cFFFFD100'" .. BloodlustMusicRemix.DefaultSongTable[index]["Path"] .. "'|r\n \n \n Accept and reload?")
	end)

	BloodlustMusicRemix.InputPanel.AcceptButton:SetScript("OnClick", function()
		ConfirmPanel(index, "Accept", "Pending changes: \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Title"] .. "'|r\n becomes \n|cFFFFD100'" .. tostring(BloodlustMusicRemix.InputPanel.TitleEditbox:GetText()) .. "'|r \n \n \n|cFFFFD100'" .. BloodlustSongObjectTable[index]["Path"] .. "'|r\n  becomes  \n|cFFFFD100'" .. tostring(BloodlustMusicRemix.InputPanel.PathEditbox:GetText()) .. "'|r\n \n \n Accept and reload?")
	end)

	BloodlustMusicRemix.InputPanel:Show()
end


--massive spaghetti function to create the interface panel
local function PanelCreation()
	local SongEditButtonWidth = 35
	local scrollbarIndent = 35
	local scrollbarOffset = scrollbarIndent + 20

	--Creating the Scrollframe and Scrollchild
	BloodlustMusicRemix.panel.scrollFrame = CreateFrame("ScrollFrame", "BloodlustMusicRemixScrollFrame", BloodlustMusicRemix.panel, "UIPanelScrollFrameTemplate");
	Mixin(BloodlustMusicRemix.panel.scrollFrame, BackdropTemplateMixin)
	BloodlustMusicRemix.panel.scrollFrame:SetPoint("TOPLEFT", 0, -5 );
    BloodlustMusicRemix.panel.scrollFrame:SetPoint("BOTTOMRIGHT", -scrollbarIndent, 5);
	BloodlustMusicRemix.panel.scrollFrame:SetSize(BloodlustMusicRemix.panel:GetWidth(), BloodlustMusicRemix.panel:GetHeight());
	BloodlustMusicRemix.panel.scrollFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
												edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
												tile = true, tileSize = 16, edgeSize = 1,
												insets = { left = 4, right = -30, top = 0, bottom = -1 }});
	BloodlustMusicRemix.panel.scrollFrame:SetBackdropColor(0,0,0,0.5);

	BloodlustMusicRemix.panel.scrollFrame.scrollbar = _G["BloodlustMusicRemixScrollFrame".."ScrollBar"];
	Mixin(BloodlustMusicRemix.panel.scrollFrame.scrollbar, BackdropTemplateMixin)
	BloodlustMusicRemix.panel.scrollFrame.scrollbar:SetWidth(22)
	BloodlustMusicRemix.panel.scrollFrame.scrollbar:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
														  edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
														  tile = true, tileSize = 16, edgeSize = 10,
														  insets = { left = 1, right = 1, top = 2, bottom = 2 }});
	BloodlustMusicRemix.panel.scrollFrame.scrollbar:SetBackdropColor(0,0,0,1)


    BloodlustMusicRemix.panel.scrollChild = CreateFrame("Frame", "BloodlustMusicRemixScrollChild", BloodlustMusicRemix.panel.scrollFrame);
	BloodlustMusicRemix.panel.scrollFrame:SetScrollChild(BloodlustMusicRemix.panel.scrollChild);
	BloodlustMusicRemix.panel.scrollChild:SetSize(BloodlustMusicRemix.panel.scrollFrame:GetWidth(), (BloodlustMusicRemix.panel.scrollFrame:GetHeight() * 3.15 ));


	--Titles and descriptions
    local BloodlustTitle = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    BloodlustTitle:SetPoint("TOPLEFT", 16, -16)
    BloodlustTitle:SetText("Bloodlust Music Remix")

    local BloodlustSubtitle = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    BloodlustSubtitle:SetPoint("TOPLEFT", BloodlustTitle, "RIGHT", 5, 3)
    BloodlustSubtitle:SetText("Version 1.0.0 (patch 11.1.0)")

	local BloodlustDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -8)
	BloodlustDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustDescription:SetJustifyH("LEFT")
	BloodlustDescription:SetText("A stupid Addon to play music during Hero, Bloodlust, Primal Rage, etc. You can change a couple of settings below to your liking. Some barebones information is provided next to the corresponding option. For a more in depth explanation, please refer to the description of the addon at: https://www.curseforge.com/wow/addons/BloodlustMusicRemix . Thanks and enjoy!")


	--Volume Slider during Hero
	local BloodlustSliderDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSliderDescription:SetPoint("TOPLEFT", BloodlustTitle, "BOTTOMLEFT", 0, -180)
	BloodlustSliderDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSliderDescription:SetJustifyH("LEFT")
	BloodlustSliderDescription:SetText("Use the Slider menu below to set how loud the music during Hero should be. Don't want the volume raised? Enter a number lower or equal to your current volume for your soundchannel. You can view this under Main menu -> System -> Sound.")
	
	local BloodlustSlider = CreateFrame("Slider", "BloodlustSliderGlobalName", BloodlustMusicRemix.panel.scrollChild, "OptionsSliderTemplate")
	BloodlustSlider:SetPoint("TOPLEFT", BloodlustSliderDescription, "BOTTOMLEFT", 10, -35)
	BloodlustSlider:SetMinMaxValues(0, 1)
    BloodlustSlider:SetValueStep(0.1)
	BloodlustSlider:SetObeyStepOnDrag(true)
	BloodlustSlider:SetOrientation('HORIZONTAL')
	BloodlustSlider.text = _G[BloodlustSlider:GetName() .. "Text"]
    BloodlustSlider.low = _G[BloodlustSlider:GetName() .. "Low"]
    BloodlustSlider.high = _G[BloodlustSlider:GetName() .. "High"]

    BloodlustSlider.text:SetText(math.floor(BloodlustChannelVolume*100) .. "%")
	BloodlustSlider:SetValue(BloodlustChannelVolume)
    BloodlustSlider.low:SetText("0%")
    BloodlustSlider.high:SetText("100%")
	BloodlustSlider.tooltipText = "Volume of " .. BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber] .. " soundchannel during Hero"
	BloodlustSlider:SetScript("OnValueChanged", function(self,event,arg1)
		BloodlustChannelVolume = math.floor(BloodlustSlider:GetValue()*100)/100
		BloodlustSlider.text:SetText(math.floor(BloodlustChannelVolume*100) .. "%")

	end)
	BloodlustSlider:Show()

	local BloodlustSliderLabel = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustSliderLabel:SetPoint("LEFT", BloodlustSlider, "TOPLEFT", -1.5, 20)
    BloodlustSliderLabel:SetNonSpaceWrap(true)
	BloodlustSliderLabel:SetText(BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber] .. " volume during Hero")


	--Dropdown to select Soundchannel
	local BloodlustDropdownDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustDropdownDescription:SetPoint("TOPLEFT", BloodlustDescription, "BOTTOMLEFT", 0, -30)
	BloodlustDropdownDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustDropdownDescription:SetJustifyH("LEFT")
	BloodlustDropdownDescription:SetText("Use the Dropdown menu below to set what soundchannel you want Hero to play on. Unsure? Dialog is recommended, Master is more fun.")

	local BloodlustDropdown = CreateFrame("FRAME", "BloodlustDropdown", BloodlustMusicRemix.panel.scrollChild, "UIDropDownMenuTemplate")
	BloodlustDropdown:SetPoint("TOPLEFT", BloodlustDropdownDescription, "BOTTOMLEFT", -10, -20)
	UIDropDownMenu_SetWidth(BloodlustDropdown, 200)
	UIDropDownMenu_SetText(BloodlustDropdown, "Current soundchannel: " .. BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber])

	UIDropDownMenu_Initialize(BloodlustDropdown, function(self, level, menuList)
		local info = UIDropDownMenu_CreateInfo()
		if (level or 1) == 1 then
			for a, c in ipairs(BloodlustMusicRemix.soundChannelTable) do
				info.text = BloodlustMusicRemix.soundChannelNames[a]
				info.func = self.SetValue
				info.arg1, info.checked = a, a == BloodlustSoundchannelNumber
				UIDropDownMenu_AddButton(info)
			end
		end
	end)

	function BloodlustDropdown:SetValue(newValue)
		if(BloodlustMusicRemix.isSongPlaying) then
			print(BloodlustMusicRemix.announcerHeader .. "Changing soundchannel prevented, please do so after hero has ended")
			CloseDropDownMenus()
		else
			BloodlustSoundchannelNumber = newValue
			UIDropDownMenu_SetText(BloodlustDropdown, "Current soundchannel: " .. BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber])
			print(BloodlustMusicRemix.announcerHeader .. "Soundchannel changed to: " .. BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber])
			BloodlustVolumecache = tonumber(GetCVar(BloodlustMusicRemix.soundVolumeTable[BloodlustSoundchannelNumber]))
			BloodlustSlider.tooltipText = "Volume of " .. BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber] .. " soundchannel during Hero"
			BloodlustSliderLabel:SetText(BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber] .. " volume during Hero")
			CloseDropDownMenus()
		end
	end

	local BloodlustDropDownLabel = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    BloodlustDropDownLabel:SetPoint("LEFT", BloodlustDropdown, "TOPLEFT", 20, 7)
    BloodlustDropDownLabel:SetNonSpaceWrap(true)
	BloodlustDropDownLabel:SetText("Sound Channel")


	--Checkbox to increase the # of allowed sounds or "soundchannels"
	local BloodlustMaxSoundchannelDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustMaxSoundchannelDescription:SetPoint("TOPLEFT", BloodlustSlider, "BOTTOMLEFT", -10, -20)
	BloodlustMaxSoundchannelDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustMaxSoundchannelDescription:SetJustifyH("LEFT")
	BloodlustMaxSoundchannelDescription:SetText("Sometimes the music will cut out if stuff gets too busy. You can try to prevent this by checking the box below. This will make sure WoW can play more sounds at the same time, by upping the number of allowed soundchannels. Afterwards it will put it back to normal levels. Highly recommended to check the addon description for more info.")

	local MaxSoundchannelCheckbox = CreateFrame("CheckButton", "MaxSoundchannelCheckbox", BloodlustMusicRemix.panel.scrollChild, "UICheckButtonTemplate")
	MaxSoundchannelCheckbox:SetPoint("TOPLEFT", BloodlustMaxSoundchannelDescription, "BOTTOMLEFT", -0, -10)
	MaxSoundchannelCheckbox:SetSize(27, 27)
	MaxSoundchannelCheckbox.text:SetFontObject("GameFontNormal")
	MaxSoundchannelCheckbox.text:SetText("Set Max number of soundchannels during Hero to 128?")
	MaxSoundchannelCheckbox.text:SetTextColor(1, 1, 1, 1)
	if (getglobal("MaxSoundchannelCheckbox"):GetChecked() ~= BloodlustMaxSoundchannelBoolean) then
		getglobal("MaxSoundchannelCheckbox"):SetChecked(BloodlustMaxSoundchannelBoolean);
	end
	MaxSoundchannelCheckbox:SetScript("OnClick", function(self,event,arg1)
		if (self:GetChecked()) then
			BloodlustMaxSoundchannelBoolean = true;
		else
			BloodlustMaxSoundchannelBoolean = false;
		end
	end)


	--Button to reset sound levels
	local BloodlustSoundResetDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSoundResetDescription:SetPoint("TOPLEFT", MaxSoundchannelCheckbox, "BOTTOMLEFT", 0, -15)
	BloodlustSoundResetDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSoundResetDescription:SetJustifyH("LEFT")
	BloodlustSoundResetDescription:SetText("Sound not reset properly after Hero? Try setting your in-game volume at Main Menu -> System -> Sound to your preferred normal level, then click the button below.")

	local SoundResetButton = CreateFrame("Button","SoundResetButton", BloodlustMusicRemix.panel.scrollChild,"UIPanelButtonTemplate")
	SoundResetButton:SetWidth(128)
	SoundResetButton:SetPoint("TOPLEFT", BloodlustSoundResetDescription, "BOTTOMLEFT", 0, -8)
	SoundResetButton.text = _G["SoundResetButton".."Text"]
	SoundResetButton:SetText("Sound Reset")
	SoundResetButton:SetScript("OnClick", function(self, arg1)
		if (BloodlustMusicRemix.isSongPlaying) then
			print(BloodlustMusicRemix.announcerHeader .. "Resetting prevented, please try again after Hero has ended")
		else
			BloodlustSoundchannelscache = GetCVar("Sound_NumChannels")
			BloodlustVolumecache = tonumber(GetCVar(BloodlustMusicRemix.soundVolumeTable[BloodlustSoundchannelNumber]))
			print(BloodlustMusicRemix.announcerHeader .. "Regular volume level for "  .. BloodlustMusicRemix.soundChannelNames[BloodlustSoundchannelNumber] .. " is now set to: " .. math.floor(BloodlustVolumecache*100) .. "%")
		end
	end)


	--Button to test a song
	local TestingPlayButtonDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    TestingPlayButtonDescription:SetPoint("TOPLEFT", SoundResetButton, "BOTTOMLEFT", 0, -15)
	TestingPlayButtonDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	TestingPlayButtonDescription:SetJustifyH("LEFT")
	TestingPlayButtonDescription:SetText("Everything set? Press the button below for a 10 second test song. Enter a number between 1 and 60 to test a specific song. Want a random one? Leave it empty or place a 0. Please note: no other songs can play at the same time.")

	local TestingPlayButtonEditbox = CreateFrame("EditBox", "InputBoxTemplateTest", BloodlustMusicRemix.panel.scrollChild, "InputBoxTemplate")
	TestingPlayButtonEditbox:SetWidth(30)
	TestingPlayButtonEditbox:SetHeight(20)
	TestingPlayButtonEditbox:SetPoint("TOPLEFT", TestingPlayButtonDescription, "BOTTOMLEFT", 140 , -15.5)
	TestingPlayButtonEditbox:SetAutoFocus(false)
	TestingPlayButtonEditbox:SetCursorPosition(0)
	TestingPlayButtonEditbox:SetNumeric(true)
	TestingPlayButtonEditbox:SetMaxLetters(2)
	TestingPlayButtonEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
	end);

	local TestingPlayButton = CreateFrame("Button","TestingPlayButton", BloodlustMusicRemix.panel.scrollChild,"UIPanelButtonTemplate")
	TestingPlayButton:SetWidth(128)
	TestingPlayButton:SetPoint("TOPLEFT", TestingPlayButtonDescription, "BOTTOMLEFT", 0, -15)
	TestingPlayButton.text = _G["TestingPlayButton".."Text"]
	TestingPlayButton:SetText("Play a test song")
	TestingPlayButton:SetScript("OnClick", function(self, arg1)
		if (BloodlustMusicRemix.isSongPlaying) then
			print(BloodlustMusicRemix.announcerHeader .. "Song test prevented. A song is already playing.")
		elseif(BloodlustMusicRemixMute) then
			print(BloodlustMusicRemix.announcerHeader .. "Song test prevented. BloodlustMusicRemix is currently muted.")
		else
			print(BloodlustMusicRemix.announcerHeader .. "Test song started");
			SongPlayerPrimer(BloodlustMusicRemix.currentSongSpellID, TestingPlayButtonEditbox:GetNumber(), 0)
			C_Timer.After(10, function() -- wait a bit
				StopSong(false)
			print(BloodlustMusicRemix.announcerHeader .. "Test song stopped")
			end)
		end
	end)


	--Description for song list
	local BloodlustSongListButtonDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    BloodlustSongListButtonDescription:SetPoint("TOPLEFT", TestingPlayButton, "BOTTOMLEFT", 0, -15)
	BloodlustSongListButtonDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	BloodlustSongListButtonDescription:SetJustifyH("LEFT")
	BloodlustSongListButtonDescription:SetText("Want to customise what songs you hear? Below you can tick the boxes to turn individual songs on or off. You can press the edit button to change the names and change the song file itself. This way you can introduce your own custom songs without digging in the code.\n \nMessed up? Each edit button has a default button. Messed up a lot? At the bottom you'll see a button to put all songs back to their hard-coded values.\n\nFor more info on the whole process, please visit the addon site.")

	--Dummy table for variable purposes
	local SongCheckboxes = { };
	for a, c in ipairs(BloodlustSongObjectTable) do
		SongCheckboxes[a] = "Checkbox" ..a
	end

	--Creates a checkbox for every song
	for a,c in ipairs(SongCheckboxes) do
		SongCheckboxes[a] = CreateFrame("CheckButton", "SongCheckbox ".. a, BloodlustMusicRemix.panel.scrollChild, "UICheckButtonTemplate")
		if (a == 1) then
			SongCheckboxes[a]:SetPoint("TOPLEFT", BloodlustSongListButtonDescription, "BOTTOMLEFT", -10, -15)
		elseif (a == (tostring(math.ceil(table.getn(BloodlustSongObjectTable)/2))+1)) then
			SongCheckboxes[a]:SetPoint("LEFT", SongCheckboxes[1].text, "RIGHT", SongEditButtonWidth, 1.5)
		else
			SongCheckboxes[a]:SetPoint("TOPLEFT", SongCheckboxes[a-1].text, "BOTTOMLEFT", -30, (-10))
		end

		SongCheckboxes[a].text:SetFontObject("GameFontHighlight")
		SongCheckboxes[a].text:SetText(a .. ". " .. BloodlustSongObjectTable[a]["Title"])
		SongCheckboxes[a].text:SetWidth((BloodlustMusicRemix.panel.scrollChild:GetWidth()/2) - scrollbarOffset - SongEditButtonWidth)
		SongCheckboxes[a].text:SetHeight(30)
		SongCheckboxes[a].text:SetJustifyH("LEFT")
		SongCheckboxes[a].text:SetWordWrap(true)
		SongCheckboxes[a].text:SetNonSpaceWrap(true)

		if (getglobal("SongCheckbox "..a):GetChecked() ~= BloodlustSongObjectTable[a]["Enabled"]) then
			getglobal("SongCheckbox "..a):SetChecked(BloodlustSongObjectTable[a]["Enabled"]);
		end

		SongCheckboxes[a]:SetScript("OnClick", function(self,event,arg1)
			if (self:GetChecked()) then
				BloodlustSongObjectTable[a]["Enabled"] = true;
			else
				BloodlustSongObjectTable[a]["Enabled"] = false;
			end
		end)

	end

	--Dummy table for variable purposes
	local SongEditButtons = { };
	for a, c in ipairs(BloodlustSongObjectTable) do
		SongEditButtons[a] = "TableButton" ..a
	end

	--Create Editbuttons to accompany the Checkboxes
	for a,c in ipairs(SongEditButtons) do
		SongEditButtons[a] = CreateFrame("Button", "SongEditButton ".. a, BloodlustMusicRemix.panel.scrollChild, "UIPanelButtonTemplate")
		SongEditButtons[a]:SetPoint("TOPLEFT", SongCheckboxes[a].text, "TOPRIGHT", 0, -1.8)
		SongEditButtons[a]:SetWidth(SongEditButtonWidth)
		SongEditButtons[a].text = _G["TestingButton".."Text"]
		SongEditButtons[a]:SetText("Edit")
		SongEditButtons[a]:SetScript("OnClick", function(self, arg1)
			InputPanel(a)
		end)
	end


	--Button to set ALL songs to default
	local SongDefaultButton = CreateFrame("Button","SongDefaultButton", BloodlustMusicRemix.panel.scrollChild,"UIPanelButtonTemplate")
	SongDefaultButton:SetWidth(170)
	SongDefaultButton:SetPoint("CENTER", SongEditButtons[(math.ceil(table.getn(BloodlustSongObjectTable)/2))], "BOTTOMRIGHT",  0, -40)
	SongDefaultButton.text = _G["SongDefaultButton".."Text"]
	SongDefaultButton:SetText("Set all songs to default")
	SongDefaultButton:SetScript("OnClick", function(self, arg1)
		ConfirmPanel(nil, "Default", "\n |cFFFFD100WARNING:|r This will set all songs back to their default, hard-coded values, even your custom songs. \n \n \n This action cannot be reversed and any change you have made to any song will have to be entered manually again. \n \n \n Accept and reload?");
	end)

	--Description for the Favored Friend feature
	local FavoredFriendDescription = BloodlustMusicRemix.panel.scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    FavoredFriendDescription:SetPoint("TOPLEFT", SongCheckboxes[(math.ceil(table.getn(BloodlustSongObjectTable)/2))], "BOTTOMLEFT", 10 , -60)
	FavoredFriendDescription:SetWidth(BloodlustMusicRemix.panel.scrollFrame:GetWidth() - scrollbarOffset)
	FavoredFriendDescription:SetJustifyH("LEFT")
	FavoredFriendDescription:SetText("Want to hear a certain song when a certain player casts Hero? You can by using the Favored Friend feature below. Just click the edit button and enter some values in the screen that pops up. You'll need the name of your friend, the title of the song, and the filename. The song can be either a song in the default list or a custom one, following the same rules for custom songs as above. More info on the addon page.")

	--Dummy table for variable purposes
	local FriendSongCheckboxes = { };
	for a, c in ipairs(BloodlustFavoredFriendTable) do
		FriendSongCheckboxes[a] = "FriendCheckbox" ..a
	end

	--Dummy table for variable purposes
	local FriendTestBoxes = { };
	for a, c in ipairs(BloodlustFavoredFriendTable) do
		FriendTestBoxes[a] = "FriendTestBox" ..a
	end

	--Creates a checkbox for every Favored Friend
	for a,c in ipairs(FriendSongCheckboxes) do
		FriendSongCheckboxes[a] = CreateFrame("CheckButton", "FriendSongCheckbox ".. a, BloodlustMusicRemix.panel.scrollChild, "UICheckButtonTemplate")
		if (a == 1) then
			FriendSongCheckboxes[a]:SetPoint("TOPLEFT", FavoredFriendDescription, "BOTTOMLEFT",  -10, -15)
		else
			FriendSongCheckboxes[a]:SetPoint("TOPLEFT", FriendSongCheckboxes[a-1].text, "BOTTOMLEFT", -30, (-10))
		end

		FriendSongCheckboxes[a].text:SetFontObject("GameFontHighlight")
		--if the friend has a name at the given index
		if BloodlustFavoredFriendTable[a]["Name"] ~= "" then
			--set the name
			FriendSongCheckboxes[a].text:SetText(a .. ". |cFFFFD100'" .. BloodlustFavoredFriendTable[a]["Name"] .."'|r will play: " .. BloodlustFavoredFriendTable[a]["Title"])
			--create a test button next to it
			FriendTestBoxes[a] = CreateFrame("Button", "SongEditButton ".. a, BloodlustMusicRemix.panel.scrollChild, "UIPanelButtonTemplate")
			FriendTestBoxes[a]:SetPoint("TOPLEFT", FriendSongCheckboxes[a].text, "TOPRIGHT", 0, -1.8)
			FriendTestBoxes[a]:SetWidth(SongEditButtonWidth)
			FriendTestBoxes[a].text = _G["FriendTestBoxes".."Text"]
			FriendTestBoxes[a]:SetText("Test")
			FriendTestBoxes[a]:SetScript("OnClick", function(self, arg1)
				if (BloodlustMusicRemix.isSongPlaying) then
					print(BloodlustMusicRemix.announcerHeader .. "Song test prevented. A song is already playing.")
				elseif(BloodlustMusicRemixMute) then
					print(BloodlustMusicRemix.announcerHeader .. "Song test prevented. BloodlustMusicRemix is currently muted.")
				elseif not(BloodlustFavoredFriendTable[a]["Enabled"]) then
					print(BloodlustMusicRemix.announcerHeader .. "Song test prevented. The song is not enabled.")
				elseif (BloodlustFavoredFriendTable[a]["Title"] == "" or BloodlustFavoredFriendTable[a]["Path"] == "") then
					print(BloodlustMusicRemix.announcerHeader .. "Song test prevented. Please fill in all the details.")	
				else
					print(BloodlustMusicRemix.announcerHeader .. "Test song started");
					SongPlayerPrimer(BloodlustMusicRemix.currentSongSpellID, 0, a)
					C_Timer.After(10, function() -- wait a bit
						StopSong(false)
					print(BloodlustMusicRemix.announcerHeader .. "Test song stopped")
					end)
				end
			end)
		else
			FriendSongCheckboxes[a].text:SetText(a .. ". ")
		end
		
		
		FriendSongCheckboxes[a].text:SetWidth((BloodlustMusicRemix.panel.scrollChild:GetWidth()) - 165)--scrollbarOffset - (SongEditButtonWidth*2))
		FriendSongCheckboxes[a].text:SetHeight(30)
		FriendSongCheckboxes[a].text:SetJustifyH("LEFT")
		FriendSongCheckboxes[a].text:SetWordWrap(true)
		FriendSongCheckboxes[a].text:SetNonSpaceWrap(true)

		if (getglobal("FriendSongCheckbox "..a):GetChecked() ~= BloodlustFavoredFriendTable[a]["Enabled"]) then
			getglobal("FriendSongCheckbox "..a):SetChecked(BloodlustFavoredFriendTable[a]["Enabled"]);
		end

		FriendSongCheckboxes[a]:SetScript("OnClick", function(self,event,arg1)
			if (self:GetChecked()) then
				BloodlustFavoredFriendTable[a]["Enabled"] = true;
			else
				BloodlustFavoredFriendTable[a]["Enabled"] = false;
			end
		end)

	end

	--Dummy table for variable purposes
	local FriendEditButtons = { };
	for a, c in ipairs(BloodlustFavoredFriendTable) do
		FriendEditButtons[a] = "FriendButton" ..a
	end

	--Create Editbuttons to accompany the Checkboxes
	for a,c in ipairs(FriendEditButtons) do
		FriendEditButtons[a] = CreateFrame("Button", "FriendSongEditButton ".. a, BloodlustMusicRemix.panel.scrollChild, "UIPanelButtonTemplate")
		FriendEditButtons[a]:SetPoint("TOPLEFT", FriendSongCheckboxes[a].text, "TOPRIGHT", SongEditButtonWidth + 15, -1.8)
		FriendEditButtons[a]:SetWidth(SongEditButtonWidth)
		FriendEditButtons[a].text = _G["TestingButton".."Text"]
		FriendEditButtons[a]:SetText("Edit")
		FriendEditButtons[a]:SetScript("OnClick", function(self, arg1)
			FriendPanel(a)
		end)
	end

	--Button to set the friend to default
	local FriendDefaultButton = CreateFrame("Button","FriendDefaultButton", BloodlustMusicRemix.panel.scrollChild,"UIPanelButtonTemplate")
	FriendDefaultButton:SetWidth(170)
	FriendDefaultButton:SetPoint("CENTER", FriendSongCheckboxes[(table.getn(FriendSongCheckboxes))].text, "CENTER",  27, -40)
	FriendDefaultButton.text = _G["FriendDefaultButton".."Text"]
	FriendDefaultButton:SetText("Clear Favored Friend List")
	FriendDefaultButton:SetScript("OnClick", function(self, arg1)
		ConfirmPanel(nil, "DefaultAllFriends", "\n |cFFFFD100WARNING:|r This will clear the entire list of Favored Friends and all checkboxes will be turned OFF.\n \n \n This action cannot be reversed and any change you have made to this list will have to be entered manually again. \n \n \n Accept and reload?");
	end)

	--Checkbox to mute BloodlustMusicRemix
	local MuteCheckbox = CreateFrame("CheckButton", "MuteCheckbox", BloodlustMusicRemix.panel.scrollChild, "UICheckButtonTemplate")
	MuteCheckbox:SetPoint("TOPRIGHT", (-scrollbarOffset - 20), -3)
	MuteCheckbox.text:SetFontObject("GameFontNormal", "Randomname")
	MuteCheckbox.text:SetText("|cFFFFD100Mute|r")
	MuteCheckbox.text:SetWidth(300)
	MuteCheckbox.text:SetJustifyH("LEFT")
	MuteCheckbox.text:SetTextColor(1, 1, 1, 1)

	if (getglobal("MuteCheckbox"):GetChecked() ~= BloodlustMusicRemixMute) then
		getglobal("MuteCheckbox"):SetChecked(BloodlustMusicRemixMute);
	end

	MuteCheckbox:SetScript("OnClick", function(self,event,arg1)
		if (self:GetChecked()) then
			BloodlustMusicRemixMute = true;
			print(BloodlustMusicRemix.announcerHeader .. "The addon is now muted, no songs will play.")
		else

			BloodlustMusicRemixMute = false;
			print(BloodlustMusicRemix.announcerHeader .. "The addon is now unmuted, enjoy the songs :)")
		end
	end)

end


--What to do when Addon loads
local BloodlustStartingFrame = CreateFrame("FRAME", "BloodlustMusicRemix");
BloodlustStartingFrame:RegisterEvent("ADDON_LOADED");

local function BloodlustStartingFrame_OnEvent(self, event, ...)
    if (event == "ADDON_LOADED") and (... == "BloodlustMusicRemix") then
        print(BloodlustMusicRemix.announcerHeader .. "Loaded");
         --Checks for saved variables, if they don't exist, we create them
		if (BloodlustMusicRemixSongEnabledTable) then
            BloodlustMusicRemixSongEnabledTable = nil
        end
		if (not BloodlustSongObjectTable) or (table.getn(BloodlustSongObjectTable)<60) then
			BloodlustSongObjectTableDefault()
		end
		if (not BloodlustFavoredFriendTable) then
			BloodlustFavoredFriendTableDefault()
		end
        if (not BloodlustSoundchannelNumber) then
            BloodlustSoundchannelNumber = 5
        end
        if(not BloodlustVolumecache) then
            BloodlustVolumecache = tonumber(GetCVar(BloodlustMusicRemix.soundVolumeTable[BloodlustSoundchannelNumber]))
        end
        if (not BloodlustSoundhandle) then
            BloodlustSoundhandle = 0
        end
        if(not BloodlustChannelVolume) then
            BloodlustChannelVolume = 1
        end
        if(not BloodlustMaxSoundchannelBoolean) then
            BloodlustMaxSoundchannelBoolean = false
        end
        if(not BloodlustSoundchannelscache) then
             BloodlustSoundchannelscache = 64
        end
		if(not BloodlustMusicRemixMute) then
			BloodlustMusicRemixMute = false
	    end
		if(not BloodlustMusicRemixShowPanelAfterReload) then
			BloodlustMusicRemixShowPanelAfterReload = false
		end
		--Create all the panels
		FriendPanelCreation()
		InputPanelCreation()
		ConfirmPanelCreation()
        PanelCreation()
     end
end

    BloodlustStartingFrame:SetScript("OnEvent", BloodlustStartingFrame_OnEvent)