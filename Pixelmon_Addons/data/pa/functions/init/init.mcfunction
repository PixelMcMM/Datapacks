#####
#Made By PixelUniverse
#####


##misc
#send install message
tellraw @a[gamemode=creative] {"text":"Thank you for installing Pixelmon Addons! Shift click this message for help on using the datapack","color":"gold","bold":true,"insertion":"/function pa:init/addons_help"}


###scoreboards
#numbers objective
scoreboard objectives add paNumbers dummy
scoreboard players set -1 paNumbers -1
##spawners
#stats stored in spawner helper
scoreboard objectives add paSpawnerDaytime dummy
scoreboard objectives add paSpawnerWeather dummy
scoreboard objectives add paSpawnerDist dummy
scoreboard objectives add paSpawnerDelay dummy
scoreboard objectives add paSpawnerTimer dummy
#set global spawner timer and delay
scoreboard players set Timer paSpawnerDelay 20
scoreboard players set Timer paSpawnerTimer 0
#scoreboard to track criteria success
scoreboard objectives add paSpawnerSuccess dummy
##entity distance
#scoreboards for entity distance
scoreboard objectives add paPos0 dummy
scoreboard objectives add paPos1 dummy
scoreboard objectives add paPos2 dummy
scoreboard objectives add paDistance0 dummy
scoreboard objectives add paDistance1 dummy
scoreboard objectives add paDistance2 dummy
scoreboard objectives add paDistanceTotal dummy