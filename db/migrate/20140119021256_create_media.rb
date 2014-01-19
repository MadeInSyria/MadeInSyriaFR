class CreateMedia < ActiveRecord::Migration
  def self.up
    create_table :media do |t|
      t.timestamps
    end
    add_attachment :media, :image
  end

  def self.down
    remove_attachment :media, :image
  end
end
