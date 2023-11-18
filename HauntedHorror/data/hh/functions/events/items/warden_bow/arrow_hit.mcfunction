#####
#Made By PixelUniverse
#####


##make player take damage and have a shockwave effect
#take initial damage from being hit
execute unless score @s hhArrowMotion1 matches 1.. run damage @s 10 minecraft:sonic_boom by @a[tag=hhFiredWArrow2,sort=nearest,limit=1] from @a[tag=hhFiredWArrow2,sort=nearest,limit=1]
#add scoreboard time to executing player
scoreboard players add @s hhArrowMotion1 1
#summon particle and give damage after a second or so
execute if score @s hhArrowMotion1 matches 13.. run particle minecraft:sonic_boom ~ ~1 ~
execute if score @s hhArrowMotion1 matches 13.. run damage @s 10 minecraft:sonic_boom by @a[tag=hhFiredWArrow2,sort=nearest,limit=1] from @a[tag=hhFiredWArrow2,sort=nearest,limit=1]
#remove tags when finished and reset score
execute if score @s hhArrowMotion1 matches 13.. unless score @e[tag=hhWAHit,distance=1..,sort=nearest,limit=1] hhArrowMotion1 matches ..12 run tag @a[tag=hhFiredWArrow2,sort=nearest,limit=1] remove hhFiredWArrow2
execute if score @s hhArrowMotion1 matches 13.. run tag @s remove hhWAHit
execute if score @s hhArrowMotion1 matches 13.. run scoreboard players set @s hhArrowMotion1 0