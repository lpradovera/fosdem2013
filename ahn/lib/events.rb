Adhearsion::Events.draw do
  punchblock do |event|
    conn = Faraday.new("http://localhost:3000")
    conn.post "/publish", { :event => event.inspect } if event.respond_to? :name
  end
end
