class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :reason
      t.integer :recipient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
