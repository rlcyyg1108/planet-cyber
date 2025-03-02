local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

data:extend
({
  {
    type = "resource",
    name = "cyber-ore",
    icon = "__planet-cyber__/graphics/icons/starmap-planet-cyber.png",
    subgroup="rlcyyg1"
    order="d",
    flags = {"placeable-neutral"},
    map_color = {0.275, 0.510, 0.706},
    mining_visualisation_tint = {r = 0.275, g = 0.510, b = 0.706, a = 1.000}, -- #4682B4
    infinite = true,
    --minimum = 6000,
    --normal = 30000,
    highlight = false,
    minable =
    {
      mining_particle = "iron-ore-particle",
      mining_time = 2,
      results =
      {
        {
          type = "item",
          name = "cyber-ore",
          amount = 1,
          --probability = 16 /100,
        }
      }
    },
  }
})
