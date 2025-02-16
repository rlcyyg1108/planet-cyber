require("__space-age__/prototypes/planet/planet-aquilo-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")

data:extend
({
  --------------------------------------------------------------------------星球
  {
    type = "planet",
    name = "cyber",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    starmap_icon = "__planet-cyber__/graphics/icons/starmap-planet-cyber.png",
    starmap_icon_size = 512,
    gravity_pull = 100,--你相信引力吗
    distance = 30,--星图距离
    orientation = 0.4,--星图角度
    magnitude = 1.75,--星球大小
    order = "e[cyber]",--排序
    subgroup = "planets",
    map_gen_settings = planet_map_gen.aquilo(),--不会写地图生成，暂时用这个
    pollutant_type = nil,--没有污染干干净净的喵
    solar_power_in_space = 10,--很低的太阳能效率
    procession_graphic_catalogue = planet_catalogue_aquilo,--不会写喵用原版的喵
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
  --------------------------------------------------------------------------航线
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