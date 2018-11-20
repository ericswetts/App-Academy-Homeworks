class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name, null: false, unique: true
      t.integer :toyable_id
      t.references :toyable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
