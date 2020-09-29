class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_hp, :max_hp, :pokemons, :items

  def pokemons
    self.object.pokemons.map do |pokemon|
      pokemon
    end
  end

end
