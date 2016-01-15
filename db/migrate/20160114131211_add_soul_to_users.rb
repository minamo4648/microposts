class AddSoulToUsers < ActiveRecord::Migration
  def change
    add_column :users, :soul, :string
  end
end
