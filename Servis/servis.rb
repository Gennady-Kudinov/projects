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

get '/client' do
	erb :client
end

get '/contacts' do
	erb :contacts
  end

	post '/visit' do
  		@username 	= params[:username]
		@phone 		= params[:phone]
		@modelauto 	= params[:modelauto]
		@date_time 	= params[:date_time]

		@title = 'Большое спасибо'
		@message = "Дорогой #{@username}, мы будем рады вас видеть #{@date_time}"

		f = File.open 'users.txt', 'a'
		f.write "Клиент: #{@username}, #{@phone}, #{@modelauto}, #{@date_time}"
		f.close
		erb :message
	end

	post '/client' do

		$time = Time.now

		@auto 		 = params[:auto].upcase
		@model_auto  = params[:model_auto].upcase
		@number_auto = params[:number_auto].upcase

		database_file = File.new('BAZA/database.txt', 'a+')
  		database_file.puts "#{@number_auto}  #{@auto}  #{@model_auto}  #{$km}км. Дата #{$time.strftime('%d %B %Y %H:%M')}"

		response = FileUtils.mkdir_p "BAZA/#{@auto}/#{@model_auto}/#{@number_auto}"

		# f = File.open 'database.txt', 'a'
		# f.write "#{@number_auto}"
		# f.close

		# $baza = File.open('database.txt') do |f|
		# f.find { |line| line[@number_auto] }
		# end
	end

	