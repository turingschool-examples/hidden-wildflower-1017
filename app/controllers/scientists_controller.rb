class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
    @lab = @scientist.lab
  end
end
