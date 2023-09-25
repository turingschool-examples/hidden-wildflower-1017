class Lab < ApplicationRecord
  has_many :scientists

  def scientists_with_experiments
    scientists.select('scientists.*, count(experiments.id) as count').joins(:experiments).group(:id).order('count desc')
  end
end