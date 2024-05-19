execute as @a[team=player] unless score @s minecart_id = @e[tag=lost,limit=1] minecart_id run title @s title [{"text": "⭐ 本局胜利 ⭐","color": "green"}]
execute as @a[team=player] if score @s minecart_id = @e[tag=lost,limit=1] minecart_id run title @s title [{"text": "💀 本局失败 💀","color": "red"}]
title @a[team=watcher] title {"text": "本局结束！","color": "yellow"}
execute as @a[team=player] unless score @s minecart_id = @e[tag=lost,limit=1] minecart_id run title @a[team=watcher] subtitle [{"text": "胜利玩家为 ","color": "aqua"},{"selector":"@s","color": "gold","bold": true}]