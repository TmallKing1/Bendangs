function brmc:game/tick1

# 强制旁观者玩家解除实体旁观
execute as @a[team=watcher] run spectate

# 强制玩家坐上矿车
ride @a[team=player,scores={minecart_id=1},limit=1] mount @e[tag=player_seat_A,limit=1]
ride @a[team=player,scores={minecart_id=2},limit=1] mount @e[tag=player_seat_B,limit=1]

# 启用老板栏
bossbar set bendangs:game_a players @a[scores={minecart_id=1}]
bossbar set bendangs:game_b players @a[scores={minecart_id=2}]