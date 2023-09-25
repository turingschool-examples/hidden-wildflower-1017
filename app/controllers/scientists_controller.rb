class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
  end

  def destroy
    scientist = Scientist.find(params[:id])
    # require 'pry'; binding.pry
    experiemnt = scientist.experiements.find(params[:experiement_id])
  end
end