# 填单个槽位
execute store result storage bendangs:game ItemReplace.Slot int 1 run scoreboard players get $slot bendangs

# 用函数宏
execute if score @s minecart_id matches 1 unless entity @e[tag=stealing,tag=player_A] run scoreboard players set $replace_player bendangs 1
execute if score @s minecart_id matches 1 if entity @e[tag=stealing,tag=player_A] run scoreboard players set $replace_player bendangs 2
execute if score @s minecart_id matches 2 unless entity @e[tag=stealing,tag=player_B] run scoreboard players set $replace_player bendangs 2
execute if score @s minecart_id matches 2 if entity @e[tag=stealing,tag=player_B] run scoreboard players set $replace_player bendangs 1
execute as @e[tag=player_marker] if score @s minecart_id = $replace_player bendangs run data modify storage bendangs:game ItemsTemp set from entity @s data.Items
function brmc:game/items/replace/replace_slot1 with storage bendangs:game ItemReplace

# 若没填完就接着填
scoreboard players add $slot bendangs 1
execute if score $slot bendangs matches 0..7 run function brmc:game/items/replace/replace_slot