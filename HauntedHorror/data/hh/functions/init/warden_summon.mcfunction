#####
#Made By PixelUniverse
#####


##set player lives count through bossbars
execute store result bossbar minecraft:hhdeathbb max run scoreboard players get @s hhLives
execute store result bossbar minecraft:hhdeathbb value run scoreboard players get @s hhLives
execute store result score Lives hhLives run scoreboard players get @s hhLives
execute store result score LifeCount hhLives run scoreboard players get @s hhLives


##general items
#add players to the hunted group
tag @a add hhHunted
#creative mode spawn time
execute if entity @p[gamemode=creative] run scoreboard players set @s[scores={hhTimer=..180}] hhTimer 185
#add tag to marker to allow it to be killed if neccesary
tag @s add hhMarker
#show spawning particles
particle minecraft:cloud ~ ~1 ~ .5 .5 .5 .01 20
#kill any existing wardens
kill @e[type=warden,tag=hhWarden]


##timer math
#increment timer
scoreboard players add @s hhTimer 1
#funny lightning bolt
execute if score @s hhTimer matches 185 run summon lightning_bolt
#summon warden
execute if score @s hhTimer matches 200 summon warden run tag @s add hhWarden
#kill the marker after enough time
execute if score @s hhTimer matches 200.. run kill @s