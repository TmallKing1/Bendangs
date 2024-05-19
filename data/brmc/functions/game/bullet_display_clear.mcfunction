# 清除所有用于显示子弹的展示实体的发光状态
execute as @e[tag=bullet_display] run data modify entity @s Glowing set value 0b

# 清空显示的子弹
execute as @e[tag=bullet_display] run data modify entity @s item set value {id: "minecraft:air", Count: 1b}