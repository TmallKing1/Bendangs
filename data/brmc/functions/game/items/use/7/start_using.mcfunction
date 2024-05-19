# 设置动画倒计时
scoreboard players set $item_using bendangs 7
scoreboard players set $countdown_fast bendangs 15

# 提示
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了末影之眼！","color": "yellow"}]