# require 'sneakers/tasks'

# Sneakers.configure  connection: Bunny.new(
#  addresses: 'localhost:5672',
#  username: 'guest',
#  password: 'guest',
#  vhost: '/',
#  logger: Rails.logger
# ),
# exchange: 'sneakers',
# exchange_type: :direct,
# workers: 1,
# env: ENV['RAILS_ENV'],
# durable: true,
# ack: true,
# heartbeat: 30
# Sneakers.logger = Rails.logger
# Sneakers.logger.level = Logger::WARN
