class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
    @lab = @scientist.lab
    @experiments = @scientist.experiments
  end
end