class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :current_hp, default: 100
      t.integer :max_hp,  default:  100
      t.timestamps
    end
  end
end
