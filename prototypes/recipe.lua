----------------------------------------------------------------------------------------------------recipe
-- 定义一个函数来生成recipe配置
local function recipe_autogenerate(name,time,ingredients,results,icon)
    local recipe = {
        type = "recipe",
        name = "rlcpc-" .. name,
        subgroup = "rlcyyg1",
        category = "merge-sp",
        enabled = false,
        energy_required = time,
        ingredients = ingredients,
        results = results
    }
    if icon then
        recipe.icon = icon
    end
    return recipe
end

-- 创建包含对应名称的表
local recipenames = {
    {
        name = "merge-automation-sp",
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
        name = "merge-logistic-sp",
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
      name = "merge-military-sp",
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
        name = "merge-chemical-sp",
        time = 24,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 14},
          {type = "item", name = "copper-plate", amount = 15},
          {type = "item", name = "plastic-bar", amount = 6},
          {type = "item", name = "sulfur", amount = 1},
          {type = "item", name = "steel-plate", amount = 2},
        },
        results = {
            {type = "item", name = "chemical-science-pack", amount = 2}
        }
    },
    {
        name = "merge-production-sp",
        time = 42,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 65},
          {type = "item", name = "copper-plate", amount = 115},
          {type = "item", name = "plastic-bar", amount = 40},
          {type = "item", name = "stone", amount = 30},
          {type = "item", name = "steel-plate", amount = 50},
          {type = "item", name = "stone-brick", amount = 20},
        },
        results = {
            {type = "item", name = "production-science-pack", amount = 6}
        }
    },
    {
        name = "merge-utility-sp",
        time = 21,
        ingredients = {
          {type = "item", name = "iron-plate", amount = 46},
          {type = "item", name = "copper-plate", amount = 110},
          {type = "item", name = "plastic-bar", amount = 16},
          {type = "item", name = "steel-plate", amount = 6},
          {type = "item", name = "sulfur", amount = 5},
          {type = "fluid", name = "water", amount = 94},
          {type = "fluid", name = "heavy-oil", amount = 15},
        },
        results = {
            {type = "item", name = "utility-science-pack", amount = 3}
        }
    },
    {
        name = "merge-base-six-sp",
        time = 870,
        icon = "__planet-cyber__/graphics/icons/merge-base-six-sp.png",
        ingredients = {
          {type = "item", name = "iron-plate", amount = 1092},
          {type = "item", name = "copper-plate", amount = 1895},
          {type = "item", name = "plastic-bar", amount = 424},
          {type = "item", name = "steel-plate", amount = 343},
          {type = "item", name = "stone-brick", amount = 200},
          {type = "item", name = "stone", amount = 150},
          {type = "item", name = "coal", amount = 100},
          {type = "item", name = "sulfur", amount = 57},
          {type = "fluid", name = "water", amount = 943},
          {type = "fluid", name = "heavy-oil", amount = 150},
        },
        results = {
            {type = "item", name = "automation-science-pack", amount = 10},
            {type = "item", name = "logistic-science-pack", amount = 10},
            {type = "item", name = "military-science-pack", amount = 20},
            {type = "item", name = "chemical-science-pack", amount = 20},
            {type = "item", name = "production-science-pack", amount = 30},
            {type = "item", name = "utility-science-pack", amount = 30},
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