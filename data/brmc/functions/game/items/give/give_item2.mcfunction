# 槽位从 0 到 7 挨个遍历
execute store result storage bendangs:game ItemGive.Slot int 1 run scoreboard players get $slot bendangs
function brmc:game/items/give/give_item3 with storage bendangs:game ItemGive
execute if score $item_gived bendangs matches 0 run scoreboard players add $slot bendangs 1
execute if score $item_gived bendangs matches 0 if score $slot bendangs matches ..7 run function brmc:game/items/give/give_item2