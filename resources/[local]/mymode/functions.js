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


function weaponComponent(weaponHash, component){
    if (HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) ){
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash), GetHashKey(component))
    }
}