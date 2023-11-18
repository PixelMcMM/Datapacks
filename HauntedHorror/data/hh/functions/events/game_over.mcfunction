#####
#Made By PixelUniverse
#####


##commands for when all players are dead
#run death message
title @s title {"text":"GAME OVER","color":"dark_red","bold":"true"}
#play death sound
playsound minecraft:entity.ghast.death ambient @s ~ ~ ~ 2 .5
#all players in spectator
gamemode spectator @s
#remove player tags
tag @s remove hhHunted