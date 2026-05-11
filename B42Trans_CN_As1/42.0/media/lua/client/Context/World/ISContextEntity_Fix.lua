local _ContextEntity = ISWorldMenuElements.ContextEntity

function ISWorldMenuElements.ContextEntity()
    local self = _ContextEntity();

    function self.createMenu( _data )
        if getCore():getGameMode() == "Tutorial" then
            return;
        end

        local canAddEntityOption = true;
        for index,object in ipairs(_data.objects) do
            local obj = object:getMasterObject();

            if canAddEntityOption and ISEntityUI.CanOpenWindowFor(_data.player, obj) then
                local displayName = obj:getEntityDisplayName();

                local itemList = {"Coffee Machine", "Toaster"}
                for i = 1, #itemList do
                    if displayName == itemList[i] then
                        local localizationKey = "ContextMenu_"..string.gsub(itemList[i], "%s+", "")
                        if getText(localizationKey) then
                            displayName = getText(localizationKey)
                        end
                    end
                end

                if (not displayName) or (displayName==GameEntity.getDefaultEntityDisplayName()) then
                    displayName = getText("Entity_Open_Window");
                end
                _data.context:addOption(displayName, _data, self.openPanel, obj );
                canAddEntityOption = false;
            end
        end
    end

    return self;
end

-- As 1 --
-- Available in B42.18.2 --