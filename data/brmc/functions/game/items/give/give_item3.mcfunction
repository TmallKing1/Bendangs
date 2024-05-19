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
# 100 - 弩

# 给予道具，替换第一个为 0 的栏位
$execute store result score $store_item bendangs run data get entity @s data.Items[$(Slot)]
execute if score $store_item bendangs matches 0 run scoreboard players set $item_gived bendangs 1
$execute if score $store_item bendangs matches 0 store result entity @s data.Items[$(Slot)] int 1 run random value 1..9