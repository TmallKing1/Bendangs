# 清除所有用于显示子弹的展示实体的发光状态
execute as @e[tag=bullet_display] run data modify entity @s Glowing set value 0b

# 显示子弹的位置
execute as @e[tag=bullet_display] if score @s minecart_id = $action_player bendangs if score $bullet_type bendangs matches 0 run data modify entity @s item set value {id: "minecraft:arrow", tag: {}, Count: 1b}
execute as @e[tag=bullet_display] if score @s minecart_id = $action_player bendangs if score $bullet_type bendangs matches 1 run data modify entity @s item set value {id: "minecraft:tipped_arrow", tag: {CustomPotionColor: 1659171}, Count: 1b}
execute as @e[tag=bullet_display] if score @s minecart_id = $action_player bendangs unless score $bullet_type bendangs matches 0..1 run data modify entity @s item set value {id: "minecraft:air", Count: 1b}
execute as @e[tag=bullet_display] if score @s minecart_id = $action_player bendangs if score $bullet_type bendangs matches 0..1 run data modify entity @s Glowing set value 1b
execute as @e[tag=bullet_display] if score @s minecart_id = $action_player bendangs if score $bullet_type bendangs matches 1 run data modify entity @s glow_color_override set value 16711680
execute as @e[tag=bullet_display] if score @s minecart_id = $action_player bendangs unless score $bullet_type bendangs matches 1 run data remove entity @s glow_color_override