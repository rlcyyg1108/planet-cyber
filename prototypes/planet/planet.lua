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
          ["rlcpc-simple-entity-1"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["rlcpc-ore"] = {},
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