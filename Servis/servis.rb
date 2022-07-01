require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
	
get '/' do
	erb "Hello! <a href=\"https://github.com/Gennady-Kudinov?tab=packages\">Original</a> pattern has been modified for <a href=\"https://github.com/Gennady-Kudinov/\">Student</a>"	
end

get '/about' do
	@error = 'Ошибка обращения'
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
			hh_visit = {
				:username => 'Введите имя',
				:phone => 'Введите телефон',
				:modelauto => 'Введите марку и модель а/м',
				:date_time => 'Введите дату и время приезда' }

  		@username 	= params[:username]
		@phone 		= params[:phone]
		@modelauto 	= params[:modelauto]
		@date_time 	= params[:date_time]

				@error = hh_visit.select {|key,_| params[key] == ""}.values.join(", ")
				if @error != ''
					return erb :visit
				end

		@title = 'Большое спасибо'
		@message = "Дорогой #{@username}, мы будем рады вас видеть #{@date_time}"

		f = File.new('BAZA/user.txt', 'a+')
		f.write "Клиент: #{@username}, #{@phone}, #{@modelauto}, #{@date_time}"
		f.close
		erb :message
	end

	post '/client' do

		@time = Time.now

		@auto			= params[:auto]
		@model_auto 	= params[:model_auto]
		@number_auto 	= params[:number_auto]
		@km 			= params[:km]
		@ecu 			= params[:ecu]
		@deffect 		= params[:deffect]
		
#   Создание папки клиента
		response = FileUtils.mkdir_p "BAZA/#{@auto}/#{@model_auto}/#{@number_auto}"

#   Создание и запись файла для общей базы клиентов
		database_file = File.new('BAZA/database.txt', 'a+')
  		database_file.puts "#{@number_auto}  #{@auto}  #{@model_auto}  #{@km}км. Дата #{@time.strftime('%d %B %Y %H:%M')}"
		database_file.close

#	Создание и запись файла с описанием машины клиента в папке клиента
		id_client = File.new("BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html", 'a+')
 		id_client.puts "<body>#{@number_auto} #{@auto} #{@model_auto} #{@km}км. Тип ЭБУ #{@ecu}: Дата #{@time.strftime('%d %B %Y %H:%M')}</br>#{@deffect}</br><body>"
		id_client.close

#   Вывод на экран результата заполнения данных клиента		
		erb "<body>#{@number_auto} #{@auto} #{@model_auto} #{@km}км: Дата #{@time.strftime('%d %B %Y %H:%M')}</br>#{@deffect}</body>" 
end