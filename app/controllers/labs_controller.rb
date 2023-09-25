class LabsController < ApplicationController
  def show
    @lab = Lab.find(params[:lab_id])
    @scientists = @lab.scientists_ordered_by_experiment_count
  end
end
