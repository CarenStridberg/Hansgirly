local _addOption = ISContextMenu.addOption

function ISContextMenu:addOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)

	local itemList = {"Feed",}
	local newName = name

	for i = 1, #itemList do
		if name == itemList[i] then
			newName = getText("ContextMenu_"..itemList[i])
		end
	end

	local context = _addOption(self, newName, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
    return context;
end

-- As 1 --
-- Available in B42.18.2 --