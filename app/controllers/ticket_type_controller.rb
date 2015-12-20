require 'action_controller'
require 'jsonapi-resources'
require 'jsonapi-serializers'

class TicketTypeController

  def index(env)
    ticket_types = TicketType.all
    [200,
     { 'Content-Type' => 'application/json' },
     [JSONAPI::Serializer.serialize(ticket_types,
                                    is_collection: true).to_json]]
  end

  def show(env)
  end

  def create(env)
  end

  def update(env)

  end

  def destroy(env)
  end
end