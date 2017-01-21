class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :bio
      t.string :location

      t.timestamps(null: false)
    end
  end
end
