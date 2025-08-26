function MapUtils.initDirectoryStreetData(mapUI, directory)
	local mapAPI = mapUI.javaObject:getAPIv3()
	local streetsAPI = mapAPI:getStreetsAPI()
	local file = directory..'/streets.xml'

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
