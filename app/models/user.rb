class User < ApplicationRecord
  scope :excluding_archived, -> { where(archived_at: nil) }

  def archive
    self.update(archived_at: Time.now)
  end

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
