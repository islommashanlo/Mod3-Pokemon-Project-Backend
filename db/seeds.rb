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




    10.times do 
        User.create(name: Faker::Games::Dota.hero)
    end

    # i = 1

    # until i == 10 do
    #     poke_name = api_call("https://pokeapi.co/api/v2/pokemon/#{i}")["name"]
    #     poke_species = api_call("https://pokeapi.co/api/v2/pokemon/#{i}")["species"]["name"]
    #     poke_img = api_call("https://pokeapi.co/api/v2/pokemon/#{i}")["sprites"]["front_default"]
    #     Pokemon.create(name: poke_name, species: poke_species, img_url: poke_img, user_id: i)
    #     i += 1
    # end

    # Items

    
        
