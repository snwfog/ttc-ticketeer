require 'eldr'
require 'rack'
require 'json'
require 'action_controller'
require 'action_dispatch/http/request'
require 'jsonapi-resources'
require 'jsonapi-serializers'

class BaseController
  attr_accessor :req
end