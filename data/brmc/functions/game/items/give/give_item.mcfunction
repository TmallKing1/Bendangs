# 若当前状态不对头，则直接返回
execute unless score $state bendangs matches 1 run return fail

# 给予两个玩家各一个物品

# A 玩家
execute as @e[tag=player_A] run function brmc:game/items/give/give_item1

# B 玩家
execute as @e[tag=player_B] run function brmc:game/items/give/give_item1

# 减少道具个数
scoreboard players remove $item_count bendangs 1

# 若还有道具未给予，则添加计时器
execute if score $item_count bendangs matches 1.. run schedule function brmc:game/items/give/give_item 10t replace