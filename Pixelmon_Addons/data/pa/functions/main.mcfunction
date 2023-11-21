#####
#Made By PixelUniverse
#####


##spawning
#increment spawning timer
execute unless entity @a[tag=paPause] if score Timer paSpawnerTimer <= Timer paSpawnerDelay run scoreboard players add Timer paSpawnerTimer 1
#run main spawning function from the perspective of apropriate armor stands
execute as @e[type=armor_stand,tag=paAS] at @s run function pa:spawners/main
#reset spawning timer
execute if score Timer paSpawnerTimer >= Timer paSpawnerDelay run scoreboard players set Timer paSpawnerTimer 1