class TrainersController < ApplicationController
  before_action :authenticate_trainer!

  def update
    redirect_to(show.html.erb)
  end

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end



end
