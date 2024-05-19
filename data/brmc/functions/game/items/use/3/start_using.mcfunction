# 设置动画倒计时
scoreboard players set $item_using bendangs 3
scoreboard players set $countdown_fast bendangs 15

# 生成临时展示实体
execute if score $action_player bendangs matches 1 run summon item_display 0.375 2.5 1.375 {item: {Count:1b, id:"minecraft:shears"},billboard:"fixed",transformation:{right_rotation: {axis: [0.0f, 0.0f, 1.0f], angle: 0f},scale: [1.0f, 1.0f, 1.0f],left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: -2.355f},translation:[0.0f, 0.5f, 0.0f]},Tags:["temporary_display"],interpolation_duration:10}
execute if score $action_player bendangs matches 2 run summon item_display -0.375 2.5 0.625 {item: {Count:1b, id:"minecraft:shears"},billboard:"fixed",transformation:{right_rotation: {axis: [0.0f, 0.0f, 1.0f], angle: 0f},scale: [1.0f, 1.0f, 1.0f],left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 0.785f},translation:[0.0f, 0.5f, 0.0f]},Tags:["temporary_display"],interpolation_duration:10}