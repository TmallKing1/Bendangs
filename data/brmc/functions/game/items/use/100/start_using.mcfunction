# 设置动画倒计时
scoreboard players set $item_using bendangs 100
scoreboard players set $countdown_fast bendangs 40

# 设置攻击对象
execute as @e[tag=player_marker] unless score @s minecart_id = $action_player bendangs run scoreboard players operation $attack_target bendangs = @s minecart_id

# 将弩抬起
data merge entity @e[tag=crossbow_display,limit=1] {transformation:{translation:[0.0f, 0.7f, 0.0f]},start_interpolation:0}