#####
#Made By PixelUniverse
#####


##misc
#add dimension scoreboard to players based on what dimension they are in
execute if dimension minecraft:overworld run scoreboard players set @s stDimension 0
execute if dimension minecraft:the_nether run scoreboard players set @s stDimension 1
execute if dimension minecraft:the_end run scoreboard players set @s stDimension 2
#replace the compass if hunters dont have it
execute unless data entity @s[tag=stHunter] Inventory[{id:"minecraft:compass"}].tag.stCompass run give @s minecraft:compass{stCompass:1,LodestoneDimension:"minecraft:overworld",LodestoneTracked:1b}
#kill all manhunt compass items
kill @e[type=item,nbt={Item:{tag:{stCompass:1}}}]


##function to do compass tracking
#add and remove tag if they are sneaking
tag @s[predicate=!st:manhunt/player_sneak] remove stSneaking
execute if entity @s[tag=stHunter] if data entity @s[predicate=st:manhunt/player_sneak,tag=!stSneaking] SelectedItem.tag.stCompass at @s if score @s stDimension = @a[tag=stHunted,sort=nearest,limit=1] stDimension run function st:manhunt/compass_track
execute if entity @s[tag=stHunter] if data entity @s[predicate=st:manhunt/player_sneak,tag=!stSneaking] SelectedItem.tag.stCompass at @s unless score @s stDimension = @a[tag=stHunted,sort=nearest,limit=1] stDimension run tellraw @s {"text":"No hunted player in your dimension","color":"red"}
tag @s[predicate=st:manhunt/player_sneak] add stSneaking