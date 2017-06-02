class ProposalsController < ApplicationController
  def index
      @proposals = Proposal.all
    end

    def show
      @proposal = Proposal.find(params[:id])
    end

    def new
      @proposal = Proposal.new
      redirect_to proposals_path unless logged_in?
    end

    def create
      @proposal = Proposal.new(proposal_params)
      if logged_in?
        @proposal.requestor = current_user
        @proposal.status = "open"
        if @proposal.save
          redirect_to @proposal
        else
          @errors = @proposal.errors.full_messages
          render :new
        end
      else
        redirect_to proposals_path
      end
    end

    def edit
      @proposal = Proposal.find(params[:id])
    end

    def update
      @proposal = Proposal.find(params[:id])

      if @proposal.update(proposal_params)
        redirect_to @proposal
      else
        render 'edit'
      end
    end

    private
      def proposal_params
         params.require(:proposal).permit(:summary, :hypothesis, :status, :title)
      end
end
