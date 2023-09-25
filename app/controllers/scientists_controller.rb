class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
    # require 'pry'; binding.pry
  end
end