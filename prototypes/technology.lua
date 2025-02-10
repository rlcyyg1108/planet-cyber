data:extend
({
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
  },
})