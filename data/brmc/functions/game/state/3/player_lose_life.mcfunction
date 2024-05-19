# 当玩家损失血量时触发（触发者为损失血量的玩家标记，损失血量的命令必须先于此函数执行）
tag @s add damage_marker

# 特效
execute as @a[team=player] if score @s minecart_id = @e[tag=damage_marker,limit=1] minecart_id run effect give @s blindness 2
execute as @a[team=player] at @s if score @s minecart_id = @e[tag=damage_marker,limit=1] minecart_id run playsound entity.ender_dragon.growl player @s 0 1000000 0 1000000
execute as @a[team=player] if score @s minecart_id = @e[tag=damage_marker,limit=1] minecart_id run title @s times 10t 25t 5t

# 若玩家处于濒死状态，则结束该局
execute if entity @s[tag=dying] run tag @s add lost
execute if entity @s[tag=dying] run function brmc:game/state/4/state_enter

# 玩家进入濒死状态的命令
execute if score @s[tag=!dying] life matches ..0 run function brmc:game/state/3/player_dying

# 若不是濒死状态，且没结束游戏，则显示标题
execute if entity @s[tag=!dying] if score $game_state bendangs matches 3 as @a[team=player] if score @s minecart_id = @e[tag=damage_marker,limit=1] minecart_id run title @s title [{"text": "|","color": "red","bold": true,"obfuscated": true},{"text": " 💀 ","color": "red","bold": false,"obfuscated": false},{"text": "|","color": "red","bold": true,"obfuscated": true}]

tag @s remove damage_marker