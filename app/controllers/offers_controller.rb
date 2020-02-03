class OffersController < ApplicationController
  def create
    @offer = Offer.new
    @task = Task.find(params[:id])
    @offer.task = @task
    @user = current_user
    @offer.user = @user
    if @offer.save
      redirect_to offers_success_path
    else
      redirect_to task_path(@task)
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def accept_offer
    @offer = Offer.find(params[:id])
    @offer.update(status: "active")
    @offer.task.offers.where(status: "pending").each do |offer|
      offer.update(status: "declined")
    end
    redirect_to dashboard_path
  end

  def mark_complete
    @offer = Offer.find(params[:id])
    @offer.update(status: "complete")
    redirect_to dashboard_path
  end

  def success
  end

  # private

  # def offer_params
  #   params.require(:offer).permit(:status)
  # end
end
