
RegisterCommand("car", function(source, args, rawComand)
    print(rawComand, args, source)
    local cont = 0
    for car in string.gmatch(rawComand, "[^%s]+") do
        spawnCar(car)
    end
end)

function spawnCar(car)
    print(car)
    local carHash = GetHashKey(car)

    local model = RequestModel(carHash)
    local playerPed = PlayerPedId()
  
    local cords = GetEntityCoords(GetPlayerPed(-1), false)
    local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
    local playerH = GetEntityHeading(playerPed)

    CreateVehicle(
		carHash, 
		FormatCoord(playerX)+2, 
		FormatCoord(playerY)+2, 
		FormatCoord(playerZ)+2, 
		FormatCoord(playerH), 
		boolean, 
		false
    )
end

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end