# 显示随机标题
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s times 0t 40t 10t
execute store result score $random bendangs run random value 0..1
execute if score $random bendangs matches 0 as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "|","color": "red","bold": true,"obfuscated": true},{"text":" 🏹 ","color":"red","bold": false,"obfuscated": false},{"text": "|","color": "red","bold": true,"obfuscated": true}]
execute if score $random bendangs matches 1 as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "|","color": "white","bold": true,"obfuscated": true},{"text":" 🏹 ","color":"white","bold": false,"obfuscated": false},{"text": "|","color": "white","bold": true,"obfuscated": true}]
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s subtitle ""

execute if score $countdown_fast bendangs matches 0 as @e[tag=player_marker] if score @s minecart_id = $action_player bendangs run function brmc:game/items/use/7/end_using