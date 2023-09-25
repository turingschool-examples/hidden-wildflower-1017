class Lab < ApplicationRecord
  has_many :scientists
  has_many :experiments, through: :scientists

  def with_count
    scientists
    .joins(:experiments)
    .select("scientists.*, COUNT(experiments.*)")
    .group("scientists.id")
    .order("count DESC")
  end
end