class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true
      t.text :content
      t.string :image
      t.integer :parent_message_id 

      t.timestamps
    end
  end
end
