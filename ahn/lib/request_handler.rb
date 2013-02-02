class RequestHandler
  def self.handle(request)
    if request.url == "/dial" && request.method == "GET"
      Adhearsion::OutboundCall.originate "SIP/100"  do
        invoke ConnectingController
      end
    end
    [:ok, "200 OK"]
  end
end