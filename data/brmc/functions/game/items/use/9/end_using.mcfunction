# 根据子弹类型显示标题
function brmc:game/items/use/9/end_using1 with storage bendangs:game

# 音效
execute as @a[team=player] at @s if score @s minecart_id = $action_player bendangs anchored eyes run playsound block.glass.break player @a ^ ^ ^ 1 1 0.5

# 重置当前正在使用的道具
scoreboard players reset $item_using bendangs