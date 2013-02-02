# encoding: utf-8

class AuthController < Adhearsion::CallController
  def run
    answer
    if authenticate_with_pin
      play "#{Adhearsion.config.platform[:root]}/sounds/balance"
    else
      play "#{Adhearsion.config.platform[:root]}/sounds/sorry-noauth"
    end
  end

  def authenticate_with_pin
    current_tries = 0
    auth_ok = false
    while current_tries < 3
      input = ask "#{Adhearsion.config.platform[:root]}/sounds/please-enter-pin", timeout: 5, limit: 4
      auth_ok = true if check_pin(input.to_s)
      break if auth_ok
      play "#{Adhearsion.config.platform[:root]}/sounds/pin-wrong-retry"
      current_tries += 1
    end
    auth_ok
  end

  def check_pin(pin)
    conn = Faraday.new("http://localhost:3000")
    response = conn.post "/check_pin", { pin: pin }
    status = JSON.parse(response.body)
    status["auth"]
  end
end