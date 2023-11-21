#####
#Made By PixelUniverse
#####


##summon spawner helper marker to store values for specific spawner
#summon marker and if furnace is already there try to store values from furnace into marker
summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Tags:["paSpawnerHelper","paAS"]}
#set furnace two blocks below to store value
execute unless block ~ ~-1 ~ minecraft:furnace{Items:[{Slot:1b,tag:{paData:{}}}]} run setblock ~ ~-1 ~ minecraft:air
execute unless block ~ ~-1 ~ minecraft:furnace{Items:[{Slot:1b,tag:{paData:{}}}]} run setblock ~ ~-1 ~ minecraft:furnace{Items:[{Slot:1b,id:"minecraft:stick",Count:1b,tag:{paData:{daytime:0,weather:0,distance:0,delay:0},display:{Name:'"Magic Spawner Stick"'}}}]} replace
#store scoreboard values
execute store result score @e[predicate=pa:sh,distance=..0.5,limit=1] paSpawnerDaytime run data get block ~ ~-1 ~ Items[0].tag.paData.daytime
execute store result score @e[predicate=pa:sh,distance=..0.5,limit=1] paSpawnerWeather run data get block ~ ~-1 ~ Items[0].tag.paData.weather
execute store result score @e[predicate=pa:sh,distance=..0.5,limit=1] paSpawnerDist run data get block ~ ~-1 ~ Items[0].tag.paData.distance
execute store result score @e[predicate=pa:sh,distance=..0.5,limit=1] paSpawnerDelay run data get block ~ ~-1 ~ Items[0].tag.paData.delay
#set timer value for calculation purposes
scoreboard players set @e[predicate=pa:sh,distance=..0.5,limit=1] paSpawnerTimer 0