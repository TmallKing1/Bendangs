# 随机数
$execute store result score $random bendangs run random value $(Min)..$(Max)
$scoreboard players set $min bendangs $(Min)
$scoreboard players set $max bendangs $(Max)
execute if score $min bendangs = $max bendangs run scoreboard players operation $random bendangs = $min bendangs