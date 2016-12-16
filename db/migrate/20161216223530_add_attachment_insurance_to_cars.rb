class AddAttachmentInsuranceToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :insurance
    end
  end

  def self.down
    remove_attachment :cars, :insurance
  end
end
