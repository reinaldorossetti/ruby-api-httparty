require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'

@rspec_yml = YAML.load_file("#{Dir.pwd}/spec/support/rspec.yml")
@ambiente = @rspec_yml['ambiente']
CONFIG = YAML.load_file("#{Dir.pwd}/spec/support/data/#{@ambiente}.yml")

# referencia de onde esta o arquivo com o modulo contato
require_relative 'services/criar_service.rb'

RSpec.configure do |config|

  #modulo esta como global 
  include Service # cria o serviço.
  include User
  config.color = true
  config.formatter = :documentation

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
