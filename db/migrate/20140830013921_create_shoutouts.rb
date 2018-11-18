class CreateShoutouts < ActiveRecord::Migration
  def change
    create_table :shoutouts do |t|
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
