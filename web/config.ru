require "rubygems"
require "bundler"
Bundler.require
require File.dirname(__FILE__) + '/web'

Sinatra::Base.set(:run, false)
Faye::WebSocket.load_adapter('thin')
use Faye::RackAdapter, :mount => '/faye', :timeout => 25

run Web