#####
#Made By PixelUniverse
#####


##send test for help
#send blanket message
tellraw @s {"text":"---------------","color":"dark_gray"}
#spawners
tellraw @s {"text":"Spawners help:","bold":true}
tellraw @s [{"text":"- Use "},{"text":"/function pa:spawners/give ","color":"gray","insertion":"/function pa:spawners/give"},{"text":"to give yourself the spawner helper entity. (Shift click command to autofill)","color":"white"}]
tellraw @s {"text":"- Place down spawner entity on a Pixelmon spawner to use. Shift on top of the spawner in creative mode to edit it's criteria"}
tellraw @s {"text":"- Editing Criteria:"}
tellraw @s {"text":"  * Weather (clear or rainy)"}
tellraw @s {"text":"  * Daytime (day or night)"}
tellraw @s {"text":"  * Distance (distance until spawner spawns)"}
tellraw @s {"text":"  * Delay (delay until spawner spawns)"}
#send blanket message
tellraw @s {"text":"---------------","color":"dark_gray"}