class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :effect
      t.string :img_url
      t.integer :user_id
      t.integer :api_id
      t.integer :api_name
      t.integer :amount, default: 1

      t.timestamps
    end
  end
end
