#####
# Made By PixelUniverse
#####


##general init items
#gamerule stuff to work with respawn mechanics
gamerule keepInventory true
gamerule doImmediateRespawn true
#timer to run general game events
scoreboard objectives add hhTimer dummy
#text message to start the hunt
tellraw @a {"text":"Shift click here to be able to start the event","color":"gold","insertion":"/execute summon marker run scoreboard players set @s hhLives <insert_life_count>"}


##player lives stuff
#create scoreboards for deaths and lives storage, hhLives is set with the tellraw command down this page
scoreboard objectives add hhDeath deathCount
scoreboard objectives add hhLives dummy
#set live regen time, 2 minutes = 20*2*60
scoreboard players set RegenTime hhLives 2400
scoreboard players set Regen hhLives 0
#create scoreboard to manage player death order
scoreboard objectives add hhDeathOrder dummy
#respawn bossbar
bossbar add hhdeathbb "Respawns"
bossbar set hhdeathbb color green


##warden objectives
#bossbars
bossbar add hhwardenbb "Warden"
bossbar set hhwardenbb color blue
bossbar set hhwardenbb max 500
#scoreboards for end healing
scoreboard objectives add hhECTimer dummy
scoreboard players set HealDelay hhECTimer 4
#scoreboard to preserve warden's anger at players
scoreboard objectives add hhWardenAnger dummy
##uuid tracking
scoreboard objectives add hhUUID1 dummy
scoreboard objectives add hhUUID2 dummy
scoreboard objectives add hhUUID3 dummy
scoreboard objectives add hhUUID4 dummy
scoreboard objectives add hhUUIDMatch dummy


###warden goodies
##objective to open goodie bag
scoreboard objectives add hhCOS minecraft.used:minecraft.carrot_on_a_stick
##warden bow
#objectives to store bow values
scoreboard objectives add hhArrowMotion1 dummy
scoreboard objectives add hhArrowMotion2 dummy
scoreboard objectives add hhArrowMotion3 dummy
#objective to store when a bow is shot
scoreboard objectives add hhBowShot minecraft.used:minecraft.bow
#store values to use in math
scoreboard players set -1 hhArrowMotion1 -1
scoreboard players set BowCharge hhArrowMotion1 300
scoreboard players set BowDistance hhArrowMotion1 25
##warden helmet
#add objective to test if players are sneaking and store their duration of it
scoreboard objectives add hhSneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add hhSneakT dummy
##warden boots
scoreboard objectives add hhFallDistance dummy
scoreboard objectives add hhXP dummy
scoreboard objectives add hhFire dummy



##reset every reload unless warden is already spawned
#remove tags from players
execute unless entity @e[type=warden,tag=hhWarden] run tag @a remove hhHunted
#kill markers
execute unless entity @e[type=warden,tag=hhWarden] run kill @e[tag=hhMarker]
execute unless entity @e[type=warden,tag=hhWarden] run kill @e[type=marker,scores={hhLives=0..},tag=!hhMarker]
#reset the Lives counter if there is no warden
execute unless entity @e[type=warden,tag=hhWarden] run scoreboard players set Lives hhLives 0
#reset the border
execute unless entity @e[type=warden,tag=hhWarden] run worldborder set 59999968
execute unless entity @e[type=warden,tag=hhWarden] run worldborder center 0 0