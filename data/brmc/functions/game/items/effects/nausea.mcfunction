# 标记
tag @s add effect_marker

# 给予效果
execute as @a[team=player] if score @s minecart_id = @e[tag=effect_marker,limit=1] minecart_id run effect give @s nausea infinite 0 true

tag @s remove effect_marker