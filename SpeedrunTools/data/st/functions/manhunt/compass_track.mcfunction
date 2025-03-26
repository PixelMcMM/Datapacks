


##setup the armor stand to record player position of nearest hunted player into compass
#test dimension
function st:manhunt/test_dimension with entity @a[tag=stHunted,distance=1..,sort=nearest,limit=1]


#revoke advancement
advancement revoke @s only st:use_compass