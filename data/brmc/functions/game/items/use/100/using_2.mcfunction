# 更改展示的物品
data modify entity @e[tag=crossbow_display,limit=1] item set value {Count:1b, id:"minecraft:crossbow",tag:{Charged:0b}}

# 音效
execute as @e[tag=crossbow_display] at @s run playsound item.crossbow.shoot player @a ~ ~ ~ 1 1.0 0.5

# 根据是否为毒箭判断掉血
execute store result score $bullet_type bendangs run data get storage bendangs:game Bullets[0]
data remove storage bendangs:game Bullets[0]
execute as @a[team=player] if score @s minecart_id = $attack_target bendangs run damage @s 1 arrow
execute if score $bullet_type bendangs matches 0 as @a[team=player] if score @s minecart_id = $attack_target bendangs run title @s title [{"text": "✔ ","color": "aqua"},{"text": "SAFE","color": "aqua"},{"text": " ✔","color": "aqua"}]
execute if score $bullet_type bendangs matches 1 as @e[tag=player_marker] if score @s minecart_id = $attack_target bendangs if score $enhanced bendangs matches 1 run scoreboard players remove @s life 2
execute if score $bullet_type bendangs matches 1 as @e[tag=player_marker] if score @s minecart_id = $attack_target bendangs unless score $enhanced bendangs matches 1 run scoreboard players remove @s life 1
execute if score $bullet_type bendangs matches 1 as @e[tag=player_marker] if score @s minecart_id = $attack_target bendangs run function brmc:game/state/3/player_lose_life

function brmc:game/bullet_display_clear
function brmc:game/bullet_display
function brmc:game/life_display