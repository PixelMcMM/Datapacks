##
 # store_data.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##store data for teleport then revoke advancement
#store lodestone data to storage
data modify storage better_exploration:temp compass.lodestone set from entity @s Inventory[{Slot:-106b}].components."minecraft:lodestone_tracker"
data modify storage better_exploration:temp compass.x set from storage better_exploration:temp compass.lodestone.target.pos[0]
data modify storage better_exploration:temp compass.y set from storage better_exploration:temp compass.lodestone.target.pos[1]
data modify storage better_exploration:temp compass.z set from storage better_exploration:temp compass.lodestone.target.pos[2]
data modify storage better_exploration:temp compass.dimension set from storage better_exploration:temp compass.lodestone.target.dimension
#teleport player to lodestone
function better_exploration:lodestone/teleport/teleport with storage better_exploration:temp compass
#playsound
execute at @s run playsound minecraft:entity.player.teleport player @a[distance=..20] ~ ~ ~ 1
#particle
execute at @s run particle minecraft:dust_plume ~ ~1 ~ .5 .5 .5 0 50
#check location of player to make sure it's survivable
execute at @s run function better_exploration:lodestone/teleport/check_location/blocks


#revoke advancement
advancement revoke @s only better_exploration:lodestone/eat_chorus_fruit