----------------------------------------------------------------------------------------------------recipe
-- 定义一个函数来生成recipe配置
local function recipe_autogenerate(name,time,ingredients,results,icon)
  local recipe = {
      type = "recipe",
      name = "rlcpc-merge-" .. name,
      category = "rlcpc-merge",
      enabled = false,
      energy_required = time,
      ingredients = ingredients,
      results = results,
      allow_productivity = true,
      auto_recycle = false,
  }
  if icon then
      recipe.icon = icon
  end
  ----------
  if subgroup then
      recipe.subgroup = subgroup
  else
      recipe.subgroup = "rlcpc-merge-recipe"
  end
  ----------
  if order then
      recipe.order = order
  else
      recipe.order = "a"
  end
  ----------
  if surface_conditions then
    recipe.surface_conditions = surface_conditions
  end
  return recipe
end

-- 创建包含对应名称的表
local recipenames = {
  ----------------------------------------------------------------------------------------------------base sp
  {
      name = "automation-sp",
      time = 5,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "copper-plate", amount = 1},
      },
      results =
    {
        {type = "item", name="automation-science-pack", amount=1},
      },
      order = "a",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "logistic-sp",
      time = 12,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 11},
        {type = "item", name = "copper-plate", amount = 3},
      },
      results =
    {
          {type = "item", name = "logistic-science-pack", amount = 2}
      },
      order = "b",
      subgroup = "rlcpc-merge-sp",
  },
  {
    name = "military-sp",
    time = 10,
    ingredients =
      {
        {type = "item", name = "iron-plate", amount = 9},
        {type = "item", name = "copper-plate", amount = 5},
        {type = "item", name = "coal", amount = 10},
        {type = "item", name = "stone-brick", amount = 10},
        {type = "item", name = "steel-plate", amount = 1},
    },
    results =
    {
        {type = "item", name = "military-science-pack", amount = 2}
    },
    order = "c",
    subgroup = "rlcpc-merge-sp",
  },
  {
      name = "chemical-sp",
      time = 24,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 14},
        {type = "item", name = "copper-plate", amount = 15},
        {type = "item", name = "coal", amount = 3},
        {type = "item", name = "steel-plate", amount = 2},
        {type = "fluid", name = "petroleum-gas", amount = 75},
        {type = "fluid", name = "water", amount = 15},
      },
      results =
    {
          {type = "item", name = "chemical-science-pack", amount = 2}
      },
      order = "d",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "production-sp",
      time = 42,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 65},
        {type = "item", name = "copper-plate", amount = 115},
        {type = "item", name = "stone", amount = 30},
        {type = "item", name = "coal", amount = 20},
        {type = "item", name = "steel-plate", amount = 50},
        {type = "item", name = "stone-brick", amount = 20},
        {type = "fluid", name = "petroleum-gas", amount = 400},
      },
      results =
    {
          {type = "item", name = "production-science-pack", amount = 6}
      },
      order = "e",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "utility-sp",
      time = 42,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 120},
        {type = "item", name = "copper-plate", amount = 299},
        {type = "item", name = "coal", amount = 23},
        {type = "item", name = "steel-plate", amount = 16},
        {type = "fluid", name = "petroleum-gas", amount = 610},
        {type = "fluid", name = "water", amount = 350},
        {type = "fluid", name = "heavy-oil", amount = 30},
      },
      results =
    {
          {type = "item", name = "utility-science-pack", amount = 6}
      },
      order = "f",
      subgroup = "rlcpc-merge-sp",
  },
  ----------------------------------------------------------------------------------------------------space age sp
  {--原配方就已经很简洁了，所以只扩大数值
      name = "space-sp",
      time = 60,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 8},
        {type = "item", name = "carbon", amount = 4},
        {type = "item", name = "ice", amount = 4}
      },
      results =
    {{type="item", name="space-science-pack", amount=20}},
      surface_conditions =
      {
        {
          property = "gravity",
          min = 0,
          max = 0
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "metallurgic-sp",
      time = 90,
      ingredients =
      {
        {type = "item", name = "tungsten-ore", amount = 68},
        {type = "item", name = "coal", amount = 36},
        {type = "fluid", name = "sulfuric-acid", amount = 540},
        {type = "fluid", name = "molten-copper", amount = 1200},
        {type = "fluid", name = "molten-iron", amount = 80},
      },
      results =
    {{type="item", name="metallurgic-science-pack", amount=9}},
      surface_conditions =
      {
        {
          property = "pressure",
          min = 4000,
          max = 4000
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {--没有种子输出
      name = "agricultural-sp",
      time = 36,
      ingredients =
      {
        {type = "item", name = "jellynut", amount = 2},
        {type = "item", name = "yumako", amount = 5},
        {type = "item", name = "pentapod-egg", amount = 6},
        {type = "item", name = "nutrients", amount = 4},
      },
      results =
      {
        {type = "item", name = "agricultural-science-pack", amount = 9},
      },
      surface_conditions =
      {
        {
          property = "pressure",
          min = 2000,
          max = 2000
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {--全是概率，除非能除尽不然全取小数点后三位
      name = "electromagnetic-sp",
      time = 90,
      icon = "__space-age__/graphics/icons/electromagnetic-science-pack.png",
      ingredients =
      {
        {type = "item", name = "battery", amount = 34},
        {type = "item", name = "advanced-circuit", amount = 32},
        {type = "item", name = "iron-gear-wheel", amount = 24},
        {type = "item", name = "stone", amount = 18},
        {type = "item", name = "holmium-ore", amount = 10},
        {type = "item", name = "ice", amount = 4},
        {type = "fluid", name = "heavy-oil", amount = 145},
      },
      results =
      {
        {type = "item", name = "electromagnetic-science-pack", amount = 9},
        {type = "item", name = "plastic-bar", amount = 14, probability = 0.952 },--13.3333333333333
        {type = "item", name = "copper-cable", amount = 11, probability = 0.97 },--10.6666666666666
        {type = "item", name = "stone", amount = 1, probability = 0.433 },--0.433333333333333
        {type = "item", name = "holmium-ore", amount = 1, probability = 0.2 },
        {type = "item", name = "ice", amount = 1, probability = 0.883 },--0.883333333333333333
        {type = "fluid", name = "heavy-oil", amount = 1, probability = 0.556 },--0.5555555555555555
      },
      surface_conditions =
      {
        {
          property = "magnetic-field",
          min = 99,
          max = 99
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "cryogenic-sp",
      time = 20,
      icon = "__space-age__/graphics/icons/cryogenic-science-pack.png",
      ingredients =
      {
        {type = "item", name = "holmium-plate", amount = 1},
        {type = "fluid", name = "ammoniacal-solution", amount = 30},
        {type = "fluid", name = "fluorine", amount = 3},
        {type = "fluid", name = "lithium-brine", amount = 11},
        {type = "fluid", name = "crude-oil", amount = 1},
      },
      results =
      {
        {type = "item", name = "cryogenic-science-pack", amount = 1},
        {type = "item", name = "holmium-plate", amount = 1, probability = 0.788 },
        {type = "fluid", name = "lithium-brine", amount = 1, probability = 0.4 },
        {type = "fluid", name = "crude-oil", amount = 1, probability = 0.64 },
        {type = "fluid", name = "ammonia", amount = 16, probability = 0.96875 },
      },
      surface_conditions =
      {
        {
          property = "pressure",
          min = 300,
          max = 300
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {--写到这
  --[[
  eNrtm0tv4zYQgP9KobPp2tnFtjDQSwssUKAFCqQ9LQKDokYSaz4UPtKogf97Z2TZK8d2d9FDalkEcoiHrxl+M9RwLL9k8NxYF9baFh5CtnrJcu4hW2V388X8/XfZLBO1NNCLvl/OFyj60eb+PnCxuZd/UwNKO/lP0Qer2W/OFlEEaQ3742f2UT5D0U9InUDBEw9QMMel8sOVSiVz/LyYLz/M7/BzDQrV6nssqcdj5EqG9mgQF8G6tlHcGHD7zh+wxTdcAOPVkTW/8wYUGoSydyijZWgoBCbavBu/7MVOibataGNwns3Byu1+SQmo/KeXTCjuyYyPO0VwpOGa5v8kdfWDDKC/bZzVEGoZNfNCgkG1aM6Hb7BzriI0TpqAc7zg5MYGmjgjxfp9fEKT17k1ctejFx+v3u/5blSwBLJX48LiRBYxVKTyKiM1UVLwwNehbaAXedpGqRslS0kQg4uAGhRQ4hYW65yGcm2joYUdPEbpUNxLVnfv3y22D7Ms2GZdKmsdaXXYrk4wy9AbQGWrJf5HfnZk1C8EiiYWsoH11xs2NGM3+IIhzcFT9913Elq1sOQlJVceZhknDLAbh8PACTChc63lYjHLNO+iZGjfr73oFIhwra3ASMHI88IxiEOjf2VHv8QFQ/rAONkjY53m6tVUu87y0lylRevWSmoZ9gZjEEQF6/6EOJjYSe+BTNj16Hx4i3MIqzWQD2QYMF8LFPUyAWmiXID3nXtcN0o8y0RAN+QVniDngb7qMkGspYrW2Q0EpMCEtRjnVQrSW6CZKI6VYoim8gEME9zlsrh+ktgOOqejg/Xj2N1rnLwM1P6XDDVDN5XF9Lj6SNtsDQFKz8/bYNqnQ+Ta0chwA6HaM6Wjd9LRyosnjteWggnpRBwn2uVFtNPj+dn4RPQ2iFJ6ZA0rJdWGrp1lLq2oud6pOiBoXcUR3zXRKyMVfQbVIPp8apGJwUmg2tiRQUPxUA+a9awO2zfzF9sgQ8yqcwUp9scd+6hUV1zEpDTASFJpfPKU0RnerTUA6TWocFp3mQ7F6y9V1KCl4OpspYLafHAts3i2TLhsUVulxxOS/6lmQYg1BK5UdFU7XcTeqki8biNwp8exjZpvLPtcvBh7+kyBWXODl/U+aFM+/Qb1TKvwSCQ9WOmsZkpWdWBWqnQsjLVArTBBxWji4qTil5KycT6xgT+1FJN0MorNKL7d/Reug+N+wnHKtcZrP6c92mdizEPDHb+dpGzqgSsFsPN1gfQ4HQlCzFlxQ3w4qe6m6nTKps95S6nic3KV5CpfcpU/QakW1UsX+ORH0yoDfblqOwZ/eqPbPOlCL/ViYqbkYwT6acQY7gd0W3Xdrxi6rHEIF1suemsq0KR7XrrnpXve27+HRCesb02owUufKKZATAj/p0DsXvBK7wSNOg6dNQnhNSJ82OLfP9gzzbM=
  ]]
      name = "promethium-sp",
      time = 54,
      icon = "__space-age__/graphics/icons/promethium-science-pack.png",
      ingredients =
      {
        {type = "item", name = "promethium-asteroid-chunk", amount = 270},
        {type = "item", name = "biter-egg", amount = 108},
        {type = "item", name = "copper-ore", amount = 84},
        {type = "item", name = "iron-ore", amount = 75},
        {type = "item", name = "carbon", amount = 38},
        {type = "item", name = "yumako", amount = 24},
        {type = "item", name = "sulfur", amount = 16},
        {type = "item", name = "tungsten-ore", amount = 15},
        {type = "item", name = "nutrients", amount = 8},
        {type = "item", name = "holmium-ore", amount = 2},
        {type = "item", name = "jellynut", amount = 2},
        {type = "item", name = "calcite", amount = 2},
        {type = "item", name = "stone", amount = 1},
        {type = "fluid", name = "ammoniacal-solution", amount = 188},
        {type = "fluid", name = "lithium-brine", amount = 152},
        {type = "fluid", name = "fluorine", amount = 36},
      },
      results =
      {
        {type = "item", name = "promethium-science-pack", amount = 108},
        {type = "item", name = "copper-ore", amount = 1, probability = 0.5333 },--0.53333333333333333
        {type = "item", name = "iron-ore", amount = 1, probability = 0.3 },--0.290666666666666
        {type = "item", name = "carbon", amount = 1, probability = 0.4 },--0.4000000000000000000000000000001
        {type = "item", name = "yumako", amount = 1, probability = 0.681 },--0.6814814814814814814815
        {type = "item", name = "sulfur", amount = 1, probability = 0.0000000000001 },--0.00000000000000000000000000000000000000000000000000001
        {type = "item", name = "tungsten-ore", amount = 1, probability = 0.6 },--0.6
        {type = "item", name = "nutrients", amount = 1, probability = 0.678 },--0.6777777777777777777777777777
        {type = "item", name = "holmium-ore", amount = 1, probability = 0.553 },--0.5536000000000000000000000000000000001
        {type = "item", name = "jellynut", amount = 1, probability = 0.874 },--0.8740740740740740740740
        {type = "item", name = "calcite", amount = 1, probability = 0.976 },--0.9760000000000000000000001
        {type = "item", name = "stone", amount = 1, probability = 0.277 },--0.276800000000000001
        {type = "item", name = "ice", amount = 4, probability = 0.9896 },--0.9896
        {type = "item", name = "yumako-seed", amount = 1, probability = 0.7 },--0.699555555555555
        {type = "item", name = "jellynut-seed", amount = 1, probability = 0.034 },--0.03377777777777777777777777777
        {type = "fluid", name = "ammoniacal-solution", amount = 1, probability = 0.8 },--0.8
        {type = "fluid", name = "lithium-brine", amount = 1, probability = 0.8 },--0.8
      },
      surface_conditions =
      {
        {
          property = "gravity",
          min = 0,
          max = 0
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "agricultural-sp-full",
      time = 288,
      icon = "__planet-cyber__/graphics/icons/merge-agricultural-sp-full.png",
      ingredients =
      {
        {type = "item", name = "jellynut", amount = 16},
        {type = "item", name = "yumako", amount = 40},
        {type = "item", name = "pentapod-egg", amount = 48},
        {type = "item", name = "nutrients", amount = 37},
      },
      results =
      {
        {type = "item", name = "agricultural-science-pack", amount = 72},
        {type = "item", name = "jellynut-seed", amount = 2, probability = 0.6 },
        {type = "item", name = "yumako-seed", amount = 1, probability = 0.48 },
      },
      surface_conditions =
      {
        {
          property = "pressure",
          min = 2000,
          max = 2000
        }
      },
      order = "g",
      subgroup = "rlcpc-merge-sp",
  },
  {
      name = "six-sp",
      time = 174,
      icon = "__planet-cyber__/graphics/icons/merge-six-sp.png",
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 246},
        {type = "item", name = "copper-plate", amount = 459},
        {type = "item", name = "steel-plate", amount = 172},
        {type = "item", name = "stone-brick", amount = 40},
        {type = "item", name = "stone", amount = 30},
        {type = "item", name = "coal", amount = 69},
        {type = "fluid", name = "petroleum-gas", amount = 1160},
        {type = "fluid", name = "water", amount = 380},
        {type = "fluid", name = "heavy-oil", amount = 30},
      },
      results =
    {
          {type = "item", name = "automation-science-pack", amount = 2},
          {type = "item", name = "logistic-science-pack", amount = 2},
          {type = "item", name = "military-science-pack", amount = 4},
          {type = "item", name = "chemical-science-pack", amount = 4},
          {type = "item", name = "production-science-pack", amount = 6},
          {type = "item", name = "utility-science-pack", amount = 6},
      },
      order = "y",
      subgroup = "rlcpc-merge-sp",
  },
  {
    --[[
    helmod的配方计算代码
    太大太多了，我懒得用概率法了
    全
    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
    半
    eNrtXUlz3LiS/isvPFdXBbERZEzoMoe5zcXXjgkHVaKlemYV9WpxP02H/vsAxEIsmWSVtXS3RYUcViFRIEgiPyQSXybu+n90/abp/vH15o9N1xyPN5/+p79ru0+ft3c3n3b6z6/i0+f+9317uPl06DZPT/eEFNWnz7fqe9+/qlrE/nno+5Nv5L90kWnESIn6sL9r/31TfN43u/bmU3M+9bvmtO33q+Nm2+437eqx0d8BrrXpz/uTutBj/7sSUUpEJSUn67Ii6j8hVdP3h/ZOtXI63vzx26dN//jYHlaPXXNqP/3vzR/f26ebuNB2Ii47PT2qsu2p3X363OyGaxafjyclu6HPn3/7tD2ozt63zWH1+0OrnpFrOS23jWfFc+2fDs3++NgfTqvbtjv55pNi23paOt34dn9sDyf18GyP7UffVf95ro+P2/awUY97dVCyu+Nq19w3/7fdj48ZrWAvhcunL61e8L65a+1V7CfXqP841/3jqd+3q9+bbnx7QZFtLSyZbvB47r6d3UM1H3wj9tNcj5q7H40a/HerzfawOW/H154JnOJk5XOXaPf36gGvzvug9bDMNhwVTbd5aLadbUj/6Vowf892p2s3p8N2s1LPZ99sxqGTCVzHsvLZUXro786b0/bH9vS0Uih27oIBCsjc2IREF1xr0x6PekhHTzgtH68RF8+1/617Mupy259W3w6qEX8JQGSvAknmLtT1v6/u2v1R3/zxdFAP4nwYrwVL7eUQ4QwmbZw2b8d3vUVeL5FrwiirRVESSStK6wyZY7gPikI8vgjqN83htt+7eWP44GcM+2kWy8/7++Op3a/0F7Z3Y78ygcPzrPziS8Q3nhSnzV841+36bujMMEH6tuNS23RSaFr+1p23d1DTt9teyf5tG7SfXFP+46zSqam+eezvVu39/ahxYaFTt6gManZdJj9kvND+rHDHWBXDFfxn13xQMDdTqIezaZSJsz3144wRFo4zR1w63XCz2Zx3Z/VSfatBiZ8zwqLp9gzY9t3TqY1geSiJEdkWzbzw3z499N1ue96tjn131gaff2GZwDafl89eo9ueHvRXYl2ISx1YxYXz+HvuD/33djAKNn13F8BvKvHomwlmb+BW9eAQDeexxGuHL4AQMmztX+dmf9L3aGabflThXGJbBwQXTH271jzMRoHLod8qq+ThvP8eToJIjXE6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
    ]]
      name = "all-sp",
      time = 151,
      icon = "__planet-cyber__/graphics/icons/merge-six-sp.png",
      ingredients =
      {
        {type = "item", name = "ice", amount = 18},
        {type = "item", name = "biter-egg", amount = 1},
        {type = "item", name = "pentapod-egg", amount = 1},
        {type = "item", name = "promethium-asteroid-chunk", amount = 3},
        {type = "item", name = "coal", amount = 14},
        {type = "item", name = "tungsten-ore", amount = 8},
        {type = "item", name = "holmium-ore", amount = 2},
        {type = "item", name = "calcite", amount = 4},
        {type = "item", name = "yumako", amount = 49},
        {type = "item", name = "jellynut", amount = 48},
        {type = "fluid", name = "fluorine", amount = 4},
        {type = "fluid", name = "lithium-brine", amount = 12},
        {type = "fluid", name = "crude-oil", amount = 1},
        {type = "fluid", name = "ammoniacal-solution", amount = 32},
        {type = "fluid", name = "lava", amount = 1606},
      },
      results =
    {
          {type = "item", name = "automation-science-pack", amount = 1},
          {type = "item", name = "logistic-science-pack", amount = 1},
          {type = "item", name = "military-science-pack", amount = 1},
          {type = "item", name = "chemical-science-pack", amount = 1},
          {type = "item", name = "production-science-pack", amount = 1},
          {type = "item", name = "utility-science-pack", amount = 1},
          {type = "item", name = "space-science-pack", amount = 1},
          {type = "item", name = "metallurgic-science-pack", amount = 1},
          {type = "item", name = "agricultural-science-pack", amount = 1},
          {type = "item", name = "electromagnetic-science-pack", amount = 1},
          {type = "item", name = "cryogenic-science-pack", amount = 1},
          {type = "item", name = "promethium-science-pack", amount = 1},
      },
      order = "z",
      subgroup = "rlcpc-merge-sp",
  },
  ----------------------------------------------------------------------------------------------------item
  {
      name = "iron-plate",
      time = 320,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 100},
      },
      results =
    {
          {type = "item", name = "iron-plate", amount = 100},
      },
  },
  {
      name = "copper-plate",
      time = 320,
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 100},
      },
      results =
    {
          {type = "item", name = "copper-plate", amount = 100},
      },
  },
  {
      name = "steel-plate",
      time = 320,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 200},
      },
      results =
    {
          {type = "item", name = "steel-plate", amount = 20},
      },
  },
  {
      name = "solid-fuel-from-heavy-oil",
      time = 100,
      ingredients =
      {
        {type = "fluid", name = "petroleum-gas", amount = 2000},
      },
      results =
    {
          {type = "item", name = "solid-fuel", amount = 100},
      },
  },
  {
      name = "solid-fuel-from-light-oil",
      time = 100,
      ingredients =
      {
        {type = "fluid", name = "petroleum-gas", amount = 1000},
      },
      results =
    {
          {type = "item", name = "solid-fuel", amount = 100},
      },
  },
  {
      name = "solid-fuel-from-petroleum-gas",
      time = 100,
      ingredients =
      {
        {type = "fluid", name = "petroleum-gas", amount = 2000},
      },
      results =
    {
          {type = "item", name = "solid-fuel", amount = 100},
      },
  },
  {
      name = "solid-fuel-from-ammonia",
      time = 50,
      ingredients =
      {
        {type = "fluid", name = "ammonia", amount = 1500},
        {type = "fluid", name = "crude-oil", amount = 600},
      },
      results =
    {
          {type = "item", name = "solid-fuel", amount = 100},
      },
  },
  {
      name = "plastic-bar",
      time = 100,
      ingredients =
      {
        {type = "item", name = "coal", amount = 100},
        {type = "fluid", name = "petroleum-gas", amount = 2000},
      },
      results =
    {
          {type = "item", name = "plastic-bar", amount = 200},
      },
  },
  {
      name = "bioplastic",
      time = 144,
      ingredients =
      {
        {type = "item", name = "jellynut", amount = 16},
        {type = "item", name = "nutrients", amount = 33},
        {type = "item", name = "yumako", amount = 104},
      },
      results =
    {
          {type = "item", name = "plastic-bar", amount = 216},
      },
  },
  {
      name = "sulfur",
      time = 200,
      ingredients =
      {
        {type = "fluid", name = "water", amount = 3000},
        {type = "fluid", name = "petroleum-gas", amount = 3000},
      },
      results =
    {
          {type = "item", name = "sulfur", amount = 200},
      },
  },
  {
      name = "biosulfur",
      time = 240,
      ingredients =
      {
        {type = "item", name = "jellynut", amount = 140},
        {type = "item", name = "nutrients", amount = 30},
        {type = "item", name = "yumako", amount = 100},
      },
      results =
    {
          {type = "item", name = "sulfur", amount = 240},
      },
  },
  {
      name = "carbon",
      time = 100,
      ingredients =
      {
        {type = "item", name = "coal", amount = 200},
        {type = "fluid", name = "sulfuric-acid", amount = 2000},
      },
      results =
    {
          {type = "item", name = "carbon", amount = 100},
      },
  },
  {
      name = "burnt-spoilage",
      time = 1200,
      ingredients =
      {
        {type = "item", name = "spoilage", amount = 400},
        {type = "item", name = "nutrients", amount = 100},
      },
      results =
    {
          {type = "item", name = "carbon", amount = 100},
      },
  },
  {
      name = "iron-gear-wheel",
      time = 50,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 200},
      },
      results =
    {
          {type = "item", name = "iron-gear-wheel", amount = 100},
      },
  },
  {
      name = "iron-stick",
      time = 50,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 100},
      },
      results =
    {
          {type = "item", name = "iron-stick", amount = 200},
      },
  },
  {
      name = "copper-cable",
      time = 50,
      ingredients =
      {
        {type = "item", name = "copper-ore", amount = 100},
      },
      results =
    {
          {type = "item", name = "copper-cable", amount = 200},
      },
  },
  {
      name = "barrel",
      time = 50,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 250},
      },
      results =
    {
          {type = "item", name = "barrel", amount = 50},
      },
  },
  {
      name = "battery",
      time = 40,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 14},
        {type = "item", name = "copper-ore", amount = 10},
        {type = "fluid", name = "water", amount = 700},
        {type = "fluid", name = "petroleum-gas", amount = 300},
      },
      results =
    {
          {type = "item", name = "battery", amount = 10},
      },
  },
  {
      name = "explosives",
      time = 40,
      ingredients =
      {
        {type = "item", name = "coal", amount = 5},
        {type = "fluid", name = "water", amount = 125},
        {type = "fluid", name = "petroleum-gas", amount = 75},
      },
      results =
    {
          {type = "item", name = "explosives", amount = 10},
      },
  },
  {
      name = "cliff-explosives",
      time = 8,
      ingredients =
      {
        {type = "item", name = "iron-ore", amount = 250},
        {type = "item", name = "coal", amount = 20},
        {type = "item", name = "calcite", amount = 10},
        {type = "fluid", name = "water", amount = 250},
        {type = "fluid", name = "petroleum-gas", amount = 150},
      },
      results =
    {
          {type = "item", name = "cliff-explosives", amount = 1},
      },
  },
  {
      name = "electronic-circuit",
      time = 5,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 10},
        {type = "item", name = "copper-plate", amount = 15},
      },
      results =
    {
          {type = "item", name = "electronic-circuit", amount = 10},
      },
  },
  {
      name = "advanced-circuit",
      time = 60,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 30},
        {type = "item", name = "copper-plate", amount = 65},
        {type = "item", name = "plastic-bar", amount = 20},
      },
      results =
    {
          {type = "item", name = "advanced-circuit", amount = 10},
      },
  },
  {
      name = "processing-unit",
      time = 100,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 241},
        {type = "item", name = "copper-plate", amount = 400},
        {type = "item", name = "coal", amount = 20},
        {type = "fluid", name = "petroleum-gas", amount = 475},
        {type = "fluid", name = "water", amount = 175},
      },
      results =
    {
          {type = "item", name = "processing-unit", amount = 10},
      },
  },
  {
      name = "engine-unit",
      time = 10,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 9},
      },
      results =
    {
        {type="item", name="engine-unit", amount=1},
      },
  },
  {
      name = "electric-engine-unit",
      time = 10,
      ingredients =
      {
        {type = "item", name = "iron-plate", amount = 20},
        {type = "item", name = "copper-plate", amount = 3},
        {type = "fluid", name = "heavy-oil", amount = 15},
      },
      results =
    {
        {type="item", name="electric-engine-unit", amount=1},
      },
  },
  {
    name = "flying-robot-frame",
    time = 20,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 40},
      {type = "item", name = "copper-plate", amount = 9},
      {type = "fluid", name = "water", amount = 140},
      {type = "fluid", name = "petroleum-gas", amount = 60},
      {type = "fluid", name = "heavy-oil", amount = 30},
    },
    results =
    {
      {type="item", name="flying-robot-frame", amount=1},
    },
  },
  {
    name = "low-density-structure",
    time = 15,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 20},
      {type = "item", name = "copper-plate", amount = 10},
      {type = "fluid", name = "petroleum-gas", amount = 50},
    },
    results =
    {
      {type="item", name="low-density-structure", amount=1},
    },
  },
  {
    name = "casting-low-density-structure",
    time = 45,
    ingredients =
    {
      {type = "item", name = "plastic-bar", amount = 10},
      {type = "item", name = "calcite", amount = 2},
      {type = "fluid", name = "lava", amount = 880},
    },
    results =
    {
      {type="item", name="casting-low-density-structure", amount=3},
    },
  },
  {
    name = "rocket-fuel-light",
    time = 15,
    ingredients =
    {
      {type = "fluid", name = "light-oil", amount = 110},
    },
    results =
    {
      {type="item", name="rocket-fuel", amount=1},
    },
  },
  {
    name = "rocket-fuel-heavy",
    time = 15,
    ingredients =
    {
      {type = "fluid", name = "light-oil", amount = 10},
      {type = "fluid", name = "heavy-oil", amount = 200},
    },
    results =
    {
      {type="item", name="rocket-fuel", amount=1},
    },
  },
  {
    name = "rocket-fuel-gas",
    time = 15,
    ingredients =
    {
      {type = "fluid", name = "light-oil", amount = 10},
      {type = "fluid", name = "petroleum-gas", amount = 200},
    },
    results =
    {
      {type="item", name="rocket-fuel", amount=1},
    },
  },
  {
    name = "rocket-fuel-ammonia",
    time = 15,
    ingredients =
    {
      {type = "fluid", name = "ammonia", amount = 150},
      {type = "fluid", name = "crude-oil", amount = 60},
      {type = "fluid", name = "light-oil", amount = 10},
    },
    results =
    {
      {type="item", name="rocket-fuel", amount=1},
    },
  },
  {
    name = "rocket-fuel-from-jelly",
    time = 180,
    ingredients =
    {
      {type = "item", name = "jellynut", amount = 68},
      {type = "item", name = "nutrients", amount = 29},
      {type = "item", name = "yumako", amount = 20},
      {type = "fluid", name = "water", amount = 360},
    },
    results =
    {
      {type="item", name="rocket-fuel", amount=18},
    },
  },
  {
    name = "ammonia-rocket-fuel",
    time = 20,
    ingredients =
    {
      {type = "item", name = "ice", amount = 5},
      {type = "fluid", name = "ammonia", amount = 1300},
      {type = "fluid", name = "crude-oil", amount = 120},
    },
    results =
    {
      {type="item", name="rocket-fuel", amount=2},
    },
  },
  {
    name = "uranium-processing",
    time = 1200,
    ingredients =
    {
      {type = "item", name = "uranium-ore", amount = 1000},
    },
    results =
    {
      {type="item", name="uranium-238", amount=100, probability = 0.993},
      {type="item", name="uranium-235", amount=1, probability = 0.7},
    },
  },
  {
    name = "kovarex-enrichment-process",
    time = 600,
    ingredients =
    {
      {type = "item", name = "uranium-235", amount = 400, ignored_by_stats = 400},
      {type = "item", name = "uranium-238", amount = 50, ignored_by_stats = 20}
    },
    results =
    {
      {type = "item", name = "uranium-235", amount = 410, ignored_by_stats = 400, ignored_by_productivity = 400},
      {type = "item", name = "uranium-238", amount = 20, ignored_by_stats = 20, ignored_by_productivity = 20}
    },
  },
  {
    name = "uranium-fuel-cell",
    time = 100,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 100},
      {type = "item", name = "uranium-235", amount = 10},
      {type = "item", name = "uranium-238", amount = 190}
    },
    results =
    {
      {type="item", name="uranium-fuel-cell", amount=100},
    },
  },
  {
    name = "nuclear-fuel",
    time = 900,
    ingredients =
    {
      {type = "item", name = "uranium-235", amount = 10},
      {type = "fluid", name = "light-oil", amount = 1100},
    },
    results =
    {
      {type="item", name="nuclear-fuel", amount=10},
    },
  },
  {
    name = "tungsten-carbide",
    time = 100,
    ingredients =
    {
      {type = "item", name = "coal", amount = 200},
      {type = "item", name = "tungsten-ore", amount = 200},
      {type = "fluid", name = "sulfuric-acid", amount = 3000},
    },
    results =
    {
      {type="item", name="tungsten-carbide", amount=100},
    },
  },
  {
    name = "tungsten-plate",
    time = 450,
    ingredients =
    {
      {type = "item", name = "calcite", amount = 1},
      {type = "item", name = "tungsten-ore", amount = 120},
      {type = "fluid", name = "lava", amount = 400},
    },
    results =
    {
      {type="item", name="tungsten-plate", amount=45},
    },
  },
  {
    name = "holmium-plate",
    time = 100,
    ingredients =
    {
      {type = "item", name = "holmium-ore", amount = 40},
      {type = "item", name = "stone", amount = 20},
      {type = "item", name = "ice", amount = 10},
    },
    results =
    {
      {type="item", name="holmium-plate", amount=100},
    },
  },
  {
    name = "holmium-solution",
    time = 200,
    ingredients =
    {
      {type = "item", name = "holmium-ore", amount = 40},
      {type = "item", name = "stone", amount = 20},
      {type = "item", name = "ice", amount = 10},
    },
    results =
    {
      {type="item", name="holmium-solution", amount=2000},
    },
  },
  {
    name = "superconductor",
    time = 450,
    ingredients =
    {
      {type = "item", name = "copper-cable", amount = 480},
      {type = "item", name = "plastic-bar", amount = 60},
      {type = "item", name = "holmium-ore", amount = 24},
      {type = "item", name = "ice", amount = 21},
      {type = "item", name = "stone", amount = 12},
      {type = "fluid", name = "heavy-oil", amount = 400},
    },
    results =
    {
      {type="item", name="superconductor", amount=180},
    },
  },
  {
    name = "supercapacitor",
    time = 450,
    ingredients =
    {
      {type = "item", name = "copper-cable", amount = 160},
      {type = "item", name = "electronic-circuit", amount = 120},
      {type = "item", name = "stone", amount = 38},
      {type = "item", name = "holmium-ore", amount = 36},
      {type = "item", name = "battery", amount = 30},
      {type = "item", name = "plastic-bar", amount = 20},
      {type = "item", name = "ice", amount = 14},
      {type = "fluid", name = "heavy-oil", amount = 333},
    },
    results =
    {
      {type="item", name="supercapacitor", amount=45},
    },
  },
  {
    name = "carbon-fiber",
    time = 30,
    ingredients =
    {
      {type = "item", name = "yumako", amount = 20},
    },
    results =
    {
      {type="item", name="carbon-fiber", amount=6},
    },
  },
  {
    name = "jellynut-processing",
    time = 12,
    ingredients =
    {
      {type = "item", name = "jellynut", amount = 8},
      {type = "item", name = "nutrients", amount = 1},
    },
    results =
    {
      {type="item", name="jellynut-seed", amount=1, probability = 0.24},
      {type="item", name="jelly", amount=48},
    },
  },
  {
    name = "yumako-processing",
    time = 12,
    ingredients =
    {
      {type = "item", name = "yumako", amount = 8},
      {type = "item", name = "nutrients", amount = 1},
    },
    results =
    {
      {type = "item", name = "yumako-seed", amount = 1, probability = 0.24},
      {type = "item", name = "yumako-mash", amount = 24}
    },
  },
  --eNrtW1uP6kYM/itVnhkKAXYBqS+tdKRKrVRp26ejFRomTpgyl+xkwi5d8d9rh8ABFo6yDycikBUPizMX25/HHtvhPYC31Do/0zbKwAfT92DOMwimQdjtdYePQScQC2mgJI373R6SfrXz7MlzsXyS/9EDpBb03/LMW83+cjbKhZfWsH9+Z1/kG0TlgjQIFKy4h4g5LlV2uFOs5By/97r9h26I3xegkK1yRJ9GvORcSb8+msSFt26dKm4MuN3gB3ySpVwA48mRNH/zFBQKhLQB0mgbmgqeifW8mN8vyU6J9TohxeA6y72Um92WEpD5r++BUDwjMb5sGcGZhmta/6vUyS/Sg/4ZTIJbstxI//wTDpirHFInjcd577igsZ4WC4iZUncrFHM2t0ZuR5Tk4x1LPW9neUvglVujjoV3UrCDnQlK1HtCPE4D4gspEfd85tcplKSM9CZ1qmQsCTXvcsDtI4hxmWg2p6lc29zQcg5ecumQXFKm/U2nEnfXyFSs1tIkzNm59Sx2RLwa3pR9ZRGYDG2CZbiD8Lmrg71BNfacFUs8QHEOqgamet3J8d84DAcPw0H/oTeaTB6Hk9FgNAjD/ngyGPR7o+HD+HEErDeqJot06LUS4I69LqAWefq9XjXWhE1TcEzwuYLb0HPmJXrWHy9KWFXFc+5cLaCPKjPkPRRB5cebYUXn/ZYqm8kVZFfElMDlY1Yva5+wc7xh+OYf2dL/3IYwmUfvXpssYUU7zqyS0W0EUlQtuXeGLrX5xpKrOK9DjHBY1eFxh8lB4xWbO25krlk4GNUgy+NnmRrXwNRkMvgcW+QdmAB1VXdTkwtFl+aaXFfVe4HPTYKe3jA6LzJqftjaC1RX5BpWZGxhlSbrvI3bwU4ajMc51bGOBYpVLqPGhTC8uwlr6LG9hYhM4vCUC1mPOFXPwTYws1hSMbHpWv4Xo0wduedwXI2fda750jLNs0XjdfuSc+PJYTorIMtqMeLwsbd57gTeprNYWdxyelC+LgidQMEKQ/i0j/9R3f+o4PwHFc5pXSFTmFWR6JD/7bQLEqT7nsFu+JZC+0WW6vUxVxl0Ak7FcdjOw2noBcD4osiPl5VOoHnRrziU7M+SdKlMbjVPDFCuQp2Ak5L0yZDsRKZyuwtCle2KD5oy1mmuTpbaDpaX1ootSjpTUku/E16jghTMyr7NXtyC+gQkyHZE0WXY4BrCag1kCEFwaKTfh/VD5GgxbTymJ1HquhGdSysWXH8IqNYlmBGJa0KvSH8Oneo2HfqYLXkngdp/RwIdkg/5oFXP8rCpy17O5FHXbTP4HPRcUUevnMfCY2ULx2NPz1+lX7BzV/o78ANlqCY1lN3YpsNa+nb0C9ldI7stWWL8wwwpunpcxQK0FFydi9bFs8y7NbOOCbe2CZi7DNpoydbZJXhEgQlr6RhcP7I7wM5C26JZoNmi2FQUkamFzHXrYG8IzH0NuwmJLh5JjPOGi5Oie6ZB+Y8Boj2S7ZFsEpinbaUbzDoJYg2eK5W7ZH2/EB/02m7g4N4fjjxacSMgYkI6kTezmNC/WEy4Pzy/Cd8ieiNV/+MXyFssm49lm6o0GcTyfYZvVfgbuOGWXTm61S64wdtAeeO9wxL8/mVuFjurmZLJwjMrVXvDbWimAny1JgDJqMWyEeX37yB5cFLvGNSCF+qnoJKUfMmBft3bhDSU7NAV732d/j6MnlyMKW3vs60DNg9SKYCdvya20bMp9SGtMVfjpJhdqY9lkHLHb6fqd/fH9PDXrm1OekUQPm/w8z9U6O5D
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
  {
    name = "ammoniarocketfuel",
    time = 213130,
    ingredients =
    {
      {type = "item", name = "iafafafafafce", amount = 323afafaf33},
      {type = "fluid", name = "ammonia", amount = 13131300},
    },
    results =
    {
      {type="item", name="rocketfuel", amount=2131313},
    },
  },
}

-- 生成多个recipe配置
local recipes = {}
for _, recipe in ipairs(recipenames) do
  table.insert(recipes, recipe_autogenerate(recipe.name,recipe.time,recipe.ingredients,recipe.results,recipe.icon))
end

----------------------------------------------------------------------------------------------------add
-- 合并多个表
local all_things = {}
for _, recipe in ipairs(recipes) do
  table.insert(all_things, recipe)
end

-- 将合并后的表添加到游戏数据中
if data and data.extend then
  data:extend(all_things)
end

----------------------------------------------------------------------------------------------------test
-- 递归打印表的函数
local function print_table(t, indent)
indent = indent or 0
for key, value in pairs(t) do
    if type(value) == "table" then
        print(string.rep("  ", indent)..key..":")
        print_table(value, indent + 1)
    else
        print(string.rep("  ", indent)..key..": "..tostring(value))
    end
end
end

-- 打印生成的recipe配置（仅用于测试）
for _,recipe in ipairs(recipes) do
print_table(recipe)
print("--------------------------------------")
end