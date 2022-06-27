require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/Gennady-Kudinov?tab=packages\">Original</a> pattern has been modified for <a href=\"https://github.com/Gennady-Kudinov/\">Student</a>"
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end