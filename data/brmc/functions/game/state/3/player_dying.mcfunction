scoreboard players set @s life 1
tag @s add dying
execute as @a[team=player] if score @s minecart_id = @e[tag=damage_marker,limit=1] minecart_id run title @s title [{"text": "|","color": "dark_red","bold": true,"obfuscated": true},{"text": " 濒死 ","color": "dark_red","bold": false,"obfuscated": false},{"text": "|","color": "dark_red","bold": true,"obfuscated": true}]