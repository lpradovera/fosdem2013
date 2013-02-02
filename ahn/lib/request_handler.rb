require 'reel'
require 'reel/app'

class RequestHandler
  include Reel::App
  get('/dial') do
    Adhearsion::OutboundCall.originate "SIP/100"  do
      invoke ConnectingController
    end
    [200, {}, "200 OK"]
  end
end