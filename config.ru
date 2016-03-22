$stdout.sync = true

require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    'Hi!'
  end
end

run App.new
