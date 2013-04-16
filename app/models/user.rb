class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	# :registerable,:recoverable,
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  validates :role, :presence => true

  def self.no_admins
    where("role != ?", ROLES[2])
  end

  # get list of roles that user has access to
  # format: [ [name, value] ]
  def accessible_roles
    index = ROLES.index(self.role)
    roles = User::ROLES[0..index].map{|x| [x.humanize, x]} if index
    return roles
  end

  # use role inheritence
  ROLES = %w[author user_manager admin]
  def role?(base_role)
    if base_role && ROLES.index(base_role.to_s)
      return ROLES.index(base_role.to_s) <= ROLES.index(role)
    end
    return false
  end
end
