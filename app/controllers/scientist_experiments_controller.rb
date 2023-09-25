class ScientistExperimentsController < ApplicationController
    def destroy
      scientist = Scientist.find(params[:scientist_id])
      experiment = Experiment.find(params[:experiment_id])
  
      ScientistExperiment.find_by(scientist: scientist, experiment: experiment).destroy
  
      redirect_to "/scientists/#{scientist.id}"
    end
  end