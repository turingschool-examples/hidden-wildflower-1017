class Lab < ApplicationRecord
  has_many :scientists
  has_many :experiments, through: :scientists

  def scientists_ordered_by_experiment_count
    scientists.joins(:experiments)
              .select('scientists.*, COUNT(experiments.id) as experiment_count')
              .group('scientists.id')
              .order('experiment_count DESC')
  end
end