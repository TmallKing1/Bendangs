# 根据当前游戏状态执行函数
execute if score $game_state bendangs matches 1 run function brmc:game/state/1/tick2
execute if score $game_state bendangs matches 2 run function brmc:game/state/2/tick2
execute if score $game_state bendangs matches 3 run function brmc:game/state/3/tick2
execute if score $game_state bendangs matches 4 run function brmc:game/state/4/tick2

# 物品处理
execute as @a[team=player] run function brmc:game/items/replace/replace_inventory

# 物品显示
execute as @e[tag=player_marker] run function brmc:game/items/display/display_inventory

# 玩家 Actionbar
execute as @a[team=player] run function brmc:game/player_actionbar

# 弩附魔显示
execute if score $enhanced bendangs matches 1 run data modify entity @e[tag=crossbow_display,limit=1] item.tag.Enchantments set value [{id:"minecraft:power",lvl:1}]
execute unless score $enhanced bendangs matches 1 run data modify entity @e[tag=crossbow_display,limit=1] item.tag.Enchantments set value []

# 玩家状态效果
execute as @e[tag=player_marker,tag=paused] run function brmc:game/items/effects/nausea
execute unless entity @e[tag=player_marker,tag=paused] run effect clear @a nausea
execute as @e[tag=player_marker,tag=stealing] run function brmc:game/items/effects/blindness