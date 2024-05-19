function brmc:game/state/3/crystal_index
execute if data storage bendangs:game Bullets[0] run scoreboard players set $enhanced bendangs 0
execute if data storage bendangs:game Bullets[0] run data modify entity @e[tag=crossbow_display,limit=1] item set value {Count:1b, id:"minecraft:crossbow",tag:{ChargedProjectiles:[{Count:1b,id:"minecraft:arrow"}],Charged:1b}}
execute unless data storage bendangs:game Bullets[0] run return run function brmc:game/state/2/state_enter