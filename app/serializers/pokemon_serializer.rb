class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :img_url, :user_id


end
