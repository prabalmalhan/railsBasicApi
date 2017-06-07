class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :eid
      t.string :title
      t.string :type
      t.string :videourl
      t.string :videoid
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
