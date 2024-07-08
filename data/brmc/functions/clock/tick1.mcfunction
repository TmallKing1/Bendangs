
execute unless entity @e[tag=player_seat_A] run summon minecart 0.0 1.5 -1.5 {Invulnerable: 1b, Tags:["player_seat","player_seat_A"], NoGravity: 1b,Silent:1b}
execute unless entity @e[tag=player_seat_B] run summon minecart 0.0 1.5 3.5 {Invulnerable: 1b, Tags:["player_seat","player_seat_B"], NoGravity: 1b,Silent:1b}

# 不同状态执行不同函数
execute if score $state bendangs matches 0 run function brmc:state/0/tick1
execute if score $state bendangs matches 1 run function brmc:state/1/tick1

# 玩家与交互实体进行交互的判定
execute as @e[type=interaction] if data entity @s interaction run function brmc:lib/interaction/interacted
execute as @e[type=interaction] if data entity @s attack run function brmc:lib/interaction/attacked

# 清除所有掉落物（除被标记的）还有鸡蛋招出来的只因
kill @e[type=item,tag=!no_gc]
tp @e[type=chicken] 0 -114 0
kill @e[type=chicken]