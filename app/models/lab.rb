class Lab < ApplicationRecord
  has_many :scientists

  def scientists_with_exp_count
     Lab.find_by_sql(
      "select scientists.name, count(*) as exp_count from scientists
        inner join labs on labs.id = scientists.lab_id
        inner join experiment_scientists on experiment_scientists.scientist_id = scientists.id
        inner join experiments on experiment_scientists.experiment_id = experiments.id
        where labs.id = #{self.id}
      group by scientists.name
      order by exp_count desc;")
  end
end