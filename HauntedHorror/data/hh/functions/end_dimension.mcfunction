#reset scoreboard
scoreboard players set hhTimer hhTimer 0
execute unless score @s hhTimer matches 0.. run scoreboard players set @s hhTimer 0


#execute init function
execute unless score @s hhECTimer matches 4.. run scoreboard players add @s hhECTimer 1
execute if score @s hhECTimer matches 4.. unless entity @s[tag=hhEndInit] as @a[tag=hhHunted,nbt={Dimension:"minecraft:the_end"}] at @s run function hh:boss_init
#display warden's health on bossbar
bossbar set hhwardenbb players @a[tag=hhHunted] 


##warden infection stuff
execute if score @s hhTimer matches 3 run effect give @s weakness 5 10
#if zero, spawn a catalyst and marker
execute if score @s hhTimer matches 0 if block ~ ~-1 ~ #hh:infectable run tag @s add hhWardenInfect
execute if entity @s[tag=hhWardenInfect] align xyz run summon marker ~ ~-1 ~ {Tags:["hhCatalystMarker"],data:{cursors:[{charge:30,pos:[I;0,0,0],update_delay:0}]}}
execute if entity @s[tag=hhWardenInfect] run data modify entity @e[type=marker,tag=hhCatalystMarker,sort=nearest,limit=1] data.cursors[0].pos set from entity @e[type=marker,tag=hhCatalystMarker,sort=nearest,limit=1] Pos
execute if entity @s[tag=hhWardenInfect] align xyz run fill ~-1 ~-2 ~ ~1 ~-1 ~ minecraft:sculk replace #hh:infectable
execute if entity @s[tag=hhWardenInfect] align xyz run fill ~ ~-2 ~-1 ~ ~-1 ~1 minecraft:sculk replace #hh:infectable
execute if entity @s[tag=hhWardenInfect] align xyz run setblock ~ ~-1 ~ minecraft:sculk_catalyst
tag @s[tag=hhWardenInfect] remove hhWardenInfect
#add to timer to cause the warden to infect blocks
execute if score @s hhTimer matches 0 store result score @s hhTimer run random value 20..30
scoreboard players remove @s hhTimer 1
#infection running stuff
execute as @e[type=marker,tag=hhCatalystMarker] at @s run function hh:infection


##init warden healing using end crystal
#get tags on them bois
tag @e[type=end_crystal] remove hhECrystal
tag @e[type=end_crystal,sort=nearest,limit=1,distance=..75] add hhECrystal
#summon end crystal marker
scoreboard players add @e[type=end_crystal,tag=hhECrystal] hhECTimer 1
execute as @e[type=end_crystal,tag=hhECrystal] at @s if score @s hhECTimer >= HealDelay hhECTimer run summon marker ~ ~4 ~ {Tags:["hhECMarker"]}
execute as @e[type=end_crystal,tag=hhECrystal] if score @s hhECTimer >= HealDelay hhECTimer run scoreboard players set @s hhECTimer 0
#make warden glow if crystals are defeated
execute unless entity @e[type=end_crystal] run effect give @s glowing 2 0 true