class AddWatchedColumnToUserWatchlist < ActiveRecord::Migration
  def change
    add_column :user_watchlists, :watched, :boolean, default: false
  end
end
