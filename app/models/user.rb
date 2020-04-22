class User < ApplicationRecord
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
