require 'open-uri'
require 'nokogiri'

class PolicyWorker
  include Sneakers::Worker
  from_queue 'policy-created'

  def work(msg)
    ack!
  end
end
