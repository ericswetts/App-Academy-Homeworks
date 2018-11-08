class Houses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |p|
      p.string :address, null: false, unique: true
      p.timestamps
    end
  end
end
