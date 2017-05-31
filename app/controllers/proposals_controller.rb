class ProposalsController < ApplicationController
  def index
      # @proposals = Proposal.all
    end

    def show
      # @proposal = Proposal.find(proposal_params)
      # @experiment = Experiment.find_by(proposal_id: @proposal.id)
    end

    def new
      # @proposal = Proposal.new
    end

    def create

    end

    def edit
    end

    def update

    end

    private
      def proposal_params
         params.require(:proposal).permit(:summary, :hypothesis, :status, :title)
      end
end
