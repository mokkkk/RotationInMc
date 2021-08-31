
# Sinλ Cosλ(Rotation[0])
execute if data entity @s Pose.Head run data modify storage math: in set from entity @s Rotation[0]
execute unless data entity @s Pose.Head run data modify storage math: in set value 0
function #math:sin
execute store result score #matrix_sinλ AsaCore run data get storage math: out 1000
function #math:cos
execute store result score #matrix_cosλ AsaCore run data get storage math: out 1000

# Calc_Vector
execute store result score #matrix_x_x AsaCore store result score #matrix_z_x AsaCore run scoreboard players get #vector_x AsaCore
execute store result score #matrix_x_z AsaCore store result score #matrix_z_z AsaCore run scoreboard players get #vector_z AsaCore

# X
scoreboard players operation #matrix_x_x AsaCore *= #matrix_cosλ AsaCore
scoreboard players operation #matrix_x_z AsaCore *= #matrix_sinλ AsaCore
scoreboard players operation #matrix_x_x AsaCore -= #matrix_x_z AsaCore
scoreboard players operation #matrix_x_x AsaCore /= #const_1000 AsaCore

# Z
scoreboard players operation #matrix_z_x AsaCore *= #matrix_sinλ AsaCore
scoreboard players operation #matrix_z_z AsaCore *= #matrix_cosλ AsaCore
scoreboard players operation #matrix_z_z AsaCore += #matrix_z_x AsaCore
scoreboard players operation #matrix_z_z AsaCore /= #const_1000 AsaCore

# Set_Vector
execute store result score #vector_x AsaCore run scoreboard players get #matrix_x_x AsaCore
execute store result score #vector_z AsaCore run scoreboard players get #matrix_z_z AsaCore