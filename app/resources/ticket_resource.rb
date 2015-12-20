require 'action_controller'
require 'jsonapi-resources'

class TicketResource < JSONAPI::Resource
  attribute :id
  attribute :uuid
  attribute :activated_at
  attribute :created_at
  attribute :updated_at

end