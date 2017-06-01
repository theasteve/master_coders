class ExperimentsController < ApplicationController

  before_action :set_proposal
  before_action :set_experiment, except: [:create, :new]

  def show
  end

  def new
    @experiment = Experiment.new
  end

  def edit
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @experiment.proposal = @proposal
    if @experiment.save
      @proposal.status = "in progress"
      @proposal.save
      redirect_to @proposal
    else
      render 'new'
    end
  end

  def update
    if @experiment.update(experiment_params)
      redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end

  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(:name, :description, :results, :conclusion)
  end
end
