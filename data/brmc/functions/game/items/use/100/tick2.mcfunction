execute if score $countdown_fast bendangs matches 30 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/100/using_1
execute if score $countdown_fast bendangs matches 20 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/100/using_2

execute if score $countdown_fast bendangs matches 0 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/100/end_using