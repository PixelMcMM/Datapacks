##
 # give_compass.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


#give compass
loot give @s loot st:tracker
#kill compass items
kill @e[predicate=st:tracker_item]


#revoke advancement
advancement revoke @s only st:test_compass