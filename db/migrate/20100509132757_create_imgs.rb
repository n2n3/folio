class CreateImgs < ActiveRecord::Migration
  def self.up
    create_table :imgs do |t|
      t.string :comment
      t.string :name
      t.string :by
      t.string :content_type
      # if using mysql, blobs default to 64k, so we an explicit
      # size to extend them
      t.binary :data, :limit => 1.megabyte

      t.timestamps
    end
  end

  def self.down
    drop_table :imgs
  end
end
