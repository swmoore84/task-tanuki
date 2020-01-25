class PagesController < ApplicationController
  def home
    @tasks = Task.all
    @user = current_user
  end
end
