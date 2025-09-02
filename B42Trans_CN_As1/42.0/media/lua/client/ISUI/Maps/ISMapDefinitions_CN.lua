function MapUtils.initDirectoryStreetData(mapUI, directory)
	local mapAPI = mapUI.javaObject:getAPIv3();
	local streetsAPI = mapAPI:getStreetsAPI();
	local file = directory..'/streets.xml';

	local startIndex, endIndex = string.find(file, "Muldraugh, KY");
	if startIndex ~= nil then
		return;
	end
	local startIndex, endIndex = string.find(file, "muldraugh, ky");
	if startIndex ~= nil then
		return;
	end

	if fileExists(file) then
		streetsAPI:addStreetData(file);
	end
end

function MapUtils.initDirectoryAnnotations(mapUI, directory)
	local file = directory..'/worldmap-annotations.lua';

	local startIndex, endIndex = string.find(file, "Muldraugh, KY");
	if startIndex ~= nil then
		return;
	end
	local startIndex, endIndex = string.find(file, "muldraugh, ky");
	if startIndex ~= nil then
		return;
	end

	if fileExists(file) then
		local annotationFunction = reloadLuaFile(file);
		if type(annotationFunction) == "function" then
            annotationFunction(mapUI);
        end
	end
end
