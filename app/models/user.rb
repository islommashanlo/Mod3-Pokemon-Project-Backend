class User < ApplicationRecord
    has_many :pokemons
    has_many :items

    validates :name, uniqueness: true

end
