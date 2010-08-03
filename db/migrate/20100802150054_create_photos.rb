class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.belongs_to :photo_gallery_elem
      t.string :caption
      t.text :description
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.datetime :image_updated_at
      t.integer :order_number

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
