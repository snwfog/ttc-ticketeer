class TicketSerializer < SerializerBase
  attribute :id
  attribute :uuid
  attribute :activated_at
  attribute :created_at
  attribute :updated_at

  has_one :ticket_type
  has_one :issue_to_user_id
end