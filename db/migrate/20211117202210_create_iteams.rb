class CreateIteams < ActiveRecord::Migration[6.1]
  def change
    create_table :iteams do |t|
      t.string :title
      t.text :text
      t.string :status
      t.integer :parent_id
      t.timestamps
    end
  end
end
