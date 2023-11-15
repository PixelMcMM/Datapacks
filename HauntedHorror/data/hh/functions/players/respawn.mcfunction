#####
#Made By PixelUniverse
#####


##players
#change gamemode
gamemode survival @s
#respawn player with temp boosts
effect give @s resistance 10 255
effect give @s fire_resistance 25 0
effect give @s night_vision 10 0
effect give @s speed 10 1
#reset death order score
scoreboard players set @s hhDeathOrder 0


##misc
#kill armor stand item
kill @e[type=item,distance=..3,nbt={Item:{id:"minecraft:armor_stand"}},sort=nearest,limit=1]
#kill marker entity
kill @e[type=marker,tag=hhDeathMarker,tag=!hhNoRespawn,sort=nearest,limit=1]
#remove 1 from lives and store value back in bossbar
execute store result bossbar minecraft:hhdeathbb value run scoreboard players remove Lives hhLives 1


