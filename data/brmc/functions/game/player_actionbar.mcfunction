# 标记
tag @a remove actionbar
tag @s add actionbar

# 不是状态 3
execute unless score $game_state bendangs matches 3 run return run title @s actionbar {"text": ""}

# 若对方玩家下线
execute store result score $player_count bendangs if entity @a[team=player]
execute if score $player_count bendangs matches ..1 run return run title @s actionbar {"text": "对方玩家离线，你暂时无法行动"}

# 若有正在显示的错误提示
execute as @e[tag=player_marker] if score @s minecart_id = @a[tag=actionbar,limit=1] minecart_id if score @s countdown_fast matches 1.. run return run title @a[tag=actionbar] actionbar {"nbt":"data.ItemUnusableHint","color": "red","entity": "@s"}

# 若不是自己的行动轮
execute unless score @s minecart_id = $action_player bendangs run return run title @s actionbar ""

# 显示按键操作
execute store result score $slot bendangs run data get entity @s SelectedItem.tag.game_slot
execute store result score $item_type bendangs run data get entity @s SelectedItem.tag.ItemType
execute if score $slot bendangs matches ..7 if score $item_type bendangs matches 1.. run title @s actionbar [{"text": "[","color": "gold"},{"keybind": "key.use","color": "aqua"},{"text": "]","color": "gold"},{"text": " 使用道具","color": "yellow"}]
execute if score $slot bendangs matches ..7 unless score $item_type bendangs matches 1.. run title @s actionbar ""
execute if score $slot bendangs matches 8 unless entity @e[tag=stealing] run title @s actionbar [{"text": "[","color": "gold"},{"keybind": "key.use","color": "aqua"},{"text": "]","color": "gold"},{"text": " 射击对方","color": "yellow"},"   ",{"text": "[","color": "gold"},{"keybind": "key.attack","color": "aqua"},{"text": "]","color": "gold"},{"text": " 射击自己","color": "yellow"}]
execute if score $slot bendangs matches 8 if entity @e[tag=stealing] run title @s actionbar ""