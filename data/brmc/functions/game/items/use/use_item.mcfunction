execute if entity @s[tag=stealing] run effect clear @a blindness
scoreboard players reset $item_using bendangs

# 消耗玩家对应槽位的物品，若为偷取状态则消耗对方玩家对应槽位的物品
$execute unless entity @s[tag=stealing] run data modify entity @s data.Items[$(Slot)] set value 0
$execute if entity @s[tag=stealing] as @e[tag=player_marker] unless score @s minecart_id = $action_player bendangs run data modify entity @s data.Items[$(Slot)] set value 0
tag @e remove stealing

# 道具类型通过传参
$function brmc:game/items/use/$(Type)/start_using