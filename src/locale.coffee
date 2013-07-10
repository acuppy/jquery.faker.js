Faker.Locale = 
  sample: (key, size) ->
    collection = this.collection(key)
    Faker.Util.Random.sample(collection, size)

  collection: (key) ->

    collection = Faker.Locales[Faker.config.locale]
    arrPath    = key.split(".")

    for i in [0...arrPath.length]
      collection = collection[arrPath[i]]

    $.error "Unknown key: \"#{key.toString()}\" -- you may need to scope it to the proper locale library (ex: name.first_name)" if Faker.Util.isBlank(collection)

    collection

  register: (id, collection) ->
    Faker.Locales[id] = collection
    return

  extend: ->
    Faker.Locales[id] ?= {}
    $.extend(true, Faker.Locales[id], collection)

Faker.Locales = {}