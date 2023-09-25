class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
    @scientist_experiments = ScientistExperiment.all
  end
end