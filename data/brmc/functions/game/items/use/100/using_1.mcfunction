# 使弩转到对应的方向上
execute if score $action_player bendangs matches 1 if score $attack_target bendangs matches 1 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 2.355f}},start_interpolation:0}
execute if score $action_player bendangs matches 1 if score $attack_target bendangs matches 2 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: -0.785f}},start_interpolation:0}
execute if score $action_player bendangs matches 2 if score $attack_target bendangs matches 1 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 2.355f}},start_interpolation:0}
execute if score $action_player bendangs matches 2 if score $attack_target bendangs matches 2 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 5.495f}},start_interpolation:0}