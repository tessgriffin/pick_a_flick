class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :username
      t.string :email
      t.string :image_url
      t.string :phone

      t.timestamps null: false
    end
  end
end
