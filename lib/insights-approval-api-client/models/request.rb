=begin
#Insights Service Approval APIs

#APIs to query approval service

The version of the OpenAPI document: 1.2.0
Contact: support@redhat.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.2

=end

require 'date'

module ApprovalApiClient
  # Approval request. It may have child requests. Only a leaf node request can have workflow_id
  class Request
    attr_accessor :id

    # The state of the request. Possible value: canceled, completed, failed, notified, skipped, or started
    attr_accessor :state

    # Approval decision. Possible value: undecided, approved, canceled, denied, or error
    attr_accessor :decision

    # Reason for the decision. Optional. Present normally when the decision is denied
    attr_accessor :reason

    # Associate workflow id. Available only if the request is a leaf node
    attr_accessor :workflow_id

    # Timestamp of creation
    attr_accessor :created_at

    # Timestamp of notification sent to approvers
    attr_accessor :notified_at

    # Timestamp of finishing (skipped, canceled, or completed)
    attr_accessor :finished_at

    # Number of child requests
    attr_accessor :number_of_children

    # Number of finished child requests
    attr_accessor :number_of_finished_children

    # Requester's id
    attr_accessor :owner

    # Requester's full name
    attr_accessor :requester_name

    # Request name
    attr_accessor :name

    # Request description
    attr_accessor :description

    # Name of approver group(s) assigned to approve this request
    attr_accessor :group_name

    # Parent request id
    attr_accessor :parent_id

    # JSON Metadata about the request
    attr_accessor :metadata

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'state' => :'state',
        :'decision' => :'decision',
        :'reason' => :'reason',
        :'workflow_id' => :'workflow_id',
        :'created_at' => :'created_at',
        :'notified_at' => :'notified_at',
        :'finished_at' => :'finished_at',
        :'number_of_children' => :'number_of_children',
        :'number_of_finished_children' => :'number_of_finished_children',
        :'owner' => :'owner',
        :'requester_name' => :'requester_name',
        :'name' => :'name',
        :'description' => :'description',
        :'group_name' => :'group_name',
        :'parent_id' => :'parent_id',
        :'metadata' => :'metadata'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'state' => :'String',
        :'decision' => :'String',
        :'reason' => :'String',
        :'workflow_id' => :'String',
        :'created_at' => :'DateTime',
        :'notified_at' => :'DateTime',
        :'finished_at' => :'DateTime',
        :'number_of_children' => :'Integer',
        :'number_of_finished_children' => :'Integer',
        :'owner' => :'String',
        :'requester_name' => :'String',
        :'name' => :'String',
        :'description' => :'String',
        :'group_name' => :'String',
        :'parent_id' => :'String',
        :'metadata' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'reason',
        :'workflow_id',
        :'notified_at',
        :'finished_at',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `ApprovalApiClient::Request` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `ApprovalApiClient::Request`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'decision')
        self.decision = attributes[:'decision']
      end

      if attributes.key?(:'reason')
        self.reason = attributes[:'reason']
      end

      if attributes.key?(:'workflow_id')
        self.workflow_id = attributes[:'workflow_id']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'notified_at')
        self.notified_at = attributes[:'notified_at']
      end

      if attributes.key?(:'finished_at')
        self.finished_at = attributes[:'finished_at']
      end

      if attributes.key?(:'number_of_children')
        self.number_of_children = attributes[:'number_of_children']
      end

      if attributes.key?(:'number_of_finished_children')
        self.number_of_finished_children = attributes[:'number_of_finished_children']
      end

      if attributes.key?(:'owner')
        self.owner = attributes[:'owner']
      end

      if attributes.key?(:'requester_name')
        self.requester_name = attributes[:'requester_name']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'group_name')
        self.group_name = attributes[:'group_name']
      end

      if attributes.key?(:'parent_id')
        self.parent_id = attributes[:'parent_id']
      end

      if attributes.key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      state_validator = EnumAttributeValidator.new('String', ["canceled", "completed", "failed", "notified", "pending", "skipped", "started"])
      return false unless state_validator.valid?(@state)
      decision_validator = EnumAttributeValidator.new('String', ["undecided", "approved", "canceled", "denied", "error"])
      return false unless decision_validator.valid?(@decision)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ["canceled", "completed", "failed", "notified", "pending", "skipped", "started"])
      unless validator.valid?(state)
        fail ArgumentError, "invalid value for \"state\", must be one of #{validator.allowable_values}."
      end
      @state = state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] decision Object to be assigned
    def decision=(decision)
      validator = EnumAttributeValidator.new('String', ["undecided", "approved", "canceled", "denied", "error"])
      unless validator.valid?(decision)
        fail ArgumentError, "invalid value for \"decision\", must be one of #{validator.allowable_values}."
      end
      @decision = decision
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          state == o.state &&
          decision == o.decision &&
          reason == o.reason &&
          workflow_id == o.workflow_id &&
          created_at == o.created_at &&
          notified_at == o.notified_at &&
          finished_at == o.finished_at &&
          number_of_children == o.number_of_children &&
          number_of_finished_children == o.number_of_finished_children &&
          owner == o.owner &&
          requester_name == o.requester_name &&
          name == o.name &&
          description == o.description &&
          group_name == o.group_name &&
          parent_id == o.parent_id &&
          metadata == o.metadata
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, state, decision, reason, workflow_id, created_at, notified_at, finished_at, number_of_children, number_of_finished_children, owner, requester_name, name, description, group_name, parent_id, metadata].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        ApprovalApiClient.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
