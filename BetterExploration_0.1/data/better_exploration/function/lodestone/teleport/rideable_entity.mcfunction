##
 # rideable_entity.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##modify area_effect_cloud
#set duration
data modify entity @s Duration set value 2
#have player ride cloud
ride @a[tag=better_exploration.current_player,limit=1] mount @s