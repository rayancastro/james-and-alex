class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :registrations
  has_many :lectures, through: :registrations

  def full_name
    (first_name || last_name) ?
      "#{first_name&.capitalize} #{last_name&.capitalize}" :
      email
  end

  def registered?(lecture)
    lectures.include?(lecture)
  end

  def registration_for(lecture)
    registrations.find_by(lecture_id: lecture.id)
  end
end
