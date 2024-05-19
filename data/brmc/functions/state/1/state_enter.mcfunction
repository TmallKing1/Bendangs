scoreboard players set $state bendangs 1

# Bossbar
bossbar set bendangs:waiting visible false
bossbar set bendangs:game visible true
bossbar set bendangs:game_a visible false
bossbar set bendangs:game_b visible false

# 玩家进入方法
execute as @a run function brmc:state/1/player_enter

# 记分板显示
scoreboard objectives setdisplay sidebar display
scoreboard objectives setdisplay list life_display

# 生成两个标记分别表示两个玩家
kill @e[tag=player_marker]
summon marker 0 0 0 {Tags:["player_marker","player_A"],data:{Items:[0,0,0,0,0,0,0,0]}}
scoreboard players set @e[tag=player_marker,tag=player_A] minecart_id 1
summon marker 0 0 0 {Tags:["player_marker","player_B"],data:{Items:[0,0,0,0,0,0,0,0]}}
scoreboard players set @e[tag=player_marker,tag=player_B] minecart_id 2

# 玩家分数
scoreboard players set @e[tag=player_marker] player_score 0

# 开始新的一局
scoreboard players set $games_count bendangs 0
function brmc:game/state/1/state_enter