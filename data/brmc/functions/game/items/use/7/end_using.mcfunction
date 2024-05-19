# 根据子弹类型显示标题
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s times 0t 40t 10t
execute store result score $bullet_type bendangs run data get storage bendangs:game Bullets[0]
execute if score $bullet_type bendangs matches 0 as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "!","color": "white","bold": true},{"text":" 🏹 ","color":"white","bold": false},{"text": "!","color": "white","bold": true}]
execute if score $bullet_type bendangs matches 1 as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "!","color": "red","bold": true},{"text":" 🏹 ","color":"red","bold": false},{"text": "!","color": "red","bold": true}]
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s subtitle ""

# 音效
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run playsound block.ender_chest.open player @a ^ ^ ^ 1 1 0.5

# 重置当前正在使用的道具
scoreboard players reset $item_using bendangs