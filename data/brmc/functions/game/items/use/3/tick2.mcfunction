execute if score $countdown_fast bendangs matches 10 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/3/using_1
execute if score $countdown_fast bendangs matches 5 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/3/using_2

execute if score $countdown_fast bendangs matches 0 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/3/end_using