# 旁观者换成玩家
execute if entity @s[team=watcher] run return run function brmc:state/0/player/ready

# 玩家换成旁观者
execute if entity @s[team=player] run return run function brmc:state/0/player/cancel_ready