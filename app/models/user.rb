class User < ActiveRecord::Base
  acts_as_authentic
  
  def has_role?(role)
    self.role == role
  end
end

