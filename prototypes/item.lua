----------------------------------------------------------------------------------------------------item
-- 定义一个函数来生成item配置
local function item_autogenerate(name,icon)
  return {
      type = "item",
      name = "rlcpc-"..name.."",
      icon = "__planet-cyber__/graphics/icons/"..icon..".png",
      subgroup = "rlcyyg1",
      order = "a",
      stack_size = 100
  }
end

-- 创建包含对应名称的表
local itemnames = {
  {
    name="history-1",
    icon="planet-cyber",
  },
  {
    name="history-2",
    icon="planet-cyber",
  },
  {
    name="history-3",
    icon="planet-cyber",
  },
  {
    name="ore",
    icon="planet-cyber",
  },
}

-- 生成多个item配置
local items = {}
for _,item in ipairs(itemnames) do
    table.insert(items, item_autogenerate(item.name,item.icon))
end

----------------------------------------------------------------------------------------------------entityitem
-- 定义一个函数来生成 entityitem 配置
function entityitem_autogenerate(name,icon)
  return {
      type = "item",
      name = "rlcpc-"..name.."",
      icon = "__planet-cyber__/graphics/icons/"..icon..".png",
      subgroup = "rlcyyg1",
      order = "a",
      stack_size = 100,
      place_result = "rlcpc-"..name.."",
  }
end

-- 创建包含对应名称的表
local entityitemnames = {
  {
    name="planet-cyber",
    icon="planet-cyber",
  },
}

-- 生成多个 entityitem 配置
local entityitems = {}
for _, entityitemname in ipairs(entityitemnames) do
  table.insert(entityitems, entityitem_autogenerate(entityitemname.name,entityitemname.icon))
end

----------------------------------------------------------------------------------------------------add
-- 合并多个表
local allitems = {}
for _, item in ipairs(entityitems) do
    table.insert(allitems, item)
end
for _, item in ipairs(items) do
    table.insert(allitems, item)
end

-- 将合并后的表添加到游戏数据中
if data and data.extend then
    data:extend(allitems)
end



--[[
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
end]]


