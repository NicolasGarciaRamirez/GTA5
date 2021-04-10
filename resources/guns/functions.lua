function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLable(0,0,1-1)
end

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function fiveWeapon(hash)
    GiveWeaponToped(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
end
