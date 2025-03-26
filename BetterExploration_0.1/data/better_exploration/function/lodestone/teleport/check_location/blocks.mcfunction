##
 # blocks.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##test for safe blocks and lodestone
execute unless block ~ ~ ~ #better_exploration:safe_block run return run function better_exploration:lodestone/teleport/check_location/not_safe
execute unless block ~ ~1 ~ #better_exploration:safe_block run return run function better_exploration:lodestone/teleport/check_location/not_safe
#check lodestone
execute unless block ~ ~-1 ~ minecraft:lodestone run return run function better_exploration:lodestone/teleport/check_location/not_safe