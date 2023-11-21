#####
#Made By PixelUniverse
#####


##spawner helper summoning and killing spawn eggs
#test if a spawner summoner entity exists and run function from it
execute if entity @s[tag=paSpawnerSummoner] as @s[tag=paSpawnerSummoner] at @s align xyz positioned ~.5 ~-2 ~.5 unless entity @e[predicate=pa:sh,distance=..0.5] run function pa:spawners/summon
execute if entity @s[tag=paSpawnerSummoner] run kill @s[tag=paSpawnerSummoner]
#test if a spawner killer entity exists and run function from it
execute if entity @s[tag=paSpawnerKiller] as @s[tag=paSpawnerKiller] at @s align xyz positioned ~.5 ~-2 ~.5 run function pa:spawners/kill


##spawner editing
#test if a player sneaks on top of a spawner helper and from function from them and remove tag when predicate is false
execute as @a[predicate=pa:player_edit,tag=!paSpawnerEdit] at @s align xyz positioned ~.5 ~-2 ~.5 if entity @e[predicate=pa:sh,distance=..0.5] run function pa:spawners/edit/init
execute as @a[predicate=!pa:player_edit,tag=paSpawnerEdit] run tag @s remove paSpawnerEdit
#test if a player has scores and run spawner storing function
execute as @a[predicate=pa:player_score] at @s run function pa:spawners/edit/criteria


##misc
#run distance checking function if spawner helper has reach timer limit
execute if score Timer paSpawnerTimer >= Timer paSpawnerDelay as @s[tag=paSpawnerHelper] if score @s paSpawnerDelay matches 1.. if score @s paSpawnerDist matches 1.. at @s run function pa:spawners/spawning/distance_check
#display nearest spawner helpers
execute at @a[gamemode=creative] run effect give @e[predicate=pa:sh,distance=..10,predicate=!pa:player_edit] minecraft:glowing 1 0 true
#spawner killing command if furnace is gone
execute as @s[tag=paSpawnerHelper] at @s unless block ~ ~-1 ~ minecraft:furnace{Items:[{Slot:1b,tag:{paData:{}}}]} run kill @s