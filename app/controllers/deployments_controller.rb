class DeploymentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    deployments = Deployment.where(company: user.company)
    @deployments = user.deployments
  end

  def show
    @deployment = user.deploy
  end

  def new
    user
    @deployment = Deployment.new()
  end

  def create
    binding.pry
    deployment = user.deployments.create(deployment_params)
    if deployment.present?
      rscale = rscale_client.create_deployment(deploy_name, deploy_desc)
    end
    deployment_notices(rscale,deployment)
  end

  private

  def rscale_client
    @rscale_client = Rscale.new(user.email, user.rscale_password, user.account)
  end

  def deployment_notices(input1,input2)
    if input1 != "error" && input2.save
      redirect_to(user_deployment_path(deploy[0].id), :notice => 'sucessfully created deployment.')
    else
      redirect_to(new_user_deployment_path, :notice => 'You are not authorized to do this.')
    end
  end

  def user
    @user ||= User.find(params[:user_id]) || current_user
  end

  def deploy
    @deploy ||= Deployment.where(name: deploy_name)
  end

  def deploy_name
    @deploy_name ||= deployment_params["name"]
  end

  def deploy_desc
    @deploy_desc ||= deployment_params["description"]
  end

  def deployment_params
    params.require(:deployment).permit(
      :user_id, :name, :description
    )
  end

end
