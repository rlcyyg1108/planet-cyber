local item_sounds = require("__base__.prototypes.item_sounds")

data:extend
({
  {
    type = "item",
    name = "planet-cyber",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    subgroup = "rlcyyg1",
    order = "a",
    stack_size = 100,
    place_result = "planet-cyber",
  },
  --岁月史书
  {
    type = "item",
    name = "rlcyyg-cyber-history-1",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    subgroup = "rlcyyg1",
    order = "a",
    stack_size = 100,
  },
  {
    type = "item",
    name = "rlcyyg-cyber-history-2",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    subgroup = "rlcyyg1",
    order = "a",
    stack_size = 100,
  },
  {
    type = "item",
    name = "rlcyyg-cyber-history-3",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    subgroup = "rlcyyg1",
    order = "a",
    stack_size = 100,
  },
  --test
  {
    type = "item",
    name = "cyber-ore",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    pictures =
    {
      { size = 64, filename = "__planet-cyber__/graphics/planet-cyber.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planet-cyber__/graphics/planet-cyber-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planet-cyber__/graphics/planet-cyber-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planet-cyber__/graphics/planet-cyber-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "rlcyyg1",
    color_hint = { text = "T" },
    order = "a",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 100,
    default_import_location = "cyber",
    weight = 10*kg
  },
})