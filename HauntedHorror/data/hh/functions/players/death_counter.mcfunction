#####
#Made By PixelUniverse
#####


##players
#put player in spectator
gamemode spectator @s
#teleport the player to the death position
tp @s ~ ~ ~
#add tag to order death
tag @s add hhOrderDeath


##summon the armorstand and marker and do necessary procedures
#summon respawn entities
summon armor_stand ~ ~.5 ~ {NoBasePlate:1,Tags:["hhDeathVisual","hhMarker"],Glowing:1,Passengers:[{id:"minecraft:marker",Tags:["hhDeathMarker","hhOrderDeath","hhMarker"]}]}
#tp all respawn thingys to center if in end and give it no gravity
execute if entity @s[nbt={Dimension:"minecraft:the_end"}] positioned 0 80 0 positioned over motion_blocking run tp @e[type=armor_stand,tag=hhDeathVisual] ~ ~10 ~
execute if entity @s[nbt={Dimension:"minecraft:the_end"}] as @e[type=armor_stand,tag=hhDeathVisual] run data merge entity @s {NoGravity:1}