#####
#Made By PixelUniverse
#####


##Start the hunt
#run the summoning function if the Lives scoreboard is adjusted
execute as @e[type=marker,scores={hhLives=1..},tag=!hhCatalystMarker] at @s run function hh:init/warden_summon


###player death and respawns
##run the main function from the perspective of each player off of the timer twice every second
execute if score hhTimer hhTimer matches 10 as @a[tag=hhHunted] at @s run function hh:players/respawn/main
execute if score hhTimer hhTimer matches 20 as @a[tag=hhHunted] at @s run function hh:players/respawn/main
#give death record markers timer score to keep them from getting killed too early
execute as @e[type=marker,tag=hhDeathRecord,scores={hhTimer=20..}] at @s run function hh:silent_kill
execute if entity @e[type=marker,tag=hhDeathRecord] run scoreboard players add @e[type=marker,tag=hhDeathRecord] hhTimer 1
##particles for death armor stands
#run particles based on lives available
execute if score Lives hhLives matches 1.. at @e[type=armor_stand,tag=hhDeathVisual] run particle minecraft:cloud ~ ~.5 ~ .5 .5 .5 .01 1
execute if score Lives hhLives matches 0 at @e[type=armor_stand,tag=hhDeathVisual] run particle minecraft:dust 1 0 0 1 ~ ~.5 ~ .5 .5 .5 .01 10
#change armor stand invulnerability based on life counter
execute if score Lives hhLives matches 1.. as @e[type=armor_stand,tag=hhDeathVisual] run data merge entity @s {Invulnerable:0}
execute if score Lives hhLives matches 0 as @e[type=armor_stand,tag=hhDeathVisual] run data merge entity @s {Invulnerable:1}
#if the death marker is in lava, tp it upwards and reset its fire tick to keep it from burning
execute as @e[type=armor_stand,tag=hhDeathVisual] at @s if block ~ ~ ~ minecraft:lava run tp @s ~ ~.1 ~
execute as @e[type=armor_stand,tag=hhDeathVisual] run data merge entity @s {Fire:0}
##regenerate respawns
#increment regen time if lives aren't full
execute unless entity @a[tag=hhPause] if score Lives hhLives < LifeCount hhLives run scoreboard players add Regen hhLives 1
#add a life if the timer reaches the regen time and the lives aren't capped and update bossbar
execute if score Lives hhLives < LifeCount hhLives if score Regen hhLives >= RegenTime hhLives run scoreboard players add Lives hhLives 1
#reset timer
execute if score Regen hhLives >= RegenTime hhLives run scoreboard players set Regen hhLives 0


###warden behavior
##infection rules
#test for blocks
execute as @a[tag=hhHunted,gamemode=survival,nbt={OnGround:1b}] at @s if block ~ ~-.1 ~ #hh:sculk unless block ~ ~ ~ #minecraft:wool_carpets run tag @s add hhInfected
execute as @a[tag=hhHunted,gamemode=survival,nbt={OnGround:1b}] at @s if block ~ ~.1 ~ minecraft:sculk_vein run tag @s add hhInfected
#give effects
effect give @a[tag=hhInfected] wither 2 0
effect give @a[tag=hhInfected] nausea 2 0
#remove tag
tag @a[tag=hhInfected] remove hhInfected
##warden behavior functions
#warden behavior functions for not end and end dimension
execute if score hhTimer hhTimer matches 20.. unless entity @a[tag=hhHunted,nbt={Dimension:"minecraft:the_end"}] as @e[type=warden,tag=hhWarden] at @s run function hh:warden/warden_behavior
execute if score hhTimer hhTimer matches 20.. if entity @a[tag=hhHunted,nbt={Dimension:"minecraft:the_end"}] as @e[type=warden,tag=hhWarden] at @s in minecraft:the_end run function hh:warden/end_dimension
execute unless entity @a[tag=hhHunted,nbt={Dimension:"minecraft:overworld"}] as @e[type=marker,tag=hhECMarker] at @s run function hh:warden/end_heal_warden
##ambient warden behavior
#kill extra wardens if there are two for some reason
tag @e[type=warden,tag=hhWarden,sort=random,limit=1] add hhRandomWarden
execute if entity @e[type=warden,tag=!hhRandomWarden] run kill @e[type=warden,tag=!hhRandomWarden]
tag @e[type=warden,tag=hhRandomWarden] remove hhRandomWarden 
#keep warden from digging away
execute as @e[type=warden,tag=hhWarden] store result score @s hhLives run data get entity @s Brain.memories."minecraft:dig_cooldown".ttl
execute as @e[type=warden,tag=hhWarden] if score @s hhLives matches ..5 run data modify entity @s Brain.memories."minecraft:dig_cooldown".ttl set value 1000
##border
#if the overworld run world border normally
execute at @e[tag=hhBorderCenter] if dimension minecraft:overworld run worldborder center ~ ~
#set worldborder center to warden unless there is a teleport marker and set the border to the right distance for each dimension
execute at @e[tag=hhBorderCenter] if dimension minecraft:the_nether summon marker at @s run function hh:warden/world_border
#make the warden glow if a player is close
execute as @e[type=warden,tag=hhWarden] at @s if entity @a[tag=hhHunted,distance=..25] run effect give @s glowing 1 0 true
##player mods
#give resistance to close players so they don't die so quickly from the sonic blast
execute at @e[type=warden,tag=hhWarden] run effect give @a[tag=hhHunted,gamemode=survival,distance=..20] resistance 3 1 true


###bosbar logic
##respawns bossbar
#adjust the color based on how many lives are remaining
execute if score Lives hhLives matches 3.. run bossbar set minecraft:hhdeathbb color green
execute if score Lives hhLives matches 2 run bossbar set minecraft:hhdeathbb color yellow
execute if score Lives hhLives matches 1 run bossbar set minecraft:hhdeathbb color red
#make bossbar display and update it
bossbar set hhdeathbb players @a[tag=hhHunted]
execute store result bossbar hhdeathbb value run scoreboard players get Lives hhLives
##store warden health
execute store result bossbar minecraft:hhwardenbb value run data get entity @e[type=warden,tag=hhWarden,limit=1] Health



##misc
#hhTimer
execute unless entity @a[tag=hhPause] run scoreboard players add hhTimer hhTimer 1
execute if score hhTimer hhTimer matches 21.. run scoreboard players set hhTimer hhTimer 1
#store player uuid if it is not stored
execute as @a run function hh:players/store_uuid


#give creative buffs
execute as @a[tag=hhHunted,gamemode=creative] run function hh:players/creative_tools