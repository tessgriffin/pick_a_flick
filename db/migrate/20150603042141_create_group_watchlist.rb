class CreateGroupWatchlist < ActiveRecord::Migration
  def change
    create_table :group_watchlists do |t|
      t.references :group, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
    end
  end
end
