----------------------------------------------------------------------------------------------------recipe
-- 定义一个函数来生成recipe配置
local function recipe_autogenerate(name,time,ingredients,results,icon)
    local recipe = {
        type = "recipe",
        name = "rlcpc-merge-" .. name,
        category = "rlcpc-merge",
        enabled = true,
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
        ingredients = {
          {type = "item", name = "iron-plate", amount = 2},
          {type = "item", name = "copper-plate", amount = 1},
        },
        results = {
          {type = "item", name="automation-science-pack", amount=1},
        },
        order = "a",
        subgroup = "rlcpc-merge-sp",
    },
    {
        name = "logistic-sp",
        time = 12,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 11},
          {type = "item", name = "copper-plate", amount = 3},
        },
        results = {
            {type = "item", name = "logistic-science-pack", amount = 2}
        },
        order = "b",
        subgroup = "rlcpc-merge-sp",
    },
    {
      name = "military-sp",
      time = 10,
      ingredients = {
          {type = "item", name = "iron-plate", amount = 9},
          {type = "item", name = "copper-plate", amount = 5},
          {type = "item", name = "coal", amount = 10},
          {type = "item", name = "stone-brick", amount = 10},
          {type = "item", name = "steel-plate", amount = 1},
      },
      results = {
          {type = "item", name = "military-science-pack", amount = 2}
      },
      order = "c",
      subgroup = "rlcpc-merge-sp",
    },
    {
        name = "chemical-sp",
        time = 24,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 14},
          {type = "item", name = "copper-plate", amount = 15},
          {type = "item", name = "coal", amount = 3},
          {type = "item", name = "steel-plate", amount = 2},
          {type = "fluid", name = "petroleum-gas", amount = 75},
          {type = "fluid", name = "water", amount = 15},
        },
        results = {
            {type = "item", name = "chemical-science-pack", amount = 2}
        },
        order = "d",
        subgroup = "rlcpc-merge-sp",
    },
    {
        name = "production-sp",
        time = 42,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 65},
          {type = "item", name = "copper-plate", amount = 115},
          {type = "item", name = "stone", amount = 30},
          {type = "item", name = "coal", amount = 20},
          {type = "item", name = "steel-plate", amount = 50},
          {type = "item", name = "stone-brick", amount = 20},
          {type = "fluid", name = "petroleum-gas", amount = 400},
        },
        results = {
            {type = "item", name = "production-science-pack", amount = 6}
        },
        order = "e",
        subgroup = "rlcpc-merge-sp",
    },
    {
        name = "utility-sp",
        time = 42,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 120},
          {type = "item", name = "copper-plate", amount = 299},
          {type = "item", name = "coal", amount = 23},
          {type = "item", name = "steel-plate", amount = 16},
          {type = "fluid", name = "petroleum-gas", amount = 610},
          {type = "fluid", name = "water", amount = 350},
          {type = "fluid", name = "heavy-oil", amount = 30},
        },
        results = {
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
        results = {{type="item", name="space-science-pack", amount=20}},
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
        results = {{type="item", name="metallurgic-science-pack", amount=9}},
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
        time = 10,
        ingredients =
        {
          {type = "item", name = "battery", amount = 4, probability = 0.944 },
          {type = "item", name = "advanced-circuit", amount = 4, probability = 0.889 },
          {type = "item", name = "iron-gear-wheel", amount = 3, probability = 0.889 },
          {type = "item", name = "stone", amount = 2, probability = 0.976 },
          {type = "item", name = "holmium-ore", amount = 2, probability = 0.5445 },
          {type = "item", name = "ice", amount = 1, probability = 0.346 },--原值≈0.346296296296296……
          {type = "fluid", name = "heavy-oil", amount = 17, probability = 0.944 },
        },
        results =
        {
          {type = "item", name = "electromagnetic-science-pack", amount = 1},
          {type = "item", name = "plastic-bar", amount = 2, probability = 0.74 },
          {type = "item", name = "copper-cable", amount = 2, probability = 0.592 },
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
        ingredients =
        {
          {type = "item", name = "holmium-plate", amount = 1, probability = 0.212 },
          {type = "fluid", name = "ammoniacal-solution", amount = 30},
          {type = "fluid", name = "fluorine", amount = 3},
          {type = "fluid", name = "lithium-brine", amount = 11, probability = 0.964 },
          {type = "fluid", name = "crude-oil", amount = 1, probability = 0.36 },
        },
        results =
        {
          {type = "item", name = "cryogenic-science-pack", amount = 1},
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
        time = 50,
        ingredients =
        {
          {type = "item", name = "holmium-plate", amount = 1, probability = 0.212 },
          {type = "fluid", name = "ammoniacal-solution", amount = 30},
          {type = "fluid", name = "fluorine", amount = 3},
          {type = "fluid", name = "lithium-brine", amount = 11, probability = 0.964 },
          {type = "fluid", name = "crude-oil", amount = 1, probability = 0.36 },
        },
        results =
        {
          {type = "item", name = "promethium-science-pack", amount = 100},
          {type = "fluid", name = "ammonia", amount = 16, probability = 0.96875 },
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
        ingredients = {
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
        results = {
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
        name = "all-sp",
        time = 174,
        icon = "__planet-cyber__/graphics/icons/merge-six-sp.png",
        ingredients = {
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
        results = {
            {type = "item", name = "automation-science-pack", amount = 2},
            {type = "item", name = "logistic-science-pack", amount = 2},
            {type = "item", name = "military-science-pack", amount = 4},
            {type = "item", name = "chemical-science-pack", amount = 4},
            {type = "item", name = "production-science-pack", amount = 6},
            {type = "item", name = "utility-science-pack", amount = 6},
        },
        order = "z",
        subgroup = "rlcpc-merge-sp",
    },
    ----------------------------------------------------------------------------------------------------item
    {
        name = "electronic-circuit",
        time = 5,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 10},
          {type = "item", name = "copper-plate", amount = 15},
        },
        results = {
            {type = "item", name = "electronic-circuit", amount = 10},
        },
    },
    {
        name = "advanced-circuit",
        time = 60,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 30},
          {type = "item", name = "copper-plate", amount = 65},
          {type = "item", name = "plastic-bar", amount = 20},
        },
        results = {
            {type = "item", name = "advanced-circuit", amount = 10},
        },
    },
    {
        name = "processing-unit",
        time = 100,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 241},
          {type = "item", name = "copper-plate", amount = 400},
          {type = "item", name = "coal", amount = 20},
          {type = "fluid", name = "petroleum-gas", amount = 475},
          {type = "fluid", name = "water", amount = 175},
        },
        results = {
            {type = "item", name = "processing-unit", amount = 10},
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