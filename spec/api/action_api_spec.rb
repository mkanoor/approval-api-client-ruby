=begin
#Insights Service Approval APIs

#APIs to query approval service

OpenAPI spec version: 1.0.0
Contact: support@redhat.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 3.3.4

=end

require 'spec_helper'
require 'json'

# Unit tests for ApprovalAPIClient::ActionApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ActionApi' do
  before do
    # run before each test
    @instance = ApprovalAPIClient::ActionApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ActionApi' do
    it 'should create an instance of ActionApi' do
      expect(@instance).to be_instance_of(ApprovalAPIClient::ActionApi)
    end
  end

  # unit tests for create_action
  # Add an action to a given stage
  # Add an action to a given stage
  # @param stage_id Id of stage
  # @param action_in Action object that will be added
  # @param [Hash] opts the optional parameters
  # @return [ActionOut]
  describe 'create_action test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for list_actions_by_stage
  # Return actions in a given stage
  # List all actions of a stage
  # @param stage_id Id of stage
  # @param [Hash] opts the optional parameters
  # @return [ActionOutCollection]
  describe 'list_actions_by_stage test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for show_action
  # Return an user action by id
  # Return an user action by id
  # @param id Query by id
  # @param [Hash] opts the optional parameters
  # @return [ActionOut]
  describe 'show_action test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
