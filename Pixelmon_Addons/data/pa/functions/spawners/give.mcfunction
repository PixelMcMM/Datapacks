#####
#Made By PixelUniverse
#####


##give the executing player the spawner helper spawn egg
#summoner spawn egg
give @s bat_spawn_egg{EntityTag:{id:"minecraft:armor_stand",Invisible:1,Tags:["paSpawnerSummoner","paAS"]},Enchantments:[{id:"paGlint",lvl:1}],display:{Name:'{"text":"Spawner Summoner","color":"gray","italic":false}',Lore:['"Place on top of a Pixelmon Spawner"','"to summon Spawner Helper"']}}
#killer spawn egg
give @s bat_spawn_egg{EntityTag:{id:"minecraft:armor_stand",Invisible:1,Tags:["paSpawnerKiller","paAS"]},Enchantments:[{id:"paGlint",lvl:1}],display:{Name:'{"text":"Spawner Killer","color":"gray","italic":false}',Lore:['"Place on top of a Pixelmon Spawner"','"to kill Spawner Helper"']}}