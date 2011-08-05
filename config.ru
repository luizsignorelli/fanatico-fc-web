require 'bundler'

Bundler.require

require "sinatra/reloader" if development?

configure :development do
  Ohm.connect
end

configure :production do
  Ohm.connect( :url => "redis://redistogo:19bdbe077bbd0401155576f841c9b0c9@angler.redistogo.com:9295/")
end

require './fanatico'
run Sinatra::Application