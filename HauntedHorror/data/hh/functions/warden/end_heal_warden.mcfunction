#####
#Made By PixelUniverse
#####


##heal the warden using the end crystals
#run armor stand to heal warden
tp @s ^ ^ ^.5 facing entity @e[type=warden,tag=hhWarden,sort=nearest,limit=1] eyes
particle minecraft:electric_spark ~ ~ ~ .1 .1 .1 .01 10
#heal warden with marker
execute as @e[type=warden,tag=hhWarden,distance=..3] if entity @s run effect give @s instant_health 1 1
execute if entity @e[type=warden,tag=hhWarden,distance=..3] run particle heart ~ ~ ~ 1 1 1 .1 5
execute if entity @e[type=warden,tag=hhWarden,distance=..3] run kill @s
#kill markers if warden is gone
execute unless entity @e[type=warden,tag=hhWarden,distance=..50] run kill @s