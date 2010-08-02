class CreateBlogElems < ActiveRecord::Migration
  def self.up
    create_table :blog_elems do |t|
      t.string :title
      t.boolean :display_title
      t.integer :max_posts
      t.integer :max_age
      t.string :email_notice
      t.string :display_style
      t.string :commentability

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_elems
  end
end
