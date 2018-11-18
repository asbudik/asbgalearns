class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :url
      t.string :title
      t.string :date

      t.timestamps
    end
  end
end
