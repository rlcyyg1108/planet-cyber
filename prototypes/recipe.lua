


--[[data:extend
({
  {
    type = "recipe",
    name = "rlcpc-planet-cyber",
    energy_required = 1,
    enabled = true,
    ingredients =
    {
      {type = "item", name = "wood", amount = 5}
    },
    results = {{type="item", name="rlcpc-planet-cyber", amount=1}}
  },
})]]

----------------------------------------------------------------------------------------------------recipe
-- 定义一个函数来生成recipe配置
local function recipe_autogenerate(name,time,ingredients,results)
  return {
      type = "recipe",
      name = "rlcpc-"..name.."",
      energy_required = time,
      ingredients = ingredients,
      results = results,
    }
end

-- 创建包含对应名称的表
local recipenames = {
  {
    name="merge-automation-science-pack",
    time=10,
    ingredients=
    {
      {type = "item", name = "wood", amount = 5},
    },
    results=
    {
      {type = "item", name="rlcpc-planet-cyber", amount=1},
    },
  },
}

-- 生成多个recipe配置
local recipes = {}
for _, recipe in ipairs(recipenames) do
    table.insert(recipes, recipe_autogenerate(recipe.name, recipe.time, recipe.ingredients, recipe.results))
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
--
-- 打印生成的recipe配置（仅用于测试）
for _,recipe in ipairs(recipes) do
  for key, value in pairs(recipe) do
      print(key, value)
  end
  print("--------------------------------------")
end


