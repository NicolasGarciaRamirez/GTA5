function alert(msg){ 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
}
  
function notify(msg){
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true,false)
}

function giveWeapon(hash){
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
}

function spawnCar(car){
    if(car) car = GetHashKey('tempestas')

    let model = RequestModel(car)
    console.log(model ,HasModelLoaded(car))
  
    let cords = GetEntityCoords(GetPlayerPed(-1), false)
        vehicle = CreateVehicle(car, cords[0] + 2, cords[1] + 2, cords[2] + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
}

function weaponComponent(weaponHash, component){
    if (HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) ){
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash), GetHashKey(component))
    }
}