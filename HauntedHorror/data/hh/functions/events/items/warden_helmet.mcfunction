#####
#Made By PixelUniverse
#####


##give glowing to nearby entities and players who aren't sneaking
effect give @e[type=!player,distance=..25] glowing 1 0 true
effect give @a[scores={hhSneak=0},distance=..25] glowing 1 0 true