class Document < ActiveRecord::Base
  belongs_to :patient
  mount_uploader :attachment, AttachmentUploader
  
  before_save :update_attachment_attributes

  private

  def update_attachment_attributes
    if attachment.present? && attachment_changed?
      self.content_type = attachment.file.content_type
      self.file_size = attachment.file.size
    end
  end
end
