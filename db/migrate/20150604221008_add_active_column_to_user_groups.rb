class AddActiveColumnToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :active, :boolean, default: false
  end
end
