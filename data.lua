data:extend
({
  {
    type = "item-group",
    name = "planet-cyber",
    order = "a",
    icon = "__planet-cyber__/graphics/item-group/planet-cyber.png",
    icon_size = 128,
  },
  {
    type = "item-subgroup",
    name = "rlcyyg1",
    group = "planet-cyber",
    order = "a"
  },
  --------------------------------------------------------------------------
  {
    type = "item",
    name = "planet-cyber",
    icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
    subgroup = "rlcyyg1",
    order = "a",
    stack_size = 100,
  },
  --------------------------------------------------------------------------
  {
    type = "recipe",
    name = "planet-cyber",
    energy_required = 1,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "wood", amount = 5}
    },
    results = {{type="item", name="planet-cyber", amount=1}}
  },
  --------------------------------------------------------------------------
  {
    type = "technology",
    name = "planet-cyber",
    icon = "__planet-cyber__/graphics/technology/planet-cyber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planet-cyber"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    }
  }
  --------------------------------------------------------------------------
})