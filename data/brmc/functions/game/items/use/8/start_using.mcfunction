# 替换子弹类型
execute store result score $bullet_type bendangs run data get storage bendangs:game Bullets[0]
execute if score $bullet_type bendangs matches 0 run data modify storage bendangs:game Bullets[0] set value 1
execute if score $bullet_type bendangs matches 1 run data modify storage bendangs:game Bullets[0] set value 0

# 提示
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了燧石！","color": "red"}]

# 音效
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run playsound item.flintandsteel.use player @a ^ ^ ^ 1 1 0.5