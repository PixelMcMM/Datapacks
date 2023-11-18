#####
#Made By PixelUniverse
#####


##pause function
#add tag to player executing
tag @a remove hhPause
#run function from the perspective of the warden
execute if entity @s[type=!warden] as @e[type=warden,tag=hhWarden] run function hh:events/resume
#run the rest of the function from the perspective of warden to pause everything
execute if entity @s[tag=hhWarden] run data modify entity @s NoAI set value 0


##gamerule adjustments
gamerule doDaylightCycle true