class Lab < ApplicationRecord
  has_many :scientists

  def scientists_by_experiment_count
    scientists
      .joins(:scientist_experiments)
      .select("scientists.*, COUNT(scientists.id) as count")
      .group("scientists.id")
      .order("count DESC")
  end
end