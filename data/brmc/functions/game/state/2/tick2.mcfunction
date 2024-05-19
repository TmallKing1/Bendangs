# 更新老板栏
execute store result bossbar bendangs:game value run scoreboard players get $countdown_fast bendangs

# 发放道具
execute if score $countdown_fast bendangs matches 30 run function brmc:game/state/2/give_items

# 倒计时结束进入状态 3
execute if score $countdown_fast bendangs matches 0 run function brmc:game/state/3/state_enter