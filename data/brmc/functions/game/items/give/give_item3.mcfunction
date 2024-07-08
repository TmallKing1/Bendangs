# 道具
# 1 - [3]苹果：回血
# 2 - [2]生鸡肉：随机回血 2 点 / 扣血 1 点
# 3 - [3]剪刀：退弹
# 4 - [3]附魔书：伤害变为 2 点一回合
# 5 - [2]鸡蛋：使对方无法行动一回合
# 6 - [3]失明药水：偷取对方道具一个并立即使用（不能偷失明药水）
# 7 - [1]末影之眼：得知下发子弹的类型
# 8 - [3]燧石：转换下发子弹类型为另一种
# 9 - [2]末地水晶：得知队列内随机位置的子弹类型
# 100 - 弩

# 给予道具，替换第一个为 0 的栏位
$execute store result score $store_item bendangs run data get entity @s data.Items[$(Slot)]
execute if score $store_item bendangs matches 0 run scoreboard players set $item_gived bendangs 1
execute unless score $store_item bendangs matches 0 run return fail
execute store result score $item_temp bendangs run random value 1..22
execute if score $item_temp bendangs matches 1..3 run scoreboard players set $item_giving bendangs 1
execute if score $item_temp bendangs matches 4..5 run scoreboard players set $item_giving bendangs 2
execute if score $item_temp bendangs matches 6..8 run scoreboard players set $item_giving bendangs 3
execute if score $item_temp bendangs matches 9..11 run scoreboard players set $item_giving bendangs 4
execute if score $item_temp bendangs matches 12..13 run scoreboard players set $item_giving bendangs 5
execute if score $item_temp bendangs matches 14..16 run scoreboard players set $item_giving bendangs 6
execute if score $item_temp bendangs matches 17 run scoreboard players set $item_giving bendangs 7
execute if score $item_temp bendangs matches 18..20 run scoreboard players set $item_giving bendangs 8
execute if score $item_temp bendangs matches 21..22 run scoreboard players set $item_giving bendangs 9
$execute if score $store_item bendangs matches 0 store result entity @s data.Items[$(Slot)] int 1 run scoreboard players get $item_giving bendangs