local _createMenu = ISWorldObjectContextMenu.createMenu

function ISWorldObjectContextMenu:createMenu(player, worldobjects, x, y, test)
	local context = _createMenu(self, player, worldobjects, x, y, test)

	if context and context ~= true and context.options then
		local itemList = {"Window", "Door", "Curtain"}

		for i = 1, #itemList do
			local option = context:getOptionFromName(itemList[i])
			if option and getText("ContextMenu_"..itemList[i]) then
				option.name = getText("ContextMenu_"..itemList[i])
			end
		end
	end

    return context;
end

-- As 1 & ROBOLUTION --
-- Available in B42.18.2 --