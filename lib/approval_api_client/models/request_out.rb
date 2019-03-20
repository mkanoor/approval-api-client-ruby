=begin
#Insights Service Approval APIs

#APIs to query approval service

OpenAPI spec version: 1.0.0
Contact: support@redhat.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 3.3.4

=end

require 'date'

module ApprovalAPIClient
  # Approval request. Each request will associate with a workflow. Corresponding to the groups of the associated workflow, every request will have a list of stages to record the request processing details.
  class RequestOut
    # Requester id
    attr_accessor :requester

    # Request name
    attr_accessor :name

    # Request description
    attr_accessor :description

    # JSON object with request content
    attr_accessor :content

    attr_accessor :id

    # The state of stage or request. It may be one of values (pending, skipped, notified or finished)
    attr_accessor :state

    # Final decision, may be one of the value (undecided, approved, or denied)
    attr_accessor :decision

    # Comments for requests
    attr_accessor :reason

    # Associate workflow id
    attr_accessor :workflow_id

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
        :'requester' => :'requester',
        :'name' => :'name',
        :'description' => :'description',
        :'content' => :'content',
        :'id' => :'id',
        :'state' => :'state',
        :'decision' => :'decision',
        :'reason' => :'reason',
        :'workflow_id' => :'workflow_id'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'requester' => :'String',
        :'name' => :'String',
        :'description' => :'String',
        :'content' => :'Object',
        :'id' => :'String',
        :'state' => :'String',
        :'decision' => :'String',
        :'reason' => :'String',
        :'workflow_id' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'requester')
        self.requester = attributes[:'requester']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'content')
        self.content = attributes[:'content']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      else
        self.state = 'pending'
      end

      if attributes.has_key?(:'decision')
        self.decision = attributes[:'decision']
      else
        self.decision = 'undecided'
      end

      if attributes.has_key?(:'reason')
        self.reason = attributes[:'reason']
      end

      if attributes.has_key?(:'workflow_id')
        self.workflow_id = attributes[:'workflow_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @content.nil?
        invalid_properties.push('invalid value for "content", content cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.nil?
      return false if @content.nil?
      state_validator = EnumAttributeValidator.new('String', ['pending', 'skipped', 'notified', 'finished'])
      return false unless state_validator.valid?(@state)
      decision_validator = EnumAttributeValidator.new('String', ['undecided', 'approved', 'denied'])
      return false unless decision_validator.valid?(@decision)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ['pending', 'skipped', 'notified', 'finished'])
      unless validator.valid?(state)
        fail ArgumentError, 'invalid value for "state", must be one of #{validator.allowable_values}.'
      end
      @state = state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] decision Object to be assigned
    def decision=(decision)
      validator = EnumAttributeValidator.new('String', ['undecided', 'approved', 'denied'])
      unless validator.valid?(decision)
        fail ArgumentError, 'invalid value for "decision", must be one of #{validator.allowable_values}.'
      end
      @decision = decision
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          requester == o.requester &&
          name == o.name &&
          description == o.description &&
          content == o.content &&
          id == o.id &&
          state == o.state &&
          decision == o.decision &&
          reason == o.reason &&
          workflow_id == o.workflow_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [requester, name, description, content, id, state, decision, reason, workflow_id].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
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
      when :BOOLEAN
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
        temp_model = ApprovalAPIClient.const_get(type).new
        temp_model.build_from_hash(value)
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
        next if value.nil?
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
