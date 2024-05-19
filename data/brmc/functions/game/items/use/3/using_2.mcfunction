# 音效
execute as @e[tag=temporary_display] at @s run playsound entity.sheep.shear player @a ~ ~ ~ 1 1 0.5

# 移除子弹
execute store result score $bullet_type bendangs run data get storage bendangs:game Bullets[0]
data remove storage bendangs:game Bullets[0]

# 显示子弹
function brmc:game/bullet_display