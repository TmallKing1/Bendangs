tellraw @s ["",{"text": "> ","color": "yellow","bold": true},{"text": "游戏已重置！","color": "yellow"}]

# 记分板
scoreboard objectives remove bendangs
scoreboard objectives add bendangs dummy "全局变量"
scoreboard objectives remove player_score
scoreboard objectives add player_score dummy "玩家分数"
scoreboard objectives remove display
scoreboard objectives add display dummy {"text": "BENDANGS","color": "gold","bold": true}
scoreboard objectives remove life
scoreboard objectives add life dummy "生命值"
scoreboard objectives remove life_display
scoreboard objectives add life_display dummy "生命值"
scoreboard objectives modify life_display rendertype hearts
scoreboard objectives remove game_id
scoreboard objectives add game_id dummy "玩家 ID"
scoreboard objectives remove minecart_id
scoreboard objectives add minecart_id dummy "矿车 ID"
scoreboard objectives remove slot_id
scoreboard objectives add slot_id dummy "槽位 ID"
scoreboard objectives remove leave_count
scoreboard objectives add leave_count custom:leave_game "离开次数统计"
scoreboard objectives remove countdown_fast
scoreboard objectives add countdown_fast dummy "快速倒计时"
scoreboard objectives remove UUID
scoreboard objectives add UUID dummy "玩家 UUID"
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay below_name
scoreboard objectives setdisplay list
scoreboard players set $countdown bendangs 0
scoreboard players set $countdown_fast bendangs 0

scoreboard players set #2 bendangs 2

# 队伍
team remove player
team add player "玩家"
team modify player collisionRule never
team remove watcher
team add watcher "旁观者"
team modify watcher collisionRule never

# 存储
#define storage bendangs:game
data modify storage bendangs:game Bullets set value []

# 实体
kill @e[tag=player_seat]
summon minecart 0.0 1.5 -1.5 {Invulnerable: 1b, Tags:["player_seat","player_seat_A"], NoGravity: 1b,Silent:1b}
summon minecart 0.0 1.5 3.5 {Invulnerable: 1b, Tags:["player_seat","player_seat_B"], NoGravity: 1b,Silent:1b}

kill @e[type=interaction]
summon interaction 0.0 2.2 -1.5 {Tags:["player_interaction","player_interaction_A"], response: 1b}
summon interaction 0.0 2.2 3.5 {Tags:["player_interaction","player_interaction_B"], response: 1b}

