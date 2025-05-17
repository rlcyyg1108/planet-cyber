require("__space-age__/prototypes/planet/planet-aquilo-map-gen")
--local planet_map_gen = require("__planet-cyber__/prototypes/planet/planet-map-gen")
local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")
local planet_catalogue_aquilo = require("__space-age__/prototypes/planet/procession-catalogue-aquilo")

local planet_map_gen_cyber = function()
  return
  {
    property_expression_names =
    {
      --[[elevation = "vulcanus_elevation",不知道干啥的注释掉1111111
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:rlcpc-ore:probability"] = "vulcanus_calcite_probability",
      ["entity:rlcpc-ore:richness"] = "vulcanus_calcite_richness",]]
    },
    autoplace_controls =
    {
      ["rlcpc_ore"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["rlcpc-tile"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          --搬运原版五颗星球的全部装饰地貌，注释掉大幅影响观感的
          --nauvis
          ["brown-hairy-grass"] = {},
          ["green-hairy-grass"] = {},
          ["brown-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-small-grass"] = {},
          ["green-asterisk"] = {},
          ["brown-asterisk-mini"] = {},
          ["green-asterisk-mini"] = {},
          ["brown-asterisk"] = {},
          ["red-asterisk"] = {},
          ["dark-mud-decal"] = {},
          ["light-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-decal"] = {},
          ["sand-decal"] = {},
          ["sand-dune-decal"] = {},
          ["green-pita"] = {},
          ["red-pita"] = {},
          ["green-croton"] = {},
          ["red-croton"] = {},
          ["green-pita-mini"] = {},
          ["brown-fluff"] = {},
          ["brown-fluff-dry"] = {},
          ["green-desert-bush"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["garballo-mini-dry"] = {},
          ["garballo"] = {},
          ["green-bush-mini"] = {},
          ["medium-rock"] = {},
          ["small-rock"] = {},
          ["tiny-rock"] = {},
          ["medium-sand-rock"] = {},
          ["small-sand-rock"] = {},
          --vulcanus
          ["vulcanus-rock-decal-large"] = {},
          ["vulcanus-crack-decal-large"] = {},
          ["vulcanus-crack-decal-huge-warm"] = {},
          ["vulcanus-dune-decal"] = {},
          ["vulcanus-sand-decal"] = {},
          ["vulcanus-lava-fire"] = {},
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["sulfur-stain"] = {},
          ["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          ["tiny-rock-cluster"] = {},
          ["small-sulfur-rock"] = {},
          ["tiny-sulfur-rock"] = {},
          ["sulfur-rock-cluster"] = {},
          ["waves-decal"] = {},
          --gleba
          --["yellow-lettuce-lichen-1x1"] = {},
          --["yellow-lettuce-lichen-3x3"] = {},
          --["yellow-lettuce-lichen-6x6"] = {},
          --["yellow-lettuce-lichen-cups-1x1"] = {},
          --["yellow-lettuce-lichen-cups-3x3"] = {},
          --["yellow-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["coral-water"] = {},
          ["coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["green-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["polycephalum-slime"] = {},
          ["polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["red-nerve-roots-veins-dense"] = {},
          ["red-nerve-roots-veins-sparse"] = {},
          ["purple-nerve-roots-veins-dense"] = {},
          ["purple-nerve-roots-veins-sparse"] = {},
          ["cream-nerve-roots-veins-dense"] = {},
          ["cream-nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["pale-lettuce-lichen-cups-1x1"] = {},
          ["pale-lettuce-lichen-cups-3x3"] = {},
          ["pale-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          --fulgoran
          ["fulgoran-ruin-tiny"] = {},
          ["fulgoran-gravewort"] = {},
          ["urchin-cactus"] = {},
          ["medium-fulgora-rock"] = {},
          ["small-fulgora-rock"] = {},
          ["tiny-fulgora-rock"] = {},
          --aqulio
          ["lithium-iceberg-medium"] = {},
          ["lithium-iceberg-small"] = {},
          ["lithium-iceberg-tiny"] = {},
          ["floating-iceberg-large"] = {},
          ["floating-iceberg-small"] = {},
          ["aqulio-ice-decal-blue"] = {},
          ["aqulio-snowy-decal"] = {},
          --["snow-drift-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["rlcpc-ore"] = {},
          ["rlcpc-ruin"] = {},
        }
      }
    }
  }
end

data:extend
({
  ----------------------------------------------------------------------------------------------------星球
  {
    type = "planet",
    name = "cyber",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    starmap_icon = "__planet-cyber__/graphics/icons/starmap-planet-cyber.png",
    starmap_icon_size = 512,
    gravity_pull = 100,--你相信引力吗
    distance = 32,--星图距离
    orientation = 0.375,--星图角度
    magnitude = 1.75,--星球大小
    order = "e[cyber]",--排序
    subgroup = "planets",
    map_gen_settings = planet_map_gen_cyber(),--地图生成
    pollutant_type = nil,--没有污染干干净净的喵
    solar_power_in_space = 10,--很低的太阳能效率
    procession_graphic_catalogue = planet_catalogue_aquilo,--这是什么
    surface_properties =
    {
      ["day-night-cycle"] = 60 * minute,
      ["magnetic-field"] = 25,
      ["solar-power"] = 1,
      pressure = 1000,
      gravity = 10
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora, 0.9),
  },
  ----------------------------------------------------------------------------------------------------航线
  {
    type = "space-connection",--雷神到赛博
    name = "fulgora-cyber",
    subgroup = "planet-connections",
    from = "fulgora",
    to = "cyber",
    order = "ef",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora),
  },
  {
    type = "space-connection",--赛博到玄冥
    name = "cyber-aquilo",
    subgroup = "planet-connections",
    from = "cyber",
    to = "aquilo",
    order = "gh",
    length = 30000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo),
  },
})