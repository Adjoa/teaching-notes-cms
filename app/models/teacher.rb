class Teacher < ActiveRecord::Base
  validates :name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_secure_password
  has_many :students
  has_many :entries, through: :students
end
