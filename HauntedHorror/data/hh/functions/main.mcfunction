#have markers spawn near the players to track where they die
execute as @a[tag=hhHunted] at @s run spawnpoint


#test for deaths
execute as @a[scores={hhDeath=1..},tag=hhHunted] at @s run function hh:death_counter


#make bossbar display
bossbar set hhdeathbb players @a[tag=hhHunted]
#kill extra wardens if there are two for some reason
tag @e[type=warden,tag=hhWarden,sort=random,limit=1] add hhRandomWarden
execute if entity @e[type=warden,tag=!hhRandomWarden] run kill @e[type=warden,tag=!hhRandomWarden]
tag @e[type=warden,tag=hhRandomWarden] remove hhRandomWarden 
#keep warden from digging away
execute as @e[type=warden,tag=hhWarden] store result score @s hhLives run data get entity @s Brain.memories."minecraft:dig_cooldown".ttl
execute as @e[type=warden,tag=hhWarden] if score @s hhLives matches ..5 run data modify entity @s Brain.memories."minecraft:dig_cooldown".ttl set value 1000


#death visual entity
execute as @a[tag=hhHunted,gamemode=spectator] at @s run ride @s mount @e[type=armor_stand,tag=hhDeathVisual,sort=nearest,limit=1]
execute as @a[tag=hhHunted,gamemode=spectator] at @s unless entity @e[type=armor_stand,tag=hhDeathVisual,distance=..2] run tp @s @e[type=armor_stand,tag=hhDeathVisual,sort=nearest,limit=1]
execute at @e[type=marker,tag=hhDeathMarker] unless entity @e[type=armor_stand,tag=hhDeathVisual] if score Lives hhLives matches 1.. as @a[tag=hhHunted,gamemode=spectator,distance=..2] at @s run function hh:respawn
execute at @e[type=armor_stand,tag=hhDeathVisual] run particle minecraft:cloud ~ ~.5 ~ .5 .5 .5 .01 1
#do a random check to see if multiple armor stands too close
tag @e[type=armor_stand,tag=hhDeathVisual,sort=random,limit=1] add hhDuplicateRespawn
execute at @e[type=armor_stand,tag=hhDuplicateRespawn] as @e[type=armor_stand,tag=hhDeathVisual,tag=!hhDuplicateRespawn,distance=..2] on passengers run kill @s[type=marker]
execute as @e[type=armor_stand,tag=hhDuplicateRespawn] at @s if entity @e[type=armor_stand,tag=hhDeathVisual,tag=!hhDuplicateRespawn,distance=..2] run kill @e[type=armor_stand,tag=hhDeathVisual,tag=!hhDuplicateRespawn,distance=..2]
tag @e[type=armor_stand,tag=hhDuplicateRespawn] remove hhDuplicateRespawn



#timer increment for warden anger function
scoreboard players add hhTimer hhTimer 1
execute if score hhTimer hhTimer matches 20.. unless entity @a[tag=hhHunted,nbt={Dimension:"minecraft:the_end"}] as @e[type=warden,tag=hhWarden] at @s run function hh:warden_behavior


#run function for warden in end
execute if score hhTimer hhTimer matches 20.. if entity @a[tag=hhHunted,nbt={Dimension:"minecraft:the_end"}] as @e[type=warden,tag=hhWarden] at @s run function hh:end_dimension
execute unless entity @a[tag=hhHunted,nbt={Dimension:"minecraft:overworld"}] as @e[type=marker,tag=hhECMarker] at @s run function hh:end_heal_warden

execute store result bossbar minecraft:hhwardenbb value run data get entity @e[type=warden,tag=hhWarden,limit=1] Health


##infection rules
#test for blocks
execute as @a[tag=hhHunted,gamemode=survival,nbt={OnGround:1b}] at @s if block ~ ~-.1 ~ #hh:sculk unless block ~ ~ ~ #minecraft:wool_carpets run tag @s add hhInfected
execute as @a[tag=hhHunted,gamemode=survival,nbt={OnGround:1b}] at @s if block ~ ~.1 ~ minecraft:sculk_vein run tag @s add hhInfected
#give effects
effect give @a[tag=hhInfected] wither 2 0
effect give @a[tag=hhInfected] nausea 2 0
#remove tag
tag @a[tag=hhInfected] remove hhInfected


#give creative buffs
execute as @a[tag=hhHunted,gamemode=creative] run function hh:creative_tools


#summon the warden when entity is placed
execute as @e[type=marker,tag=hhSummonMarker] at @s run function hh:warden_summon