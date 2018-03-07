class Student < ActiveRecord::Base
  validates :name, :email, presence: true
  belongs_to :teacher
  has_many :entries
end
