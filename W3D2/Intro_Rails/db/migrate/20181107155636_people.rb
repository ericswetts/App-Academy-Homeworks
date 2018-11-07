class People < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |p|
    p.string :name, null: false
    p.string :house, null: false
    p.timestamps
    end
  end
end
