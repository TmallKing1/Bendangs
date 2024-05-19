schedule function brmc:clock/tick2 2t

# 玩家重进处理
execute as @a unless score @s leave_count matches 0 run function brmc:player/player_enter

# 倒计时
execute if score $countdown_fast bendangs matches 1.. run scoreboard players remove $countdown_fast bendangs 1
scoreboard players remove @e[scores={countdown_fast=1..}] countdown_fast 1

# 不同状态执行不同函数
execute if score $state bendangs matches 0 run function brmc:state/0/tick2
execute if score $state bendangs matches 1 run function brmc:state/1/tick2