class CreatePhotoGalleryElems < ActiveRecord::Migration
  def self.up
    create_table :photo_gallery_elems do |t|
      t.string :title
      t.boolean :display_title
      t.string :display_style

      t.timestamps
    end
  end

  def self.down
    drop_table :photo_gallery_elems
  end
end
