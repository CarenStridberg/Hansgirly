local _createMenu = ISWorldObjectContextMenu.createMenu

function ISWorldObjectContextMenu:createMenu(player, worldobjects, x, y, test)
	if getCore():getGameMode() == "Tutorial" then
		local context = Tutorial1.createWorldContextMenu(player, worldobjects, x ,y);
		return context;
	end
	if test then
		return ISWorldObjectContextMenu.Test;
	end

	local context = _createMenu(self, player, worldobjects, x, y, test)

	if context and context.options then
		local windowOption = context:getOptionFromName("Window")
		if windowOption then
			windowOption.name = getText("ContextMenu_Window")
		end

		local doorOption = context:getOptionFromName("Door")
		if doorOption then
			doorOption.name = getText("ContextMenu_Door")
		end

		local curtainOption = context:getOptionFromName("Curtain")
		if curtainOption then
			curtainOption.name = getText("ContextMenu_Curtain")
		end
	end

    return context;
end