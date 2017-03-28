class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :image_name
      t.string :image_location
      t.integer :user_id

      t.timestamps

    end
  end
end
