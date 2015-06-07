class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :group_watchlist, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :vote

      t.timestamps null: false
    end
  end
end
