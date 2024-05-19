tag @s add interacted_player

execute if score $state bendangs matches 0 run function brmc:state/0/player_interacted
execute if score $state bendangs matches 1 run function brmc:state/1/player_interacted

tag @s remove interacted_player