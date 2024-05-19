# Bossbar 更新
execute store result bossbar bendangs:waiting value run scoreboard players get $countdown_fast bendangs

# 玩家处理
## 筛选矿车上的玩家
tag @a remove on_minecart
execute as @e[tag=player_seat] on passengers run tag @s add on_minecart

## 玩家计数
execute store result score $on_minecart_count bendangs if entity @a[tag=on_minecart]
execute store result score $ready_count bendangs if entity @a[tag=on_minecart,team=player]

## 非矿车上的玩家自动进旁观组
execute as @a[tag=!on_minecart,team=player] run function brmc:state/0/player/cancel_ready
clear @a[tag=!on_minecart] gray_dye{ready_item: 1b}
clear @a[tag=!on_minecart] purple_dye{ready_item: 1b}

## 矿车上的玩家给予物品
execute as @a[tag=on_minecart,team=watcher] unless data entity @s Inventory[{Slot: 8b, id:"minecraft:gray_dye",Count:1b,tag:{ready_item:1b}}] run function brmc:state/0/player/watcher_item
execute as @a[tag=on_minecart,team=player] unless data entity @s Inventory[{Slot: 8b, id:"minecraft:purple_dye",Count:1b,tag:{ready_item:1b}}] run function brmc:state/0/player/player_item

## 显示提示
execute if score $on_minecart_count bendangs matches ..1 run title @a[tag=!on_minecart] actionbar ["",{"text": "坐上矿车","color": "yellow"},{"text": "以加入游戏","color": "gold"}]
title @a[tag=on_minecart,team=watcher] actionbar ["",{"text": "按下 ","color": "gold"},{"keybind": "key.use","color": "yellow"},{"text": " 以准备","color": "gold"}]
title @a[tag=on_minecart,team=player] actionbar [""]

# 开始游戏
execute if score $ready_count bendangs matches ..1 run scoreboard players add $countdown_fast bendangs 1
execute if score $countdown_fast bendangs matches 114.. if score $ready_count bendangs matches 2.. run function brmc:state/0/ready/proceed
execute if score $countdown_fast bendangs matches ..113 if score $ready_count bendangs matches ..1 as @a at @s run function brmc:lib/sounds/error
execute if score $countdown_fast bendangs matches ..113 if score $ready_count bendangs matches ..1 run function brmc:state/0/ready/waiting
execute if score $countdown_fast bendangs matches 0 run function brmc:state/0/start_game