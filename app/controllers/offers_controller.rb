class OffersController < ApplicationController
  def create
    @offer = Offer.new
    @task = Task.find(params[:id])
    @offer.task = @task
    @user = current_user
    @offer.user = @user
    if @offer.save
      redirect_to home_path
    else
      redirect_to task_path(@task)
    end
  end

  # private

  # def offer_params
  #   params.require(:offer).permit(:status)
  # end
end
