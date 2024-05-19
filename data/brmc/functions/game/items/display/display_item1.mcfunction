# 获取玩家当前槽位的物品类型
tag @e remove marked_display
$execute store result score $item_type bendangs run data get entity @s data.Items[$(Slot)]
$execute as @e[type=item_display] if score @s minecart_id = @e[tag=marked_marker,limit=1] minecart_id if score @s slot_id matches $(Slot) run tag @s add marked_display
execute if score $item_type bendangs matches 0 run data modify entity @e[tag=marked_display,limit=1] item set value {Count:1b, id:"minecraft:air"}
execute unless score $item_type bendangs matches 0 store result storage bendangs:game ItemDisplay.Type int 1 run scoreboard players get $item_type bendangs
execute unless score $item_type bendangs matches 0 run function brmc:game/items/display/display_item2 with storage bendangs:game ItemDisplay

tag @e remove marked_display