class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: "User"

  validates :name, presence: true 
  validates :description, presence: true, length: { minimum: 10  } 

  #upload file with carrerwave
  mount_uploader :attachment, AttachmentUploader
end
