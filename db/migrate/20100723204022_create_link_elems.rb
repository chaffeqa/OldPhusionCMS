class CreateLinkElems < ActiveRecord::Migration
  def self.up
    create_table :link_elems do |t|
      t.string :name
      t.string :url
      t.string :target

      t.timestamps
    end
  end

  def self.down
    drop_table :link_elems
  end
end
