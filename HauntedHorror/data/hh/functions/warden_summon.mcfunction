#add players to the hunted group
tag @a[distance=..30] add hhHunted
effect give @a[tag=hhHunted] glowing 1 0 true

#increment timer
scoreboard players add @s hhTimer 1
#creative mode spawn time
execute if entity @p[gamemode=creative] run scoreboard players set @s[scores={hhTimer=..180}] hhTimer 185
#show particles
particle minecraft:cloud ~ ~1 ~ .5 .5 .5 .01 20
#funny lightning bolt
execute if score @s hhTimer matches 190 run summon lightning_bolt
#summon warden
execute if score @s hhTimer matches 200 summon warden run tag @s add hhWarden
#kill the marker after enough time
execute if score @s hhTimer matches 200.. run kill @s