# Helpers
# -----------------------------------------------------------------------------

descend = (o, ks) ->
    if typeof ks == 'string'
        ks = ks.split('.')
    k = ks.shift()
    if k?
        descend o[k], ks
    else
        return o

objectMatcher = (query) -> (item) ->
    matches = true
    for key, value of query
        if descend(item, key) != value
            matches = false
    return matches

randomString = (len=8) ->
    s = ''
    while s.length < len
        s += Math.random().toString(36).slice(2, len-s.length+2)
    return s

# Define Trees collection
# Possible statuses are 'marked', 'cut down', 'sawmill', 'distributor'
# -----------------------------------------------------------------------------

trees = [
    id: 'vilevofj'
    species: 'oak'
    status: 'cut down'
    created_at: 1496256384000
,
    id: 'fwoejlef'
    species: 'elm'
    status: 'cut down'
    created_at: 1496256544000
,
    id: 'nveksfxl'
    species: 'maple'
    status: 'marked'
    created_at: 1496256599000
,
    id: 'febgfuxo'
    species: 'elm'
    status: 'sawmill'
    created_at: 1496256599050
]

# A simple database in memory built from the app's collections
# -----------------------------------------------------------------------------

db = {
    trees
}

# The Data Service exposes CRUD functions for the app's types
# -----------------------------------------------------------------------------
# get(type, query) → Item
# find(type, query) → {items: [Item], total: Int, pages: Int}
# create(type, new_item) → Item
# update(type, id, item_update) → Item

module.exports = {
    get: (type, query, cb) ->
        item = db[type].filter(objectMatcher query)[0]
        cb null, item

    find: (type, query, cb) ->
        items = db[type].filter objectMatcher query
        count = items.length
        cb null, {items, page: 1, pages: 1, page_size: count, total: count}

    create: (type, new_item, cb) ->
        new_item.id = randomString()
        db[type].push new_item
        cb null, new_item

    update: (type, item_id, cb) ->
        # TODO:
}
