class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :db_id
      t.string :imgurl
      t.string :fb_id
      t.string :auth_token

      t.timestamps
    end
  end
end
