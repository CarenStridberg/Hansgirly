local _createMenu = ISWorldObjectContextMenu.createMenu

function ISWorldObjectContextMenu:createMenu(player, worldobjects, x, y, test)
	local context = _createMenu(self, player, worldobjects, x, y, test)

	if context and context ~= true and context.options then
		-- ContextMenu_Fireplace is in the localization already!
		local itemList = {"Window", "Door", "Curtain", "Campfire",
		"Blue Vintage Lamp", "Globe Lamp", "Fireplace"}

		for i = 1, #itemList do
			local option = context:getOptionFromName(itemList[i])
			local localizationKey = "ContextMenu_"..string.gsub(itemList[i], "%s+", "")
			if option and getText(localizationKey) then
				option.name = getText(localizationKey)
			end
		end
	end

    return context;
end

-- As 1 & ROBOLUTION --
-- Available in B42.18.2 --