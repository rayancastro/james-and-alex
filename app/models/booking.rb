class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lecture

  ROLES = %w(Lead Follow)

  validates :role, presence: true, inclusion: { in: ROLES,
    message: "%{value} is not a valid role" }
  validates :user, uniqueness: { scope: :lecture, message: "has already registered to this lecture" }

  def available_roles
    lecture.available_roles
  end
end
