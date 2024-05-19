# 根据当前游戏状态执行函数
execute if score $game_state bendangs matches 1 run function brmc:game/state/1/tick1
execute if score $game_state bendangs matches 2 run function brmc:game/state/2/tick1
execute if score $game_state bendangs matches 3 run function brmc:game/state/3/tick1
execute if score $game_state bendangs matches 4 run function brmc:game/state/4/tick1