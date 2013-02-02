# encoding: utf-8

class ConnectingController < Adhearsion::CallController
  def run
    play! "vm-dialout"
    play! "#{Adhearsion.config.platform[:root]}/sounds/call_me_maybe"
    dial "SIP/200"
    hangup
  end
end