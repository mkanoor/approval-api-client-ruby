=begin
#Insights Service Approval APIs

#APIs to query approval service

The version of the OpenAPI document: 1.2.0
Contact: support@redhat.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.2

=end

require 'cgi'

module ApprovalApiClient
  class ActionApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Add an action to a given request
    # Add an action to a given request. Admin can do approve, deny, memo, and cancel operations; approver can do approve, deny and memo operations; while requester can do only cancel operation.
    # @param request_id [String] Id of request
    # @param action [Action] Action object that will be added
    # @param [Hash] opts the optional parameters
    # @return [Action]
    def create_action(request_id, action, opts = {})
      data, _status_code, _headers = create_action_with_http_info(request_id, action, opts)
      data
    end

    # Add an action to a given request
    # Add an action to a given request. Admin can do approve, deny, memo, and cancel operations; approver can do approve, deny and memo operations; while requester can do only cancel operation.
    # @param request_id [String] Id of request
    # @param action [Action] Action object that will be added
    # @param [Hash] opts the optional parameters
    # @return [Array<(Action, Integer, Hash)>] Action data, response status code and response headers
    def create_action_with_http_info(request_id, action, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ActionApi.create_action ...'
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling ActionApi.create_action"
      end
      pattern = Regexp.new(/^\d+$/)
      if @api_client.config.client_side_validation && request_id !~ pattern
        fail ArgumentError, "invalid value for 'request_id' when calling ActionApi.create_action, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'action' is set
      if @api_client.config.client_side_validation && action.nil?
        fail ArgumentError, "Missing the required parameter 'action' when calling ActionApi.create_action"
      end
      # resource path
      local_var_path = '/requests/{request_id}/actions'.sub('{' + 'request_id' + '}', CGI.escape(request_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(action) 

      # return_type
      return_type = opts[:return_type] || 'Action' 

      # auth_names
      auth_names = opts[:auth_names] || ['Basic_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ActionApi#create_action\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List all actions of a request
    # Return actions in a given request, available for admin/approver
    # @param request_id [String] Id of request
    # @param [Hash] opts the optional parameters
    # @return [ActionCollection]
    def list_actions_by_request(request_id, opts = {})
      data, _status_code, _headers = list_actions_by_request_with_http_info(request_id, opts)
      data
    end

    # List all actions of a request
    # Return actions in a given request, available for admin/approver
    # @param request_id [String] Id of request
    # @param [Hash] opts the optional parameters
    # @return [Array<(ActionCollection, Integer, Hash)>] ActionCollection data, response status code and response headers
    def list_actions_by_request_with_http_info(request_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ActionApi.list_actions_by_request ...'
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling ActionApi.list_actions_by_request"
      end
      pattern = Regexp.new(/^\d+$/)
      if @api_client.config.client_side_validation && request_id !~ pattern
        fail ArgumentError, "invalid value for 'request_id' when calling ActionApi.list_actions_by_request, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/requests/{request_id}/actions'.sub('{' + 'request_id' + '}', CGI.escape(request_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'ActionCollection' 

      # auth_names
      auth_names = opts[:auth_names] || ['Basic_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ActionApi#list_actions_by_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Return an user action by id
    # Return an user action by id, available to all
    # @param id [String] Query by id
    # @param [Hash] opts the optional parameters
    # @return [Action]
    def show_action(id, opts = {})
      data, _status_code, _headers = show_action_with_http_info(id, opts)
      data
    end

    # Return an user action by id
    # Return an user action by id, available to all
    # @param id [String] Query by id
    # @param [Hash] opts the optional parameters
    # @return [Array<(Action, Integer, Hash)>] Action data, response status code and response headers
    def show_action_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ActionApi.show_action ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ActionApi.show_action"
      end
      pattern = Regexp.new(/^\d+$/)
      if @api_client.config.client_side_validation && id !~ pattern
        fail ArgumentError, "invalid value for 'id' when calling ActionApi.show_action, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/actions/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'Action' 

      # auth_names
      auth_names = opts[:auth_names] || ['Basic_auth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ActionApi#show_action\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
