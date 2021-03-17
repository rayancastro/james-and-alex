class Lecture < ApplicationRecord
  has_many :registrations
  has_many :students, through: :registrations, source: :user

  validates :name, :max_leads, :max_follows, :start_date, :duration, :location, presence: true
  validates :max_leads, :max_follows, numericality: { greater_than_or_equal_to: 0 }
  def leads
    students.where("registrations.role = 'Lead'")
  end

  def follows
    students.where("registrations.role = 'Follow'")
  end

  def available_roles
    roles = []
    roles << "Lead" unless leads.count >= max_leads
    roles << "Follow" unless leads.count >= max_follows
  end

  def has_passed?
    DateTime.now > start_date
  end

  def upcoming?
    DateTime.now < start_date
  end
end
