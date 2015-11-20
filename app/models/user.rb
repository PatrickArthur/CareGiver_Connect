class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, email: true, presence: true, uniqueness: true
  validates_presence_of :rscale_password
  has_many :deployments
end
