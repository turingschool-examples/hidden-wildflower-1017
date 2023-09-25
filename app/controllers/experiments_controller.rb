class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
  end
  
  def destroy
    experiment = Experiment.find(params[:id])

    experiment.destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end