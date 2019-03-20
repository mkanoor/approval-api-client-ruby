=begin
#Insights Service Approval APIs

#APIs to query approval service

OpenAPI spec version: 1.0.0
Contact: support@redhat.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for ApprovalAPIClient::UserOut
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'UserOut' do
  before do
    # run before each test
    @instance = ApprovalAPIClient::UserOut.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of UserOut' do
    it 'should create an instance of UserOut' do
      expect(@instance).to be_instance_of(ApprovalAPIClient::UserOut)
    end
  end
  describe 'test attribute "email"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end

