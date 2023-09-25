class Experiment < ApplicationRecord
  validates_presence_of :name,
                        :objective,
                        :num_months
                        
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments


  def self.long
    where("num_months > ?", 5)
    .order("num_months DESC")
  end
end
