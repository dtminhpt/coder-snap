class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :user_id
      t.integer :blocked_id

      t.timestamps null: false
    end
  end
end
