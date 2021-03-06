
#Centrifuge
execute as @e[distance=..0.5,tag=mech_active,tag=mech_centrifuge] store result score temp_0 mech_data run data get entity @s HandItems[0].tag.FuelGrade
scoreboard players operation temp_0 mech_data /= con_10 mech_data
execute if entity @e[distance=..0.5,tag=mech_active,tag=mech_centrifuge] run tellraw @p ["",{"score":{"name":"temp_0","objective":"mech_data"},"color":"dark_green"},{"text":"% Refined ","color":"dark_green"}]

execute as @e[distance=..0.5,tag=mech_centrifuge,tag=mech_active] store result score temp_0 mech_data run data get entity @s HandItems[0].tag.FuelSpent
execute as @e[distance=..0.5,tag=mech_centrifuge,tag=mech_active] store result score temp_1 mech_data run data get entity @s HandItems[0].tag.FuelGrade
execute as @e[distance=..0.5,tag=mech_centrifuge,tag=mech_active] if score temp_0 mech_data matches 1.. run tellraw @p ["",{"text":"Fuel Spent: ","color":"dark_green"},{"score":{"name":"temp_0","objective":"mech_data"},"color":"dark_aqua"},{"text":"/","color":"dark_aqua"},{"score":{"name":"temp_1","objective":"mech_data"},"color":"dark_aqua"}]

#Reactor
execute as @e[distance=..0.5,tag=mech_fission_reactor] run scoreboard players operation temp_0 mech_data = @s mech_x
scoreboard players set temp_1 mech_data 1000
execute as @e[distance=..0.5,tag=mech_fission_reactor] run scoreboard players operation temp_0 mech_data /= temp_1 mech_data
execute as @e[distance=..0.5,tag=mech_fission_reactor] run tellraw @p ["",{"text":"Temperature: ","color":"dark_green"},{"score":{"name":"temp_0","objective":"mech_data"},"color":"dark_aqua"},{"text":" °C: ","color":"dark_green"}]
execute as @e[distance=..0.5,tag=mech_fission_reactor] run tellraw @p ["",{"text":"Reaction Rate: ","color":"dark_green"},{"score":{"name":"@s","objective":"mech_y"},"color":"dark_aqua"}]

execute as @e[distance=..0.5,tag=mech_fission_reactor] store result score temp_0 mech_data run data get entity @s HandItems[0].tag.FuelSpent
execute as @e[distance=..0.5,tag=mech_fission_reactor] store result score temp_1 mech_data run data get entity @s HandItems[0].tag.FuelGrade
execute as @e[distance=..0.5,tag=mech_fission_reactor] if score temp_0 mech_data matches 1.. run tellraw @p ["",{"text":"Fuel Spent: ","color":"dark_green"},{"score":{"name":"temp_0","objective":"mech_data"},"color":"dark_aqua"},{"text":"/","color":"dark_aqua"},{"score":{"name":"temp_1","objective":"mech_data"},"color":"dark_aqua"}]
