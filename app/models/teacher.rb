class Teacher < ActiveRecord::Base
  validates :name, :username, :email, :password, presence: true
  has_secure_password
  has_many :students
  has_many :entries, through: :students
end
