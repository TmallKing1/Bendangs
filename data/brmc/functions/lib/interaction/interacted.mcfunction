# 玩家与交互实体交互，按照游戏状态执行方法
tag @s add interacted

execute on target run function brmc:lib/interaction/player_interacted

data remove entity @s interaction

tag @s remove interacted