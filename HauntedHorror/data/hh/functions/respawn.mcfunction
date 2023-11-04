#respawn player with temp boosts
gamemode survival @s
effect give @s resistance 10 255
effect give @s fire_resistance 25 0
effect give @s night_vision 10 0
effect give @s speed 10 1
#kill armor stand item
kill @e[type=item,distance=..3,nbt={Item:{id:"minecraft:armor_stand"}},sort=nearest,limit=1]
#kill marker entity
kill @e[type=marker,tag=hhDeathMarker,sort=nearest,limit=1]