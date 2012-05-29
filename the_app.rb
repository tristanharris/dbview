require 'sinatra/base'
require 'sinatra/activerecord'

class CcmPlan < ActiveRecord::Base
  self.table_name = 'ccm_plan'
end

class TheApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

	set :database, ENV['DATABASE_URL'] || raise('Please set DATABASE_URL')
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

