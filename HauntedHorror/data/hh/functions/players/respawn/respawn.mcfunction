#####
#Made By PixelUniverse
#####


##find the right player to revive
#go through the player UUID's and find matches and add tag to correct player
execute if score @s hhUUID1 = @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUID1 run scoreboard players add @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUIDMatch 1
execute if score @s hhUUID2 = @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUID2 run scoreboard players add @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUIDMatch 1
execute if score @s hhUUID3 = @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUID3 run scoreboard players add @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUIDMatch 1
execute if score @s hhUUID4 = @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUID4 run scoreboard players add @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1] hhUUIDMatch 1
tag @e[type=marker,tag=hhDeathMarker,scores={hhUUIDMatch=4},tag=!hhNoRespawn,sort=nearest,limit=1] add hhPlayerRevive
scoreboard players set @e[type=marker,tag=hhPlayerRevive,sort=nearest,limit=1] hhUUIDMatch 0


##players
#tp player
tp @s @e[type=marker,tag=hhPlayerRevive,sort=nearest,limit=1]
#change gamemode
gamemode survival @s
#respawn player with temp boosts
effect give @s instant_health 1 10 true
effect give @s resistance 20 255
effect give @s fire_resistance 25 0
effect give @s night_vision 20 0
effect give @s speed 10 1


##misc
#kill armor stand item
kill @e[type=item,nbt={Item:{id:"minecraft:armor_stand"}},sort=nearest,limit=1]
#kill marker entity
kill @e[type=marker,tag=hhPlayerRevive]
#remove 1 from lives and store value back in bossbar
execute store result bossbar minecraft:hhdeathbb value run scoreboard players remove Lives hhLives 1