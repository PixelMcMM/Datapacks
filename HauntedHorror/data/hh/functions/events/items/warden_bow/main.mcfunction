#####
#Made By PixelUniverse
#####


###player rewards
##warden bow
#store arrow values near the player into scores
execute store result score @s hhArrowMotion1 run data get entity @s Motion[0] 100
execute store result score @s hhArrowMotion2 run data get entity @s Motion[1] 100
execute store result score @s hhArrowMotion3 run data get entity @s Motion[2] 100
#change negative motion values in the arrows to positive ones
execute if score @s hhArrowMotion1 matches ..-1 run scoreboard players operation @s hhArrowMotion1 *= -1 hhArrowMotion1
execute if score @s hhArrowMotion2 matches ..-1 run scoreboard players operation @s hhArrowMotion2 *= -1 hhArrowMotion1
execute if score @s hhArrowMotion3 matches ..-1 run scoreboard players operation @s hhArrowMotion3 *= -1 hhArrowMotion1
#add the arrow motion values together
execute store result score total hhArrowMotion1 run scoreboard players get @s hhArrowMotion1
scoreboard players operation total hhArrowMotion1 += @s hhArrowMotion2
scoreboard players operation total hhArrowMotion1 += @s hhArrowMotion3
#if the value is over the bow charge value turn this arrow into a warden arrow
execute if score total hhArrowMotion1 >= BowCharge hhArrowMotion1 run summon marker ~ ~ ~ {Tags:["hhMarker","hhWAManager"]}
execute if score total hhArrowMotion1 >= BowCharge hhArrowMotion1 run tp @e[type=marker,tag=hhWAManager] @p
execute if score total hhArrowMotion1 >= BowCharge hhArrowMotion1 as @e[type=marker,tag=hhWAManager] at @s run function hh:events/items/warden_bow/arrow
#give firing player immunity tag and tracking tag
tag @p add hhFiredWArrow
tag @p add hhFiredWArrow2
#display warden particle and play warden firing sound
execute at @e[type=marker,tag=hhWArrowMarker] run tag @e[tag=!hhFiredWArrow,distance=..2.5] add hhWAHit
execute at @e[type=marker,tag=hhWArrowMarker] run particle minecraft:sonic_boom
execute if score total hhArrowMotion1 >= BowCharge hhArrowMotion1 run playsound minecraft:entity.warden.sonic_boom hostile @a ~ ~ ~
#kill the warden arrows, the markers
execute if score total hhArrowMotion1 >= BowCharge hhArrowMotion1 run kill @s
kill @e[type=marker,tag=hhWArrowMarker]
#remove player tag
tag @p remove hhFiredWArrow