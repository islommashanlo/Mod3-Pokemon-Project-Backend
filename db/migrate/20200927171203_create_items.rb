class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :effect
      t.string :img_url
      t.string :user_id
      t.integer :amount, default: 1

      t.timestamps
    end
  end
end