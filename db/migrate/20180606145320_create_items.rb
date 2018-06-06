class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :parent_id
      t.string :code
      t.string :name
      t.timestamp :created_on
      t.timestamp :updated_on
      t.text :data

      t.timestamps
    end
  end
end
