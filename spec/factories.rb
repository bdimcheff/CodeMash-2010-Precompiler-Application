Factory.define(:user) do |u|
  u.login 'testuser'
  u.email 'foo@example.org'
  u.password 'testpw'
  u.password_confirmation 'testpw'
end

# Factory.define(:speaker, :parent => :user) do |u|
#   u.role 'speaker'
# end