class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many :attachments, dependent: :destroy

  validates :name, presence: true 
  validates :description, presence: true, length: { minimum: 10  } 

  #upload file with carrerwave
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
end
