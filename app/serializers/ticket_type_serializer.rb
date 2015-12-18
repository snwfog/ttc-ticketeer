class TicketTypeSerializer < SerializerBase
  attribute :id
  attribute :price
  attribute :name
  attribute :resource_key
  attribute :warning
  attribute :type_uuid
  attribute :type_identifier
end
