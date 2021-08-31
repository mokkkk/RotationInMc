
execute unless data entity @s Pose.Head run data merge entity @s {Pose:{Head:[0f,0f,1f]}}

execute store result score #as_pose_x AsaCore run data get entity @s Pose.Head[0] 1000
scoreboard players add #as_pose_x AsaCore 3000
execute store result entity @s Pose.Head[0] float 0.001 run scoreboard players get #as_pose_x AsaCore
execute if score #as_pose_x AsaCore matches 360000.. run scoreboard players set #as_pose_x AsaCore 0

execute store result score #as_pose_y AsaCore run data get entity @s Pose.Head[1] 1000
scoreboard players add #as_pose_y AsaCore 3000
execute store result entity @s Pose.Head[1] float 0.001 run scoreboard players get #as_pose_y AsaCore
execute if score #as_pose_y AsaCore matches 360000.. run scoreboard players set #as_pose_y AsaCore 0

execute store result score #as_pose_y AsaCore run data get entity @s Pose.Head[2] 1000
scoreboard players add #as_pose_y AsaCore 3000
execute store result entity @s Pose.Head[2] float 0.001 run scoreboard players get #as_pose_y AsaCore
execute if score #as_pose_y AsaCore matches 360000.. run scoreboard players set #as_pose_y AsaCore 0

tp @s ~ ~ ~ ~5 ~