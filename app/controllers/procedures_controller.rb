class ProceduresController < ApplicationController
  before_action :set_experiment, only: [:show, :create]
  before_action :set_procedure, only: [:show]
  before_action :set_proposal, only: [:show]

  def show
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.experiment = @experiment

    if @procedure.save
      redirect_to proposal_experiment_path(@experiment.proposal, @experiment)
    else
      @errors = @procedure.errors.full_messages
      render :new
    end
  end

  private
    def procedure_params
      params.require(:procedure).permit(:title, :steps, :experiment)
    end

    def set_proposal
      @proposal = Proposal.find(params[:proposal_id])
    end

    def set_experiment
      @experiment = Experiment.find(params[:experiment_id])
    end

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end
end
