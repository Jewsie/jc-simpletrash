Config = Config or {}

Config.AmountToFind = math.random(1, 5) -- The range of how many items you can find in each dumpster/trash, can be a solid number too!
Config.QBVersion == 'oldqb' -- Just the logic of how inventory itembox is handled! "oldqb" or "newqb"

Config.Trashcans = { -- The models of the trashcans you want to be searchable!
    'prop_dumpster_02a',
    'prop_dumpster_01a',
    'pop_cs_bin_02',
    'prop_bin_01a',
}

Config.ItemsToFind = { -- The items that can be found in trashcans
    {
        item = 'phone', -- The ID/Name of the item from inventory
        price = 0, -- Just leave this at 0
        amount = math.random(2, 4), -- Can be a solid number
        info = {}, -- If you want a specific data to be assigned for the item
        type = 'item', -- Just the category of the item
        chance = 50 -- How high a chance it is to find!
    },
    {
        item = 'tablet',
        price = 0,
        amount = math.random(2, 4),
        info = {},
        type = 'item',
        chance = 50
    },
    {
        item = 'bandage',
        price = 0,
        amount = math.random(2, 4),
        info = {},
        type = 'item',
        chance = 50
    },
    {
        item = 'cryptostick',
        price = 0,
        amount = 1,
        info = {},
        type = 'item',
        chance = 50
    },
    {
        item = 'bread',
        price = 0,
        amount = 1,
        info = {},
        type = 'item',
        chance = 100
    },
}