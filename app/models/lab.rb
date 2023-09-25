class Lab < ApplicationRecord
  has_many :scientists
  has_many :experiments, through: :scientists

  def scientists_number_of_experiments
    scientists.joins(:experiments)
    .select("scientists.*, count(experiments) as experiment_count")
    .group("scientists.id")
    .order("experiment_count DESC")
    # require 'pry';binding.pry
  end
end