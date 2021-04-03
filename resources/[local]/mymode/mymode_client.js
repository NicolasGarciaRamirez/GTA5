const spawnPos = [266.4990234375, 6631, 29.55451011657715];

RegisterCommand("clear", function(){
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    notify("~r~Cleared All Weapons")
})


let cars = ["adder", "comet", "cheetah", "faggio"]

RegisterCommand("car", function(){
    let car = (cars[Math.random(cars.length)])
    spawnCar(car)
    notify("~p~Spawned car: ~h~~g~" + car)
})

RegisterCommand("die", function(){
    SetEntityHealth(PlayerPedId(), 0)
    notify("~r~ You Died.")
})

RegisterCommand('cords', function(){
    let cords = GetEntityCoords(GetPlayerPed(-1), false)
    emit('chat:addMessage', {
      args: [
        `Your Position Is: x =${cords[0]}, y =${cords[1]} , z =${cords[2]}`
      ]
    })
    notify(`Your Position Is: x =${cords[0]}, y =${cords[1]} , z =${cords[2]}`)
})

RegisterCommand('tp', async(cords) => {
  exports.spawnmanager.setAutoSpawnCallback(() => {
    exports.spawnmanager.spawnPlayer({
      x: cords[0],
      y: cords[1],
      z: cords[2],
      model: 'a_m_m_skater_01'
    }, () => {
      
    });
  });

  exports.spawnmanager.setAutoSpawn(true)
  exports.spawnmanager.forceRespawn()
})

on('onClientGameTypeStart', () => {
  exports.spawnmanager.setAutoSpawnCallback(() => {
    exports.spawnmanager.spawnPlayer({
      x: spawnPos[0],
      y: spawnPos[1],
      z: spawnPos[2],
      model: 'a_m_m_skater_01'
    }, () => {
      emit('chat:addMessage', {
        args: [
          'Welcome to the city!~'
        ]
      })
    });
  });

  exports.spawnmanager.setAutoSpawn(true)
  exports.spawnmanager.forceRespawn()
 
});


