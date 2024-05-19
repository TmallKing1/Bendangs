# 如果玩家是用虚弹射自己，则放下弩
execute if score $bullet_type bendangs matches 0 if score $attack_target bendangs = $action_player bendangs if score $action_player bendangs matches 1 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 0f},translation:[0.0f, 0.048f, 0.0f]},start_interpolation:0}
execute if score $bullet_type bendangs matches 0 if score $attack_target bendangs = $action_player bendangs if score $action_player bendangs matches 2 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 3.14f},translation:[0.0f, 0.048f, 0.0f]},start_interpolation:0}

# 如果玩家不是用虚弹射自己，则进入下一回合
execute unless score $bullet_type bendangs matches 0 run function brmc:game/state/3/next_turn
execute if score $bullet_type bendangs matches 0 unless score $attack_target bendangs = $action_player bendangs run function brmc:game/state/3/next_turn
execute if score $bullet_type bendangs matches 0 if score $attack_target bendangs = $action_player bendangs run function brmc:game/items/use/100/end_using1

# 重置当前正在使用的道具
scoreboard players reset $item_using bendangs