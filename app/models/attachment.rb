class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true
  mount_uploader :attachment_name, AvatarUploader
end
