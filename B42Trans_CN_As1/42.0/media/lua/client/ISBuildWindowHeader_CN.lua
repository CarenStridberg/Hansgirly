local original_createChildren = ISBuildWindowHeader.createChildren

function ISBuildWindowHeader:createChildren()
    original_createChildren(self)
    
    if self.title then
        local originalTitle = self.title.origTitleStr or self.title:getName()
        local translationKey = "IGUI_BuildWindow_" .. originalTitle:gsub("%s", "")
        self.title:setName(getTextOrNull(translationKey) or originalTitle)
    end
end
