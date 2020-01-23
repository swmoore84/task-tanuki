class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :category
      t.integer :price
      t.date :due_date
      t.boolean :remote_job
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
