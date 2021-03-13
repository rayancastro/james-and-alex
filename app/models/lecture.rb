class Lecture < ApplicationRecord
  has_many :registrations
  has_many :students, through: :registrations, source: :user

  validates :name, :start_date, :duration, :location, presence: true
end
