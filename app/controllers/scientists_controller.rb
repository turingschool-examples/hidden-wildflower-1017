class ScientistsController < ApplicationController
  def show
    @scientists = Scientist.find(params[:id])
  end


end