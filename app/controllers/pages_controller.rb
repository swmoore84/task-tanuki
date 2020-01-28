class PagesController < ApplicationController
  def home
    
    @tasks = Task.all
    
  end

  def dashboard
    @tasks = current_user.tasks.all
  end


end
