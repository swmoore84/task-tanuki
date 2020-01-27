class PagesController < ApplicationController
  def home
    @tasks = Task.all
    @user = current_user
  end

  def dashboard
    @tasks = current_user.tasks.all
  end
end
