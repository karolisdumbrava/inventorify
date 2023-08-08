class CreateUserActivityLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_activity_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.string :entity
      t.integer :entity_id
      t.datetime :timestamp

      t.timestamps
    end
  end
end
