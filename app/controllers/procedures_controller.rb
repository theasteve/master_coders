class ProceduresController < ApplicationController
  def show
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find(params[:experiment_id])
    @procedure = Procedure.find(params[:id])
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    # redirect_to to experiment homepage

  end

  def edit

  end

  def update

  end

  private
    def procedure_params
      params.require(:procedure).permit(:title, :steps, :experiment)
    end
end
