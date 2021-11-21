class CreateTaskers < ActiveRecord::Migration[6.1]
  def change
    create_table :taskers do |t|
      t.string :task
      t.text :body
      t.text :status
      t.references :iteam
      t.timestamps
    end
  end
end
