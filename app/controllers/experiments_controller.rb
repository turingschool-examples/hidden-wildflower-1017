class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
  end
  
  def destroy
    ExperimentScientist.find_by(experiment_id: params[:id], scientist_id: params[:scientist_id]).destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end