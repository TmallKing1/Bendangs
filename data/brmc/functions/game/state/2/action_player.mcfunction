# 计算两名玩家的生命值之差
scoreboard players operation $life_difference bendangs = @e[scores={minecart_id=1},tag=player_marker] life
scoreboard players operation $life_difference bendangs -= @e[scores={minecart_id=2},tag=player_marker] life

# 若相差大于等于 2 则命数少的玩家行动
execute if score $life_difference bendangs matches 2.. run scoreboard players set $action_player bendangs 2
execute if score $life_difference bendangs matches ..-2 run scoreboard players set $action_player bendangs 1

# 若相差不为 0 且有玩家生命值为 1 则该玩家行动
execute unless score $life_difference bendangs matches 0 run scoreboard players operation $action_player bendangs = @e[scores={life=1},tag=player_marker] minecart_id

# 其他情况下行动玩家不变