require 'eldr'
require 'colorize'
require 'userapp'

require_relative './app/models/ticket'
require_relative './app/models/ticket_type'

require_relative './app/serializers/ticket_serializer'
require_relative './app/serializers/ticket_type_serializer'

# TODO: Put the logging service as a rethingdb backend
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter:  'mysql',
  host:     '127.0.0.1',
  username: 'root',
  password: '1234',
  database: 'ttc-ticketeer'
)

class TtcTicketeer < Eldr::App
  attr_reader :api

  def initialize(*args, &block)
    super *args, &block
    raise 'UserApp API is empty' if ENV['USER_APP'].nil?
    @api = UserApp::API.new(app_id: ENV['USER_APP'], throw_errors: true)
    @api.get_options.token = ENV['USER_APP_API_TOKEN']
  end

  before do
    puts 'Authenticating user...'.yellow

  end

  get '/' do
    ticket_type = TicketType.first

    ticket = Ticket.create!(uuid: SecureRandom::uuid)
    ticket.ticket_type = ticket_type
    ticket.save
    [200, { 'Content-Type' => 'txt' }, [TicketSerializer.new(ticket).to_json]]
  end
end
