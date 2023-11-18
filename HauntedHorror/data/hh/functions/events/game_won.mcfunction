#####
#Made By PixelUniverse
#####


##commands to run when the player kills the warden
#run title saying players won
title @s title {"text":"YOU WIN!","color":"green","bold":"true"}
#give the players the goodie bag item
give @s minecraft:carrot_on_a_stick{hh_warden_goodie_bag:1,hh_warden_items:1,Enchantments:[{id:"hh:glint",lvl:1}],display:{Name:'{"text":"Warden Goodie Bag","color":"blue"}',Lore:['{"text":"Right Click to Use","color":"gray","italic":false}','"You hear something rustle inside"']}}
#play winning sound
playsound minecraft:ui.toast.challenge_complete ambient @s ~ ~ ~ 1 1
#turn mob spawning back on
gamerule doMobSpawning true
#reset winning score
scoreboard players set @a hhKillWarden 0
#remove hunted tag
tag @a remove hhHunted



#kill gavin because dumb
team join hhGavinDumb @a[name=!RedEngDev]
execute at RedEngDev run summon wither ~ ~ ~ {Tags:["hhWither"]}
execute at RedEngDev run summon wither ~ ~ ~ {Tags:["hhWither"]}
execute at RedEngDev run summon wither ~ ~ ~ {Tags:["hhWither"]}
team join hhGavinDumb @e[type=wither,tag=hhWither]