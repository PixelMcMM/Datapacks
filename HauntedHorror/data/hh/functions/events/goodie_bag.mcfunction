#####
#Made By PixelUniverse
#####


##clear goodie bag item
clear @s minecraft:carrot_on_a_stick{hh_warden_goodie_bag:1} 1


##give warden loot
#warden bow
give @s minecraft:bow{hh_warden_items:1,hh_warden_bow:1,Unbreakable:1,Enchantments:[{id:"hh:sonic_boom",lvl:1}],display:{Name:'{"text":"Warden Bow","color":"blue","italic":false}',Lore:['{"text":"Sonic Boom I","color":"gray","italic":false}','"Powered by the core of a Warden"']}}
#warden helmet
give @s minecraft:diamond_helmet{hh_warden_items:1,hh_warden_helmet:1,Unbreakable:1,Enchantments:[{id:"hh:optic",lvl:1}],display:{Name:'{"text":"Warden Helmet","color":"blue","italic":false}',Lore:['{"text":"Optic I","color":"gray","italic":false}','"Vibrates with nearby sound"']}}
#warden chestplate
give @s minecraft:diamond_chestplate{hh_warden_items:1,hh_warden_chestplate:1,Unbreakable:1,Enchantments:[{id:"hh:sturdy",lvl:1}],display:{Name:'{"text":"Warden Chestplate","color":"blue","italic":false}',Lore:['{"text":"Sturdy I","color":"gray","italic":false}','"Made from the armor of a Warden"']},AttributeModifiers:[{AttributeName:"generic.armor",Amount:8,Slot:chest,Name:"generic.armor",UUID:[I;-1231014,27009,22451,-54018]},{AttributeName:"generic.armor_toughness",Amount:2,Slot:chest,Name:"generic.armor_toughness",UUID:[I;-1231014,27109,22451,-54218]},{AttributeName:"generic.max_health",Amount:20.0,Slot:chest,Name:"generic.max_health",UUID:[I;-1231014,27209,22451,-54418]},{AttributeName:"generic.knockback_resistance",Amount:0.5,Slot:chest,Name:"generic.knockback_resistance",UUID:[I;-1231014,27309,22451,-54618]}]}
#warden leggings
give @s minecraft:diamond_leggings{hh_warden_items:1,hh_warden_leggings:1,Unbreakable:1,Enchantments:[{id:"minecraft:swift_sneak",lvl:3}],display:{Name:'{"text":"Warden Leggings","color":"blue","italic":false}',Lore:['"Weightless and soundless"']},AttributeModifiers:[{AttributeName:"generic.armor",Amount:6,Slot:legs,Name:"generic.armor",UUID:[I;-1231014,22809,22451,-45618]},{AttributeName:"generic.armor_toughness",Amount:2,Slot:legs,Name:"generic.armor_toughness",UUID:[I;-1231014,22909,22451,-45818]},{AttributeName:"generic.movement_speed",Amount:0.04,Slot:legs,Name:"generic.movement_speed",UUID:[I;-1231014,22709,22451,-45418]}]}
#warden boots
give @s minecraft:diamond_boots{hh_warden_items:1,hh_warden_boots:1,Unbreakable:1,Enchantments:[{id:"hh:cleansing",lvl:1}],display:{Name:'{"text":"Warden Boots","color":"blue","italic":false}',Lore:['{"text":"Cleansing I","color":"gray","italic":false}','"Purifies the nearby surrounding"']}}