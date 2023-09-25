class Lab < ApplicationRecord
  has_many :scientists

  # def scientists_ordered_by_experiment_count
  #   scientists
  #   .select('scientists.id, count(experiments.id) as experiment_count')
  #   .joins(:scientist_experiments)
  #   .where('scientist_experiments.scientist_id = ?', self.id)
  #   .group('scientists.id')
  #   .order('experiment_count desc')
  # end
end