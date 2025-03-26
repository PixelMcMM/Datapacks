##
 # init.mcfunction
 # 
 #
 # Created by PixelUniverse.
##


#storage
data modify storage better_exploration:temp teleport_fail_msg set value [\
  '{"text":"Get a better Lodestone"}',\
  '{"text":"Endermen teleport better than that!"}',\
  '{"text":"You call that a teleport?"}',\
  '{"text":"Skill issue"}',\
  '{"text":"This guy really tried to break my datapack"}',\
  '{"text":"Gavin broke it"}',\
  '{"text":"You broke it!"}',\
  '{"text":"She Hulk broke it"}',\
  '{"text":"Gavin\'s Mom Broke it"}',\
  '{"text":"Ask RedEngDev if you have questions","clickEvent": {"action": "open_url", "value": "https://www.youtube.com/@RedEngDeveloper"}}',\
  '{"text":"Bet you are wondering what happened?"}',\
  '{"text":"You thought that would work?"}',\
  '{"text":"You got trolled","clickEvent": {"action": "open_url", "value": "https://youtu.be/dQw4w9WgXcQ?si=hA2K0sPT98rAy0H2"}}',\
  '{"text":"ChatGPT said no"}',\
  '{"text":"Minecraft didn\'t like that one"}',\
  '{"text":"If problem persists, call Microsoft support"}',\
  '{"text":"How did you find your way into this?"}',\
  '{"text":"Your friends must hate teleporting"}',\
  '{"text":"Better luck next time"}',\
  '{"text":"You might want to give up"}',\
  '{"text":"Maybe it will work if you subscribe to BloopTank (Click plz)","clickEvent": {"action": "open_url", "value": "https://www.youtube.com/@BloopTank"}}',\
  '{"text":"Maybe it will work if you subscribe to PixelUniverse (Click plz)","clickEvent": {"action": "open_url", "value": "https://www.youtube.com/@PixelUniverseMC"}}',\
  '{"text":"Maybe it will work if you subscribe to RedEngDev (Click plz)","clickEvent": {"action": "open_url", "value": "https://www.youtube.com/@RedEngDeveloper"}}',\
  '{"text":"Ask Dan"}',\
  '{"text":"Ask Notch"}',\
  '{"text":"TommyInnit might know why"}',\
  '{"text":"Have you consulted the Minecraft wiki?","clickEvent": {"action": "open_url", "value": "https://minecraft.wiki"}}',\
  '{"text":"Servers are currently down"}',\
  '{"text":"Press \\"Alt + F4\\" to fix the issue"}',\
  '{"text":"Maybe Santa can help"}',\
  '{"text":"Put teleportation on your Christmas list"}',\
  '{"text":"Easter is around the corner"}',\
  '{"text":"The Doctor had a similar problem..."}',\
  '{"text":"Ask your girlfriend-- oh wait..."}',\
  '{"text":"Maindenless"}',\
  '{"text":"Go play Terraria","clickEvent": {"action": "open_url", "value": "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjD7p_G5Z6MAxV2JTQIHYkbOCcQFnoECFoQAQ&url=https%3A%2F%2Fstore.steampowered.com%2Fapp%2F105600%2FTerraria%2F&usg=AOvVaw2cX2UyXCe2ieLs25b_EwXy&cshid=1742684538532414&opi=89978449"}}',\
  '{"text":"Go play Elden Ring"}',\
  '{"text":"Go play the saxaphone"}',\
  '{"text":"Go watch something Blooptank made (plz click)","clickEvent": {"action": "open_url", "value": "https://www.youtube.com/@BloopTank"}}',\
  '{"text":"Click here for a walkthrough to fix the issue","clickEvent": {"action": "open_url", "value": "https://youtu.be/dQw4w9WgXcQ?si=hA2K0sPT98rAy0H2"}}',\
  '{"text":"You weren\'t playing the right music","clickEvent": {"action": "open_url", "value": "https://youtu.be/wDgQdr8ZkTw?si=ThOxkHiwD862RBtM"}}',\
  '{"text":"Oh no, your speedrun of Minecraft isn\'t fast enough :`("}',\
  '{"text":"Go fake a speedrun"}',\
  '{"text":"Nether travel instead"}',\
  '{"text":"Haven\'t you had enough?"}',\
  '{"text":"Ya like jazz?"}',\
  '{"text":"Rub some bacon on it","clickEvent": {"action": "open_url", "value": "https://youtu.be/wSReSGe200A?si=VeRb3OLqRDhBsxXJ"}}',\
  '{"text":"Idk why?"}',\
  '{"text":"Your random number was not corrent"}',\
  '{"text":"Eating another will fix it"}'\
]


##scoreboards
#numbers
scoreboard objectives add better_exploration.numbers dummy
execute store result score $msg_length better_exploration.numbers run data get storage better_exploration:temp teleport_fail_msg
scoreboard players set $dummy better_exploration.numbers 0
scoreboard players set $remove_dig_time better_exploration.numbers 0