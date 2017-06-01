class ObservationsController < ApplicationController
  before_action :set_experiment, only: [:new, :create, :show]
  
  def new
    @experiment = Experiment.find(params[:experiment_id])
    @observation = Observation.new
    render 'observations/new_e'
  end

  def create
  end


  def show
  end

  private

  def set_experiment
    @experiment = Experiment.find(params[:experiment_id])
  end
end
