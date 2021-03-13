class Lecture < ApplicationRecord
  has_many :registrations
  has_many :students, through: :registrations, class_name: 'User'

  validates :name, :start_date, :duration, :location, presence: true
end
