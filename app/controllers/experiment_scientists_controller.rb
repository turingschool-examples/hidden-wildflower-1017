class ExperimentScientistsController < ApplicationController
  def destroy
    ExperimentScientist
    .where("scientist_id = #{params[:scientist_id]} and experiment_id = #{params[:id]}")
    .first
    .destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end