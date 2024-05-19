# 设定游戏 ID 与玩家 ID
execute store result score $ game_id run random value 1..2147483647
execute as @a[team=player] run scoreboard players operation @s game_id = $ game_id

# 设定玩家所在的矿车 ID
execute as @a[team=player] run ride @s mount @e[tag=player_seat,sort=nearest,limit=1]
execute as @e[tag=player_seat_A] on passengers run scoreboard players set @s minecart_id 1
execute as @e[tag=player_seat_B] on passengers run scoreboard players set @s minecart_id 2

# 显示提示
tellraw @a ["",{"text": "> ","color": "gold","bold": true},{"text": "游戏开始！","color": "gold"}]

# 状态进入
function brmc:state/1/state_enter