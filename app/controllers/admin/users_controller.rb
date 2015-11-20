class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = User.new()
  end

  def create
    if current_user.admin == true
      @user = User.new(user_params)
      @user.company = current_user.company
      if @user.save
        redirect_to(users_path, :notice => 'sucessfully created user.')
      else
        redirect_to(new_admin_user_path, :notice => 'You are not authorized to do this.')
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :account, :rscale_password
    )
  end

end
