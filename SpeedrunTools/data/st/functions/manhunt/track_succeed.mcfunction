##
 # edit_compass.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##edit compass from armor stand perspective
#say who the compass is tracking
title @a[tag=stHunter,sort=nearest,limit=1] actionbar [{"text":"Compass now tracking ","color":"green"},{"selector":"@a[tag=stHunted,distance=1..,sort=nearest,limit=1]","color":"gray"}]
#store player compass in armor stand mainhand
loot replace entity @s weapon.mainhand loot st:tracker
#set data from storage
#data modify storage st:manhunt tracker.target.pos set from entity @a[tag=stHunted,sort=nearest,limit=1] Pos
execute store result storage st:manhunt tracker.target.pos[0] int 1 run data get entity @a[tag=stHunted,distance=1..,sort=nearest,limit=1] Pos[0]
execute store result storage st:manhunt tracker.target.pos[1] int 1 run data get entity @a[tag=stHunted,distance=1..,sort=nearest,limit=1] Pos[1]
execute store result storage st:manhunt tracker.target.pos[2] int 1 run data get entity @a[tag=stHunted,distance=1..,sort=nearest,limit=1] Pos[2]
data modify storage st:manhunt tracker.target.dimension set from entity @a[tag=stHunted,distance=1..,sort=nearest,limit=1] Dimension
#store dimension into armor stand compass value
data modify entity @s HandItems[0].components."minecraft:lodestone_tracker" set from storage st:manhunt tracker
#store compass into player selected slot
item replace entity @a[tag=stHunter,sort=nearest,limit=1] weapon.mainhand from entity @s weapon.mainhand
#kill the armor stand
kill @s