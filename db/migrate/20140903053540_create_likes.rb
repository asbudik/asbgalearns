class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likes
      t.integer :user_likes_id
      t.references :shoutout

      t.timestamps
    end
  end
end
