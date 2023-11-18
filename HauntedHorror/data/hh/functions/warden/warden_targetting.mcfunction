#####
#Made By PixelUniverse
#####


##warden's target glows
#store scoreboard values for warden from anger uuid
execute store result score @s hhUUID1 run data get entity @s anger.suspects[0].uuid[0]
execute store result score @s hhUUID2 run data get entity @s anger.suspects[0].uuid[1]
execute store result score @s hhUUID3 run data get entity @s anger.suspects[0].uuid[2]
execute store result score @s hhUUID4 run data get entity @s anger.suspects[0].uuid[3]
#store scoreboard values for player from uuid
execute as @e[distance=..40,type=!#hh:warden_targetable,type=!player] run function hh:players/store_uuid
#compare warden and player scores and add corresponding tags to succeeding players
execute as @e[type=!#hh:warden_targetable] if score @s hhUUID1 = @e[type=warden,tag=hhWarden,sort=nearest,limit=1] hhUUID1 run scoreboard players add @s hhUUIDMatch 1
execute as @e[type=!#hh:warden_targetable] if score @s hhUUID2 = @e[type=warden,tag=hhWarden,sort=nearest,limit=1] hhUUID2 run scoreboard players add @s hhUUIDMatch 1
execute as @e[type=!#hh:warden_targetable] if score @s hhUUID3 = @e[type=warden,tag=hhWarden,sort=nearest,limit=1] hhUUID3 run scoreboard players add @s hhUUIDMatch 1
execute as @e[type=!#hh:warden_targetable] if score @s hhUUID4 = @e[type=warden,tag=hhWarden,sort=nearest,limit=1] hhUUID4 run scoreboard players add @s hhUUIDMatch 1
#apply glowing to success entity
effect give @e[scores={hhUUIDMatch=4}] glowing 2 0
#reset score
scoreboard players set @e[type=!warden,type=!marker,type=!armor_stand] hhUUIDMatch 0