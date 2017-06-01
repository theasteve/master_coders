class ExperimentsController < ApplicationController

  before_action :set_proposal
  before_action :set_experiment, except: [:create, :new]

  def show
  end

  def new
    @experiment = Experiment.new
    redirect_to proposal_path(@proposal) unless logged_in? && !@proposal.experiment
  end

  def edit
    redirect_to proposal_experiment_path(@experiment.proposal, @experiment) unless experimentor?(@proposal)
  end

  def create
    @experiment = Experiment.new(experiment_params)
    if logged_in? && !@proposal.experiment
      @proposal.assign_attributes(experimentor_id: current_user.id)
      @experiment.proposal = @proposal
      if @experiment.save
        @proposal.status = "in progress"
        @proposal.save
        redirect_to @proposal
      else
        render 'new'
      end
    else
      redirect_to proposal_path(@proposal)
    end
  end

  def update
    if experimentor?(@proposal)
      if @experiment.update(experiment_params)
        @proposal.update_attributes(status: "closed") if @experiment.results != "" || @experiment.conclusion != ""
        redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
      end
    else
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
