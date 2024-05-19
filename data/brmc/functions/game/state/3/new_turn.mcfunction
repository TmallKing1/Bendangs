# 解除发光特效
execute as @e[type=item_display] if score @s slot_id matches -2147483648..2147483647 run data modify entity @s Glowing set value 0b

# 更改展示的物品
data modify entity @e[tag=crossbow_display,limit=1] item set value {Count:1b, id:"minecraft:crossbow",tag:{ChargedProjectiles:[{Count:1b,id:"minecraft:arrow"}],Charged:1b}}

# 显示玩家生命值
function brmc:game/life_display

# 末影水晶
function brmc:game/state/3/crystal_index

# 将弩转到朝向当前行动玩家的一边
execute if score $action_player bendangs matches 1 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 0f},translation:[0.0f, 0.048f, 0.0f]},start_interpolation:0}
execute if score $action_player bendangs matches 2 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 3.14f},translation:[0.0f, 0.048f, 0.0f]},start_interpolation:0}

# 给弩填上子弹
data modify entity @e[tag=crossbow_display,limit=1] item set value {Count:1b, id:"minecraft:crossbow",tag:{Charged:1b,ChargedProjectiles:[{id:"minecraft:arrow",Count:1}]}}

# 解除所有的特效
execute if entity @e[tag=paused] as @a[team=player] if score @s minecart_id = @e[tag=paused,limit=1] minecart_id run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 清醒过来了","color": "yellow"}]
tag @e remove paused
scoreboard players set $enhanced bendangs 0

# 向当前行动玩家播放音效
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs run function brmc:lib/sounds/hit