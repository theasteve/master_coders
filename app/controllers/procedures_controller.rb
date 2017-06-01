class ProceduresController < ApplicationController
  def show
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find(params[:experiment_id])
    @procedure = Procedure.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end
end
