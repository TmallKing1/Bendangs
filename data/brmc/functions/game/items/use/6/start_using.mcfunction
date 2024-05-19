# 设置动画倒计时
scoreboard players set $item_using bendangs 6
scoreboard players set $countdown_fast bendangs 3

# 生成一个砸向敌方玩家的喷溅型药水
execute if score $action_player bendangs matches 1 run summon potion 0.0 2.5 -1.0 {Motion:[0.0, 0.15, 0.7],Item:{Count:1b,id:"minecraft:splash_potion",tag:{CustomPotionColor:2624856}}}
execute if score $action_player bendangs matches 2 run summon potion 0.0 2.5 3.0 {Motion:[0.0, 0.15, -0.7],Item:{Count:1b,id:"minecraft:splash_potion",tag:{CustomPotionColor:2624856}}}