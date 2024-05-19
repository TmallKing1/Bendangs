# 玩家攻击交互实体，按照游戏状态执行方法
tag @s add interacted

execute on attacker run function brmc:lib/interaction/player_attacked

data remove entity @s attack

tag @s remove interacted