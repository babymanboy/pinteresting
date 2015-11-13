class AddAttachmentImageToOrnaments < ActiveRecord::Migration
  def self.up
    change_table :ornaments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :ornaments, :image
  end
end
