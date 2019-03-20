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

# Unit tests for ApprovalAPIClient::StageApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'StageApi' do
  before do
    # run before each test
    @instance = ApprovalAPIClient::StageApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of StageApi' do
    it 'should create an instance of StageApi' do
      expect(@instance).to be_instance_of(ApprovalAPIClient::StageApi)
    end
  end

  # unit tests for list_stages_by_request
  # Return an array of stages by given request id
  # Return an array of stages by given request id
  # @param request_id Id of request
  # @param [Hash] opts the optional parameters
  # @return [StageOutCollection]
  describe 'list_stages_by_request test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for show_stage
  # Return an approval stage by given id
  # Return an approval stage by given id
  # @param id Query by id
  # @param [Hash] opts the optional parameters
  # @return [StageOut]
  describe 'show_stage test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
