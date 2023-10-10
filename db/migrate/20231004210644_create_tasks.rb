class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :status_id, null: false
      t.string :taskname, null: false
      t.integer :category_id, null: false
      t.integer :schedule_id, null: false
      t.integer :point, null: false
      t.references :user, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true



      t.timestamps
    end
  end
end
