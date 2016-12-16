class AddAttachmentRegistrationToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :registration
    end
  end

  def self.down
    remove_attachment :cars, :registration
  end
end
