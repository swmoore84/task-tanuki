class PagesController < ApplicationController
  def home
  end

  def dashboard
    @tasks = current_user.tasks.all
  end
end
