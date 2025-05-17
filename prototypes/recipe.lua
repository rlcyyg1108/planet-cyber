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
    }
    if icon then
        recipe.icon = icon
    end

    if subgroup then
        recipe.subgroup = subgroup
    else
        recipe.subgroup = "rlcpc-recipe"
    end

    if order then
        recipe.order = order
    else
        recipe.order = "a"
    end
    return recipe
end

-- 创建包含对应名称的表
local recipenames = {
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
        }
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
      }
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
        }
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
        }
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
        }
    },
    ----------------------------------------------------------------------------------------------------space age sp
    --[[{--原配方就已经很简洁了
        name = "space-sp",
        time = 15,
        ingredients =
        {
          {type = "item", name = "iron-plate", amount = 2},
          {type = "item", name = "carbon", amount = 1},
          {type = "item", name = "ice", amount = 1}
        },
        results = {{type="item", name="space-science-pack", amount=5}},
        surface_conditions =
        {
          {
            property = "gravity",
            min = 0,
            max = 0
          }
        },
    },]]
    {
        name = "metallurgic-sp",
        time = 15,
        ingredients =
        {
          {type = "item", name = "iron-plate", amount = 2},
          {type = "item", name = "carbon", amount = 1},
          {type = "item", name = "ice", amount = 1}
        },
        results = {{type="item", name="metallurgic-science-pack", amount=5}},
        surface_conditions =
        {
          {
            property = "pressure",
            min = 4000,
            max = 4000
          }
        },
    },--写到这没写完
    {
        name = "base-six-sp",
        time = 174,
        icon = "__planet-cyber__/graphics/icons/merge-base-six-sp.png",
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
        }
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
        }
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
        }
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
        }
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