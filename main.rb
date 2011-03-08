require 'rubygems'
require 'sinatra'
require 'timeline'

get '/' do
  haml :home
end

post '/timeline' do
  @timeline = Timeline.new params[:username], params[:list], params[:period_start], params[:period_end]
end