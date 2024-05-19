# 判断自己在不在矿车上
tag @s remove on_minecart
execute on vehicle if entity @s[type=minecart] run tag @a[tag=interacted_player] add on_minecart

# 若一个不在矿车上的玩家与交互实体交互，且矿车上没有玩家，则使其坐上矿车
execute if entity @s[tag=!on_minecart] as @e[type=minecart] run tag @s remove occupied
execute if entity @s[tag=!on_minecart] as @e[type=minecart] if score @s minecart_id = @e[tag=interacted,limit=1] minecart_id on passengers on vehicle run tag @s add occupied
execute if entity @s[tag=!on_minecart] as @e[type=minecart] if score @s minecart_id = @e[tag=interacted,limit=1] minecart_id unless entity @s[tag=occupied] run ride @a[tag=interacted_player,limit=1] mount @s

# 若一个在矿车上的玩家与交互实体交互，则切换他的准备状态
execute if entity @s[tag=on_minecart] run function brmc:state/0/player/switch_ready

# 结束判定
tag @s remove on_minecart
tag @e remove occupied