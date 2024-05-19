# 加入玩家队
team join player @s

# 播放音效
execute at @s run function brmc:lib/sounds/hit

# 替换物品
clear @s gray_dye
clear @s purple_dye
item replace entity @s[tag=on_minecart] hotbar.8 with purple_dye{ready_item: 1b,display:{Name:'[{"text":"","color": "light_purple","italic": false},{"text": "准备（按 "},{"keybind":"key.use"},{"text": " 切换待机）"}]'}} 1