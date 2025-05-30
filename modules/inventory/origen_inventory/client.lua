if GetResourceState('origen_inventory') ~= 'started' then return end

Inventory = Inventory or {}

local origin = exports.origen_inventory

---comment
---@param item string
---@return table
Inventory.GetItemInfo = function(item)
    local itemData = origin:Items(item)
    local repackedTable = {
        name = itemData.name or "Missing Name",
        label = itemData.label or "Missing Label",
        stack = itemData.unique or "false",
        weight = itemData.weight or "0",
        description = itemData.description or "none",
        image = itemData.image or Inventory.GetImagePath(item),
    }
    return repackedTable or {}
end

---comment
---@param item string
---@return boolean
Inventory.HasItem = function(item)
    return origin:HasItem(item)
end

---comment
---@param item string
---@return string
Inventory.GetImagePath = function(item)
    local file = LoadResourceFile("origen_inventory", string.format("html/images/%s.png", item))
    local imagePath = file and string.format("nui://origen_inventory/html/images/%s.png", item)
    return imagePath or "https://avatars.githubusercontent.com/u/47620135"
end

---comment
---@return table
Inventory.GetPlayerInventory = function()
    local items = {}
    local inventory = origin:GetInventory()
    for _, v in pairs(inventory) do
        table.insert(items, {
            name = v.name,
            label = v.label,
            count = v.count,
            slot = v.slot,
            metadata = v.metadata,
            stack = v.unique,
            close = v.useable,
            weight = v.weight
        })
    end
    return items
end
