----------------------------------------------------------------------------------------------------item
-- 定义一个函数来生成item配置
local function item_autogenerate(name)
  return {
      type = "item",
      name = "rlcpc-"..name.."",
      icon = "__planet-cyber__/graphics/icons/planet-cyber.png",
      subgroup = "rlcpc-item",
      order = "a",
      stack_size = 100
    }
end

-- 创建包含对应名称的表
local itemnames = {
  "history-1",
  "history-2",
  "history-3",
  "ore",
}

-- 生成多个item配置
local items = {}
for _,item in ipairs(itemnames) do
    table.insert(items, item_autogenerate(item))
end

----------------------------------------------------------------------------------------------------entityitem
-- 定义一个函数来生成 entityitem 配置
function entityitem_autogenerate(name,icon)
  return {
      type = "item",
      name = "rlcpc-"..name.."",
      icon = "__planet-cyber__/graphics/"..icon..".png",
      subgroup = "rlcpc-entity",
      order = "a",
      stack_size = 100,
      place_result = "rlcpc-"..name.."",
  }
end

-- 创建包含对应名称的表
local entityitemnames = {
  {
  name = "dri-1",
  icon = "entity/dri/dri-icon",
  },
  {
  name = "dri-2",
  icon = "entity/dri/dri-icon",
  },
  {
  name = "dri-3",
  icon = "entity/dri/dri-icon",
  },
}

-- 生成多个 entityitem 配置
local entityitems = {}
for _, entityitemname in ipairs(entityitemnames) do
  table.insert(entityitems, entityitem_autogenerate(entityitemname.name,entityitemname.icon))
end

----------------------------------------------------------------------------------------------------add
-- 合并多个表
local all_things = {}
for _, item in ipairs(entityitems) do
    table.insert(all_things, item)
end
for _, item in ipairs(items) do
    table.insert(all_things, item)
end

-- 将合并后的表添加到游戏数据中
if data and data.extend then
    data:extend(all_things)
end

----------------------------------------------------------------------------------------------------test
--
-- 打印生成的item配置（仅用于测试）
for _,item in ipairs(items) do
  for key, value in pairs(item) do
      print(key, value)
  end
  print("--------------------------------------")
end
-- 打印生成的 entity 配置（仅用于测试）
for _, entityitem in ipairs(entityitems) do
  for key, value in pairs(entityitem) do
      print(key, value)
  end
  print("--------------------------------------")
end


