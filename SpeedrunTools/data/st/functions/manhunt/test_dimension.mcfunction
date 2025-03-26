##
 # test_dimension.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##test dimension using macro
$execute unless dimension $(Dimension) run return run function st:manhunt/track_fail
#run success function
$execute if dimension $(Dimension) positioned ~ ~50 ~ summon minecraft:armor_stand positioned ~ ~-50 ~ run function st:manhunt/track_succeed
