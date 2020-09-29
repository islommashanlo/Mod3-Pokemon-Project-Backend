class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location_id
      t.boolean :good?, default: true
      t.boolean :happened?, default: false
      t.timestamps
    end
  end
end
