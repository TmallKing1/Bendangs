# 回复血量
scoreboard players set $success bendangs 0
execute store success score $success bendangs unless entity @s[tag=dying] run scoreboard players add @s[scores={life=..4}] life 1

# 显示提示
execute if score $success bendangs matches 1 as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了苹果，回复了 1 点生命值！","color": "yellow"}]
execute if score $success bendangs matches 0 as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了苹果，但啥事都没发生……","color": "red"}]

# 更新血量显示
function brmc:game/life_display

# 音效与粒子
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run particle item apple ^ ^-0.1 ^0.2 0 0 0 0 1 force @a
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run playsound entity.generic.eat player @a ^ ^ ^ 1 1 0.5