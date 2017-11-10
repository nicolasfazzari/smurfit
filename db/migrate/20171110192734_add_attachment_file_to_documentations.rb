class AddAttachmentFileToDocumentations < ActiveRecord::Migration
  def self.up
    change_table :documentations do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :documentations, :file
  end
end
