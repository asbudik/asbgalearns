class AddSummaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :summary, :text
    add_column :users, :website_one, :string
    add_column :users, :website_two, :string
  end
end
