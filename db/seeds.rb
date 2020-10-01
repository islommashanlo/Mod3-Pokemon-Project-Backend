# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "Faker"

def api_call(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    json_response = JSON.parse(response.read_body)
end

rand_num = Random.new

# Locations


Location.create(id: 1, name: "Northwestern Viridian Forest", api_id: "viridian-forest")
Location.create(id: 2, name: "Northeaster Viridian Forest", api_id: "viridian-forest")
Location.create(id: 3, name: "Pokemon Mansion", api_id: "pokemon-mansion")
Location.create(id: 4, name: "Power Plant", api_id: "power-plant")
Location.create(id: 5, name: "Lost Ruins", api_id: "ruin-valley")


Location.create(id: 6, name: "Western Viridian Forest", api_id: "viridian-forest")
Location.create(id: 7, name: "Eastern Viridian Forest", api_id: "viridian-forest")
Location.create(id: 8, name: "Pokemon Tower", api_id: "pokemon-tower")
Location.create(id: 9, name: "Trainer Tower", api_id: "trainer-tower")
Location.create(id: 10, name: "Abandoned Road", api_id: "kindle-road")

Location.create(id: 11, name: "Western Road", api_id: "kanto-route-15")
Location.create(id: 12, name: "Southeastern Viridian Forest", api_id: "viridian-forest")
Location.create(id: 13, name: "Pallet Town", api_id: "pallet-town")
Location.create(id: 14, name: "Eastern Road", api_id: "kanto-route-1")
Location.create(id: 15, name: "Eastern Ruins", api_id: "tanoby-ruins")


Location.create(id: 16, name: "Western Cave", api_id: "digletts-cave")
Location.create(id: 17, name: "Lost Cave", api_id: "lost-cave")
Location.create(id: 18, name: "Eastern Cave", api_id: "cerulian-cave")
Location.create(id: 19, name: "Country Road", api_id: "kanto-route-5")
Location.create(id: 20, name: "Dangerous Cave", api_id: "icefall-cave")

Location.create(id: 21, name: "Western Cave", api_id: "kanto-altering-cave")
Location.create(id: 22, name: "Lost Cave", api_id: "kanto-altering-cave")
Location.create(id: 23, name: "Eastern Cave", api_id: "kanto-altering-cave")
Location.create(id: 24, name: "Eastern Cave", api_id: "kanto-altering-cave")
Location.create(id: 25, name: "Dangerous Cave", api_id: "kanto-altering-cave")


10.times do 
    User.create(name: Faker::Games::Dota.hero)
end

i = 1

until i == 10 do
    a = rand_num.rand(30)
    poke_name = api_call("https://pokeapi.co/api/v2/pokemon/#{a}")["name"]
    poke_species = api_call("https://pokeapi.co/api/v2/pokemon/#{a}")["species"]["name"]
    poke_img = api_call("https://pokeapi.co/api/v2/pokemon/#{a}")["sprites"]["front_default"]
    api_id = a
    Pokemon.create(name: poke_name, species: poke_species, img_url: poke_img, user_id: i, api_id: a)
    i += 1
end


d = 1

until a == 10 do
    b = rand_num.rand(30)
    api_name = api_call("https://pokeapi.co/api/v2/item/#{b}")["name"]
    name = api_call("https://pokeapi.co/api/v2/item/#{b}")["names"][7]["name"]
    effect = api_call("https://pokeapi.co/api/v2/item/#{b}")["effect_entries"][0]["short_effect"]
    img = api_call("https://pokeapi.co/api/v2/item/#{b}")["sprites"]["default"]

    c = rand_num.rand(30)
    api_name_2 = api_call("https://pokeapi.co/api/v2/item/#{c}")["name"]
    name_2 = api_call("https://pokeapi.co/api/v2/item/#{c}")["names"][7]["name"]
    effect_2 = api_call("https://pokeapi.co/api/v2/item/#{c}")["effect_entries"][0]["short_effect"]
    img_2 = api_call("https://pokeapi.co/api/v2/item/#{c}")["sprites"]["default"]

    Item.create(name: name, effect: effect, img_url: img, user_id: d, api_name: api_name, api_id: b)

    Item.create(name: name_2, effect: effect_2, img_url: img_2, user_id: d, api_name: api_name_2, api_id: c)
    d += 1
end


       
