require 'active_model_serializers'

class TicketSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :activated_at, :created_at, :updated_at

  has_one :ticket_type, embed: :ids #, embed_in_root: true
  has_one :issue_to_user_id, key: :user_id #, embed: :ids, embed_in_root: true
end