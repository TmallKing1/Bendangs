# 更新老板栏
execute store result bossbar bendangs:game value run scoreboard players get $countdown_fast bendangs

# 倒计时结束时按照分数决定下一状态
execute if score $countdown_fast bendangs matches 0 unless entity @e[tag=player_marker,scores={player_score=2..}] run function brmc:game/state/1/state_enter
execute if score $countdown_fast bendangs matches 0 if entity @e[tag=player_marker,scores={player_score=2..}] run function brmc:state/0/state_enter