class ObservationsController < ApplicationController
  def new
    @experiment = Experiment.find(params[:experiment_id])
    @observation = Observation.new
    render 'observations/new_e'
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
