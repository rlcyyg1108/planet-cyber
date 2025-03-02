


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

data:extend
({
  {
    type = "noise-expression",
    name = "vulcanus_starting_circle", -- Used to push random ores away. No not clamp.
    -- 600-650 circle
    expression = "1 + vulcanus_starting_area_radius * (300 - distance) / 50"
  },
  {
    type = "noise-function",
    name = "vulcanus_place_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(clamp(-1 + 4 * favor_biome, -1, 1), metal_spot_noise - vulcanus_hairline_cracks / 30000)",
    local_expressions =
    {
      metal_spot_noise = "vulcanus_spot_noise{seed = seed,\z
                                              count = count,\z
                                              spacing = vulcanus_ore_spacing,\z
                                              span = 3,\z
                                              offset = offset,\z
                                              region_size = 500 + 500 / freq,\z
                                              density = favor_biome * 4,\z
                                              quantity = size * size,\z
                                              radius = size,\z
                                              favorability = favor_biome > 0.9}"
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_size",
    expression = "slider_rescale(control:tungsten_ore:size, 2)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_basalts_resource_favorability",
    expression = "clamp(((vulcanus_basalts_biome_full * (vulcanus_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(vulcanus_starting_tungsten,\z
                      min(1 - vulcanus_starting_circle,\z
                          vulcanus_place_metal_spots(789, 15, 2,\z
                                                     vulcanus_tungsten_ore_size * min(1.2, vulcanus_ore_dist) * 25,\z
                                                     control:tungsten_ore:frequency,\z
                                                     vulcanus_basalts_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_probability",
    expression = "(control:tungsten_ore:size > 0) * (1000 * ((1 + vulcanus_tungsten_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_tungsten_ore_richness",
    expression = "vulcanus_tungsten_ore_region * random_penalty_between(0.9, 1, 1)\z
                  * 10000 * vulcanus_starting_area_multiplier\z
                  * control:tungsten_ore:richness / vulcanus_tungsten_ore_size"
  },
})

planet_map_gen.cyber = function()
  return
  {
    property_expression_names =
    {
      elevation = "vulcanus_elevation",
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability",
      ["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness",
      ["entity:coal:probability"] = "vulcanus_coal_probability",
      ["entity:coal:richness"] = "vulcanus_coal_richness",
      ["entity:calcite:probability"] = "vulcanus_calcite_probability",
      ["entity:calcite:richness"] = "vulcanus_calcite_richness",
      ["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
      ["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-moshine",
      control = "fulgora_cliff",
      cliff_elevation_0 = 80,
      -- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
      -- so instead the coastline is moved to elevation 80.
      -- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
      -- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
      -- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
      cliff_elevation_interval = 40,
      cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
      richness = 1
    },
    autoplace_controls =
    {
      --["molten_copper_geyser"] = {richness = 1500000000},
      ["steam_geyser"] = {richness = 150},
      ["fulgoran_data_source"] = { frequency = 4, size = 0.1, richness = 150 },
      ["moshine_islands"] = {},
      ["fulgora_cliff"] = {},
      ["multi_ore"] = {},-- frequency = 600000000, size = 10000000, richness = 150500000 },
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          --["volcanic-soil-dark"] = {},
          --["volcanic-soil-light"] = {},
          --["volcanic-ash-soil"] = {},
          --end of nauvis tiles
          --["volcanic-ash-flats"] = {},
          --["volcanic-ash-light"] = {},
          --["volcanic-ash-dark"] = {},
          --["volcanic-cracks"] = {},
          --["volcanic-cracks-warm"] = {},
          --["volcanic-folds"] = {},
          --["volcanic-folds-flat"] = {},
          ["moshine-rock"] = {},
          ["moshine-hot-swamp"] = {},
          ["moshine-lava"] = {},

          ["moshine-dust"] = {},
          ["moshine-sand"] = {},
          ["moshine-dunes"] = {},
          --["fulgoran-walls"] = {},
          --["fulgoran-paving"] = {},
          --["fulgoran-conduit"] = {},
          --["fulgoran-machinery"] = {},

          --["volcanic-folds-warm"] = {},
          --["volcanic-pumice-stones"] = {},
          --["volcanic-cracks-hot"] = {},
          --["volcanic-jagged-ground"] = {},
          --["volcanic-smooth-stone"] = {},
          --["volcanic-smooth-stone-warm"] = {},
          --["volcanic-ash-cracks"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["moshine-medium-fulgora-rock"] = {},
          ["moshine-small-fulgora-rock"] = {},
          ["moshine-tiny-fulgora-rock"] = {},
          
          ["moshine-barnacles-decal"] = {},
          ["moshine-rock-decal-large"] = {},
          ["moshine-snow-drift-decal"] = {},
          -- nauvis decoratives
          --["v-brown-carpet-grass"] = {},
          --["v-green-hairy-grass"] = {},
          --["v-brown-hairy-grass"] = {},
          --["v-red-pita"] = {},
          -- end of nauvis
          --["moshine-crack-decal-large"] = {},
          --["vulcanus-crack-decal-huge-warm"] = {},
          --["vulcanus-lava-fire"] = {},
          --["calcite-stain"] = {},
          --["calcite-stain-small"] = {},
          --["sulfur-stain"] = {},
          --["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          ["moshine-crater-small"] = {},
          ["moshine-crater-large"] = {},

          --["moshine-pumice-relief-decal"] = {},
          --["moshine-dune-decal"] = {},
          --["moshine-sand-decal"] = {},


          --["small-volcanic-rock"] = {},
          --["medium-volcanic-rock"] = {},
          --["tiny-volcanic-rock"] = {},
          --["tiny-rock-cluster"] = {},
          --["small-sulfur-rock"] = {},
          --["tiny-sulfur-rock"] = {},
          --["sulfur-rock-cluster"] = {},
          --["moshine-waves-decal"] = {},
          
        }
      },
      ["entity"] =
      {
        settings =
        {
          --["molten-iron-geyser"] = {},
          --["molten-copper-geyser"] = {},
          ["steam-geyser"] = {},
          ["fulgoran-data-source"] = {},
          --["neodymium-ore"] = {},
          ["multi-ore"] = {},
          --["calcite"] = {},


          ["moshine-huge-volcanic-rock"] = {},
          ["moshine-big-fulgora-rock"] = {}
          --["big-volcanic-rock"] = {},
          --["moshine-crater-cliff"] = {},

          --["vulcanus-chimney"] = {},
          --["vulcanus-chimney-faded"] = {},
          --["vulcanus-chimney-cold"] = {},
          --["vulcanus-chimney-short"] = {},
          --["vulcanus-chimney-truncated"] = {},
          --["ashland-lichen-tree"] = {},
          --["ashland-lichen-tree-flaming"] = {},
        }
      }
    }
  }
end