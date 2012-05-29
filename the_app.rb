require 'sinatra/base'

class TheApp < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/public'

  before do
    content_type :html, 'charset' => 'utf-8'
  end

  get '/' do
    haml :home
  end

  get '/main.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass '../stylesheets/main'.to_sym
  end

end

