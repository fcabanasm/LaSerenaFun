class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :owner, :boolean
  end
end
