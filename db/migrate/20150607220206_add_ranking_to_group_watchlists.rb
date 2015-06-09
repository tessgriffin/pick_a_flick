class AddRankingToGroupWatchlists < ActiveRecord::Migration
  def change
    add_column :group_watchlists, :ranking, :integer, default: 50
  end
end
