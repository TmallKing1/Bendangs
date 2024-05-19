# 生成一个范围在 1 到 总子弹数 的随机数
data modify storage bendangs:game Random.Min set value 1
execute store result storage bendangs:game Random.Max int 1 run scoreboard players get $arrow_count_temp bendangs
function brmc:lib/random with storage bendangs:game Random

# 若随机数小于等于实弹个数则填实弹，否则填虚弹
scoreboard players set $arrow_type bendangs 0
execute if score $random bendangs <= $real_count_temp bendangs run scoreboard players set $arrow_type bendangs 1
execute if score $arrow_type bendangs matches 1 run data modify storage bendangs:game String.C set value '{"text":"🏹","color":"red"}'
execute if score $arrow_type bendangs matches 0 run data modify storage bendangs:game String.C set value '{"text":"🏹","color":"white"}'
scoreboard players remove $arrow_count_temp bendangs 1
execute if score $arrow_type bendangs matches 1 run scoreboard players remove $real_count_temp bendangs 1

# 连接字符串并将其作为新的 A
data modify storage bendangs:game String.B set value ','
function brmc:lib/string/connect3 with storage bendangs:game String
data modify storage bendangs:game String.A set from storage bendangs:game String.Result

# 若子弹数没扣完，则继续填子弹
execute if score $arrow_count_temp bendangs matches 1.. run function brmc:game/state/2/fill_display_queue