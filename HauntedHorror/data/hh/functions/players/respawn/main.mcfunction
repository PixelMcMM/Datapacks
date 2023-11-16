#####
#Made By PixelUniverse
#####


###player deaths and respawns
##death management
#activate dead player function
execute if score @s hhDeath matches 1.. run function hh:players/respawn/death_counter
#summon marker at the players position and store the player's UUID inside of the marker, marker gets killed in the main function
execute if score @s[gamemode=!spectator] hhDeath matches 0 run summon marker ~ ~ ~ {Tags:["hhDeathRecord","hhMarker","hhNoUUID"]}
execute if score @s[gamemode=!spectator] hhDeath matches 0 run data modify entity @e[type=marker,tag=hhNoUUID,sort=nearest,limit=1] data.PlayerUUID set from entity @s UUID
execute if score @s[gamemode=!spectator] hhDeath matches 0 run tag @e[type=marker,tag=hhNoUUID,sort=nearest,limit=1] remove hhNoUUID
##respawn management
#run respawn function from the revived player if armor stand is killed by applying tags to the passengers of the armor stand
execute as @e[type=armor_stand,tag=hhDeathVisual] on passengers run tag @s add hhNoRespawn
execute if entity @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn] at @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] as @s[gamemode=spectator] run function hh:players/respawn/respawn
tag @e[type=marker,tag=hhNoRespawn] remove hhNoRespawn


##reset death score as a failsafe
execute if score @s hhDeath matches 1.. run scoreboard players set @s hhDeath 0