execute positioned 0 80 0 positioned over motion_blocking run tp @e[type=warden,tag=hhWarden] ~ ~5 ~

#make sure enderman don't spawn
gamerule commandModificationBlockLimit 30000000
gamerule doMobSpawning false
kill @e[type=ender_dragon]
tp @e[type=enderman,distance=..200] 0 -500 0
kill @e[type=enderman,distance=..200]
#try to replace end_portal
fill 2 50 -2 -2 80 2 air replace end_portal

execute unless entity @e[type=ender_dragon] run tag @e[type=warden,tag=hhWarden] add hhEndInit