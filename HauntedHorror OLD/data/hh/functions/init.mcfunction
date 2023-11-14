#create scoreboards
scoreboard objectives add hhDeath deathCount
scoreboard objectives add hhLives dummy
scoreboard players set Lives hhLives 6
scoreboard objectives add hhTimer dummy
scoreboard objectives add hhECTimer dummy
scoreboard players set HealDelay hhECTimer 4
scoreboard objectives add hhWardenAnger dummy

#bossbar schtuff
bossbar add hhdeathbb "Respawns"
bossbar set hhdeathbb color green
execute store result bossbar minecraft:hhdeathbb max run scoreboard players get Lives hhLives
execute store result bossbar minecraft:hhdeathbb value run scoreboard players get Lives hhLives
#warden bossbar schtuff
bossbar add hhwardenbb "Warden"
bossbar set hhwardenbb color blue
bossbar set hhwardenbb max 500


#gamerule stuff
gamerule keepInventory true
gamerule doImmediateRespawn true


#warden summonable item
execute if entity @s[type=player] run give @s bat_spawn_egg{EntityTag:{id:"minecraft:marker",Tags:["hhSummonMarker"]},display:{Name:'"Warden Summoner"'}}