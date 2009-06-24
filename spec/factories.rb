require 'sha1'
require 'factory_girl'

# collection of factory helper methods
module FactoryHelper
  # used to create a factory and use block to do any stubbing required
  def create_factory(symbol, params = {})
    factory = Factory.build(symbol, params)
    yield(factory)
    factory.save!

    factory
  end
end

Factory.sequence :name do |num|
  "name#{num}"
end

Factory.sequence :email do |num|
  "name#{num}@example.com"
end

Factory.define :user do |user|
  user.login                    { @name = Factory.next(:name) }
  user.name                     @name
  user.password                 'p@ssw0rd'
  user.password_confirmation    'p@ssw0rd'
  user.email                    { Factory.next(:email) }
end
