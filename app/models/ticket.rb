require 'active_record'
require 'active_model'

class Ticket < ActiveRecord::Base
  belongs_to :user, foreign_key: :issue_to_user_id
  belongs_to :ticket_type

  validates :uuid, presence: true
  validates :ticket_type, presence: true

  scope :available, -> { where(:user => nil) }

  before_validation do
    self.uuid = SecureRandom.uuid
  end
end
