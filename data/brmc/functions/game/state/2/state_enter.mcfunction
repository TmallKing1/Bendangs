# 设置游戏状态：1 - 开始局 / 2 - 开始轮 / 3 - 游戏中 / 4 - 单局结束
scoreboard players set $game_state bendangs 2

# 决定当前行动玩家
function brmc:game/state/2/action_player

# 将弩转到朝向当前行动玩家的一边
execute if score $action_player bendangs matches 1 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 0f},translation:[0.0f, 0.048f, 0.0f]},start_interpolation:0}
execute if score $action_player bendangs matches 2 run data merge entity @e[tag=crossbow_display,limit=1] {transformation:{left_rotation: {axis: [0.0f, 1.0f, 0.0f], angle: 3.14f},translation:[0.0f, 0.048f, 0.0f]},start_interpolation:0}

# 生成子弹
function brmc:game/state/2/generate_bullets

# 显示标题
title @a times 5t 60t 10t
execute as @a[team=player] if score @s minecart_id = $action_player bendangs run title @s title [{"text": "本轮你先手行动","color": "green"}]
execute as @a[team=player] unless score @s minecart_id = $action_player bendangs run title @s title [{"text": "本轮对方先手行动","color": "red"}]
title @a[team=watcher] title {"text": "新的一轮","color": "yellow"}
title @a subtitle ["本轮子弹 ",{"nbt":"BulletsDisplay","storage": "bendangs:game","interpret": true}]

# 老板栏显示
function brmc:game/life_display
bossbar set bendangs:game_a visible false
bossbar set bendangs:game_b visible false
bossbar set bendangs:game visible true
bossbar set bendangs:game color yellow
bossbar set bendangs:game name ["本轮子弹 ",{"nbt":"BulletsDisplay","storage": "bendangs:game","interpret": true}]
bossbar set bendangs:game max 40

# 清空子弹显示
function brmc:game/bullet_display_clear

# 音效
execute as @a at @s run playsound block.note_block.pling player @s 0 1000000 0 1000000 2

# 设置下一轮倒计时
scoreboard players set $countdown_fast bendangs 40