#####
#Made By PixelUniverse
#####


##misc
#send blanket message
tellraw @s {"text":"---------------","color":"dark_gray"}
#send initial message with current stats of spawner helper
tellraw @s {"text":"Current Stats of Spawner Helper, shift click on a stat to change it's value:","bold":true}
tellraw @s [{"text":"- Daytime: ","insertion":"/scoreboard players set @s paSpawnerDaytime <value>"},{"score":{"name":"@e[type=armor_stand,tag=paSpawnerHelper,distance=..0.5,limit=1]","objective":"paSpawnerDaytime"},"color":"gray"},{"text":" (1=Daytime,2=Nighttime,0=NA)","color":"white","italic":true}]
tellraw @s [{"text":"- Weather: ","insertion":"/scoreboard players set @s paSpawnerWeather <value>"},{"score":{"name":"@e[type=armor_stand,tag=paSpawnerHelper,distance=..0.5,limit=1]","objective":"paSpawnerWeather"},"color":"gray"},{"text":" (1=Clear,2=Rainy,0=NA)","color":"white","italic":true}]
tellraw @s [{"text":"- Distance: ","insertion":"/scoreboard players set @s paSpawnerDist <value>"},{"score":{"name":"@e[type=armor_stand,tag=paSpawnerHelper,distance=..0.5,limit=1]","objective":"paSpawnerDist"},"color":"gray"},{"text":" Blocks","color":"white","italic":true}]
tellraw @s [{"text":"- Delay: ","insertion":"/scoreboard players set @s paSpawnerDelay <value>"},{"score":{"name":"@e[type=armor_stand,tag=paSpawnerHelper,distance=..0.5,limit=1]","objective":"paSpawnerDelay"},"color":"gray"},{"text":" Seconds","color":"white","italic":true}]
#give targetted armor stand glowing to show which one
effect give @e[type=armor_stand,tag=paSpawnerHelper,sort=nearest,limit=1] minecraft:glowing 5 0 true
#add tag to player so they don't activate multiple times
tag @s add paSpawnerEdit
#send blanket message
tellraw @s {"text":"---------------","color":"dark_gray"}