require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :following_user, class: User do |u|
  u.name 'Follow User'
  u.email 'follow@test.com'
  u.password 'follow'
end

Factory.define :first_user, class: User do |u|
  u.name 'First User'
  u.email 'first@test.com'
  u.password 'first'
end

Factory.define :second_user, class: User do |u|
  u.name 'Second User'
  u.email 'second@test.com'
  u.password 'second'
end

Factory.define :category do |c|
  c.name "Wood"
end

Factory.define :message do |m|
  m.title "Hello"
  m.content "World"
end