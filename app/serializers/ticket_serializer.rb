class TicketSerializer < SerializerBase
  attribute :id
  attribute :uuid
  attribute :activated_at
  attribute :created_at
  attribute :updated_at

  # has_one :ticket_type, embed: :ids #, embed_in_root: true
  # has_one :issue_to_user_id, key: :user_id #, embed: :ids, embed_in_root: true
end