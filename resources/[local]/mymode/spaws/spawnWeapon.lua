RegisterCommand("weapon", function(source, args, rawComand)
    print(rawComand, args, source)
    local cont = 0
    for weapon in string.gmatch(rawComand, "[^%s]+") do
        spawnWeapon(weapon)
    end
end)

function spawnWeapon(weapon)
    local weaponHash = GetHashKey(weapon)
    fiveWeapon(weaponHash)
    local model = RequestModel(weaponHash)

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

function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
end


function weaponComponent(weaponHash, component)
    if (HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) ) then 
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash), GetHashKey(component))
    end
end