require 'eldr'
require 'rack'
require 'json'
require 'action_controller'
require 'action_dispatch/http/request'
require 'jsonapi-resources'
require 'jsonapi-serializers'

class TicketController < BaseController
  def index(env)
    available_tickets = Ticket.available
    [200,
     { 'Content-Type' => 'application/json' },
     [JSONAPI::Serializer.serialize(available_tickets,
                                    is_collection: true,
                                    include:       ['ticket-type']).to_json]]
  end

  def show(env)
    t = Ticket.find(params['id'])
    [200,
     { 'Content-Type' => 'application/json' },
     [TicketSerializer.new(t).to_json]]
  end

  def operation_processor
    JSONAPI.configuration.operations_processor.new
  end

  def wrap_params(request, action)
    {
      # :controller => self.class.name,
      :action     => action,
      :params     => request.parameters,
      :format     => request.format.try(:ref),
      :method     => request.request_method,
    }
  end

  def create(env)
    req ||= ActionDispatch::Request.new(env)
    params = ActionController::Parameters.new(wrap_params(req, __callee__.to_s))
    jsonapi_request = JSONAPI::Request.new(params)
    operation_processor.process(jsonapi_request)
    # req = Rack::Request.new(env)
    # ticket = Ticket.new.from_json(req.body)
    # ticket_type = TicketType.find_by(type_uuid: params['type_uuid'])
    # raise 'Ticket Type not found' if ticket_type.nil?
    # ticket = Ticket.create(ticket_type: ticket_type)
    [200, { 'Content-Type' => 'txt' }, [{ 'message' => 'ok' }.as_json]]
  end

  def update(env)

  end

  def destroy(env)
    puts 'Deleted'

  end
end