require "ISUI/ISScrollingListBox"

function MapSpawnSelect:_fillList()
	self.listbox:clear()
	WORLD_MAP = nil
	self.mapPanel:clear()
	local spawnSelectImagePyramid = nil

	self.sortedList = {};
	self.notSortedList = {};

	local regions = self:getSpawnRegions()
	if not regions then return end
	for _,v in ipairs(regions) do
		local info = getMapInfo(v.name)
		if info then
            if not info.only_for_game_mode or GameMode.get(ResourceLocation.of(getCore():getGameMode())) == info.only_for_game_mode then
                local item = {};
                item.name = info.title or "NO TITLE";
                item.region = v;
                item.dir = v.name;
                item.desc = info.description or "NO DESCRIPTION";
                if info.spawnSelectImagePyramid then
                    spawnSelectImagePyramid = info.spawnSelectImagePyramid -- only one is supported
                end
                item.zoomX = info.zoomX
                item.zoomY = info.zoomY
                item.zoomS = info.zoomS
                item.demoVideo = info.demoVideo
                self:checkSorted(item);
            end
		else
			local item = {}
			item.name = v.name;
			item.region = v;
			item.dir = "";
			item.desc = "";
			item.worldimage = nil;
			self:checkSorted(item);
		end
	end

	if #self.listbox.items > 1 then
        local item = {}
        item.name = getText("UI_mapspawn_random");
        item.region = nil;
        item.dir = "";
        item.desc = "";
        item.worldimage = nil;
		table.insert(self.notSortedList, item);
    end

	spawnSelectImagePyramid = getMapInfo("Riverside, KY").dir .. "\\spawnSelectImagePyramid.zip"
	if spawnSelectImagePyramid then
		self.mapPanel:setImagePyramid(spawnSelectImagePyramid)
	else
		for _,v in ipairs(regions) do
			local info = getMapInfo(v.name)
			if info then
				self.mapPanel:initMapData('media/maps/'..v.name) -- FIXME: order of multiple maps matters
				for _,dir in ipairs(info.lots) do
					self.mapPanel:initMapData('media/maps/'..dir) -- FIXME: order of multiple maps matters
				end
			end
		end
	end

	-- list has been sorted with MapsOrder
	for i,v in ipairs(self.sortedList) do
		self.listbox:addItem(v.name, v);
	end

	for i,v in ipairs(self.notSortedList) do
		self.listbox:addItem(v.name, v);
	end

	self:hideOrShowSaveName()
	self:recalculateMapSize()

    if self.textEntry ~= nil and self.textEntry:getInternalText() == "" then
        local sdf = SimpleDateFormat.new("yyyy-MM-dd_HH-mm-ss", Locale.ENGLISH);
        self.textEntry:setText(sdf:format(Calendar.getInstance():getTime()));
    end

	self.mapPanel.shownInitialLocation = false
end

MapSpawnSelect.fillList = MapSpawnSelect._fillList;

-- As 1 --
-- Available in B42.20 --