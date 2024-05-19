execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s times 0t 40t 10t
$execute store result score $bullet_type bendangs run data get storage bendangs:game Bullets[$(CrystalIndex)]
execute if score $bullet_type bendangs matches 0 as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "!","color": "white","bold": true},{"text":" 🏹 ","color":"white","bold": false},{"text": "!","color": "white","bold": true}]
execute if score $bullet_type bendangs matches 1 as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "!","color": "red","bold": true},{"text":" 🏹 ","color":"red","bold": false},{"text": "!","color": "red","bold": true}]
execute store result score $crystal_index bendangs run data get storage bendangs:game CrystalIndex
scoreboard players add $crystal_index bendangs 1
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s subtitle [{"text":"第 ","color":"yellow"},{"score":{"name": "$crystal_index","objective": "bendangs"},"color": "gold","bold": true},{"text": " 支箭","color": "yellow"}]