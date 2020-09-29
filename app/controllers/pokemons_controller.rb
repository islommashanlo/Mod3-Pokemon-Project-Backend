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
        Pokemon.create(name: name, species: species, img_url: img, user_id: user)
    end

    def update
        @pokemon.update(poke_params)
    end

    private 

    def find_poke 
        @pokemon = Pokemon.find(params[:id])
    end

    def poke_params
        params.require(:pokemon).permit(:name, :species, :img_url, :user_id)
    end

end

#  api_call("https://pokeapi.co/api/v2/pokemon/1")
