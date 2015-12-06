require 'rspec'
require_relative '../app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

describe '#tickets endpoint' do
  def app
    TtcTicketeer.new
  end

  it 'should create ticket successfully' do
    response = post '/tickets', { hello: 'world' }
  end
end
