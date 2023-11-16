#####
#Made By PixelUniverse
#####


###warden boots stuff
#store xp value and fire value
execute store result score @s hhXP run data get entity @s XpTotal
execute store result score @s hhFire run data get entity @s Fire
##replace nearby sculk for xp
execute if score @s hhSneak matches 1.. run summon marker ~ ~ ~ {Tags:["hhMarker","hhSculkMarker"]}
execute if score @s hhSneak matches 1.. store result score @e[type=marker,tag=hhSculkMarker,sort=nearest,limit=1] hhSneakT run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace #hh:sculk
execute if score @s hhSneak matches 1.. as @e[type=marker,tag=hhSculkMarker] at @s run function hh:events/items/warden_boots/xp
##give fire resistance in lava if they don't have fire resistance
#check if the player is on fire and add the tag
execute unless data entity @s[scores={hhXP=10..,hhFire=1..}] active_effects[{id:"minecraft:fire_resistance"}] run tag @s add hhOnFire
#if the player has the on fire tag give them fire resistance and take 10 experience
execute if entity @s[tag=hhOnFire] run xp add @s -10 points
execute if entity @s[tag=hhOnFire] run effect give @s minecraft:fire_resistance 10 0
#remove the on fire tag
tag @s[tag=hhOnFire] remove hhOnFire
##slow falling
#store fall distance
execute store result score @s hhFallDistance run data get entity @s FallDistance
#if fall distance is high, give slow falling when the ground is near and add tag
execute if score @s[scores={hhXP=5..}] hhFallDistance matches 4.. run tag @s add hhFalling
#give the effects to players with the falling tag
execute if entity @s[tag=hhFalling] run effect give @s minecraft:jump_boost 1 255 true
execute if entity @s[tag=hhFalling,nbt={OnGround:1b}] run xp add @s -5 points
#remove the falling tag
tag @s[tag=hhFalling,nbt={OnGround:1b}] remove hhFalling