kill @e[type=glow_item_frame]
summon minecraft:glow_item_frame -8.97 2.50 5.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {id: "minecraft:arrow", tag: {display: {Name: '{"text":"无害箭","italic":false}'}}, Count: 1b}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 2.50 3.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {id: "minecraft:tipped_arrow", tag: {display: {Name: '{"text":"毒箭","italic":false,"color": "red"}'},CustomPotionColor: 1659171}, Count: 1b}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 4.50 -1.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:apple",tag:{ItemType:1,game_item:1b,display:{Name:'[{"text": "苹果","color": "red","italic": false}," ",{"text": "(回血)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 4.50 -2.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:chicken",tag:{ItemType:2,game_item:1b,display:{Name:'[{"text": "生鸡肉","color": "yellow","italic": false}," ",{"text": "(随机回血/扣血)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 4.50 -3.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:shears",tag:{ItemType:3,game_item:1b,display:{Name:'[{"text": "剪刀","color": "dark_aqua","italic": false}," ",{"text": "(退弹)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 3.50 -1.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:enchanted_book",tag:{ItemType:4,game_item:1b,display:{Name:'[{"text": "附魔书","color": "light_purple","italic": false}," ",{"text": "(伤害翻倍)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 3.50 -3.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:egg",tag:{ItemType:5,game_item:1b,display:{Name:'[{"text": "鸡蛋","color": "gold","italic": false}," ",{"text": "(使对方无法行动)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 2.50 -1.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:splash_potion",tag:{ItemType:6,game_item:1b,display:{Name:'[{"text": "失明药水","color": "dark_blue","italic": false}," ",{"text": "(偷取对方道具)","color": "gray"}]'},CustomPotionColor:2624856}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 2.50 -2.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:ender_eye",tag:{ItemType:7,game_item:1b,display:{Name:'[{"text": "末影之眼","color": "dark_green","italic": false}," ",{"text": "(查看装填子弹)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 2.50 -3.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:flint",tag:{ItemType:8,game_item:1b,display:{Name:'[{"text": "燧石","color": "dark_gray","italic": false}," ",{"text": "(逆转子弹类型)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}
summon minecraft:glow_item_frame -8.97 1.50 -2.50 {Invisible: 0b, ItemDropChance: 1.0f, Item: {Count:1b,id:"minecraft:end_crystal",tag:{ItemType:9,game_item:1b,display:{Name:'[{"text": "末地水晶","color": "light_purple","italic": false}," ",{"text": "(查看队列内随机子弹)","color": "gray"}]'}}}, ItemRotation: 0b, OnGround: 0b, Air: 300s, Invulnerable: 1b, FallDistance: 0.0f, Fixed: 1b, Motion: [0.0d, 0.0d, 0.0d], Rotation: [270.0f, 0.0f], Facing: 5b, TileZ: 5, Fire: -1s, PortalCooldown: 0, TileY: 2, TileX: -9}

# 木桶与告示牌
setblock 4 5 3 air
kill @e[type=item]
setblock 4 5 3 barrel{Lock: "YuanshenQidong",Items:[{Slot:0b,Count:1b,id:"minecraft:apple",tag:{ItemType:1,game_item:1b,display:{Name:'[{"text": "苹果","color": "red","italic": false}," ",{"text": "(回复 1 点生命值)","color": "gray"}]'}}},{Slot:1b,Count:1b,id:"minecraft:chicken",tag:{ItemType:2,game_item:1b,display:{Name:'[{"text": "生鸡肉","color": "yellow","italic": false}," ",{"text": "(随机回复 2 点生命值或损失 1 点生命值)","color": "gray"}]'}}},{Slot:2b,Count:1b,id:"minecraft:shears",tag:{ItemType:3,game_item:1b,display:{Name:'[{"text": "剪刀","color": "dark_aqua","italic": false}," ",{"text": "(公开下一发子弹的类型并将其作废)","color": "gray"}]'}}},{Slot:3b,Count:1b,id:"minecraft:enchanted_book",tag:{ItemType:4,game_item:1b,display:{Name:'[{"text": "附魔书","color": "light_purple","italic": false}," ",{"text": "(本轮弩的攻击伤害提升为 2 点)","color": "gray"}]'}}},{Slot:4b,Count:1b,id:"minecraft:egg",tag:{ItemType:5,game_item:1b,display:{Name:'[{"text": "鸡蛋","color": "gold","italic": false}," ",{"text": "(使对方在一回合之内无法行动)","color": "gray"}]'}}},{Slot:5b,Count:1b,id:"minecraft:splash_potion",tag:{ItemType:6,game_item:1b,display:{Name:'[{"text": "失明药水","color": "dark_blue","italic": false}," ",{"text": "(偷取对方一个道具并立即使用，但无法偷取失明药水)","color": "gray"}]'},CustomPotionColor:2624856}},{Slot:6b,Count:1b,id:"minecraft:ender_eye",tag:{ItemType:7,game_item:1b,display:{Name:'[{"text": "末影之眼","color": "dark_green","italic": false}," ",{"text": "(得知下一发子弹的类型)","color": "gray"}]'}}},{Slot:7b,Count:1b,id:"minecraft:flint",tag:{ItemType:8,game_item:1b,display:{Name:'[{"text": "燧石","color": "dark_gray","italic": false}," ",{"text": "(逆转下一发子弹的类型)","color": "gray"}]'}}},{Slot:8b,Count:1b,id:"minecraft:end_crystal",tag:{ItemType:9,game_item:1b,display:{Name:'[{"text": "末地水晶","color": "light_purple","italic": false}," ",{"text": "(得知队列内随机一发子弹的类型)","color": "gray"}]'}}}]} replace

# 老板栏
bossbar remove bendangs:waiting
bossbar add bendangs:waiting ""
bossbar remove bendangs:game
bossbar add bendangs:game ""
bossbar remove bendangs:game_a
bossbar add bendangs:game_a ""
bossbar remove bendangs:game_b
bossbar add bendangs:game_b ""
bossbar remove bendangs:game_watcher
bossbar add bendangs:game_watcher ""

# 游戏规则
gamerule reducedDebugInfo true

# 启动循环
schedule function brmc:clock/tick2 2t

# 进入状态 0
function brmc:state/0/state_enter