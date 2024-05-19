execute store result storage bendangs:game ItemCheck.Slot int 1 run scoreboard players get $slot bendangs
scoreboard players set $can_steal bendangs 0
function brmc:game/items/use/6/check_can_use2 with storage bendangs:game ItemCheck
execute if score $can_steal bendangs matches 1 run return 1
scoreboard players add $slot bendangs 1
execute if score $slot bendangs matches ..7 run return run function brmc:game/items/use/6/check_can_use1
return 0