class User < ActiveRecord::Base
  acts_as_authentic
  
  ROLES = %w[attendee speaker organizer]
  
  def has_role?(role)
    roles.include? role
  end
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def has_awesome?
    true
  end
  
  def role_symbols
    roles.map(&:to_sym)
  end
end

