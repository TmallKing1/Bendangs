# 设置游戏状态：1 - 开始局 / 2 - 开始轮 / 3 - 游戏中 / 4 - 单局结束
scoreboard players set $game_state bendangs 3

# 老板栏显示
bossbar set bendangs:game_a visible true
bossbar set bendangs:game_a value 11
bossbar set bendangs:game_a max 11
bossbar set bendangs:game_b visible true
bossbar set bendangs:game_b value 45
bossbar set bendangs:game_b max 45
bossbar set bendangs:game_watcher visible true
bossbar set bendangs:game_watcher value 14
bossbar set bendangs:game_watcher max 14

# 新回合
function brmc:game/state/3/new_turn