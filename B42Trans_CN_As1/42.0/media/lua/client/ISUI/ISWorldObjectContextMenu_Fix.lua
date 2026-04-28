require "ISUI/ISWorldObjectContextMenu"

local _createMenu = ISWorldObjectContextMenu.createMenu

function ISWorldObjectContextMenu:createMenu(player, worldobjects, x, y, test)
	context = _createMenu(player, worldobjects, x, y, test)

	if context and context.options then
		local windowOption = context:getOptionFromName("Window")
		if windowOption then
			windowOption.name = getText("ContextMenu_Window")
		end

		local doorOption = context:getOptionFromName("Door")
		if doorOption then
			doorOption.name = getText("ContextMenu_Door")
		end

		local doorOption = context:getOptionFromName("Curtain")
		if doorOption then
			doorOption.name = getText("ContextMenu_Curtain")
		end
	end

    return context;
end
