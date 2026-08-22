function ISSkillProgressBar:updateTooltip(lvlSelected)
	-- we display the correct message
	self.message = self.perk:getName() .. " " .. xpSystemText.lvl .. " " .. lvlSelected + 1;
	-- first if the lvl is unlocked
	if lvlSelected < self.level then
		self.message = self.message .. " <LINE> " .. xpSystemText.unlocked;
	-- if we selected the level wich is in progress, we display the xp we already got / xp needed for lvl
	elseif self.level == lvlSelected then
		self.message = self.message .. " <LINE> " .. getText("IGUI_XP_tooltipxp", round(self.xp, 2), self.xpForLvl);
		-- if we got a multiplier, we show it
		local multiplier = self.char:getXp():getMultiplier(self.perk:getType());
		if multiplier > 0 then
			self.message = self.message .. " <LINE> " .. getText("IGUI_skills_Multiplier", round(multiplier, 2));
		end
	else
		self.message = self.message .. " <LINE> " .. xpSystemText.locked;
    end

	local perksList = {"Combat", "Blunt", "SmallBlunt", "LongBlade", "SmallBlade", "Axe",
	"Spear", "Aiming", "Reloading", "Crafting", "Carpentry", "Woodwork", "Cooking",
	"Farming", "Agility", "Sprinting", "Lightfooted", "Nimble", "Sneaking", "Fishing",
	"Survivalist", "Trapping", "Foraging", "Doctor", "Accuracy", "Guard", "Maintenance",
	"Firearm", "Passive", "Strength", "Fitness", "Electricity", "Mechanics",
	"Husbandry", "FlintKnapping", "Glassmaking", "Carving", "Masonry", "Pottery", 
	"Butchering", "Blacksmith", "MetalWelding", "Melting", "Tailoring", "Tracking"}

	local tooltipKey = self.perk:getName()
	for i = 1, #perksList do
		local localizationKey = getText("IGUI_perks_"..perksList[i])
		if localizationKey == tooltipKey then
			tooltipKey = perksList[i]
			break
		end
	end
	if tooltipKey == "Sprinting" then tooltipKey = "Running" end
	if tooltipKey == "Husbandry" then tooltipKey = "Animal Care" end
	if tooltipKey == "Farming" then tooltipKey = "Agriculture" end
	if tooltipKey == "Electricity" then tooltipKey = "Electrical" end
	if tooltipKey == "FlintKnapping" then tooltipKey = "Knapping" end
	if tooltipKey == "MetalWelding" then tooltipKey = "Welding" end
	if tooltipKey == "Blacksmith" then tooltipKey = "Blacksmithing" end
	if tooltipKey == "Doctor" then tooltipKey = "First Aid" end
	if tooltipKey == "SmallBlunt" then tooltipKey = "Short Blunt" end
	if tooltipKey == "SmallBlade" then tooltipKey = "Short Blade" end
	if tooltipKey == "Blunt" then tooltipKey = "Long Blunt" end
	if tooltipKey == "LongBlade" then tooltipKey = "Long Blade" end

	self.message = self.message .. " <LINE><LINE> " .. getText("IGUI_perks_"..tooltipKey.."_Description")
	local levelText = getTextOrNull("IGUI_perks_"..tooltipKey.."_Description"..lvlSelected+1)
	if levelText ~= nil and levelText ~= "" then
		self.message = self.message .. " <LINE><LINE> " .. levelText
	end
    local xpBoost = self.char:getXp():getPerkBoost(self.perk:getType());
    local percentage = nil;
    if xpBoost == 1 then
        percentage = "75%";
    elseif xpBoost == 2 then
        percentage = "100%";
    elseif xpBoost == 3 then
        percentage = "125%";
    end

    if percentage then
        self.message = self.message .. " <LINE> " .. getText("IGUI_XP_tooltipxpboost", percentage);
    end
end