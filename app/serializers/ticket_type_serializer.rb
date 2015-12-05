require 'active_model_serializers'

class TicketTypeSerializer < ActiveModel::Serializer
  attributes :id, :price, :name, :resource_key, :warning, :type_uuid, :type_identifier
end