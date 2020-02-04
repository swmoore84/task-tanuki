class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @offer = Offer.new
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def create
    @task = Task.new(task_params)
    @user = current_user
    @task.user = @user
    if @task.save
      redirect_to task_path(@task)
    else
      render 'tasks/new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.offers.where(status: "pending").each do |offer|
      offer.update(status: "declined")
    end
    @task.destroy
    redirect_to dashboard_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :category, :description, :price, :remote_job, :location, :due_date, :photo)
  end
end
