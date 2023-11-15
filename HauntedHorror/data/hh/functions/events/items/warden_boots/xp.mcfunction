#####
#Made By PixelUniverse
#####


##recursively summon xp orbs for every value inside of the executing marker
execute if score @s hhSneakT matches 1.. run summon minecraft:experience_orb ~ ~ ~ {Value:3,Count:1}
execute if score @s hhSneakT matches 1.. run scoreboard players remove @s hhSneakT 1
execute if score @s hhSneakT matches 1.. run function hh:events/items/warden_boots/xp
#kill the entity if the value is zero
execute if score @s hhSneakT matches 0 run kill @s