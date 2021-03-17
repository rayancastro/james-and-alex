class Lecture < ApplicationRecord
  has_many :bookings
  has_many :students, through: :bookings, source: :user

  validates :name, :max_leads, :max_follows, :start_date, :duration, :location, presence: true
  validates :max_leads, :max_follows, numericality: { greater_than_or_equal_to: 0 }
  def leads
    students.where("bookings.role = 'Lead'")
  end

  def follows
    students.where("bookings.role = 'Follow'")
  end

  def available_roles
    roles = []
    roles << "Lead" if available_lead_slots?
    roles << "Follow" if available_follow_slots?
    roles
  end

  def available_lead_slots?
    leads.count < max_leads
  end

  def available_follow_slots?
    follows.count < max_follows
  end

  def has_passed?
    DateTime.now > start_date
  end

  def upcoming?
    DateTime.now < start_date
  end
end
