# 确保初始的子弹队列是空的
data modify storage bendangs:game Bullets set value []

# 总子弹数（血量均小于等于2时：2-4，只有一名玩家小于等于2时：3-6，两名玩家血量均大于2时：4-8）
scoreboard players set $bullet_count_control bendangs 0
execute unless score @e[scores={minecart_id=1},tag=player_marker,limit=1] life matches ..2 run scoreboard players add $bullet_count_control bendangs 1
execute unless score @e[scores={minecart_id=2},tag=player_marker,limit=1] life matches ..2 run scoreboard players add $bullet_count_control bendangs 1
execute if score $bullet_count_control bendangs matches 0 store result score $arrow_count bendangs run random value 2..4
execute if score $bullet_count_control bendangs matches 1 store result score $arrow_count bendangs run random value 3..6
execute if score $bullet_count_control bendangs matches 2 store result score $arrow_count bendangs run random value 4..8

# 计算实弹数目，虚弹即为总数减去实弹数目
execute if score $arrow_count bendangs matches ..4 run scoreboard players set $random_min bendangs 1
execute if score $arrow_count bendangs matches 5..6 run scoreboard players set $random_min bendangs 2
execute if score $arrow_count bendangs matches 7..8 run scoreboard players set $random_min bendangs 3
scoreboard players operation $random_max bendangs = $arrow_count bendangs
execute if score $arrow_count bendangs matches ..4 run scoreboard players remove $random_max bendangs 1
execute if score $arrow_count bendangs matches 5..6 run scoreboard players remove $random_max bendangs 2
execute if score $arrow_count bendangs matches 7..8 run scoreboard players remove $random_max bendangs 3
execute store result storage bendangs:game Random.Min int 1 run scoreboard players get $random_min bendangs
execute store result storage bendangs:game Random.Max int 1 run scoreboard players get $random_max bendangs
function brmc:lib/random with storage bendangs:game Random
scoreboard players operation $real_count bendangs = $random bendangs

# 根据实弹和虚弹数目随机填充队列
scoreboard players operation $arrow_count_temp bendangs = $arrow_count bendangs
scoreboard players operation $real_count_temp bendangs = $real_count bendangs
function brmc:game/state/2/fill_bullet_queue

# 根据实弹和虚弹数目随机填充显示队列
scoreboard players operation $arrow_count_temp bendangs = $arrow_count bendangs
scoreboard players operation $real_count_temp bendangs = $real_count bendangs
data modify storage bendangs:game String.A set value '{"text":""}'
function brmc:game/state/2/fill_display_queue
data modify storage bendangs:game String.A set value '['
data modify storage bendangs:game String.B set from storage bendangs:game String.Result
data modify storage bendangs:game String.C set value ']'
function brmc:lib/string/connect3 with storage bendangs:game String
data modify storage bendangs:game BulletsDisplay set from storage bendangs:game String.Result