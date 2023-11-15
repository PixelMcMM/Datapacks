#####
#Made By PixelUniverse
#####


##Generate a unique number for the player and marker to keep the correct player revived when armor stand is destroyed
#add to the scoreboard and test if the value is taken to store the value on the player
scoreboard players add @s hhDeathOrder 1
execute as @e[type=marker,tag=hhDeathMarker,tag=!hhOrderDeath] if score @s hhDeathOrder = @e[type=marker,tag=hhOrderDeath,scores={hhDeathOrder=1..},sort=nearest,limit=1] hhDeathOrder run tag @e[type=marker,tag=hhOrderDeath,scores={hhDeathOrder=1..},sort=nearest,limit=1] add hhOrderDeathAgain
execute unless entity @s[tag=hhOrderDeathAgain] store result score @a[tag=hhOrderDeath,sort=nearest,limit=1] hhDeathOrder run scoreboard players get @s hhDeathOrder
tag @e[type=marker,tag=hhOrderDeathAgain] remove hhOrderDeathAgain
#remove death ordering tags from player and marker when successful
execute as @a[tag=hhHunted,tag=hhOrderDeath] if score @s hhDeathOrder matches 1.. run tag @s remove hhOrderDeath
execute if score @a[tag=hhHunted,tag=hhOrderDeath,sort=nearest,limit=1] hhDeathOrder matches 1.. run tag @s remove hhOrderDeath