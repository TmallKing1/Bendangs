# 给敌方目标加暂停行动的标签
execute as @e[tag=player_marker] unless score @s minecart_id = $action_player bendangs run tag @s add paused

# 显示提示
execute as @a[team=player] if score @s minecart_id = @e[tag=paused,limit=1] minecart_id run tellraw @a ["",{"text": "> ","color": "yellow","bold": true},{"selector": "@s","color": "gold"},{"text": " 被只因蛋砸晕了，暂时无法行动","color": "yellow"}]

# 重置当前正在使用的道具
scoreboard players reset $item_using bendangs