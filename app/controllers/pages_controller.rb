class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @tasks = Task.all
  end

  def dashboard
    @tasks = current_user.tasks.all
  end


end
