class ExperimentsController < ApplicationController

  before_action :set_experiment

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  private

  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(:name, :description, :results, :conclusion)
  end
end
