class Entry < ActiveRecord::Base
  validates :title, :content, presence: true
  belongs_to :student
  belongs_to :teacher
end
