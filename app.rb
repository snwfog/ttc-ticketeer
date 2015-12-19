require 'eldr'
require 'userapp'
require 'colorize'
require 'jsonapi-serializers'
require 'require_all'

require_rel './app'

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
    # user = User.find_by(user_app_id: params[:user_id])
    # raise 'User Not Found' if user.nil?
    # puts params
  end

  get '/' do
    [200,
     { 'Content-Type' => 'application/json' },
     [{'message' => 'Welcome to ttc-ticketeer'}.to_json]]
  end

  get '/ticket_types' do
    ticket_types = TicketType.all
    [200,
     { 'Content-Type' => 'application/json' },
     [JSONAPI::Serializer.serialize(ticket_types,
                                    is_collection: true).to_json]]
  end

  get '/tickets' do
    available_tickets = Ticket.available
    [200,
     { 'Content-Type' => 'application/json' },
     [JSONAPI::Serializer.serialize(available_tickets,
                                    is_collection: true,
                                    include: ['ticket-type']).to_json]]
  end

  get '/ticket/:uuid' do
    t = Ticket.find_by_uuid(params['uuid'])

    [200,
     { 'Content-Type' => 'application/json' },
     [JSONAPI::Serializer.serialize(t).to_json]]
  end

  post '/tickets' do |env|
    req = Rack::Request.new(env)
    ticket = Ticket.new.from_json(req.body)
    ticket_type = TicketType.find_by(type_uuid: params['type_uuid'])
    raise 'Ticket Type not found' if ticket_type.nil?
    ticket = Ticket.create(ticket_type: ticket_type)
    [200,
     { 'Content-Type' => 'txt' },
     [JSONAPI::Serializer.serialize(t).to_json]]
  end
end
