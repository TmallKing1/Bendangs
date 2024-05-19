# 设置动画倒计时
scoreboard players set $item_using bendangs 5
scoreboard players set $countdown_fast bendangs 5

# 生成一个砸向敌方玩家的鸡蛋
execute if score $action_player bendangs matches 1 run summon egg 0.0 2.5 -1.0 {Motion:[0.0, 0.1, 0.7]}
execute if score $action_player bendangs matches 2 run summon egg 0.0 2.5 3.0 {Motion:[0.0, 0.1, -0.7]}