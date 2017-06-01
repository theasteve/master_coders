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

    # redirect_to to experiment homepage
    
  end

  def edit

  end

  def update

  end
end
