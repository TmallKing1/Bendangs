# 根据当前正在使用的物品执行函数
execute if score $item_using bendangs matches 3 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/3/tick2
execute if score $item_using bendangs matches 5 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/5/tick2
execute if score $item_using bendangs matches 6 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/6/tick2
execute if score $item_using bendangs matches 7 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/7/tick2
execute if score $item_using bendangs matches 9 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/9/tick2
execute if score $item_using bendangs matches 100 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/100/tick2