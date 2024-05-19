tag @s add interacted_player

execute if score $state bendangs matches 1 run function brmc:state/1/player_attacked

tag @s remove interacted_player