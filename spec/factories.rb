require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :category do |c|
  c.name "Wood"
end

Factory.define :message do |m|
  m.title "Hello"
  m.content "World"
end