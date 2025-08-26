local _populateCategoryList = ISWidgetRecipeCategories.populateCategoryList

function ISWidgetRecipeCategories:populateCategoryList()
    _populateCategoryList(self)
    for _, item in ipairs(self.recipeCategoryPanel.items) do
        if item.text == "-- ALL --" then
            item.text = getTextOrNull("IGUI_RecipeCategory_All") or item.text
        else
            item.text = getTextOrNull("IGUI_RecipeCategory_" .. item.text) or item.text
        end
    end
end
