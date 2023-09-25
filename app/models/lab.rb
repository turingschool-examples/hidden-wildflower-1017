class Lab < ApplicationRecord
  has_many :scientists

  def scientists_by_experiment_count
    scientists
      .left_joins(:scientist_experiments)
      .select("scientists.*, COUNT(scientist_experiments.id) as experiment_count")
      .group("scientists.id")
      .order("experiment_count DESC")
  end
end