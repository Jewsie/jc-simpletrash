# jc-simpletrash

Video; https://youtu.be/lBQlkj8cmag

Discord for support; https://discord.gg/Kt45hmU9wb

jc-simpletrash is as it states in it's name! It's a simple script for searching in trashcans for items, with an incredibly easy and modifiable config file. All you need to do is assign which models of trashcans should be searchable and what items can be found and you'll be basically good to go!

```Config Files

Config = Config or {}

Config.SearchCooldownTimer = 1800 -- How long people has to wait to search the same trashcan in seconds!

Config.Trashcans = { -- The models of the trashcans you want to be searchable!
    'prop_dumpster_02a',
    'prop_dumpster_01a',
    'pop_cs_bin_02',
    'prop_bin_01a',
}

Config.ItemsToFind = { -- The items that can be found in trashcans
    'phone',
    'tablet',
    'bandage',
    'cryptostick',
    'aluminum',
    'iron',
    'steel',
    'plastic',
    'rubber',
    'glass',
    'metalscrap',
    'rolling_paper',
    'water_bottle',
    'tosti',
    'bread',
    'weed_skunk_seed'
}

Config.LowChancePercentage = 10 -- 10% chance you'll get the low chance amount of items!
Config.MediumChancePercentage = 50 -- 50% chance you'll get the medium chance amount of items!
Config.HighChancePercentage = 80 -- 80% chance you'll get the high chance amount of items!

Config.LowChanceItemAmount = 3 -- How many different items you can find in low chance!
Config.MediumChanceItemAmount = 2 -- How many different items you can find in low chance!
Config.HighChanceItemAmount = 1 -- How many different items you can find in low chance!

Config.LowChanceCount = math.random(1, 3) -- How many of each items can be found, can be a solid number too!
Config.MediumChanceCount = math.random(1, 2) -- How many of each items can be found, can be a solid number too!
Config.HighChanceCount = 1 -- How many of each items can be found, can be a solid number too!```
