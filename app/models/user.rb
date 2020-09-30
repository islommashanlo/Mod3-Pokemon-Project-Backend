class User < ApplicationRecord
    has_many :pokemons, dependent: :destroy
    has_many :items, dependent: :destroy

    validates :name, uniqueness: true

    def take_low_damage
        dmg_range = (1..10).to_a
        dmg = dmg_range.sample

        self.current_hp -= dmg
    end

    def take_med_damage
        dmg_range = (11..25).to_a
        dmg = dmg_range.sample

        self.current_hp -= dmg
    end

    def take_high_damage
        dmg_range = (26..50).to_a
        dmg = dmg_range.sample

        self.current_hp -= dmg
    end

    def lose_pokemon(name, species, user_id)
        self.pokemons.map{|e|name == e.name && species == e.species && user_id.to_i == self.id}.each{|e|e.destroy}
    end

end
