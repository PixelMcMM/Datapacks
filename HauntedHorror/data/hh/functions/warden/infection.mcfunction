#####
#Made By PixelUniverse
#####


###infection
##misc
#kill infection marker if catalyst is gone
execute unless block ~ ~ ~ minecraft:sculk_catalyst run kill @s
#particles to show infection hotspot
execute if block ~ ~ ~ minecraft:sculk_catalyst run particle minecraft:cloud ~.5 ~1 ~.5 .1 .1 .1 .1 50
#create timer to slow down infection
tag @s remove hhBeginInfect
execute if score @s hhTimer matches 5.. run tag @s add hhBeginInfect
execute if score @s hhTimer matches 5.. run scoreboard players set @s hhTimer 0
##store infection in catalyst block every couple of seconds random
#create infection by storing data to the block
execute if entity @s[tag=hhBeginInfect] run data modify block ~ ~ ~ cursors set from entity @s data.cursors
#kill infection after enough time
execute unless score @s hhLives matches 0.. store result score @s hhLives run random value 5..10
execute if score @s hhLives matches 0 run kill @s
execute if entity @s[tag=hhBeginInfect] run scoreboard players remove @s hhLives 1
#increment timer
scoreboard players add @s hhTimer 1