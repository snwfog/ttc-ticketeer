require 'eldr'

require_relative './app/models/ticket'
require_relative './app/models/ticket_type'

ActiveRecord::Base.establish_connection(
  adapter:  'mysql',
  host:     '127.0.0.1',
  username: 'root',
  password: '1234',
  database: 'ttc-ticketeer'
)

class TtcTicketeer < Eldr::App
  get '/', proc {
    [200, { 'Content-Type' => 'txt' }, [TicketType.all.to_json]]
  }
end
