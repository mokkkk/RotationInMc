
# SinΨ CosΨ(Pose[2])
execute if data entity @s Pose.Head run data modify storage math: in set from entity @s Pose.Head[2]
execute unless data entity @s Pose.Head run data modify storage math: in set value 0
function #math:sin
execute store result score #matrix_sinΨ AsaCore run data get storage math: out 1000
function #math:cos
execute store result score #matrix_cosΨ AsaCore run data get storage math: out 1000

# Calc_Vector
execute store result score #matrix_x_x AsaCore store result score #matrix_y_x AsaCore run scoreboard players get #vector_x AsaCore
execute store result score #matrix_x_y AsaCore store result score #matrix_y_y AsaCore run scoreboard players get #vector_y AsaCore

# X
scoreboard players operation #matrix_x_x AsaCore *= #matrix_cosΨ AsaCore
scoreboard players operation #matrix_x_y AsaCore *= #matrix_sinΨ AsaCore
scoreboard players operation #matrix_x_x AsaCore += #matrix_x_y AsaCore
scoreboard players operation #matrix_x_x AsaCore /= #const_1000 AsaCore

# Y
scoreboard players operation #matrix_y_x AsaCore *= #matrix_sinΨ AsaCore
scoreboard players operation #matrix_y_y AsaCore *= #matrix_cosΨ AsaCore
scoreboard players operation #matrix_y_y AsaCore -= #matrix_y_x AsaCore
scoreboard players operation #matrix_y_y AsaCore /= #const_1000 AsaCore

# Set_Vector
execute store result score #vector_x AsaCore run scoreboard players get #matrix_x_x AsaCore
execute store result score #vector_y AsaCore run scoreboard players get #matrix_y_y AsaCore