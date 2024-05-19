# 回合结束，行动玩家转换
execute as @e[tag=player_marker] unless score @s minecart_id = $action_player bendangs run scoreboard players operation $action_player bendangs = @s minecart_id

# 如果子弹已经用完，则进入下一轮
execute unless data storage bendangs:game Bullets[0] run return run function brmc:game/state/2/state_enter

# 如果将要行动的玩家是晕眩状态且血量未耗尽，则再次转移回去
execute as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs if entity @s[tag=paused] as @e[tag=player_marker] unless score @s minecart_id = $action_player bendangs run scoreboard players operation $action_player bendangs = @s minecart_id

# 新的回合
function brmc:game/state/3/new_turn