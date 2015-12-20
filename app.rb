require 'eldr'
require 'userapp'
require 'colorize'
require 'require_all'

require_rel './app'
require_rel './config'

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

  get     '/tickets',     to: 'TicketController#index'
  get     '/tickets/:id', to: 'TicketController#show'
  post    '/tickets',     to: 'TicketController#create'
  put     '/tickets/:id', to: 'TicketController#show'
  delete  '/tickets/:id', to: 'TicketController#show'

  get     '/ticket_types', to: 'TicketTypeController#index'
end
