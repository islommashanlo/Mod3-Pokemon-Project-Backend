class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :species
      t.string :img_url
      t.string :user_id

      t.timestamps
    end
  end
end
