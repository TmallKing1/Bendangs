# 随机决定回复 2 点还是扣血 1 点
execute store result score $random bendangs run random value 0..1

# 若为 0 则扣血 1 点
execute if score $random bendangs matches 0 run scoreboard players remove @s life 1
execute if score $random bendangs matches 0 run function brmc:game/state/3/player_lose_life
execute if score $random bendangs matches 0 as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了生鸡肉，不幸地受伤了……","color": "red"}]

# 若为 1 则回血 2 点
# 回复血量
execute if score $random bendangs matches 1 if entity @s[tag=!dying,scores={life=..3}] as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了生鸡肉，回复了 2 点生命值！","color": "yellow"}]
execute if score $random bendangs matches 1 if entity @s[tag=!dying,scores={life=4}] as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了生鸡肉，回复了 1 点生命值！","color": "yellow"}]
execute if score $random bendangs matches 1 if entity @s[tag=!dying,scores={life=5}] as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了生鸡肉，但啥事都没发生……","color": "red"}]
execute if score $random bendangs matches 1 if entity @s[tag=dying] as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了生鸡肉，但啥事都没发生……","color": "red"}]
execute if score $random bendangs matches 1 unless entity @s[tag=dying] run scoreboard players add @s[scores={life=..4}] life 2
scoreboard players set @s[scores={life=6..}] life 5

# 更新血量显示
function brmc:game/life_display

# 音效与粒子
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run particle item chicken ^ ^-0.1 ^0.2 0 0 0 0 1 force @a
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run playsound entity.generic.eat player @a ^ ^ ^ 1 1 0.5