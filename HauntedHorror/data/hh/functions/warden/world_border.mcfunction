#####
#By PixelUniverse
#####


##set the world border at the warden in the overworld and nether
#store position values for the entity
execute store result score @s hhEntityX run data get entity @s Pos[0] 100
execute store result score @s hhEntityZ run data get entity @s Pos[2] 100
#multiply position by 8
scoreboard players operation @s hhEntityX *= 8 hhNumberStore
scoreboard players operation @s hhEntityZ *= 8 hhNumberStore
#store multiplied values back into entity position
execute store result entity @s Pos[0] double .01 run scoreboard players get @s hhEntityX
execute store result entity @s Pos[2] double .01 run scoreboard players get @s hhEntityZ
#set world border center
execute in minecraft:overworld run worldborder center ~ ~
#kill marker entity
function hh:silent_kill