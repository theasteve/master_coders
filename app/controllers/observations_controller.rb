class ObservationsController < ApplicationController
  before_action :set_experiment, only: [:new, :create, :show]

  def new
    @observation = Observation.new
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find(params[:experiment_id])
    if request.path_info.include?("procedures")

      @procedure = Procedure.find(params[:procedure_id])
      @form_params = [@proposal, @experiment,@procedure,@observation]
    else
      @form_params = [@proposal, @experiment, @observation]
    end

    render 'observations/new'
  end

  def create
    @observation = Observation.new(observation_params)

    if @observation.save

      if request.path_info.include?("procedures")
        redirect_to "/proposals/#{params[:proposal_id]}/experiments/#{params[:experiment_id]}/procedures"
        # correct_path = response.request_path.split('/')
        # correct_path.delete(-1)
        # correct_path.join("/")
        # redirect_to correct_path
      else
         redirect_to "/proposals/#{params[:proposal_id]}/experiments/#{params[:experiment_id]}"
      end
    else
        render 'observations/new'
    end
  end


  def show
  end

  private

  def set_experiment
    @experiment = Experiment.find(params[:experiment_id])
  end

  def observation_params
    params.require(:observation).permit(:body, :observable_type, :observable_id)
  end
end
