class ScientistsExperimentsController < ApplicationController

  def destroy
    @scientist = Scientist.find(params[:scientist_id])
    @experiment = Experiment.find(params[:id])

    @scientists_experoments = ScientistsExperiment.find_by(scientist_id: @scientist.id, experiment_id: @experiment.id)

    @scientists_experoments.destroy
    redirect_to scientist_path(@scientist)
  end
end