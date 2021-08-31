
# ArmorStands
# summon armor_stand ~ ~ ~ {Invulnerable:1b,Marker:1b, NoGravity: 1b,Tags:["MatrixTest"],ArmorItems:[{},{},{},{id:"minecraft:creeper_head",Count:1b}]}
# summon armor_stand ~ ~ ~ {Invulnerable:1b,Marker:1b, NoGravity: 1b,Tags:["MatrixTestSub"],ArmorItems:[{},{},{},{id:"minecraft:skeleton_skull",Count:1b}]}

# MatrixTest Rotation
function asa_animator:test/rotate_head

# MatrixTestSub Position Offset
scoreboard players set #vector_x AsaCore 0
scoreboard players set #vector_y AsaCore 600
scoreboard players set #vector_z AsaCore 0

# LocalRotation (Pose[0] and Pose[1])
function asa_animator:animator/rotation_local_pose01

# LocalRotation (Pose[2])
function asa_animator:animator/rotation_local_pose2

# WorldRotation (Rotation[0])
function asa_animator:animator/rotation_world

# Offset
execute store result score #offset_x AsaCore run data get entity @s Pos[0] 1000
execute store result score #offset_y AsaCore run data get entity @s Pos[1] 1000
execute store result score #offset_z AsaCore run data get entity @s Pos[2] 1000
scoreboard players operation #vector_x AsaCore += #offset_x AsaCore
scoreboard players operation #vector_y AsaCore += #offset_y AsaCore
scoreboard players operation #vector_z AsaCore += #offset_z AsaCore

# SetPosition
data modify entity @e[type=armor_stand,tag=MatrixTestSub,limit=1] Rotation[0] set from entity @s Rotation[0]
data modify entity @e[type=armor_stand,tag=MatrixTestSub,limit=1] Pose.Head set from entity @s Pose.Head
execute as @e[type=armor_stand,tag=MatrixTestSub] store result entity @s Pos[0] double 0.001 run scoreboard players get #vector_x AsaCore
execute as @e[type=armor_stand,tag=MatrixTestSub] store result entity @s Pos[1] double 0.001 run scoreboard players get #vector_y AsaCore
execute as @e[type=armor_stand,tag=MatrixTestSub] store result entity @s Pos[2] double 0.001 run scoreboard players get #vector_z AsaCore
