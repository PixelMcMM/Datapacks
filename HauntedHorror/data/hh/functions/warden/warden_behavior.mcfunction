#####
#Made By PixelUniverse
#####


##misc
#reset timer scoreboard
execute unless score @s hhTimer matches 0.. run scoreboard players set @s hhTimer 0
#keep warden from suffocating
execute unless block ~ ~1 ~ #hh:transparent run fill ~ ~ ~ ~ ~2 ~ air
#keep warden from dying outside of the end
effect give @s resistance 1 255 true
effect give @s regeneration 1 255 true
#keep him from unloading outside of the end
setworldspawn ~ ~ ~
#set the warden or teleport marker as the border center
tag @e[tag=hhBorderCenter] remove hhBorderCenter
execute unless entity @e[type=marker,tag=hhTeleportMarker] run tag @e[type=warden,tag=hhWarden] add hhBorderCenter
tag @e[type=marker,tag=hhTeleportMarker] add hhBorderCenter
#set the border size
worldborder set 250
#cause the warden's target to glow
execute if data entity @s anger.suspects[0] run function hh:warden/warden_targetting


##warden infection
#give the warden slowness and weakness right before he spawns infection
execute if score @s hhTimer matches 3 unless entity @a[tag=hhHunted,gamemode=survival,sort=nearest,limit=1,distance=20..] run effect give @s slowness 4 3
execute if score @s hhTimer matches 3 run effect give @s weakness 10 10
#if zero, spawn a catalyst and marker
execute if score @s hhTimer matches 0 if block ~ ~-1 ~ #hh:infectable run tag @s add hhWardenInfect
execute if entity @e[type=warden,tag=hhWardenInfect] align xyz run summon marker ~ ~-1 ~ {Tags:["hhCatalystMarker","hhMarker"],data:{cursors:[{charge:30,pos:[I;0,0,0],update_delay:0}]},PortalCooldown:1000}
execute if entity @e[type=warden,tag=hhWardenInfect] run data modify entity @e[type=marker,tag=hhCatalystMarker,sort=nearest,limit=1] data.cursors[0].pos set from entity @e[type=marker,tag=hhCatalystMarker,sort=nearest,limit=1] Pos
execute if entity @e[type=warden,tag=hhWardenInfect] align xyz run fill ~-1 ~-2 ~ ~1 ~-1 ~ minecraft:sculk replace #hh:infectable
execute if entity @e[type=warden,tag=hhWardenInfect] align xyz run fill ~ ~-2 ~-1 ~ ~-1 ~1 minecraft:sculk replace #hh:infectable
execute if entity @e[type=warden,tag=hhWardenInfect] align xyz run setblock ~ ~-1 ~ minecraft:sculk_catalyst
tag @e[type=warden,tag=hhWardenInfect] remove hhWardenInfect
#add to timer to cause the warden to infect blocks
execute if score @s hhTimer matches 0 store result score @s hhTimer run random value 30..50
scoreboard players remove @s hhTimer 1
#infection running stuff
execute as @e[type=marker,tag=hhCatalystMarker] at @s run function hh:warden/infection


##warden teleport stuff
#test if players are too far away and summon marker
execute if dimension minecraft:overworld unless entity @s[tag=hhWardenTeleport] as @a[tag=hhHunted,gamemode=survival,sort=nearest,limit=1] unless entity @s[nbt={Dimension:"minecraft:overworld"},distance=..50] at @s run summon marker ~ ~ ~ {Tags:["hhTeleportMarker"],data:{anger:{suspects:[{uuid:[],anger:0}]}}}
execute if dimension minecraft:the_nether unless entity @s[tag=hhWardenTeleport] as @a[tag=hhHunted,gamemode=survival,sort=nearest,limit=1] unless entity @s[nbt={Dimension:"minecraft:the_nether"},distance=..50] at @s run summon marker ~ ~ ~ {Tags:["hhTeleportMarker"],data:{anger:{suspects:[{uuid:[],anger:0}]}}}
tag @s remove hhWardenTeleport
execute if entity @e[type=marker,tag=hhTeleportMarker] run tag @s add hhWardenTeleport
#set timer for marker to teleport warden after certain time
scoreboard players add @e[type=marker,tag=hhTeleportMarker] hhTimer 1
#add particles to marker
execute as @e[type=marker,tag=hhTeleportMarker] if score @s hhTimer matches ..6 at @s run particle minecraft:portal ~ ~ ~ .1 .1 .1 1 500
#keep warden from summoning inside of portal
execute as @e[type=marker,tag=hhTeleportMarker] at @s if block ~ ~ ~ minecraft:nether_portal run tp @s @a[tag=hhHunted,gamemode=survival,sort=nearest,limit=1]
#teleport warden and have cool effects
execute as @e[type=marker,tag=hhTeleportMarker] if score @s hhTimer matches 1 at @s run playsound minecraft:block.sculk_shrieker.shriek ambient @a[tag=hhHunted] ~ ~ ~ 10 .1
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 6 run data merge entity @s {Invulnerable:1b,PortalCooldown:2000}
execute as @e[type=marker,tag=hhTeleportMarker] if score @s hhTimer matches 6 at @s run summon lightning_bolt
execute as @e[type=marker,tag=hhTeleportMarker] if score @s hhTimer matches 6 at @s run tp @e[type=warden,tag=hhWarden,sort=nearest,limit=1] @s
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 7.. run data merge entity @s {Invulnerable:0b}
#make warden angry if you tp too much
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 5 if entity @s[nbt={anger:{suspects:[]}}] run data merge entity @s {anger:{suspects:[{uuid:[I;0,0,0,0],anger:100}]}}
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 5 unless score @s hhWardenAnger matches 150.. run scoreboard players add @s hhWardenAnger 40
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 5 run data modify entity @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] data.anger.suspects[0].uuid set from entity @a[tag=hhHunted,gamemode=survival,sort=nearest,limit=1] UUID
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 5 store result entity @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] data.anger.suspects[0].anger int 1 run scoreboard players get @s hhWardenAnger
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 5 run data modify entity @s anger.suspects[0] set from entity @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] data.anger.suspects[0]
execute if score @e[type=marker,tag=hhTeleportMarker,sort=nearest,limit=1] hhTimer matches 7 if score @s hhWardenAnger matches 110.. if entity @a[tag=hhHunted,gamemode=survival,sort=nearest,limit=1,distance=30..] run effect give @s speed 15 1
#kill marker
kill @e[type=marker,tag=hhTeleportMarker,scores={hhTimer=7..}]
#remove from anger counter
execute if score @s[] hhWardenAnger matches 1.. run scoreboard players remove @s hhWardenAnger 1