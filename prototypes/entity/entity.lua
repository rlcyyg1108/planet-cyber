local color_dark_gray = {0.412, 0.412, 0.412}----------Dark gray-暗暗rgb(105, 105, 105)

data:extend
({
  ----------------------------------------------------------------------------------------------------简单实体，即岩石、雷神星废墟等
  {
    type = "simple-entity",
    name = "rlcpc-ruin",
    flags = {"placeable-neutral", "placeable-off-grid"},
    order = "z",
    icon = "__planet-cyber__/graphics/icons/ruin.png",
    subgroup = "grass",
    max_health = 1,--我很弱，一撞就死
    collision_box = {{-5.5, -5.5}, {5.5, 5.5}},
    selection_box = {{-6, -6}, {6, 6}},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    map_color = color_dark_gray,
    autoplace =
    {
        probability_expression = "multiplier * control * (rock_density - penalty)",
        local_expressions =
        {
            multiplier = 0.1,--正比例概率系数
            penalty = 1.7,
            control = "control:rocks:size",
        }
    },
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "rlcpc-ore", amount_min = 50, amount_max = 200},
        {type = "item", name = "stone", amount_min = 50, amount_max = 200},
        {type = "item", name = "iron-ore", amount_min = 50, amount_max = 150},
        {type = "item", name = "copper-ore", amount_min = 50, amount_max = 130},
        {type = "item", name = "stone-brick", amount_min = 50, amount_max = 100},
        {type = "item", name = "iron-gear-wheel", amount_min = 50, amount_max = 80},
        {type = "item", name = "iron-stick", amount_min = 50, amount_max = 80},
        {type = "item", name = "copper-cable", amount_min = 50, amount_max = 80},
        {type = "item", name = "electronic-circuit", amount_min = 15, amount_max = 30},
        {type = "item", name = "advanced-circuit", amount_min = 10, amount_max = 20},
        {type = "item", name = "processing-unit", amount_min = 5, amount_max = 10},
      },
    },
    pictures =
    {
      {
        filename = "__planet-cyber__/graphics/entity/ruin-1.png",
        width = 300,
        height = 600,
        scale = 1,
      },
      {
        filename = "__planet-cyber__/graphics/entity/ruin-2.png",
        width = 600,
        height = 300,
        scale = 1,
      },
      {
        filename = "__planet-cyber__/graphics/entity/ruin-3.png",
        width = 400,
        height = 400,
        scale = 1,
      },
      {
        filename = "__planet-cyber__/graphics/entity/ruin-4.png",
        width = 400,
        height = 550,
        scale = 1,
      },
    },
  },
  ----------------------------------------------------------------------------------------------------生产机器
  {
    type = "assembling-machine",
    name = "rlcpc-planet-cyber",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    icon_size = 64,
    icon_draw_specification = {shift = {0, -0.0}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "rlcpc-planet-cyber"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 1,
    energy_usage = "100kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-3.5, -3.5}, {3.5, 3.5}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__planet-cyber__/graphics/entity/planet-cyber.png",
            priority="high",
            width = 256,
            height = 256,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 0),
            scale = 1
          }
        }
      }
    },
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = true, uses_beacon_effects = true, uses_surface_effects = true},
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
})