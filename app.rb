require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = Peeps.read
    erb :'peeps/index'
  end

  get '/chitter/new' do
    erb :'peeps/new'
  end

  post '/chitter' do
    Peeps.create(peep: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end