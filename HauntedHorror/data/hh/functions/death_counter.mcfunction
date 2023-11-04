#reset scoreboard
scoreboard players set @s hhDeath 0


#adjust bossbar
scoreboard players remove Lives hhLives 1
execute store result bossbar minecraft:hhdeathbb value run scoreboard players get Lives hhLives
execute if score Lives hhLives matches 3 run bossbar set minecraft:hhdeathbb color yellow
execute if score Lives hhLives matches 2 run bossbar set minecraft:hhdeathbb color pink
execute if score Lives hhLives matches 1 run bossbar set minecraft:hhdeathbb color red


#summon placeholder entity
execute if score Lives hhLives matches 1.. run summon armor_stand ~ ~.5 ~ {NoBasePlate:1,Tags:["hhDeathVisual"],Glowing:1,Passengers:[{id:"minecraft:marker",Tags:["hhDeathMarker"]}]}
#tp all respawn thingys to center
execute as @e[type=armor_stand,tag=hhDeathVisual] run data merge entity @s {NoGravity:1}
execute if entity @s[nbt={Dimension:"minecraft:the_end"}] run tp @e[type=armor_stand,tag=hhDeathVisual] 0 80 0


#put player in spectator
gamemode spectator @s


#game over sequence
execute if score Lives hhLives matches 0 run gamemode spectator @a[tag=hhHunted,gamemode=survival]
execute if score Lives hhLives matches 0 run title @a[tag=hhHunted,gamemode=survival] title {"text":"GAME OVER","color":"red","bold":true}
execute if score Lives hhLives matches 0 run kill @e[type=armor_stand,tag=hhDeathVisual]