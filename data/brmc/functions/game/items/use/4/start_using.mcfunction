# 强化
scoreboard players set $enhanced bendangs 1

# 提示
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 使用了附魔书，强化了弩的伤害！","color": "yellow"}]

# 音效
execute as @e[tag=crossbow_display] at @s run playsound entity.player.levelup player @a ~ ~ ~ 1 0.5 0.5