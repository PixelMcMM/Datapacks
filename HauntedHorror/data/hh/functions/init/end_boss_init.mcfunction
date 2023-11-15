#####
#Made By PixelUniverse
#####


##make the end work correctly
#teleport warden to the center
execute positioned 0 80 0 positioned over motion_blocking run tp @e[type=warden,tag=hhWarden] ~ ~5 ~
#make sure enderman don't spawn and aren't in the end
gamerule doMobSpawning false
tp @e[type=enderman,distance=..200] 0 -500 0
kill @e[type=enderman,distance=..200]
#kill the ender dragon
kill @e[type=ender_dragon]
#try to replace end_portal
fill 2 50 -2 -2 80 2 air replace end_portal
#end the end init process once the ender dragon is dead, or try running it again
execute unless entity @e[type=ender_dragon] run tag @e[type=warden,tag=hhWarden] add hhEndInit