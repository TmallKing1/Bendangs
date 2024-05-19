# 若场上没有玩家，则重置游戏
execute unless entity @a[team=player] run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"text": "玩家全部离场，比赛提前结束！","color": "red"}]
execute unless entity @a[team=plyaer] run function brmc:state/0/player_enter

execute if entity @a[team=player] run function brmc:game/tick2