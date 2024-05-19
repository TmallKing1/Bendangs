scoreboard players set $state bendangs 0

# 分数重置
scoreboard players reset * game_id
scoreboard players reset * minecart_id
scoreboard players reset * display
scoreboard players reset * player_score

# 记分板显示
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list
scoreboard objectives setdisplay below_name

# Bossbar
bossbar set bendangs:waiting visible true
bossbar set bendangs:game visible false
bossbar set bendangs:game_a visible false
bossbar set bendangs:game_b visible false
function brmc:state/0/ready/waiting

# 生成展示实体
function brmc:state/0/summon_display

# 部分实体的阵营
scoreboard players set @e[tag=player_seat_A] minecart_id 1
scoreboard players set @e[tag=player_seat_B] minecart_id 2
scoreboard players set @e[tag=player_interaction_A] minecart_id 1
scoreboard players set @e[tag=player_interaction_B] minecart_id 2

# 玩家进入方法
execute as @a run function brmc:state/0/player_enter