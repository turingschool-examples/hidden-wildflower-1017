class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
    @lab = @scientist.lab_name
    @experiments = @scientist.experiments
  end
end