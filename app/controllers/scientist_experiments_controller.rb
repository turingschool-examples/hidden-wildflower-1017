class ScientistExperimentsController < ApplicationController 

def destroy
  @scientist = Scientist.find(params[:scientist_id])
  @experiment = @scientist.experiments.find(params[:id])
  @scientist_experiment = ScientistExperiment.find(params[:scientist_id, ])
  @scientist_experiment.destroy
  redirect_to scientist_path(@scientist_experiment.scientist)
end

end