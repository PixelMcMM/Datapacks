#####
#Made By PixelUniverse
#####


##do math to check player square distance and run function
#store player and marker positions
execute store result score @s paPos0 run data get entity @s Pos[0]
execute store result score @s paPos1 run data get entity @s Pos[1]
execute store result score @s paPos2 run data get entity @s Pos[2]
execute as @p store result score @s paPos0 run data get entity @s Pos[0]
execute as @p store result score @s paPos1 run data get entity @s Pos[1]
execute as @p store result score @s paPos2 run data get entity @s Pos[2]
#do math to calculate total distance on each axis
execute store result score @s paDistance0 run scoreboard players operation @s paPos0 -= @p paPos0
execute store result score @s paDistance1 run scoreboard players operation @s paPos1 -= @p paPos1
execute store result score @s paDistance2 run scoreboard players operation @s paPos2 -= @p paPos2
#make all values positive
execute if score @s paDistance0 matches ..-1 run scoreboard players operation @s paDistance0 *= -1 paNumbers
execute if score @s paDistance1 matches ..-1 run scoreboard players operation @s paDistance1 *= -1 paNumbers
execute if score @s paDistance2 matches ..-1 run scoreboard players operation @s paDistance2 *= -1 paNumbers
#compare scores to test if total distance is correct and set spawning time 
execute if score @s paDistance0 <= @s paSpawnerDist run scoreboard players add @s paDistanceTotal 1
execute if score @s paDistance1 <= @s paSpawnerDist run scoreboard players add @s paDistanceTotal 1
execute if score @s paDistance2 <= @s paSpawnerDist run scoreboard players add @s paDistanceTotal 1
#run function if all distance values are correct and if the spawner time is up
execute if score @s paDistanceTotal matches 3 if score @s paSpawnerTimer >= @s paSpawnerDelay run function pa:spawners/spawning/spawn
scoreboard players set @s paDistanceTotal 0


##misc
#increment score of spawner timer so after certain delay the spawner will spawn immediately if the player is close
execute if score @s paSpawnerTimer <= @s paSpawnerDelay run scoreboard players add @s paSpawnerTimer 1