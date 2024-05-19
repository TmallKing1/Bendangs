# 道具
# 1 - 苹果：回血
# 2 - 生鸡肉：随机回血 2 点 / 扣血 1 点
# 3 - 剪刀：退弹
# 4 - 附魔书：伤害变为 2 点一回合
# 5 - 鸡蛋：使对方无法行动一回合
# 6 - 失明药水：偷取对方道具一个并立即使用（不能偷失明药水）
# 7 - 末影之眼：得知下发子弹的类型
# 8 - 燧石：转换下发子弹类型为另一种
# 9 - 末影水晶：得知队列内随机位置的子弹类型

# 获取玩家当前槽位的物品类型
$execute store result score $item_type bendangs run data get storage bendangs:game ItemsTemp[$(Slot)]
item replace block 4 5 3 container.9 with barrier{game_item: 1b,display:{Name:'{"text": "无道具","color": "red","italic": false}'}}
execute if score $item_type bendangs matches 1 run item replace block 4 5 3 container.9 from block 4 5 3 container.0
execute if score $item_type bendangs matches 2 run item replace block 4 5 3 container.9 from block 4 5 3 container.1
execute if score $item_type bendangs matches 3 run item replace block 4 5 3 container.9 from block 4 5 3 container.2
execute if score $item_type bendangs matches 4 run item replace block 4 5 3 container.9 from block 4 5 3 container.3
execute if score $item_type bendangs matches 5 run item replace block 4 5 3 container.9 from block 4 5 3 container.4
execute if score $item_type bendangs matches 6 run item replace block 4 5 3 container.9 from block 4 5 3 container.5
execute if score $item_type bendangs matches 7 run item replace block 4 5 3 container.9 from block 4 5 3 container.6
execute if score $item_type bendangs matches 8 run item replace block 4 5 3 container.9 from block 4 5 3 container.7
execute if score $item_type bendangs matches 9 run item replace block 4 5 3 container.9 from block 4 5 3 container.8
execute if score $item_type bendangs matches 6 if entity @e[tag=stealing] run item replace block 4 5 3 container.9 with barrier{game_item: 1b,display:{Name:'{"text": "无法偷取此道具","color": "red","italic": false}'}}
$data modify block 4 5 3 Items[9].tag.game_slot set value $(Slot)b
$item replace entity @s hotbar.$(Slot) from block 4 5 3 container.9