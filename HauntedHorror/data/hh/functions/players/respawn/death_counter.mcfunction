#####
#Made By PixelUniverse
#####


##UUID magic
#store marker UUID
execute as @e[type=marker,tag=hhDeathRecord] store result score @s hhUUID1 run data get entity @s data.PlayerUUID[0]
execute as @e[type=marker,tag=hhDeathRecord] store result score @s hhUUID2 run data get entity @s data.PlayerUUID[1]
execute as @e[type=marker,tag=hhDeathRecord] store result score @s hhUUID3 run data get entity @s data.PlayerUUID[2]
execute as @e[type=marker,tag=hhDeathRecord] store result score @s hhUUID4 run data get entity @s data.PlayerUUID[3]
#add a tag to the correct marking marker
execute as @e[type=marker,tag=hhDeathRecord] if score @s hhUUID1 = @a[tag=hhHunted,sort=nearest,limit=1] hhUUID1 run scoreboard players add @s hhUUIDMatch 1
execute as @e[type=marker,tag=hhDeathRecord] if score @s hhUUID2 = @a[tag=hhHunted,sort=nearest,limit=1] hhUUID2 run scoreboard players add @s hhUUIDMatch 1
execute as @e[type=marker,tag=hhDeathRecord] if score @s hhUUID3 = @a[tag=hhHunted,sort=nearest,limit=1] hhUUID3 run scoreboard players add @s hhUUIDMatch 1
execute as @e[type=marker,tag=hhDeathRecord] if score @s hhUUID4 = @a[tag=hhHunted,sort=nearest,limit=1] hhUUID4 run scoreboard players add @s hhUUIDMatch 1
tag @e[type=marker,tag=hhDeathRecord,scores={hhUUIDMatch=4},sort=nearest,limit=1] add hhDMarkerMatch
scoreboard players set @e[type=marker,tag=hhDeathRecord] hhUUIDMatch 0


##players
#put player in spectator
gamemode spectator @s
#teleport the player to the death marker
tp @s @e[type=marker,tag=hhDMarkerMatch,sort=nearest,limit=1]


##summon the armorstand and marker and do necessary procedures
#summon respawn entity and mount the marker to it removing tags
execute at @e[type=marker,tag=hhDMarkerMatch,sort=nearest,limit=1] run summon armor_stand ~ ~ ~ {NoBasePlate:1,Tags:["hhDeathVisual","hhMarker","hhNoMarker"],Glowing:1}
ride @e[type=marker,tag=hhDMarkerMatch,sort=nearest,limit=1] mount @e[type=armor_stand,tag=hhNoMarker,sort=nearest,limit=1]
#remove tags
execute as @e[type=armor_stand,tag=hhNoMarker,sort=nearest,limit=1] on passengers run data merge entity @s[tag=hhDeathRecord] {Tags:["hhMarker","hhDeathMarker"]}
execute as @e[type=armor_stand,tag=hhNoMarker,sort=nearest,limit=1] on passengers on vehicle run tag @s remove hhNoMarker



##misc
#tp all respawn thingys to center if in end and give it no gravity
execute if entity @s[nbt={Dimension:"minecraft:the_end"}] positioned 0 80 0 positioned over motion_blocking run tp @e[type=armor_stand,tag=hhDeathVisual] ~ ~10 ~
execute if entity @s[nbt={Dimension:"minecraft:the_end"}] as @e[type=armor_stand,tag=hhDeathVisual] run data merge entity @s {NoGravity:1}