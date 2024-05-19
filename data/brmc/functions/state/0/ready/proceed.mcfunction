scoreboard players set $countdown_fast bendangs 100

bossbar set bendangs:waiting name {"text": "游戏即将开始","color": "green"}
bossbar set bendangs:waiting color green
bossbar set bendangs:waiting max 100

execute as @a at @s run function brmc:lib/sounds/levelup