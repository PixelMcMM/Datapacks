#tp warden to the end
execute in minecraft:the_end positioned over motion_blocking run tp 0 ~5 0
tag @s add hhEndInit

#make sure enderman don't spawn
gamerule commandModificationBlockLimit 30000000
fillbiome -200 0 -200 200 180 200 minecraft:deep_dark
tp @e[type=ender_dragon] 0 -500 0
tp @e[type=enderman,distance=..200] 0 -500 0