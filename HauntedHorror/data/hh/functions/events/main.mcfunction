#####
#Made By PixelUniverse
#####





###warden items
##warden bow shot
#run function if bow is shot and player is sneaking and play charging sound when sneaking
execute as @a[scores={hhBowShot=1..,hhSneakT=20},nbt={SelectedItem:{tag:{hh_warden_bow:1}}}] at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=arrow,sort=nearest,limit=1] run function hh:events/items/warden_bow/main
execute as @a[scores={hhSneakT=1}] if data entity @s SelectedItem.tag.hh_warden_bow at @s run playsound minecraft:entity.warden.sonic_charge voice @a ~ ~ ~ 1 1.3
execute as @a[scores={hhSneak=0,hhSneakT=2..}] run stopsound @s voice
#reset score
scoreboard players set @a[scores={hhBowShot=1..}] hhBowShot 0
#damage players who were hit by the bow otherwise remove tracking tag
execute if entity @e[tag=hhWAHit] as @e[tag=hhWAHit] at @s run function hh:events/items/warden_bow/arrow_hit
execute unless entity @e[tag=hhWAHit] run tag @a[tag=hhFiredWArrow2] remove hhFiredWArrow
##waren helmet
#activate glowing for anyone near a wearing player who isn't sneaking and reset sneak score and play sculk sensor sound
execute as @a[scores={hhSneak=1..}] if data entity @s Inventory[{Slot:103b}].tag.hh_warden_helmet at @s run function hh:events/items/warden_helmet
execute as @a[scores={hhSneak=1..},tag=!hhSneakInit] at @s run playsound minecraft:block.sculk_sensor.clicking ambient @a ~ ~ ~
##warden boots
#activate function if wearing boots
execute as @a if data entity @s Inventory[{Slot:100b}].tag.hh_warden_boots at @s run function hh:events/items/warden_boots/main


##warden rewards functions
#activate goodie bag and reset COS score
execute as @a[scores={hhCOS=1..},nbt={SelectedItem:{tag:{hh_warden_goodie_bag:1}}}] run function hh:events/goodie_bag
scoreboard players set @a[scores={hhCOS=1..}] hhCOS 0
#add tag if the player sneaks to activate helmet
tag @a[tag=hhSneakInit] remove hhSneakInit
tag @a[scores={hhSneak=1..},tag=!hhSneakInit] add hhSneakInit
#do sneak score objectives, add sneak time and holding bow when sneaking, reset it when not
scoreboard players add @a[scores={hhSneak=1..,hhSneakT=..19},nbt={SelectedItem:{tag:{hh_warden_bow:1}}}] hhSneakT 1
scoreboard players set @a[scores={hhSneak=0}] hhSneakT 0
scoreboard players set @a[scores={hhSneak=1..}] hhSneak 0