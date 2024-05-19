# 更新老板栏
execute store result bossbar bendangs:game value run scoreboard players get $countdown_fast bendangs

# 倒计时结束进入状态 2（随机决定行动玩家）
execute store result score $action_player bendangs run random value 1..2
execute if score $countdown_fast bendangs matches 0 run function brmc:game/state/2/state_enter