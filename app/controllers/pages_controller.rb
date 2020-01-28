class PagesController < ApplicationController
  def home
    # page_params
    @tasks = Task.all
    @user = current_user
  end

  def dashboard
    @tasks = current_user.tasks.all
  end

  # def page_params
  #   params.require(:user).permit(:photo)
  # end
end
