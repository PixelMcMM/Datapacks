#####
#Made By PixelUniverse
#####


##reset spawner timer value
scoreboard players set @s paSpawnerTimer 0


##check criteria for spawners to spawn things
#add succcess tag if daytime matches
execute if predicate pa:daytime if score @s paSpawnerDaytime matches 1 run scoreboard players add @s paSpawnerSuccess 1
execute unless predicate pa:daytime if score @s paSpawnerDaytime matches 2 run scoreboard players add @s paSpawnerSuccess 1
execute if score @s paSpawnerDaytime matches 0 run scoreboard players add @s paSpawnerSuccess 1
#add success tag if weather matches
execute if predicate pa:raining if score @s paSpawnerWeather matches 2 run scoreboard players add @s paSpawnerSuccess 1
execute unless predicate pa:raining if score @s paSpawnerWeather matches 1 run scoreboard players add @s paSpawnerSuccess 1
execute if score @s paSpawnerWeather matches 0 run scoreboard players add @s paSpawnerSuccess 1


##spawning
#check if success tags are there are place a redstone block
execute if score @s paSpawnerSuccess matches 2 unless block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:air
execute if score @s paSpawnerSuccess matches 2 run setblock ~ ~ ~ minecraft:redstone_block
scoreboard players set @s paSpawnerSuccess 0