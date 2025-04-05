local color_steel_blue_transparent = {0.275, 0.510, 0.706, 0.5}----------Steel Blue-钢蓝 #4682B4
--往下是从base/tiles里复制的，没有全用上
local sounds = require("__base__/prototypes/entity/sounds")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")

local grass_vehicle_speed_modifier = 1.6
local dirt_vehicle_speed_modifier = 1.4
local sand_vehicle_speed_modifier = 1.8
local stone_path_vehicle_speed_modifier = 1.1
local concrete_vehicle_speed_modifier = 0.8

data:extend
({
    {
        name = "rlcpc-tile",
        type = "tile",
        order = "z",
        subgroup = "cyber-tiles",
        collision_mask = tile_collision_masks.ground(),
        autoplace = {probability_expression = 'max(expression_in_range_base(-10, 0.25, 0.45, 0.3),\z
                                                   expression_in_range_base(0.4, -10, 0.45, 0.25)) + noise_layer_noise(6)'},
        layer = 19,
        variants = tile_variations_template(
          "__planet-cyber__/graphics/tile/tile.png", "__base__/graphics/terrain/masks/transition-1.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
            [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
          }
        ),
        --transitions = dry_dirt_transitions,虚化不会搞一大坨
        --transitions_between_transitions = dry_dirt_transitions_between_transitions,
        walking_sound = tile_sounds.walking.sand,
        map_color = color_steel_blue_transparent,
        scorch_mark_color = color_steel_blue,
        absorptions_per_second = tile_pollution.dirt,
        vehicle_friction_modifier = dirt_vehicle_speed_modifier,
        trigger_effect = tile_trigger_effects.dirt_1_trigger_effect()
      },
})
