=begin
#Insights Service Approval APIs

#APIs to query approval service

OpenAPI spec version: 1.0.0
Contact: support@redhat.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 3.3.4

=end

require 'uri'

module ApprovalAPIClient
  class RequestApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Add an approval request by given parameters
    # Add an approval request by given parameters
    # @param workflow_id Id of workflow
    # @param request_in Parameters need to create a request
    # @param [Hash] opts the optional parameters
    # @return [RequestOut]
    def create_request(workflow_id, request_in, opts = {})
      data, _status_code, _headers = create_request_with_http_info(workflow_id, request_in, opts)
      data
    end

    # Add an approval request by given parameters
    # Add an approval request by given parameters
    # @param workflow_id Id of workflow
    # @param request_in Parameters need to create a request
    # @param [Hash] opts the optional parameters
    # @return [Array<(RequestOut, Fixnum, Hash)>] RequestOut data, response status code and response headers
    def create_request_with_http_info(workflow_id, request_in, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RequestApi.create_request ...'
      end
      # verify the required parameter 'workflow_id' is set
      if @api_client.config.client_side_validation && workflow_id.nil?
        fail ArgumentError, "Missing the required parameter 'workflow_id' when calling RequestApi.create_request"
      end
      # verify the required parameter 'request_in' is set
      if @api_client.config.client_side_validation && request_in.nil?
        fail ArgumentError, "Missing the required parameter 'request_in' when calling RequestApi.create_request"
      end
      # resource path
      local_var_path = '/workflows/{workflow_id}/requests'.sub('{' + 'workflow_id' + '}', workflow_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_in)
      auth_names = ['APIKey_auth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RequestOut')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RequestApi#create_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Return an array of approval requests
    # Return an array of requests
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :decision Fetch item by given decision (undecided, approved, denied)
    # @option opts [Array<String>] :state Fetch item by given state (pending, skipped, notified, finished)
    # @option opts [String] :requester Fetch item by given requester
    # @option opts [Integer] :limit How many items to return at one time (max 1000) (default to 20)
    # @option opts [Integer] :offset Starting Offset (default to 0)
    # @return [RequestOutCollection]
    def list_requests(opts = {})
      data, _status_code, _headers = list_requests_with_http_info(opts)
      data
    end

    # Return an array of approval requests
    # Return an array of requests
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :decision Fetch item by given decision (undecided, approved, denied)
    # @option opts [Array<String>] :state Fetch item by given state (pending, skipped, notified, finished)
    # @option opts [String] :requester Fetch item by given requester
    # @option opts [Integer] :limit How many items to return at one time (max 1000)
    # @option opts [Integer] :offset Starting Offset
    # @return [Array<(RequestOutCollection, Fixnum, Hash)>] RequestOutCollection data, response status code and response headers
    def list_requests_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RequestApi.list_requests ...'
      end
      if @api_client.config.client_side_validation && opts[:'decision'] && !opts[:'decision'].all? { |item| ['undecided', 'approved', 'denied'].include?(item) }
        fail ArgumentError, 'invalid value for "decision", must include one of undecided, approved, denied'
      end
      if @api_client.config.client_side_validation && opts[:'state'] && !opts[:'state'].all? { |item| ['pending', 'skipped', 'notified', 'finished'].include?(item) }
        fail ArgumentError, 'invalid value for "state", must include one of pending, skipped, notified, finished'
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling RequestApi.list_requests, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 20
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling RequestApi.list_requests, must be greater than or equal to 20.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling RequestApi.list_requests, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = '/requests'

      # query parameters
      query_params = {}
      query_params[:'decision'] = @api_client.build_collection_param(opts[:'decision'], :multi) if !opts[:'decision'].nil?
      query_params[:'state'] = @api_client.build_collection_param(opts[:'state'], :multi) if !opts[:'state'].nil?
      query_params[:'requester'] = opts[:'requester'] if !opts[:'requester'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['APIKey_auth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RequestOutCollection')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RequestApi#list_requests\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Return approval requests by given workflow id
    # Return approval requests by given workflow id
    # @param workflow_id Id of workflow
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many items to return at one time (max 1000) (default to 20)
    # @option opts [Integer] :offset Starting Offset (default to 0)
    # @return [RequestOutCollection]
    def list_requests_by_workflow(workflow_id, opts = {})
      data, _status_code, _headers = list_requests_by_workflow_with_http_info(workflow_id, opts)
      data
    end

    # Return approval requests by given workflow id
    # Return approval requests by given workflow id
    # @param workflow_id Id of workflow
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many items to return at one time (max 1000)
    # @option opts [Integer] :offset Starting Offset
    # @return [Array<(RequestOutCollection, Fixnum, Hash)>] RequestOutCollection data, response status code and response headers
    def list_requests_by_workflow_with_http_info(workflow_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RequestApi.list_requests_by_workflow ...'
      end
      # verify the required parameter 'workflow_id' is set
      if @api_client.config.client_side_validation && workflow_id.nil?
        fail ArgumentError, "Missing the required parameter 'workflow_id' when calling RequestApi.list_requests_by_workflow"
      end
      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling RequestApi.list_requests_by_workflow, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 20
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling RequestApi.list_requests_by_workflow, must be greater than or equal to 20.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling RequestApi.list_requests_by_workflow, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = '/workflows/{workflow_id}/requests'.sub('{' + 'workflow_id' + '}', workflow_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['APIKey_auth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RequestOutCollection')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RequestApi#list_requests_by_workflow\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Return an approval request by given id
    # Return an approval request by given id
    # @param id Query by id
    # @param [Hash] opts the optional parameters
    # @return [RequestOut]
    def show_request(id, opts = {})
      data, _status_code, _headers = show_request_with_http_info(id, opts)
      data
    end

    # Return an approval request by given id
    # Return an approval request by given id
    # @param id Query by id
    # @param [Hash] opts the optional parameters
    # @return [Array<(RequestOut, Fixnum, Hash)>] RequestOut data, response status code and response headers
    def show_request_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RequestApi.show_request ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling RequestApi.show_request"
      end
      # resource path
      local_var_path = '/requests/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['APIKey_auth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RequestOut')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RequestApi#show_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end
