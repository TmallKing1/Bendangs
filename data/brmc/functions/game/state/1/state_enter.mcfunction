# 设置游戏状态：1 - 开始局 / 2 - 开始轮 / 3 - 游戏中 / 4 - 单局结束
scoreboard players set $game_state bendangs 1

# 局数 +1
scoreboard players add $games_count bendangs 1

# 显示标题
title @a times 5t 40t 10t
title @a title [{"text": "","color": "light_purple"},{"text": "第 "},{"score":{"name": "$games_count","objective": "bendangs"}},{"text": " 局游戏"}]
title @a subtitle ["",{"selector":"@a[scores={minecart_id=1}]","color": "red","bold": false}," ",{"score": {"name": "@e[tag=player_marker,scores={minecart_id=1},limit=1]","objective": "player_score"},"color": "red","bold": true},{"text": " : ","color": "white","bold": true},{"score": {"name": "@e[tag=player_marker,scores={minecart_id=2},limit=1]","objective": "player_score"},"color": "blue","bold": true}," ",{"selector":"@a[scores={minecart_id=2}]","color": "blue","bold": false}]

# 记分板显示
execute store result storage bendangs:game PlayerScore.A int 1 run scoreboard players get @e[tag=player_marker,scores={minecart_id=1},limit=1] player_score
execute store result storage bendangs:game PlayerScore.B int 1 run scoreboard players get @e[tag=player_marker,scores={minecart_id=2},limit=1] player_score
scoreboard players set $score_placeholder display 100
scoreboard players display numberformat $score_placeholder display blank
scoreboard players display name $score_placeholder display {"text": "- 玩家分数 -","color": "light_purple"}
scoreboard players set $player_A_score display 2
scoreboard players display name $player_A_score display {"text":"红队","color": "red"}
scoreboard players set $player_B_score display 1
scoreboard players display name $player_B_score display {"text":"蓝队","color": "blue"}
function brmc:game/state/1/set_scoreboard with storage bendangs:game PlayerScore

# 玩家命数
execute store result score $random bendangs run random value 3..5
scoreboard players operation @e[tag=player_A] life = $random bendangs
scoreboard players operation @e[tag=player_B] life = $random bendangs
function brmc:game/life_display

# 老板栏显示
bossbar set bendangs:game color blue
bossbar set bendangs:game name ["",{"selector":"@a[scores={minecart_id=1}]","color": "red","bold": false}," ",{"score": {"name": "@e[tag=player_marker,scores={minecart_id=1},limit=1]","objective": "player_score"},"color": "red","bold": true},{"text": " : ","color": "white","bold": true},{"score": {"name": "@e[tag=player_marker,scores={minecart_id=2},limit=1]","objective": "player_score"},"color": "blue","bold": true}," ",{"selector":"@a[scores={minecart_id=2}]","color": "blue","bold": false}]
bossbar set bendangs:game max 30

# 音效
execute as @a at @s run playsound entity.firework_rocket.launch player @s 0 1000000 0 1000000

# 子弹和道具
data modify storage bendangs:game Bullets set value []
execute as @e[tag=player_marker] run data modify entity @s data.Items set value [0,0,0,0,0,0,0,0]
tag @e[tag=player_marker] remove dying
function brmc:game/bullet_display_clear

# 设置下一轮倒计时
scoreboard players set $countdown_fast bendangs 30