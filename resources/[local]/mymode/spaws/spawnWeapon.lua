RegisterCommand("weapon", function(source, args, rawComand)
    print(rawComand, args, source)
    local cont = 0
    for car in string.gmatch(rawComand, "[^%s]+") do
        spawnWeapon(car)
    end
end)

function spawnWeapon(weapon)
    local weaponHash = GetHashKey(weapon)

    local model = RequestModel(carHash)
    local playerPed = PlayerPedId()
  
    local cords = GetEntityCoords(GetPlayerPed(-1), false)
    local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
    local playerH = GetEntityHeading(playerPed)

    CreateWeaponObject(
		weaponHash --[[ Hash ]], 
		1 --[[ integer ]], 
		FormatCoord(playerX)+2 --[[ number ]], 
		FormatCoord(playerY)+2 --[[ number ]], 
		FormatCoord(playerZ)+2 --[[ number ]], 
		true --[[ boolean ]], 
		1 --[[ number ]]
	)

end

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end