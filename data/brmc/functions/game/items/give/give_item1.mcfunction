tag @s add give_marker
# 给予道具的初始化操作
scoreboard players set $item_gived bendangs 0
scoreboard players set $slot bendangs 0
function brmc:game/items/give/give_item2

# 音效
execute as @a[team=player] if score @s minecart_id = @e[tag=give_marker,limit=1] minecart_id if score $item_gived bendangs matches 1 at @s run playsound block.note_block.pling player @s 0 1000000 0 1000000 0.5

tag @e remove give_marker