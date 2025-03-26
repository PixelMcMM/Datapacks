##
 # eat_chorus_fruit.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##activate lodestone compass after chorus fruit is eaten
#end function if not active lodestone compass
execute unless items entity @s weapon.offhand minecraft:compass[minecraft:lodestone_tracker] run return run advancement revoke @s only better_exploration:lodestone/eat_chorus_fruit
execute unless data entity @s Inventory[{Slot:-106b}].components."minecraft:lodestone_tracker".target run return run advancement revoke @s only better_exploration:lodestone/eat_chorus_fruit
#set current player
tag @a[tag=better_exploration.current_player] remove better_exploration.current_player
tag @s add better_exploration.current_player
#player particles and sound
particle minecraft:cloud ~ ~1.5 ~ .5 .5 .5 .1 100
particle minecraft:portal ~ ~1 ~ 0 0 0 .8 200
playsound minecraft:block.portal.trigger player @a[distance=..30] ~ ~ ~ .5 1.5
#schedule function
schedule function better_exploration:lodestone/teleport/schedule_tp 1t append