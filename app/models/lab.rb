class Lab < ApplicationRecord
  has_many :scientists
  has_many :scientist_experiments, through: :scientists
  has_many :experiments, through: :scientists

  def scientists_by_experiments
    scientists.joins(:experiments).select("scientists.*, (sum(scientists.id) / scientists.id) AS num_exp").group(:id).order(num_exp: :desc)
  end
end