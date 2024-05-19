# 设置游戏状态：1 - 开始局 / 2 - 开始轮 / 3 - 游戏中 / 4 - 单局结束
scoreboard players set $game_state bendangs 4

# 加分
execute as @e[tag=player_marker,tag=!lost] run scoreboard players add @s player_score 1

# 显示标题
title @a times 5t 60t 10t
execute unless entity @e[tag=player_marker,scores={player_score=2..}] run function brmc:game/state/4/match_end
execute if entity @e[tag=player_marker,scores={player_score=2..}] run function brmc:game/state/4/game_end

# 解除
tag @e remove lost

# 老板栏显示
function brmc:game/life_display
bossbar set bendangs:game_a visible false
bossbar set bendangs:game_b visible false
bossbar set bendangs:game_watcher visible false
bossbar set bendangs:game visible true
bossbar set bendangs:game color yellow
bossbar set bendangs:game name [{"text": "游戏结束","color": "yellow"}]
bossbar set bendangs:game max 40

# 设置下一轮倒计时
scoreboard players set $countdown_fast bendangs 40