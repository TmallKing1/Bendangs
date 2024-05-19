# 生成末影水晶显示的子弹索引

data modify storage bendangs:game Random.Min set value 0
execute store result score $random_max bendangs run data get storage bendangs:game Bullets
execute store result storage bendangs:game Random.Max int 1 run scoreboard players remove $random_max bendangs 1
function brmc:lib/random with storage bendangs:game Random
execute store result storage bendangs:game CrystalIndex int 1 run scoreboard players get $random bendangs