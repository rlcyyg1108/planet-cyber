local resource_autoplace = require("resource-autoplace")
local color_light_steel_blue = {0.459, 0.600, 0.690}----------Light Steel Blue-淡钢蓝 #7599B0
local color_blue = {0, 0, 1}----------Blue-蓝 #0000ff
local color_steel_blue = {0.275, 0.510, 0.706}----------Steel Blue-钢蓝 #4682B4

data:extend
({
  --自动放置，地图生成上的那个玩意
  {
    type = "autoplace-control",
    name = "rlcpc_ore",
    localised_name = {"", "[entity=rlcpc-ore] ", {"entity-name.rlcpc-ore"}},
    richness = true,
    order = "z-a",
    category = "resource",
  },
  ----资源，用来挖的
  --矿
  {
    type = "resource",
    name = "rlcpc-ore",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    flags = {"placeable-neutral"},
    order = "a-b-h",
    map_color = color_blue,
    minable = {
      mining_particle = "iron-ore-particle",
      mining_time = 1.0,
      result = "rlcpc-ore"
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages = {
      sheet = {
        filename = "__planet-cyber__/graphics/entity/ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5,
      }
    },
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "rlcpc-ore",
      order = "a",
      base_density = 6,
      base_spots_per_km2 = 1.5,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.2,
      starting_rq_factor_multiplier = 1.4,
      random_spot_size_minimum = 0.5,
      random_spot_size_maximum = 2,
      tile_restriction = nil,
      additional_richness = 0
    }
  },
})







