# 给自己加个标签
tag @s add marked_marker

# 填单个槽位
execute store result storage bendangs:game ItemDisplay.Slot int 1 run scoreboard players get $slot bendangs

# 用函数宏
function brmc:game/items/display/display_item1 with storage bendangs:game ItemDisplay

# 移除标签
tag @s remove marked_marker

# 若没填完就接着填
scoreboard players add $slot bendangs 1
execute if score $slot bendangs matches 0..7 run function brmc:game/items/display/display_item