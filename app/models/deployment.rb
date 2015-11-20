class Deployment < ActiveRecord::Base
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  validates_presence_of :name
end
