data:extend
({
  {
    type = "planet",
    name = "cyber",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    starmap_icon = "__planet-cyber__/graphics/icons/starmap-planet-cyber.png",
    starmap_icon_size = 512,
    gravity_pull = -10,
    distance = 48,
    orientation = 0.9,
    magnitude = 2,
    order = "z",
    subgroup = "planets",
    pollutant_type = nil,
    solar_power_in_space = 10,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,
    surface_properties =
    {
      ["day-night-cycle"] = 60 * minute,
      ["magnetic-field"] = 25,
      ["solar-power"] = 1,
      pressure = 1000,
      gravity = 10
    },
    asteroid_spawn_influence = 1,
  },
})