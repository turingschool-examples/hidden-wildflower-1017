class Lab < ApplicationRecord
  has_many :scientists
  has_many :experiments, through: :scientists

  def scientist_with_experiment_count
    scientists.select("scientists.*, COUNT(experiments.id)")
    .joins(:experiments)
      .group("scientists.id")
      .order("count desc")
  end
end