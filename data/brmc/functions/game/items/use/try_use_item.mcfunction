tag @s add action
execute as @e[tag=player_marker] if score @s minecart_id = @a[tag=action,limit=1] minecart_id run tag @s add action_marker

# 获取玩家副手对应的原物品槽位
execute store result score $item_slot bendangs run data get entity @s SelectedItem.tag.game_slot
execute store result storage bendangs:game ItemUse.Slot int 1 run data get entity @s SelectedItem.tag.game_slot

# 判断当前是否可以使用道具
data remove storage bendangs:game ItemUnusableHint
function brmc:game/items/use/check_item with storage bendangs:game ItemUse
data remove entity @e[tag=action_marker,limit=1] data.ItemUnusableHint
data modify entity @e[tag=action_marker,limit=1] data.ItemUnusableHint set from storage bendangs:game ItemUnusableHint

# 若道具无法使用，则设置文本显示倒计时，否则使用此道具
execute store result storage bendangs:game ItemUse.Type int 1 run scoreboard players get $item_type bendangs
execute as @e[tag=action_marker,limit=1] if data entity @s data.ItemUnusableHint as @a[team=player] if score @s minecart_id = @e[tag=action_marker,limit=1] minecart_id at @s run function brmc:lib/sounds/error
execute as @e[tag=action_marker,limit=1] if data entity @s data.ItemUnusableHint run scoreboard players set @s countdown_fast 15
execute as @e[tag=action_marker,limit=1] unless data entity @s data.ItemUnusableHint unless score $item_slot bendangs matches 8 run function brmc:game/items/use/use_item with storage bendangs:game ItemUse
execute as @e[tag=action_marker,limit=1] unless data entity @s data.ItemUnusableHint if score $item_slot bendangs matches 8 run function brmc:game/items/use/use_item with storage bendangs:game ItemUse

tag @a remove action
tag @e remove action_marker