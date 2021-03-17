class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :lectures, through: :bookings

  def full_name
    (first_name || last_name) ?
      "#{first_name&.capitalize} #{last_name&.capitalize}" :
      email
  end

  def registered?(lecture)
    lectures.include?(lecture)
  end

  def booking_for(lecture)
    bookings.find_by(lecture_id: lecture.id)
  end
end
