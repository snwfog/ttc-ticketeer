require 'active_model_serializers'

class TicketSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :activated_at, :created_at, :updated_at
  has_one :ticket_type, embed: :ids, include: true
end