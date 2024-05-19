# 随机决定道具个数
execute store result score $item_count bendangs run random value 2..5

# 给予道具
function brmc:game/items/give/give_item