#####
#Made By PixelUniverse
#####


##do a recursion function to calculate how far to spawn warden bow projectiles
#give every executing entity a score
execute unless score @s hhArrowMotion1 matches 0.. run scoreboard players set @s hhArrowMotion1 1
#summon a marker one block in front and tp the executing marker forward
execute if score @s hhArrowMotion1 <= BowDistance hhArrowMotion1 positioned ~ ~1.5 ~ run summon marker ^ ^ ^1 {Tags:["hhMarker","hhWArrowMarker"]}
execute if score @s hhArrowMotion1 <= BowDistance hhArrowMotion1 run tp @s ^ ^ ^1
execute if score @s hhArrowMotion1 <= BowDistance hhArrowMotion1 run scoreboard players add @s hhArrowMotion1 1
#if the max bow length hasn't been reached, instantly recall this function the same game tick to make more arrow entities spawn
execute if score @s hhArrowMotion1 <= BowDistance hhArrowMotion1 as @s at @s run function hh:events/items/warden_bow/arrow
#kill marker after box length is reached
execute if score @s hhArrowMotion1 >= BowDistance hhArrowMotion1 run kill @s