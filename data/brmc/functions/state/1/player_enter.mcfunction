# 匹配玩家 ID 与游戏 ID
execute if score @s game_id = $ game_id run team join player
execute unless score @s game_id = $ game_id run team join watcher

# 若进入状态的玩家为旁观者则设置游戏模式为旁观
gamemode spectator @s[team=watcher]
tp @s[team=watcher] -4.5 1.0 1.0 -90 0
scoreboard players reset @s[team=watcher] game_id
scoreboard players reset @s[team=watcher] minecart_id

# 若进入状态的玩家不为旁观者则设置游戏模式为冒险并使其坐在矿车上
gamemode adventure @s[team=player]
ride @s[team=player,scores={minecart_id=1}] mount @e[tag=player_seat_A,limit=1]
ride @s[team=player,scores={minecart_id=2}] mount @e[tag=player_seat_B,limit=1]

# 清除物品
clear @s

# 状态效果
function brmc:state/1/give_effects