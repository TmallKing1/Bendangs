# 清除展示实体
kill @e[tag=temporary_display]

# 重置当前正在使用的道具
scoreboard players reset $item_using bendangs

# 如果子弹已经用完，则进入下一轮
execute unless data storage bendangs:game Bullets[0] run function brmc:game/state/2/state_enter