##
 # not_safe.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


##spread player around area to safe spot
spreadplayers ~ ~ 0 3 false @s
#send message
execute store result score $dummy better_exploration.numbers run random value 1..
execute store result storage better_exploration:temp values.dummy int 1 run scoreboard players operation $dummy better_exploration.numbers %= $msg_length better_exploration.numbers
function better_exploration:lodestone/teleport/check_location/store_message with storage better_exploration:temp values
function better_exploration:lodestone/teleport/check_location/message with storage better_exploration:temp values