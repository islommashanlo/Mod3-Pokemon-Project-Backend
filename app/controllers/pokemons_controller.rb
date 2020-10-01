class PokemonsController < ApplicationController
    before_action :find_poke, only: [:edit, :update, :show]

    def show
        @pokemon
        render json: @pokemon
    end

    def index
        pokemons = Pokemon.all
        render json: pokemons
    end

    def create
        name = poke_params[:name]
        species = api_call("pokemon-species/#{poke_params[:species].downcase}/")["name"]
        img = api_call("pokemon/#{species}")["sprites"]["front_default"]
        user = poke_params[:user_id]
        api_id = poke_params[:api_id]
        new_pokemon = Pokemon.create(name: name, species: species, img_url: img, user_id: user, api_id: api_id)
        render json: new_pokemon
    end

    def update
        new_pokemon = @pokemon.update(poke_params)
        render json: new_pokemon
    end

    private 

    def find_poke 
        @pokemon = Pokemon.find(params[:id])
    end

    def poke_params
        params.require(:pokemon).permit(:name, :species, :img_url, :user_id, :api_id)
    end

end

#  api_call("https://pokeapi.co/api/v2/pokemon/1")
