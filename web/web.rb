class Web < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/events' do
    haml :events
  end

  post '/publish' do
    client = env['faye.client']
    client.publish('/messages', 'text' => params['event'])
    '{"status":"ok"}'
  end

  post '/check_pin' do
    response = params[:pin] == '1234' ? {auth: true} : {auth: false}
    response.to_json
  end
end
