# encoding: utf-8

class DemoController < Adhearsion::CallController
  def run
    answer
    menu "#{Adhearsion.config.platform[:root]}/sounds/demo-menu", :timeout => 5.seconds, :tries => 3 do
      match 1 do
        enter_number
      end
      match 2 do
        record_message
      end

      timeout do
        play "#{Adhearsion.config.platform[:root]}/sounds/menu-timeout"
      end
      invalid do
        play "#{Adhearsion.config.platform[:root]}/sounds/menu-invalid"
      end

      failure do
        play "#{Adhearsion.config.platform[:root]}/sounds/menu-failure"
        hangup
      end
    end
  end

  def enter_number
    number = ask "#{Adhearsion.config.platform[:root]}/sounds/please-enter", :limit => 1, :timeout => 5.seconds
    if number
      play "#{Adhearsion.config.platform[:root]}/sounds/you-entered"
      play "digits/#{number}"
    end
  end

  def record_message
    play "#{Adhearsion.config.platform[:root]}/sounds/please-speak-after"
    record_result = record :start_beep => true, :max_duration => 5_000
    logger.info "Recording saved to #{record_result.recording_uri}"
    play record_result.recording_uri.gsub(/file:\/\//, '').gsub(/\.wav/, '')
  end
end