class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_hp, :max_hp, :pokemons, :items, :score

  def pokemons
    self.object.pokemons.map do |pokemon|
      pokemon
    end
  end

  def score

    items_count = self.object.items.sum{|e|e.amount}
    poke_count = self.object.pokemons.count

    total = ((items_count*0.15) + (poke_count*0.7)).round(2)

  end

end
