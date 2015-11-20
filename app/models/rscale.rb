 require 'rubygems'
 require 'pp' # Require pretty print Ruby gem
 require 'right_api_client' # RightScale API client gem
 require 'rest-client'
 require 'httparty'

class Rscale
  include ActiveModel::Model
  attr_accessor :email, :password, :account

  def initialize(user_params)
    @email = user_params['email']
    @password = user_params['password']
    @account = user_params['account']
  end

  def client
    @client ||= RightApi::Client.new(:email => @email, :password => @password, \
      :account_id => @account)
    rescue RestClient::Exception
      "error"
  end

  def current_servers
    @current_servers ||= client.deployments.index
  end

  def create_deployment
    # name = "deployment[name]"
    # desc = "deployment[description]"
    # HTTParty.post("https://my.rightscale.com/api/deployments",\
    #   :body => { name => "patest4", desc => "patest4"},\
    #   :headers => { 'X-Api-Version'=> api_version, 'cookie' => mycookie})
  end

  private


  def mycookie
    mycookie ||= client.last_request[:request].headers[:cookie]
  end

  def api_version
    api_version ||= client.last_request[:request].headers['X-Api-Version']
  end
end
