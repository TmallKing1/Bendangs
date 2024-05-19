execute unless score $item_type bendangs matches 6 run return 1

execute as @e[tag=player_marker] unless score @s minecart_id = $action_player bendangs run data modify storage bendangs:game ItemsTemp set from entity @s data.Items

scoreboard players set $slot bendangs 0
return run function brmc:game/items/use/6/check_can_use1