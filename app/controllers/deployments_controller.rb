class DeploymentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    deployments = Deployment.where(company: user.company)
    @deployments = user.deployments
  end

  def show
    deployment = Deployment.find(params[:id])
    @deployment = user.deployment
  end

  def new
    user
    @deployment = Deployment.new()
  end

  def create
  end

  private

  def user
    @user ||= User.find(params[:user_id]) || current_user
  end

  def deployment
    @deployment ||= Deployment.find(params[:id]) || current_user
  end

  def user_params
    params.require(:user).permit(
      :name, :description
    )
  end

end
