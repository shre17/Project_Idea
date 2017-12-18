class Idea < ApplicationRecord
  belongs_to :user, optional: true
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, 
  reject_if: :all_blank, allow_destroy: true
  # mount_uploader :idea_attachment, AvatarUploader
end
