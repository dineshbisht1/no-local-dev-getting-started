# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class data < ActiveRecord::Base
  self.table_name = 'maxmhbpostinstalldatav1.MD_MHB__IATA_Detail__c'
end

get "/data" do
  @data = MD_MHB__IATA_Detail__c.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
