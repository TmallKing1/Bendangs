# 解除所有展示实体的标签
tag @e[type=item_display] remove hikari

# 选中当前回合玩家
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run tag @s add selected

# 获取玩家选择的物品索引位
execute store result score $slot bendangs run data get entity @a[tag=selected,limit=1] SelectedItem.tag.game_slot
execute unless entity @e[tag=stealing] as @e[type=item_display] if score @s minecart_id = @a[tag=selected,limit=1] minecart_id if score @s slot_id = $slot bendangs run tag @s add hikari
execute if entity @e[tag=stealing] as @e[type=item_display] unless score @s minecart_id = @a[tag=selected,limit=1] minecart_id if score @s slot_id = $slot bendangs run tag @s add hikari
execute if score $slot bendangs matches 8 run tag @e[tag=crossbow_display] add hikari

# 施加与取消 buff
execute as @e[type=item_display,tag=!hikari,tag=!bullet_display] run data modify entity @s Glowing set value 0b
execute as @e[type=item_display,tag=hikari,tag=!bullet_display] run data modify entity @s Glowing set value 1b

tag @a remove selected