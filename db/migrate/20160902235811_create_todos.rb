class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :task
      t.date :deadline
      t.boolean :completed
      t.text :more_details

      t.timestamps null: false
    end
  end
end
