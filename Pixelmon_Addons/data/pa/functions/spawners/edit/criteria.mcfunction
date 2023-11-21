#####
#Made By PixelUniverse
#####


##if a player has any spawner score values, store those in the nearest spawner
#daytime
execute if score @s paSpawnerDaytime matches 0..2 store result score @e[predicate=pa:sh,sort=nearest,limit=1] paSpawnerDaytime run scoreboard players get @s paSpawnerDaytime
execute if score @s paSpawnerDaytime matches ..-1 run tellraw @s {"text":"Value must be between 0 and 2","color":"red"}
execute if score @s paSpawnerDaytime matches 3.. run tellraw @s {"text":"Value must be between 0 and 2","color":"red"}
scoreboard players reset @s paSpawnerDaytime
#weather
execute if score @s paSpawnerWeather matches 0..2 store result score @e[predicate=pa:sh,sort=nearest,limit=1] paSpawnerWeather run scoreboard players get @s paSpawnerWeather
execute if score @s paSpawnerWeather matches ..-1 run tellraw @s {"text":"Value must be between 0 and 2","color":"red"}
execute if score @s paSpawnerWeather matches 3.. run tellraw @s {"text":"Value must be between 0 and 2","color":"red"}
scoreboard players reset @s paSpawnerWeather
#distance
execute if score @s paSpawnerDist matches 1.. store result score @e[predicate=pa:sh,sort=nearest,limit=1] paSpawnerDist run scoreboard players get @s paSpawnerDist
execute if score @s paSpawnerDist matches ..0 run tellraw @s {"text":"Value must be greater than 0","color":"red"}
scoreboard players reset @s paSpawnerDist
#delay
execute if score @s paSpawnerDelay matches 1.. store result score @e[predicate=pa:sh,sort=nearest,limit=1] paSpawnerDelay run scoreboard players get @s paSpawnerDelay
execute if score @s paSpawnerDelay matches ..0 run tellraw @s {"text":"Value must be greater than 0","color":"red"}
scoreboard players reset @s paSpawnerDelay
#run particle at affected armor stand
execute at @e[predicate=pa:sh,sort=nearest,limit=1] run particle minecraft:cloud ~ ~2 ~ .1 .1 .1 .1 50