# 获取即将使用的道具（或者即将偷取的道具）
execute if score @s minecart_id matches 1 unless entity @e[tag=stealing,tag=player_A] run scoreboard players set $replace_player bendangs 1
execute if score @s minecart_id matches 1 if entity @e[tag=stealing,tag=player_A] run scoreboard players set $replace_player bendangs 2
execute if score @s minecart_id matches 2 unless entity @e[tag=stealing,tag=player_B] run scoreboard players set $replace_player bendangs 2
execute if score @s minecart_id matches 2 if entity @e[tag=stealing,tag=player_B] run scoreboard players set $replace_player bendangs 1
execute as @e[tag=player_marker] if score @s minecart_id = $replace_player bendangs run data modify storage bendangs:game ItemsTemp set from entity @s data.Items
$execute store result score $item_type bendangs run data get storage bendangs:game ItemsTemp[$(Slot)]
execute if score $item_slot bendangs matches 8 run scoreboard players set $item_type bendangs 100
# 对方玩家在线
data modify storage bendangs:game ItemUnusableHint set value "请等待对方玩家恢复连接"
execute as @e[type=minecart] unless score @s minecart_id = $action_player bendangs on passengers run data remove storage bendangs:game ItemUnusableHint
# 游戏状态为 3
execute unless score $game_state bendangs matches 3 run return run data modify storage bendangs:game ItemUnusableHint set value "准备阶段无法使用"
# 当前为自己的行动回合
execute unless score @s minecart_id = $action_player bendangs run return run data modify storage bendangs:game ItemUnusableHint set value "当前不是你的行动轮"
# 当前没有道具正在使用状态中
execute if score $item_using bendangs matches 1.. run data modify storage bendangs:game ItemUnusableHint set value "请先等待上一操作结束"
# 对失明药水的特殊处理
execute if score $item_using bendangs matches 6 unless score $countdown bendangs matches 1.. run data remove storage bendangs:game ItemUnusableHint
execute if score $item_using bendangs matches 6 if score $countdown bendangs matches 1.. run data modify storage bendangs:game ItemUnusableHint set value "请先等待上一操作结束"
execute if score $item_using bendangs matches 6 if score $item_slot bendangs matches 8 run data modify storage bendangs:game ItemUnusableHint set value "请先等待上一操作结束"
# 若道具类型为 0（屏障）
execute if score $item_type bendangs matches 0 run data modify storage bendangs:game ItemUnusableHint set value "该位置没有物品"
# 若玩家尝试偷失明药水
execute if entity @e[tag=action_marker,tag=stealing] if score $item_type bendangs matches 6 run data modify storage bendangs:game ItemUnusableHint set value "无法偷取此道具"
# 若玩家尝试使用鸡蛋扔已经晕了的敌方
execute if entity @e[tag=player_marker,tag=!action_marker,tag=paused] if score $item_type bendangs matches 5 run data modify storage bendangs:game ItemUnusableHint set value "当前状态下无法使用此道具"
# 若玩家尝试用失明药水偷不可偷的玩家
execute store result score $can_use bendangs run function brmc:game/items/use/6/check_can_use
execute unless score $can_use bendangs matches 1 run data modify storage bendangs:game ItemUnusableHint set value "当前状态下无法使用此道具"