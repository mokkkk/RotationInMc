
# Pose[0](X Rotation)
# summon armor_stand 0 0 0 {Tags:["RotationGetter"],NoGravity: 1b, Invulnerable: 1b, Marker: 1b, Invisible: 1b, }
# execute as @e[type=armor_stand,tag=RotationGetter] run tp @s 0 0 0 0 0
# execute store result entity @e[type=armor_stand,tag=RotationGetter,limit=1] Rotation[0] float 0.001 run data get entity @s Pose.Head[0] 1000
# execute as @e[type=armor_stand,tag=RotationGetter] at @s align xyz run tp @s ^ ^ ^1 ~ 0
# execute store result score #matrix_sinφ AsaCore store result score #matrix_sinφsinΘ AsaCore store result score #matrix_sinφcosΘ AsaCore run data get entity @e[type=armor_stand,tag=RotationGetter,limit=1] Pos[0] -1000
# execute store result score #matrix_cosφ AsaCore store result score #matrix_cosφsinΘ AsaCore store result score #matrix_cosφcosΘ AsaCore run data get entity @e[type=armor_stand,tag=RotationGetter,limit=1] Pos[2] 1000

# Pose[1](Y Rotation)
# execute as @e[type=armor_stand,tag=RotationGetter] run tp @s 0 0 0 0 0
# execute store result entity @e[type=armor_stand,tag=RotationGetter,limit=1] Rotation[0] float 0.001 run data get entity @s Pose.Head[1] 1000
# execute as @e[type=armor_stand,tag=RotationGetter] at @s align xyz run tp @s ^ ^ ^1 ~ 0
# execute store result score #matrix_sinΘ AsaCore run data get entity @e[type=armor_stand,tag=RotationGetter,limit=1] Pos[0] -1000
# execute store result score #matrix_cosΘ AsaCore run data get entity @e[type=armor_stand,tag=RotationGetter,limit=1] Pos[2] 1000

# kill @e[type=armor_stand,tag=RotationGetter]

# Sinφ Cosφ(Pose[0])
execute if data entity @s Pose.Head run data modify storage math: in set from entity @s Pose.Head[0]
execute unless data entity @s Pose.Head run data modify storage math: in set value 0
function #math:sin
execute store result score #matrix_sinφ AsaCore store result score #matrix_sinφsinΘ AsaCore store result score #matrix_sinφcosΘ AsaCore run data get storage math: out 1000
function #math:cos
execute store result score #matrix_cosφ AsaCore store result score #matrix_cosφsinΘ AsaCore store result score #matrix_cosφcosΘ AsaCore run data get storage math: out 1000

# SinΘ CosΘ(Pose[1])
execute if data entity @s Pose.Head run data modify storage math: in set from entity @s Pose.Head[1]
execute unless data entity @s Pose.Head run data modify storage math: in set value 0
function #math:sin
execute store result score #matrix_sinΘ AsaCore run data get storage math: out 1000
function #math:cos
execute store result score #matrix_cosΘ AsaCore run data get storage math: out 1000

# Calc_Matrix
scoreboard players operation #matrix_sinφsinΘ AsaCore *= #matrix_sinΘ AsaCore
scoreboard players operation #matrix_cosφsinΘ AsaCore *= #matrix_sinΘ AsaCore
scoreboard players operation #matrix_sinφcosΘ AsaCore *= #matrix_cosΘ AsaCore
scoreboard players operation #matrix_cosφcosΘ AsaCore *= #matrix_cosΘ AsaCore

scoreboard players operation #matrix_sinφsinΘ AsaCore /= #const_1000 AsaCore
scoreboard players operation #matrix_cosφsinΘ AsaCore /= #const_1000 AsaCore
scoreboard players operation #matrix_sinφcosΘ AsaCore /= #const_1000 AsaCore
scoreboard players operation #matrix_cosφcosΘ AsaCore /= #const_1000 AsaCore

# Calc_Vector
execute store result score #matrix_x_x AsaCore store result score #matrix_z_x AsaCore run scoreboard players get #vector_x AsaCore
execute store result score #matrix_x_y AsaCore store result score #matrix_y_y AsaCore store result score #matrix_z_y AsaCore run scoreboard players get #vector_y AsaCore
execute store result score #matrix_x_z AsaCore store result score #matrix_y_z AsaCore store result score #matrix_z_z AsaCore run scoreboard players get #vector_z AsaCore

# X
scoreboard players operation #matrix_x_x AsaCore *= #matrix_cosΘ AsaCore
scoreboard players operation #matrix_x_y AsaCore *= #matrix_sinφsinΘ AsaCore
scoreboard players operation #matrix_x_z AsaCore *= #matrix_cosφsinΘ AsaCore
scoreboard players operation #matrix_x_x AsaCore -= #matrix_x_y AsaCore
scoreboard players operation #matrix_x_x AsaCore -= #matrix_x_z AsaCore
scoreboard players operation #matrix_x_x AsaCore /= #const_1000 AsaCore

# Y
scoreboard players operation #matrix_y_y AsaCore *= #matrix_cosφ AsaCore
scoreboard players operation #matrix_y_z AsaCore *= #matrix_sinφ AsaCore
scoreboard players operation #matrix_y_y AsaCore -= #matrix_y_z AsaCore
scoreboard players operation #matrix_y_y AsaCore /= #const_1000 AsaCore

# Z
scoreboard players operation #matrix_z_x AsaCore *= #matrix_sinΘ AsaCore
scoreboard players operation #matrix_z_y AsaCore *= #matrix_sinφcosΘ AsaCore
scoreboard players operation #matrix_z_z AsaCore *= #matrix_cosφcosΘ AsaCore
scoreboard players operation #matrix_z_x AsaCore += #matrix_z_y AsaCore
scoreboard players operation #matrix_z_x AsaCore += #matrix_z_z AsaCore
scoreboard players operation #matrix_z_x AsaCore /= #const_1000 AsaCore

# Set_Vector
execute store result score #vector_x AsaCore run scoreboard players get #matrix_x_x AsaCore
execute store result score #vector_y AsaCore run scoreboard players get #matrix_y_y AsaCore
execute store result score #vector_z AsaCore run scoreboard players get #matrix_z_x AsaCore

# tellraw @a [{"text":"SINφ"},{"score":{"name":"#matrix_sinφ","objective":"AsaCore"}},{"text":",COSφ"},{"score":{"name":"#matrix_cosφ","objective":"AsaCore"}}]
# tellraw @a [{"text":"SINΘ"},{"score":{"name":"#matrix_sinΘ","objective":"AsaCore"}},{"text":",COSΘ"},{"score":{"name":"#matrix_cosΘ","objective":"AsaCore"}}]

# tellraw @a [{"score":{"name":"#matrix_cosΘ","objective":"AsaCore"}},{"text":","},{"score":{"name":"#matrix_sinφsinΘ","objective":"AsaCore"}},{"text":","},{"score":{"name":"#matrix_cosφsinΘ","objective":"AsaCore"}}]
# tellraw @a [{"text":"0,"},{"score":{"name":"#matrix_cosφ","objective":"AsaCore"}},{"text":",-"},{"score":{"name":"#matrix_sinφ","objective":"AsaCore"}}]
# tellraw @a [{"score":{"name":"#matrix_sinΘ","objective":"AsaCore"}},{"text":","},{"score":{"name":"#matrix_sinφcosΘ","objective":"AsaCore"}},{"text":","},{"score":{"name":"#matrix_cosφcosΘ","objective":"AsaCore"}}]