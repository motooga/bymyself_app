class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :total_point, null: false
      t.references :user, foreign_key: true
      t.timestamps
     
    end
  end
end
