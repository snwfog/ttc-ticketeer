require 'active_record'
require 'memoist'

class TicketType < ActiveRecord::Base
  class << self
    extend Memoist
    memoize :all, :first
  end
end