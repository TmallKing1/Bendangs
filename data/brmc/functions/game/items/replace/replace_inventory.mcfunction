# 槽位异常检测
execute unless data entity @s Inventory[{Slot:0b,tag:{game_slot: 0b}}] run clear @s #brmc:game_item{game_slot:0b}
execute unless data entity @s Inventory[{Slot:1b,tag:{game_slot: 1b}}] run clear @s #brmc:game_item{game_slot:1b}
execute unless data entity @s Inventory[{Slot:2b,tag:{game_slot: 2b}}] run clear @s #brmc:game_item{game_slot:2b}
execute unless data entity @s Inventory[{Slot:3b,tag:{game_slot: 3b}}] run clear @s #brmc:game_item{game_slot:3b}
execute unless data entity @s Inventory[{Slot:4b,tag:{game_slot: 4b}}] run clear @s #brmc:game_item{game_slot:4b}
execute unless data entity @s Inventory[{Slot:5b,tag:{game_slot: 5b}}] run clear @s #brmc:game_item{game_slot:5b}
execute unless data entity @s Inventory[{Slot:6b,tag:{game_slot: 6b}}] run clear @s #brmc:game_item{game_slot:6b}
execute unless data entity @s Inventory[{Slot:7b,tag:{game_slot: 7b}}] run clear @s #brmc:game_item{game_slot:7b}
execute unless data entity @s Inventory[{Slot:8b,tag:{game_slot: 8b}}] run clear @s #brmc:game_item{game_slot:8b}

# 替换无用槽
item replace entity @s inventory.0 with air
item replace entity @s inventory.1 with air
item replace entity @s inventory.2 with air
item replace entity @s inventory.3 with air
item replace entity @s inventory.4 with air
item replace entity @s inventory.5 with air
item replace entity @s inventory.6 with air
item replace entity @s inventory.7 with air
item replace entity @s inventory.8 with air
item replace entity @s inventory.9 with air
item replace entity @s inventory.10 with air
item replace entity @s inventory.11 with air
item replace entity @s inventory.12 with air
item replace entity @s inventory.13 with air
item replace entity @s inventory.14 with air
item replace entity @s inventory.15 with air
item replace entity @s inventory.16 with air
item replace entity @s inventory.17 with air
item replace entity @s inventory.18 with air
item replace entity @s inventory.19 with air
item replace entity @s inventory.20 with air
item replace entity @s inventory.21 with air
item replace entity @s inventory.22 with air
item replace entity @s inventory.23 with air
item replace entity @s inventory.24 with air
item replace entity @s inventory.25 with air
item replace entity @s inventory.26 with air

# 替换快捷栏
scoreboard players set $slot bendangs 0
function brmc:game/items/replace/replace_slot

# 替换第九个槽位：如果当前游戏状态为 3 且是自己的行动轮，则将第九个槽位替换为弩，否则替换为屏障
execute if score $game_state bendangs matches 3 if score $action_player bendangs = @s minecart_id unless score $item_using bendangs matches 1.. run item replace entity @s hotbar.8 with crossbow{Charged:1b,ChargedProjectiles:[{Count:1b,id:"minecraft:arrow"}],display:{Name:'{"text": "弩","color": "red","italic": false}'},game_slot: 8b}
execute if score $game_state bendangs matches 3 if score $action_player bendangs = @s minecart_id if score $item_using bendangs matches 1.. run item replace entity @s hotbar.8 with barrier{display:{Name:'{"text": "当前无法使用","color": "red","italic": false}'},game_slot: 8b}
execute if score $game_state bendangs matches 3 unless score $action_player bendangs = @s minecart_id run item replace entity @s hotbar.8 with barrier{display:{Name:'{"text": "当前不是你的行动轮","color": "red","italic": false}'},game_slot: 8b}
execute unless score $game_state bendangs matches 3 run item replace entity @s hotbar.8 with barrier{display:{Name:'{"text": "请等待游戏开始","color": "red","italic": false}'},game_slot: 8b}