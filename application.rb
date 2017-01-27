require File.expand_path("../models/credit/standart", __FILE__)
require File.expand_path("../models/credit/annuity", __FILE__)
require 'coffee-script'

class Application < Sinatra::Base
  get '/' do
    haml :'credits/index'
  end

  post '/credit' do
    @credit = if params[:type] == 'annuity'
                Credit::Annuity.new(params)
              else
                Credit::Standart.new(params)
              end
    @credit.obtain
    haml :'credits/show'
  end

  get "/credit.js" do
    coffee :credit
  end
end
