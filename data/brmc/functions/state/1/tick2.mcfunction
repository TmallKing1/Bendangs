# 旁观者活动范围限制
execute as @a[team=watcher] unless entity @s[x=-9,y=1,z=-5,dx=11,dy=3,dz=11] run tp @s -4.5 1.0 1.0 -90 0

# 若场上没有玩家，则重置游戏
execute unless entity @a[team=player] run tellraw @a ["",{"text": "> ","color": "red","bold": true},{"text": "玩家全部离场，比赛提前结束！","color": "red"}]
execute unless entity @a[team=player] run function brmc:state/0/state_enter

execute if entity @a[team=player] run function brmc:game/tick2