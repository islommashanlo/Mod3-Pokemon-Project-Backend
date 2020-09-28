class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :user_hp, default: 100
      t.integer :user_xp,  default:  0
      t.timestamps
    end
  end
end
