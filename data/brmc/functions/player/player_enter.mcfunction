# 记录玩家 UUID
execute store result score @s UUID run data get entity @s UUID[0]

# 解除骑乘状态
execute on vehicle run kill
ride @s dismount

# 解除状态效果
effect clear @s

# 根据游戏状态执行不同方法
execute if score $state bendangs matches 0 run function brmc:state/0/player_enter
execute if score $state bendangs matches 1 run function brmc:state/1/player_enter

# 重置重进次数
scoreboard players set @s leave_count 0

# 提示声音
execute as @a at @s run function brmc:lib/sounds/hit