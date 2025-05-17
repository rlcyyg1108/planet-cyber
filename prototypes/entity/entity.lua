local color_dark_gray = {0.412, 0.412, 0.412}----------Dark gray-暗灰#696969

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
    max_health = 1,--一撞就死
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
  -----------------------------------------------------------------------------------------------------dri-1
  {
    type = "assembling-machine",
    name = "rlcpc-dri-1",--dissociation-reshaping-instrument--解离重塑仪
    icon = "__planet-cyber__/graphics/entity/dri/dri-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "rlcpc-dri-1"},
    max_health = 200,
    corpse = "big-remnants",--通解贴图6666666
    dying_explosion = "big-explosion",
    crafting_categories = {"rlcpc-merge"},
    crafting_speed = 1,
    energy_usage = "1MW",
    --ingredient_count = 64,机器支持的配方物品种类数，暂时理念冲突，注释掉
    module_slots = 4,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },--支持产能加成(:
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    resistances = 
    {
      {type = "physical",percent = 90},
      {type = "fire",percent = 90},
      {type = "impact",percent = 90},
    },
    impact_category = "metal",--这玩意干啥的，没了它机器不能动):
    tile_width = 1,--没有这俩行实体中心会位于地格的某一顶点，3格四舍五入占四格，很坏):
    tile_height = 1,
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    fluid_boxes_off_when_no_fluid_recipe = true,--无流体配方时流体接口关闭
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,--这玩意怎么是全局变量啊，该值=9，位于底端-Factorio\data\core\lualib\circuit-connector-sprites.lua
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    fluid_boxes =
    --[[
    3*3
    #=#
    ===
    #=#
    ]]
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-1, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {1, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {1, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {-1, 1} }},
        secondary_draw_orders = { north = -1 }
      },
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set = --graphics by hurricane,code by plexpt
    {
      animation = 
      {
          layers = 
          {
              {
                  filename = "__planet-cyber__/graphics/entity/dri/dri-hr-shadow.png",
                  priority = "high",
                  width = 900,
                  height = 420,
                  frame_count = 1,
                  line_length = 1,
                  repeat_count = 100,
                  animation_speed = 0.3,
                  shift = util.by_pixel_hr(0, -16),
                  draw_as_shadow = true,
                  scale = 0.14,
              },
              {
                  priority = "high",
                  width = 410,
                  height = 410,
                  frame_count = 100,
                  --shift = util.by_pixel_hr(0, -16),
                  animation_speed = 1,
                  scale = 0.28,
                  stripes = 
                  {
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-1.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-2.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                  },
              },
          },
      },
      working_visualisations = 
      {
          {
              fadeout = true,
              secondary_draw_order = 1,
              animation = {
                  priority = "high",
                  size = { 410, 410 },
                  shift = util.by_pixel_hr(0, -16),
                  frame_count = 100,
                  draw_as_glow = true,
                  scale = 0.28,
                  animation_speed = 1,
                  blend_mode = "additive",
                  stripes = 
                  {
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-emission-1.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-emission-2.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                  },
              },
          }
      },
      reset_animation_when_frozen = true
    },
  },
  ----------------------------------------------------------------------------------------------------dri-2
  {
    type = "assembling-machine",
    name = "rlcpc-dri-2",--dissociation-reshaping-instrument--解离重塑仪
    icon = "__planet-cyber__/graphics/entity/dri/dri-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "rlcpc-dri-2"},
    max_health = 1000,
    corpse = "big-remnants",--通解贴图6666666
    dying_explosion = "big-explosion",
    crafting_categories = {"rlcpc-merge"},
    crafting_speed = 2.5,
    energy_usage = "10MW",
    --ingredient_count = 64,机器支持的配方物品种类数，暂时理念冲突，注释掉
    module_slots = 8,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },--支持产能加成(:
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    resistances = 
    {
      {type = "physical",percent = 90},
      {type = "fire",percent = 90},
      {type = "impact",percent = 90},
    },
    impact_category = "metal",--这玩意干啥的，没了它机器不能动):
    tile_width = 1,--没有这俩行实体中心会位于地格的某一顶点，3格四舍五入占四格，很坏):然而2必须要……
    tile_height = 2,
    selection_box = {{-3.5, -3}, {3.5, 3}},
    collision_box = {{-3.2, -2.7}, {3.2, 2.7}},
    fluid_boxes_off_when_no_fluid_recipe = true,--无流体配方时流体接口关闭
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,--这玩意怎么是全局变量啊，该值=9，位于底端-Factorio\data\core\lualib\circuit-connector-sprites.lua
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    fluid_boxes =
    --[[
    7*6
    #=#=#=#
    =======
    =======
    =======
    =======
    #=#=#=#
    ]]
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-3, -2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-1, -2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {1, -2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {3, -2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {3, 2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {1, 2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {-1, 2.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {-3, 2.5} }},
        secondary_draw_orders = { north = -1 }
      },
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set = --graphics by hurricane,code by plexpt
    {
      animation = 
      {
          layers = 
          {
              {
                  filename = "__planet-cyber__/graphics/entity/dri/dri-hr-shadow.png",
                  priority = "high",
                  width = 900,
                  height = 420,
                  frame_count = 1,
                  line_length = 1,
                  repeat_count = 100,
                  animation_speed = 0.3,
                  shift = util.by_pixel_hr(0, -16),
                  draw_as_shadow = true,
                  scale = 0.275,
              },
              {
                  priority = "high",
                  width = 410,
                  height = 410,
                  frame_count = 100,
                  shift = util.by_pixel_hr(0, -16),
                  animation_speed = 1,
                  scale = 0.55,
                  stripes = 
                  {
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-1.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-2.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                  },
              },
          },
      },
      working_visualisations = 
      {
          {
              fadeout = true,
              secondary_draw_order = 1,
              animation = {
                  priority = "high",
                  size = { 410, 410 },
                  shift = util.by_pixel_hr(0, -16),
                  frame_count = 100,
                  draw_as_glow = true,
                  scale = 0.55,
                  animation_speed = 1,
                  blend_mode = "additive",
                  stripes = 
                  {
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-emission-1.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-emission-2.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                  },
              },
          }
      },
      reset_animation_when_frozen = true
    },
  },
  ----------------------------------------------------------------------------------------------------dri-3
  {
    type = "assembling-machine",
    name = "rlcpc-dri-3",--dissociation-reshaping-instrument--解离重塑仪
    icon = "__planet-cyber__/graphics/entity/dri/dri-icon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "rlcpc-dri-3"},
    max_health = 1000,
    corpse = "big-remnants",--通解贴图6666666
    dying_explosion = "big-explosion",
    crafting_categories = {"rlcpc-merge"},
    crafting_speed = 10,
    energy_usage = "10MW",
    --ingredient_count = 64,机器支持的配方物品种类数，暂时理念冲突，注释掉
    module_slots = 8,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },--支持产能加成(:
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    resistances = 
    {
      {type = "physical",percent = 90},
      {type = "fire",percent = 90},
      {type = "impact",percent = 90},
    },
    impact_category = "metal",--这玩意干啥的，没了它机器不能动):
    tile_width = 1,--没有这俩行实体中心会位于地格的某一顶点，3格四舍五入占四格，很坏):
    tile_height = 1,
    selection_box = {{-6.5, -5.5}, {6.5, 5.5}},
    collision_box = {{-6.2, -5.2}, {6.2, 5.2}},
    fluid_boxes_off_when_no_fluid_recipe = true,--无流体配方时流体接口关闭
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,--这玩意怎么是全局变量啊，该值=9，位于底端-Factorio\data\core\lualib\circuit-connector-sprites.lua
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    fluid_boxes =
    --[[
    13*11
    #=#=#=#=#=#=#
    =============
    =============
    =============
    =============
    =============
    =============
    =============
    =============
    =============
    #=#=#=#=#=#=#
    ]]
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-5, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-3, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-1, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {1, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {3, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {5, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {-5, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {-3, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {-1, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {1, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {3, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {5, 5} }},
        secondary_draw_orders = { north = -1 }
      },
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set = --graphics by hurricane,code by plexpt
    {
      animation = 
      {
          layers = 
          {
              {
                  filename = "__planet-cyber__/graphics/entity/dri/dri-hr-shadow.png",
                  priority = "high",
                  width = 900,
                  height = 420,
                  frame_count = 1,
                  line_length = 1,
                  repeat_count = 100,
                  animation_speed = 0.3,
                  shift = util.by_pixel_hr(0, -16),
                  draw_as_shadow = true,
                  scale = 0.52,
              },
              {
                  priority = "high",
                  width = 410,
                  height = 410,
                  frame_count = 100,
                  shift = util.by_pixel_hr(0, -16),
                  animation_speed = 1,
                  scale = 1.045,
                  stripes = 
                  {
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-1.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-2.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                  },
              },
          },
      },
      working_visualisations = 
      {
          {
              fadeout = true,
              secondary_draw_order = 1,
              animation = {
                  priority = "high",
                  size = { 410, 410 },
                  shift = util.by_pixel_hr(0, -16),
                  frame_count = 100,
                  draw_as_glow = true,
                  scale = 1.04,
                  animation_speed = 1,
                  blend_mode = "additive",
                  stripes = 
                  {
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-emission-1.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                      {
                          filename = "__planet-cyber__/graphics/entity/dri/dri-hr-animation-emission-2.png",
                          width_in_frames = 8,
                          height_in_frames = 8,
                      },
                  },
              },
          }
      },
      reset_animation_when_frozen = true
    },
  },
})