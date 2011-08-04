require 'bundler'

Bundler.require

require "sinatra/reloader" if development?

configure :development do
  Ohm.connect
end

require './fanatico'
run Sinatra::Application