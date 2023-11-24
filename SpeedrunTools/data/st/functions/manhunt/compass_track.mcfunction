


##setup the armor stand to record player position of nearest hunted player into compass
#set a lodestone block
execute if score @s stDimension matches 0 at @a[tag=stHunted,sort=nearest,limit=1] run setblock ~ -64 ~ minecraft:lodestone
execute if score @s stDimension matches 1..2 at @a[tag=stHunted,sort=nearest,limit=1] run setblock ~ 0 ~ minecraft:lodestone
#summon armor stand
summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Tags:["stKill","stHuntAS"],ArmorItems:[{id:"minecraft:compass",Count:1b,tag:{stCompass:1,LodestoneDimension:"minecraft:overworld",LodestoneTracked:1b,LodestonePos:{X:0,Y:0,Z:0}}}]}
#update dimension y value
execute if score @s stDimension matches 0 run scoreboard players set @s stDimensionY -64
execute if score @s stDimension matches 1..2 run scoreboard players set @s stDimensionY 0
#store player position into armor stand compass position values
execute store result entity @e[type=minecraft:armor_stand,tag=stHuntAS,sort=nearest,limit=1] ArmorItems[0].tag.LodestonePos.X int 1 run data get entity @a[tag=stHunted,sort=nearest,limit=1] Pos[0]
execute store result entity @e[type=minecraft:armor_stand,tag=stHuntAS,sort=nearest,limit=1] ArmorItems[0].tag.LodestonePos.Y int 1 run scoreboard players get @s stDimensionY
execute store result entity @e[type=minecraft:armor_stand,tag=stHuntAS,sort=nearest,limit=1] ArmorItems[0].tag.LodestonePos.Z int 1 run data get entity @a[tag=stHunted,sort=nearest,limit=1] Pos[2]
#store dimension into armor stand compass value
data modify entity @e[type=minecraft:armor_stand,tag=stHuntAS,sort=nearest,limit=1] ArmorItems[0].tag.LodestoneDimension set from entity @s Dimension
#store compass into player selected slot
item replace entity @s weapon.mainhand from entity @e[type=minecraft:armor_stand,tag=stHuntAS,sort=nearest,limit=1] armor.feet
#kill the armor stand
kill @e[type=minecraft:armor_stand,tag=stHuntAS,sort=nearest,limit=1]
#say who the compass is tracking
tellraw @s [{"text":"Compass now tracking ","color":"green"},{"selector":"@a[tag=stHunted,sort=nearest,limit=1]","color":"gray"}]