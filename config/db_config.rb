# TODO: Put the logging service as a rethingdb backend
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter:  'mysql',
  host:     '127.0.0.1',
  username: 'root',
  password: '1234',
  database: 'ttc-ticketeer'
)

