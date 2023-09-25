class Lab < ApplicationRecord
  has_many :scientists
  
  def scientists_descending
    scientists.joins(:experiments).select("scientists.*, experiments.count as experiment_count").group("scientists.id").order("experiment_count desc")
  end
end