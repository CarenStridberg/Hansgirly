function ISHandcraftWindow:prerender()
    self:stayOnSplitScreen();

    if self.dirtyLayout then
        local oldX = self:getX();
        local oldWidth = self:getWidth();
        if self.calculateLayout then self:calculateLayout(self.xuiPreferredResizeWidth, self.xuiPreferredResizeHeight); end
        self.dirtyLayout = false;

        if self.xuiResizeAnchorRight then
            self:setX(oldX - (self:getWidth()-oldWidth))
            self.xuiResizeAnchorRight = false;
        end
    end

    if self.isoObject then
        if self.isoObjectInProximity then
            local header = getText("IGUI_CraftingWindow_Header");
            local props = self.isoObject:getProperties();
            -- Code below is changed to provide localization for crafting surface.
            local surface = getText("IGUI_CraftingWindow_Surface");
            if props and props:has("IsMoveAble") and props:has("CustomName") then
                local localizationKey = "ContextMenu_Surface_"..string.gsub(props:get("CustomName"), "%s+", "")
                if localizationKey ~= getText(localizationKey) then
                    surface = getText(localizationKey)
                else
                    surface = props:get("CustomName")
                end
            end
            self.windowHeader.title.name = header .. surface;
        else
            self.windowHeader.title.name = getText("IGUI_CraftingWindow_Title");
        end
    else
        self.windowHeader.title.name = getText("IGUI_CraftingWindow_Title");
    end

    ISCollapsableWindow.prerender(self);
end