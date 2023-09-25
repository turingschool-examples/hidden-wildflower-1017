class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:scientist_id])
  end
end
