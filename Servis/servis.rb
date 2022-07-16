require 'sqlite3'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#   Происходит подключение базы данных sqlite3 barbershop.db (запомнить)
set :database, {adapter: "sqlite3", database: "autoservis.db"}

#   Далее надо создать класс который будет представлять нашу сущьность
#   В нашем случает сущность это Клиент, парикмахер, Post сообщение текст,
#   комментарии с текстом.
class Client < ActiveRecord::Base     #   Client наследует методы ActiveRecord базовый класс Base
end

class Users < ActiveRecord::Base     #   Client наследует методы ActiveRecord базовый класс Base
end

class Max < ActiveRecord::Base     #   Client наследует методы ActiveRecord базовый класс Base
end

class Demidov < ActiveRecord::Base     #   Client наследует методы ActiveRecord базовый класс Base
end

class Chat < ActiveRecord::Base     #   Client наследует методы ActiveRecord базовый класс Base
end

class Dictionary < ActiveRecord::Base     #   Client наследует методы ActiveRecord базовый класс Base
end

#		Создадим вывод на страницу список наших парикмахеров:
get '/' do
	@client = Client.all
	erb :index
  end

get '/' do
  erb :index
end


def init_db
	db = SQLite3::Database.new 'autoservis.db'
	db.results_as_hash = true
	return db
  end

#		before Вызывается каждый раз при перезагрузки
#		Любой страницы
  before do
#		Инициализация Базы данных
	init_db
  end

#		CONFIGURE Вызывается каждый раз при конфигурации приложения:
#		когда изменился код программы и перезагрузилась страница
configure do

#		Иницилизация Базы данных в Конфигуре
	init_db
	db = SQLite3::Database.new 'autoservis.db'

#		Создает таблицу если она не существует
		db.execute 'CREATE TABLE IF NOT EXISTS 
		"client"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"number_auto" TEXT,
			"auto" TEXT,
			"modelauto" TEXT,
			"km" INTEGER,
			"ecu" TEXT,
			"deffect" TEXT,
			"price" TEXT,
			"phone" TEXT,
			"date_time" DATE
		);'
	
		db.execute 'CREATE TABLE IF NOT EXISTS
		"users"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"username" TEXT,
			"phone" TEXT,
			"modelauto" TEXT,
			"number_auto" TEXT,
			"date_time" DATE
		);'

		db.execute 	'CREATE TABLE IF NOT EXISTS
		"max"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"number_auto" TEXT,
			"auto" TEXT,
			"modelauto" TEXT,
			"km" INTEGER,
			"ecu" TEXT,
			"deffect" TEXT,
			"price" TEXT,
			"phone" TEXT,
			"date_time" DATE
		);'

		db.execute 	'CREATE TABLE IF NOT EXISTS
		"demidov"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"number_auto" TEXT,
			"auto" TEXT,
			"modelauto" TEXT,
			"km" INTEGER,
			"ecu" TEXT,
			"deffect" TEXT,
			"price" TEXT,
			"phone" TEXT,
			"date_time" DATE
		);'

		db.execute 	'CREATE TABLE IF NOT EXISTS
		"chat"
		(
			"id"	INTEGER NOT NULL,
			"firstname"	TEXT,
			"lastname"	TEXT,
			"login"	TEXT,
			"password"	TEXT,
			"email"	TEXT,
			"date_time"	DATE,
			PRIMARY KEY("id" AUTOINCREMENT)
		)'

		db.execute 'CREATE TABLE IF NOT EXISTS
		"dictionary"
		(
			"id"	INTEGER NOT NULL,
			"modelauto"	TEXT,
			"synonyms"	TEXT,
			PRIMARY KEY("id","synonyms")
		)'
		end

#		(Браузер получает страницу с сервера)
get '/' do
	erb "Hello! <a href=\"https://github.com/Gennady-Kudinov?tab=packages\">Original</a> pattern has been modified for <a href=\"https://github.com/Gennady-Kudinov/\">Student</a>"	
end

#		(Браузер получает страницу с сервера)
get '/about' do
	erb :about
end

#		(Браузер получает страницу с сервера)
get '/visit' do
	erb :visit
end

get '/admin' do
	erb :autoservis
end

#		(Браузер получает страницу с сервера)
get '/showusers' do
	db = init_db
	@results = db.execute 'SELECT * FROM users ORDER BY id DESC'
	erb :showusers
end

#		(Браузер получает страницу с сервера)
get '/admin/autoservis' do
	erb :base_creation
end

#		(Браузер получает страницу с сервера)
get '/showclients' do
	db = init_db
	@results = db.execute 'SELECT * FROM client ORDER BY id DESC'
	erb :showclients
end

get '/showmax' do
	db = init_db
	@results = db.execute 'SELECT * FROM max ORDER BY id DESC'
	erb :showmax
end

get '/showdemidov' do
	db = init_db
	@results = db.execute 'SELECT * FROM demidov ORDER BY id DESC'
	erb :showdemidov
end

get '/showchatfree' do
	db = init_db
	@results = db.execute 'SELECT * FROM chat ORDER BY id DESC'
	erb :showchatfree
end

#		(Браузер получает страницу с сервера)
get '/contacts' do
	erb :contacts
end

#		Обработчик Post - запроса /admin
#		(Браузер отправляет данные на сервер)
post '/admin' do

	@login = params[:login]
	@password = params[:password]

	if @login == 'gena' && @password == '8101966'
        erb :base_creation
   	
		elsif @login == 'max' && @password == 'maxim'
			erb :max

			elsif @login == 'sergey' && @password == 'sergey'
				erb :demidov

				elsif @login == 'chat' && @password == 'chatfree'
					erb :chat
						else
						erb "Введите другой Логин и Пароль или позвоните +7 910-942-2002: +7 930-899-1111" 
	end
end

#		Обработчик Post - запроса /visit
#		(Браузер отправляет данные на сервер)
post '/visit' do

	#		Хеш для ответа на не заполнение поля Визит		
				hh_visit = {
					:username => 'Введите имя',
					:phone => 'Введите телефон',
					:modelauto => 'Ввыберите марку а/м',
					:number_auto => 'Введите Гос. номер а/м',
					:date_time => 'Введите дату и время приезда' }

#		Получаем переменные из пост - запроса	
			@username  	= params[:username]
			@phone 		= params[:phone]
			@modelauto  = params[:modelauto]
			@number_auto = params[:number_auto]
			@date_time 	= params[:date_time]
	
#		Вывод сообщений из хеша в зависимости какое поле не заполнено!
			@error = hh_visit.select {|key,_| params[key] == ""}.values.join(", ")
					if @error != ''
						return erb :visit
					end
	
					db = init_db
					db.execute 'INSERT INTO
						users
						(
							username,
							phone,
							modelauto,
							number_auto,
							date_time
						)
						values (?, ?, ?, ?, ?)', [@username, @phone, @modelauto, @number_auto, @date_time]
	
			@title = 'Большое спасибо'
			@message = "Дорогой(я) #{@username}, мы будем рады вас видеть на #{@modelauto} в #{@date_time}"
	
	#		f = File.new('BAZA/user.txt', 'a+')
	#		f.write "Клиент: #{@username}, #{@phone}, #{@modelauto}, #{@date_time}"
	#		f.close
		
			erb :message
			
	end


	get '/admin/search' do
		erb :search
	  end

#==========================================================

	post '/admin/search' do

		#       Передача имени из файла search.erb в переменную @ecu
			@ecu            = params[:ecu]

		#       Метод поиска файла по идентификатору и вывод его адреса (полный путь в виде строки)
			@sw_file = Dir.glob("/Users/gena/projects/servis/*.jpg")
			@xx = File.open "/Users/gena/projects/Servis/IMG_1.jpg"
		#       Метод добавления ключей каждому адресу найденого файла.
			#@sw_file.each do |path|

			#end
			erb :search
								
	end

#=========================================================

#		Обработчик Post - запроса /admin/autoservis
#		(Браузер отправляет данные на сервер)
post '/admin/autoservis' do

	@time = Time.now		

#    Хеш с Моделями автомобилей, использовать как словарь
		@hash_model = {
			'q5' => 'Q5',
			'x1' => 'X1',
			'х1' => 'X1',
			'x2' => 'X2',
			'x3' => 'X3',
			'х3' => 'X3',
			'x5' => 'X5',
			'х5' => 'X5',
			'e60' => 'E60',
			'е60' => 'E60',
			'e90' => 'E90',
			'ети' => 'YETI',
			'tnb' => 'YETI',
			'eti' => 'YETI',
			'yeti' => 'YETI',
			'снкщт' => 'CYRON',
			'cyron' => 'CYRON',
			'rfqhjy' => 'CYRON',
			'кайрон' => 'CYRON',
			'kayron' => 'CYRON',
			'silverado' => 'SILVERADO',
			'r2' => 'R2',
			'r4' => 'R4',
			'spark' => 'SPARK',
			'спарк' => 'SPARK',
			'sparkev' => 'SPARK EV',
			'spin' => 'SPIN',
			'ss' => 'SS',
			'tahoe' => 'TAHOE',
			'tracker' => 'TRACKER',
			'trailblazer' => 'TRAILBLAZER',
			'traverse' => 'TRAVERSE',
			'viva' => 'VIVA',
			'volt' => 'VOLT',
			'alero' => 'ALERO',
			'aveo' => 'AVEO',
			'авео' => 'AVEO',
			'blazer' => 'BLAZER',
			'camaro' => 'CAMARO',
			'captiva' => 'CAPTIVA',
			'каптива' => 'CAPTIVA',
			'cobalt' => 'COBALT',
			'кобальт' => 'COBALT',
			'corvette' => 'CORVETTE',
			'cruze' => 'CRUZE',
			'круз' => 'CRUZE',
			'epica' => 'EPICA',
			'епика' => 'EPICA',
			'evanda' => 'EVANDA',
			'эванда' => 'EVANDA',
			'impala' => 'IMPALA',
			'lacetti' => 'LACETTI',
			'лачети' => 'LACETTI',
			'lanos' => 'LANOS',
			'ланос' => 'LANOS',
			'lovarv' => 'LOVA RV',
			'malibu' => 'MALIBU',
			'orlando' => 'ORLANDO',
			'орландо' => 'ORLANDO',
			'rezo' => 'REZZO',
			'резо' => 'REZZO',
			'accent' => 'ACCENT',
			'frwtyn' => 'ACCENT',
			'акцент' => 'ACCENT',
			'фссуте' => 'ACCENT',
			'akcent' => 'ACCENT',
			'coupe' => 'COUPE',
			'creta' => 'CRETA',
			'rhtnf' => 'CRETA',
			'крета' => 'CRETA',
			'скуеф' => 'CRETA',
			'RHTNF' => 'CRETA',
			'kreta' => 'CRETA',
			'elantra' => 'ELANTRA',
			'элантра' => 'ELANTRA',
			'equus' => 'EQUUS',
			'tucson' => 'TUCSON',
			'nercjy' => 'TUCSON',
			'туксон' => 'TUCSON',
			'егсыщт' => 'TUCSON',
			'genesis' => 'GENESIS',
			'генезис' => 'GENESIS',
			'genesis coupe' => 'GENESIS COUPE',
			'gets' => 'GETZ',
			'гетс' => 'GETZ',
			'grand santafe' => 'GRAND SANTAFE',
			'graunder' => 'GRANDEUR',
			'h1' => 'H-1',
			'i10' => 'I10',
			'i20' => 'I20',
			'i30' => 'I30',
			'i40' => 'I40',
			'ioniq' => 'IONIQ',
			'ioniq5' => 'IONIQ 5',
			'ix20 ' => 'IX20',
			'ix25' => 'IX25',
			'ix35' => 'IX35',
			'ix55' => 'IX55',
			'fx35' => 'FX35',
			'kona' => 'KONA',
			'matrix' => 'MATRIX',
			'матрикс' => 'MATRIX',
			'sonatanf' => 'SONATA NF',
			'palisade' => 'PALISADE',
			'santafe' => 'SANTAFE',
			'сантафе' => 'SANTAFE',
			'solaris' => 'SOLARIS',
			'солярис' => 'SOLARIS',
			'sonata' => 'SONATA',
			'соната' => 'SONATA',
			'starex' => 'STAREX',
			'старекс' => 'STAREX',
			'terracan' => 'TERRACAN',
			'trajet' => 'TRAJET',
			'veloster' => 'VELOSTER',
			'venue' => 'VENUE',
			'verna' => 'VERNA',
			'xcent' => 'XCENT',
			'cadenza' => 'CADENZA',
			'carens' => 'CARENS',
			'каренс' => 'CARENS',
			'carnival' => 'CARNIVAL',
			'ceed' => 'CEED',
			'сид' => 'CEED',
			'cerato' => 'CERATO',
			'церато' => 'CERATO',
			'ev6' => 'EV6',
			'k2 cross' => 'K2 CROSS',
			'k5' => 'K5',
			'k9' => 'K9',
			'k900' => 'K900',
			'magentis' => 'MAGENTIS',
			'мажентис' => 'MAGENTIS',
			'mohave' => 'MOHAVE',
			'мохав' => 'MOHAVE',
			'niro' => 'NIRO',
			'opirus' => 'OPIRUS',
			'optima' => 'OPTIMA',
			'оптима' => 'OPTIMA',
			'picanto' => 'PICANTO',
			'пиканто' => 'PICANTO',
			'proceed' => 'PROCEED',
			'quoris' => 'QUORIS',
			'rio' => 'RIO',
			'рио' => 'RIO',
			'seltos' => 'SELTOS',
			'sorento' => 'SORENTO',
			'соренто' => 'SORENTO',
			'сосренто' => 'SORENTO',
			'soul' => 'SOUL',
			'соул' => 'SOUL',
			'soulev' => 'SOUL EV',
			'spectra' => 'SPECTRA',
			'спектра' => 'SPECTRA',
			'sportage' => 'SPORTAGE',
			'спортаж' => 'SPORTAGE',
			'stinger' => 'STINGER',
			'stonic' => 'STONIC',
			'telluride' => 'TELLURIDE',
			'venga' => 'VENGA',
			'xceed' => 'XCEED',
			'amarok' => 'AMAROK',
			'амарок' => 'AMAROK',
			'arteon ' => 'ARTEON',
			'atlascrosssport' => 'ATLAS CROSS SPORT',
			'beetle' => 'BEETLE',
			'bora' => 'BORA',
			'caddy' => 'CADDY',
			'кади' => 'CADDY',
			'crossgolf' => 'CROSS GOLF',
			'crosspolo' => 'CROSS POLO',
			'egolf' => 'E-GOLF',
			'eos' => 'EOS',
			'golf' => 'GOLF',
			'гольф' => 'GOLF',
			'golfalltrack' => 'GOLF ALLTRACK',
			'golfgti' => 'GOLF GTI',
			'golfplus' => 'GOLF PLUS',
			'golfr' => 'GOLF R',
			'golf sportvan' => 'GOLF SPORTSVAN',
			'id.3' => 'ID.3',
			'id.4' => 'ID.4',
			'jetta' => 'JETTA',
			'джета' => 'JETTA',
			'lavida' => 'LAVIDA',
			'multivan' => 'MULTIVAN',
			'newbeetle' => 'NEW BEETLE',
			'passat' => 'PASSAT',
			'пассат' => 'PASSAT',
			'passatalltrack ' => 'PASSAT ALLTRACK',
			'passatcc ' => 'PASSAT CC',
			'passatgte' => 'PASSAT GTE',
			'phaeton' => 'PHAETON',
			'pointer' => 'POINTER',
			'polo' => 'POLO',
			'поло' => 'POLO',
			'scirocco' => 'SCIROCCO',
			'sharan' => 'SHARAN',
			'taos' => 'TAOS',
			'tarek' => 'TAREK',
			'tcross' => 'T-CROSS',
			'teramont' => 'TERAMONT',
			'tiguan' => 'TIGUAN',
			'тигуан' => 'TIGUAN',
			'toureg' => 'TOUAREG',
			'таурег' => 'TOUAREG',
			'touran' => 'TOURAN',
			'тоуран' => 'TOURAN',
			'transporter' => 'TRANSPORTER',
			'транспортер' => 'TRANSPORTER',
			'xl1' => 'XL1',
			'h2' => 'H2',
			'h3' => 'H3',
			'h5' => 'H5',
			'xtral' => 'XTRAL',
			'фдьукф' => 'ALMERA',
			'almera' => 'ALMERA',
			'альмера' => 'ALMERA',
			'примьера' => 'PRIMERA',
			'primera' => 'PRIMERA',
			'qashqai' => 'QASHQAI',
			'кашкай' => 'QASHQAI',
			'tiida' => 'TIIDA',
			'тиида' => 'TIIDA',
			'juke' => 'JUKE',
			'жук' => 'JUKE',
			'teana' => 'TEANA',
			'теана' => 'TEANA',
			'note' => 'NOTE',
			'нот' => 'NOTE',
			'chance' => 'CHANCE',
			'шанс' => 'CHANCE',
			'outlanderxl' => 'OUTLANDER XL',
			'оутландерхл' => 'OUTLANDER XL',
			'оутландер' => 'OUTLANDER',
			'outlander' => 'OUTLANDER',
			'lancer10' => 'LANCER 10',
			'ланцер10' => 'LANCER 10',
			'lancer9' => 'LANCER 9',
			'ланцер9' => 'LANCER 9',
			'pajero' => 'PAJERO',
			'паджеро' => 'PAJERO',
			'nexia' => 'NEXIA',
			'нексия' => 'NEXIA',
			'matiz' => 'MATIZ',
			'матиз' => 'MATIZ',
			'gentra' => 'GENTRA',
			'джентра' => 'GENTRA',
			'largus' => 'LARGUS',
			'ларгус' => 'LARGUS',
			'xray' => 'XRAY',
			'храй' => 'XRAY',
			'хрей' => 'XRAY',
			'гранта' => 'GRANTA',
			'granta' => 'GRANTA',
			'vesta' => 'VESTA',
			'веста' => 'VESTA',
			'astra' => 'ASTRA',
			'астра' => 'ASTRA ',
			'корса' => 'CORSA',
			'corsa' => 'CORSA',
			'астраг' => 'ASTRA G',
			'astrag' => 'ASTRA G',
			'astraj' => 'ASTRA J',
			'астраж' => 'ASTRA J',
			'astrah' => 'ASTRA H',
			'астран' => 'ASTRA H',
			'исигния' => 'ISIGNIA',
			'isignia' => 'ISIGNIA',
			'x60' => 'X60',
			'х60' => 'X60',
			'tigo' => 'TIGO',
			'тиго' => 'TIGO',
			'amulet' => 'AMULET',
			'амулет' => 'AMULET',
			'emgrand' => 'EMGRAND',
			'емгранд' => 'EMGRAND',
			'atlas' => 'ATLAS',
			'атлас' => 'ATLAS',
			'coolray' => 'COOLRAY',
			'кулрей' => 'COOLRAY',
			'кулрай' => 'COOLRAY',
			'logan' => 'LOGAN',
			'логан' => 'LOGAN',
			'sandero' => 'SANDERO',
			'сандеро' => 'SANDERO',
			'arkana' => 'ARKANA',
			'аркана' => 'ARKANA',
			'kaptur' => 'KAPTUR',
			'каптур' => 'KAPTUR',
			'каптюр' => 'KAPTUR',
			'duster' => 'DUSTER',
			'дастер' => 'DUSTER',
			'megan2' => 'MEGAN 2',
			'меган2' => 'MEGAN 2',
			'megan3' => 'MEGAN 3',
			'меган3' => 'MEGAN 3',
			'octavia' => 'OCTAVIA',
			'октавия' => 'OCTAVIA',
			'rapid' => 'RAPID',
			'рапид' => 'RAPID',
			'фабия' => 'FABIA',
			'fabia' => 'FABIA',
			'suprb' => 'SUPERB',
			'суперб' => 'SUPERB',
			'kalina' => 'KALINA',
			'калина' => 'KALINA',
			'шнива' => 'ШЕВИ НИВА',
			'шеви' => 'ШЕВИ НИВА',
			'шевинива' => 'ШЕВИ НИВА',
			'2107' => '2107',
			'2111' => '2111',
			'2114' => '2114',
			'2115' => '2115',
			'2109' => '2109',
			'2110' => '2110',
			'2112' => '2112',
			'gazel' => 'GAZEL',
			'газель' => 'GAZEL',
			'приора' => 'PRIORA',
			'priora' => 'PRIORA',
			'niva' => 'NIVA',
			'нива' => 'NIVA',
			'focus2' => 'FOCUS 2',
			'фокус2' => 'FOCUS 2',
			'focus3' => 'FOCUS 3',
			'фокус3' => 'FOCUS 3',
			'ащсгы3' => 'FOCUS 3',
			'mondeo' => 'MONDEO',
			'мондео' => 'MONDEO',
			'mondeo3' => 'MONDEO 3',
			'ьщтвущ3' => 'MONDEO 3',
			'vjyltj3' => 'MONDEO 3',
			'мондео3' => 'MONDEO 3',
			'mondeo4' => 'MONDEO 4',
			'vjyltj4' => 'MONDEO 4',
			'мондео4' => 'MONDEO 4',
			'ьщтвущ4' => 'MONDEO 4',
			'kuga' => 'KUGA',
			'куга' => 'KUGA',
			'лгпф' => 'KUGA',
			'reuf' => 'KUGA',
			'camry' => 'CAMRY',
			'камри' => 'CAMRY',
			'yaris' => 'YARIS',
			'ярис' => 'YARIS',
			'авенсис' => 'AVENSIS',
			'avensis' => 'AVENSIS',
			'berlingo' => 'BERLINGO',
			'берлинго' => 'BERLINGO',
			'308' => '308',
			'3008' => '3008',
			'408' => '408',
			'4008' => '4008',
			'207' => '207',
			'c4' => 'C4',
			'с4' => 'C4',
			'c3' => 'C3',
			'с3' => 'C3',
			'crv' => 'CRV',
			'срв' => 'CRV',
			'acord' => 'ACORD',
			'акорд' => 'ACORD',
			'civic' => 'CIVIC',
			'цивик'=> 'CIVIC',
			'action' => 'ACTION',
			'экшен' => 'ACTION',
			'sx4' => 'SX4',
			'liana' => 'LIANA',
			'лиана' => 'LIANA',
			'grandvitara' => 'GRAND VITARA',
			'грандвитара' => 'GRAND VITARA',
			'mazda3' => 'MAZDA 3',
			'мазда3' => 'MAZDA 3',
			'мазда6' => 'MAZDA 6',
			'mazda6' => 'MAZDA 6',
			'cx5' => 'CX5',
			'cx9' => 'CX9'
		  }

#		Хеш для ответа на не заполнение поля Визит		
	hh_client = {
		:number_auto => 'Запишите Гос. номер а/м',
		:auto => 'Выберите марку а/м',
		:modelauto => 'Вы не записали модель а/м',
		:km => 'Запишите пробег в км',
		:ecu => 'Напишите версию калибровок или софта'
	}

	#		Получаем переменные из пост - запроса	
		@auto			= params[:auto]
		@modelauto	 	= params[:modelauto]
		@number_auto 	= params[:number_auto]
		@km 			= params[:km]
		@ecu 			= params[:ecu]
		@deffect 		= params[:deffect]
		@phone			= params[:phone]
		@price			= params[:price]

				if @modelauto != @hash_model[@key_model]
					@key_model = @modelauto     
					@modelauto = @hash_model[@key_model]
				end

#		Решено добавить миграцию времени в переменную @deffect
				@deffect << @time.strftime('%d %B %Y %H:%M')

#		Вывод сообщений из хеша в зависимости какое поле не заполнено!
		@error = hh_client.select {|key,_| params[key] == ""}.values.join(", ")
		if @error != ''
			return erb :base_creation
		end

		db = init_db
		db.execute 'INSERT INTO
			client
			(
				auto,
				modelauto,
				number_auto,
				km,
				ecu,
				deffect,
				price,
				phone,
				date_time
			)
			values (?, ?, ?, ?, ?, ?, ?, ?, ?)', [@auto, @modelauto, @number_auto, @km, @ecu, @deffect, @price, @phone, @time.strftime('%d %B %Y %H:%M')]
	
			db.close

#   Создание папки клиента
		response = FileUtils.mkdir_p "E:/BAZA/#{@auto}/#{@modelauto}/#{@number_auto}"

#   Создание и запись файла для общей базы клиентов
		database_file = File.new('E:/BAZA/database.txt', 'a+')
 		database_file.puts "#{@number_auto}  #{@auto}  #{@modelauto}  #{@km}км.  Сумма #{@price} Телефон #{@phone} Дата #{@time.strftime('%d %B %Y %H:%M')}"
		database_file.close

#	Создание и запись файла с описанием машины клиента в папке клиента
		id_client = File.new("E:/BAZA/#{@auto}/#{@modelauto}/#{@number_auto}/#{@number_auto}.html", 'a+')
		id_client.puts "<body>#{@number_auto} #{@auto} #{@modelauto} #{@km}км. Тип ЭБУ #{@ecu}: Сумма #{@price} Телефон #{@phone} Дата #{@time.strftime('%d %B %Y %H:%M')}<br />#{@deffect}<br /><body>"
		id_client.close

#   Вывод на экран результата заполнения данных клиента		
		erb "<body>#{@number_auto} #{@auto} #{@modelauto} #{@km}км: Сумма #{@price} Дата #{@time.strftime('%d %B %Y %H:%M')}<br />#{@deffect}</body>" 

	end

#============================================================

	post '/admin/max' do

		@time = Time.now		
	
	#    Хеш с Моделями автомобилей, использовать как словарь
	@hash_model = {
		'q5' => 'Q5',
		'x1' => 'X1',
		'х1' => 'X1',
		'x2' => 'X2',
		'x3' => 'X3',
		'х3' => 'X3',
		'x5' => 'X5',
		'х5' => 'X5',
		'e60' => 'E60',
		'е60' => 'E60',
		'e90' => 'E90',
		'ети' => 'YETI',
		'tnb' => 'YETI',
		'eti' => 'YETI',
		'yeti' => 'YETI',
		'снкщт' => 'CYRON',
		'cyron' => 'CYRON',
		'rfqhjy' => 'CYRON',
		'кайрон' => 'CYRON',
		'kayron' => 'CYRON',
		'silverado' => 'SILVERADO',
		'r2' => 'R2',
		'r4' => 'R4',
		'spark' => 'SPARK',
		'спарк' => 'SPARK',
		'sparkev' => 'SPARK EV',
		'spin' => 'SPIN',
		'ss' => 'SS',
		'tahoe' => 'TAHOE',
		'tracker' => 'TRACKER',
		'trailblazer' => 'TRAILBLAZER',
		'traverse' => 'TRAVERSE',
		'viva' => 'VIVA',
		'volt' => 'VOLT',
		'alero' => 'ALERO',
		'aveo' => 'AVEO',
		'авео' => 'AVEO',
		'blazer' => 'BLAZER',
		'camaro' => 'CAMARO',
		'captiva' => 'CAPTIVA',
		'каптива' => 'CAPTIVA',
		'cobalt' => 'COBALT',
		'кобальт' => 'COBALT',
		'corvette' => 'CORVETTE',
		'cruze' => 'CRUZE',
		'круз' => 'CRUZE',
		'epica' => 'EPICA',
		'епика' => 'EPICA',
		'evanda' => 'EVANDA',
		'эванда' => 'EVANDA',
		'impala' => 'IMPALA',
		'lacetti' => 'LACETTI',
		'лачети' => 'LACETTI',
		'lanos' => 'LANOS',
		'ланос' => 'LANOS',
		'lovarv' => 'LOVA RV',
		'malibu' => 'MALIBU',
		'orlando' => 'ORLANDO',
		'орландо' => 'ORLANDO',
		'rezo' => 'REZZO',
		'резо' => 'REZZO',
		'accent' => 'ACCENT',
		'frwtyn' => 'ACCENT',
		'акцент' => 'ACCENT',
		'фссуте' => 'ACCENT',
		'akcent' => 'ACCENT',
		'coupe' => 'COUPE',
		'creta' => 'CRETA',
		'rhtnf' => 'CRETA',
		'крета' => 'CRETA',
		'скуеф' => 'CRETA',
		'RHTNF' => 'CRETA',
		'kreta' => 'CRETA',
		'elantra' => 'ELANTRA',
		'элантра' => 'ELANTRA',
		'equus' => 'EQUUS',
		'tucson' => 'TUCSON',
		'nercjy' => 'TUCSON',
		'туксон' => 'TUCSON',
		'егсыщт' => 'TUCSON',
		'genesis' => 'GENESIS',
		'генезис' => 'GENESIS',
		'genesis coupe' => 'GENESIS COUPE',
		'gets' => 'GETZ',
		'гетс' => 'GETZ',
		'grand santafe' => 'GRAND SANTAFE',
		'graunder' => 'GRANDEUR',
		'h1' => 'H-1',
		'i10' => 'I10',
		'i20' => 'I20',
		'i30' => 'I30',
		'i40' => 'I40',
		'ioniq' => 'IONIQ',
		'ioniq5' => 'IONIQ 5',
		'ix20 ' => 'IX20',
		'ix25' => 'IX25',
		'ix35' => 'IX35',
		'ix55' => 'IX55',
		'fx35' => 'FX35',
		'kona' => 'KONA',
		'matrix' => 'MATRIX',
		'матрикс' => 'MATRIX',
		'sonatanf' => 'SONATA NF',
		'palisade' => 'PALISADE',
		'santafe' => 'SANTAFE',
		'сантафе' => 'SANTAFE',
		'solaris' => 'SOLARIS',
		'солярис' => 'SOLARIS',
		'sonata' => 'SONATA',
		'соната' => 'SONATA',
		'starex' => 'STAREX',
		'старекс' => 'STAREX',
		'terracan' => 'TERRACAN',
		'trajet' => 'TRAJET',
		'veloster' => 'VELOSTER',
		'venue' => 'VENUE',
		'verna' => 'VERNA',
		'xcent' => 'XCENT',
		'cadenza' => 'CADENZA',
		'carens' => 'CARENS',
		'каренс' => 'CARENS',
		'carnival' => 'CARNIVAL',
		'ceed' => 'CEED',
		'сид' => 'CEED',
		'cerato' => 'CERATO',
		'церато' => 'CERATO',
		'ev6' => 'EV6',
		'k2 cross' => 'K2 CROSS',
		'k5' => 'K5',
		'k9' => 'K9',
		'k900' => 'K900',
		'magentis' => 'MAGENTIS',
		'мажентис' => 'MAGENTIS',
		'mohave' => 'MOHAVE',
		'мохав' => 'MOHAVE',
		'niro' => 'NIRO',
		'opirus' => 'OPIRUS',
		'optima' => 'OPTIMA',
		'оптима' => 'OPTIMA',
		'picanto' => 'PICANTO',
		'пиканто' => 'PICANTO',
		'proceed' => 'PROCEED',
		'quoris' => 'QUORIS',
		'rio' => 'RIO',
		'рио' => 'RIO',
		'seltos' => 'SELTOS',
		'sorento' => 'SORENTO',
		'соренто' => 'SORENTO',
		'сосренто' => 'SORENTO',
		'soul' => 'SOUL',
		'соул' => 'SOUL',
		'soulev' => 'SOUL EV',
		'spectra' => 'SPECTRA',
		'спектра' => 'SPECTRA',
		'sportage' => 'SPORTAGE',
		'спортаж' => 'SPORTAGE',
		'stinger' => 'STINGER',
		'stonic' => 'STONIC',
		'telluride' => 'TELLURIDE',
		'venga' => 'VENGA',
		'xceed' => 'XCEED',
		'amarok' => 'AMAROK',
		'амарок' => 'AMAROK',
		'arteon ' => 'ARTEON',
		'atlascrosssport' => 'ATLAS CROSS SPORT',
		'beetle' => 'BEETLE',
		'bora' => 'BORA',
		'caddy' => 'CADDY',
		'кади' => 'CADDY',
		'crossgolf' => 'CROSS GOLF',
		'crosspolo' => 'CROSS POLO',
		'egolf' => 'E-GOLF',
		'eos' => 'EOS',
		'golf' => 'GOLF',
		'гольф' => 'GOLF',
		'golfalltrack' => 'GOLF ALLTRACK',
		'golfgti' => 'GOLF GTI',
		'golfplus' => 'GOLF PLUS',
		'golfr' => 'GOLF R',
		'golf sportvan' => 'GOLF SPORTSVAN',
		'id.3' => 'ID.3',
		'id.4' => 'ID.4',
		'jetta' => 'JETTA',
		'джета' => 'JETTA',
		'lavida' => 'LAVIDA',
		'multivan' => 'MULTIVAN',
		'newbeetle' => 'NEW BEETLE',
		'passat' => 'PASSAT',
		'пассат' => 'PASSAT',
		'passatalltrack ' => 'PASSAT ALLTRACK',
		'passatcc ' => 'PASSAT CC',
		'passatgte' => 'PASSAT GTE',
		'phaeton' => 'PHAETON',
		'pointer' => 'POINTER',
		'polo' => 'POLO',
		'поло' => 'POLO',
		'scirocco' => 'SCIROCCO',
		'sharan' => 'SHARAN',
		'taos' => 'TAOS',
		'tarek' => 'TAREK',
		'tcross' => 'T-CROSS',
		'teramont' => 'TERAMONT',
		'tiguan' => 'TIGUAN',
		'тигуан' => 'TIGUAN',
		'toureg' => 'TOUAREG',
		'таурег' => 'TOUAREG',
		'touran' => 'TOURAN',
		'тоуран' => 'TOURAN',
		'transporter' => 'TRANSPORTER',
		'транспортер' => 'TRANSPORTER',
		'xl1' => 'XL1',
		'h2' => 'H2',
		'h3' => 'H3',
		'h5' => 'H5',
		'xtral' => 'XTRAL',
		'фдьукф' => 'ALMERA',
		'almera' => 'ALMERA',
		'альмера' => 'ALMERA',
		'примьера' => 'PRIMERA',
		'primera' => 'PRIMERA',
		'qashqai' => 'QASHQAI',
		'кашкай' => 'QASHQAI',
		'tiida' => 'TIIDA',
		'тиида' => 'TIIDA',
		'juke' => 'JUKE',
		'жук' => 'JUKE',
		'teana' => 'TEANA',
		'теана' => 'TEANA',
		'note' => 'NOTE',
		'нот' => 'NOTE',
		'chance' => 'CHANCE',
		'шанс' => 'CHANCE',
		'outlanderxl' => 'OUTLANDER XL',
		'оутландерхл' => 'OUTLANDER XL',
		'оутландер' => 'OUTLANDER',
		'outlander' => 'OUTLANDER',
		'lancer10' => 'LANCER 10',
		'ланцер10' => 'LANCER 10',
		'lancer9' => 'LANCER 9',
		'ланцер9' => 'LANCER 9',
		'pajero' => 'PAJERO',
		'паджеро' => 'PAJERO',
		'nexia' => 'NEXIA',
		'нексия' => 'NEXIA',
		'matiz' => 'MATIZ',
		'матиз' => 'MATIZ',
		'gentra' => 'GENTRA',
		'джентра' => 'GENTRA',
		'largus' => 'LARGUS',
		'ларгус' => 'LARGUS',
		'xray' => 'XRAY',
		'храй' => 'XRAY',
		'хрей' => 'XRAY',
		'гранта' => 'GRANTA',
		'granta' => 'GRANTA',
		'vesta' => 'VESTA',
		'веста' => 'VESTA',
		'astra' => 'ASTRA',
		'астра' => 'ASTRA ',
		'корса' => 'CORSA',
		'corsa' => 'CORSA',
		'астраг' => 'ASTRA G',
		'astrag' => 'ASTRA G',
		'astraj' => 'ASTRA J',
		'астраж' => 'ASTRA J',
		'astrah' => 'ASTRA H',
		'астран' => 'ASTRA H',
		'исигния' => 'ISIGNIA',
		'isignia' => 'ISIGNIA',
		'x60' => 'X60',
		'х60' => 'X60',
		'tigo' => 'TIGO',
		'тиго' => 'TIGO',
		'amulet' => 'AMULET',
		'амулет' => 'AMULET',
		'emgrand' => 'EMGRAND',
		'емгранд' => 'EMGRAND',
		'atlas' => 'ATLAS',
		'атлас' => 'ATLAS',
		'coolray' => 'COOLRAY',
		'кулрей' => 'COOLRAY',
		'кулрай' => 'COOLRAY',
		'logan' => 'LOGAN',
		'логан' => 'LOGAN',
		'sandero' => 'SANDERO',
		'сандеро' => 'SANDERO',
		'arkana' => 'ARKANA',
		'аркана' => 'ARKANA',
		'kaptur' => 'KAPTUR',
		'каптур' => 'KAPTUR',
		'каптюр' => 'KAPTUR',
		'duster' => 'DUSTER',
		'дастер' => 'DUSTER',
		'megan2' => 'MEGAN 2',
		'меган2' => 'MEGAN 2',
		'megan3' => 'MEGAN 3',
		'меган3' => 'MEGAN 3',
		'octavia' => 'OCTAVIA',
		'октавия' => 'OCTAVIA',
		'rapid' => 'RAPID',
		'рапид' => 'RAPID',
		'фабия' => 'FABIA',
		'fabia' => 'FABIA',
		'suprb' => 'SUPERB',
		'суперб' => 'SUPERB',
		'kalina' => 'KALINA',
		'калина' => 'KALINA',
		'шнива' => 'ШЕВИ НИВА',
		'шеви' => 'ШЕВИ НИВА',
		'шевинива' => 'ШЕВИ НИВА',
		'2107' => '2107',
		'2111' => '2111',
		'2114' => '2114',
		'2115' => '2115',
		'2109' => '2109',
		'2110' => '2110',
		'2112' => '2112',
		'gazel' => 'GAZEL',
		'газель' => 'GAZEL',
		'приора' => 'PRIORA',
		'priora' => 'PRIORA',
		'niva' => 'NIVA',
		'нива' => 'NIVA',
		'focus2' => 'FOCUS 2',
		'фокус2' => 'FOCUS 2',
		'focus3' => 'FOCUS 3',
		'фокус3' => 'FOCUS 3',
		'ащсгы3' => 'FOCUS 3',
		'mondeo' => 'MONDEO',
		'мондео' => 'MONDEO',
		'mondeo3' => 'MONDEO 3',
		'ьщтвущ3' => 'MONDEO 3',
		'vjyltj3' => 'MONDEO 3',
		'мондео3' => 'MONDEO 3',
		'mondeo4' => 'MONDEO 4',
		'vjyltj4' => 'MONDEO 4',
		'мондео4' => 'MONDEO 4',
		'ьщтвущ4' => 'MONDEO 4',
		'kuga' => 'KUGA',
		'куга' => 'KUGA',
		'лгпф' => 'KUGA',
		'reuf' => 'KUGA',
		'camry' => 'CAMRY',
		'камри' => 'CAMRY',
		'yaris' => 'YARIS',
		'ярис' => 'YARIS',
		'авенсис' => 'AVENSIS',
		'avensis' => 'AVENSIS',
		'berlingo' => 'BERLINGO',
		'берлинго' => 'BERLINGO',
		'308' => '308',
		'3008' => '3008',
		'408' => '408',
		'4008' => '4008',
		'207' => '207',
		'c4' => 'C4',
		'с4' => 'C4',
		'c3' => 'C3',
		'с3' => 'C3',
		'crv' => 'CRV',
		'срв' => 'CRV',
		'acord' => 'ACORD',
		'акорд' => 'ACORD',
		'civic' => 'CIVIC',
		'цивик'=> 'CIVIC',
		'action' => 'ACTION',
		'экшен' => 'ACTION',
		'sx4' => 'SX4',
		'liana' => 'LIANA',
		'лиана' => 'LIANA',
		'grandvitara' => 'GRAND VITARA',
		'грандвитара' => 'GRAND VITARA',
		'mazda3' => 'MAZDA 3',
		'мазда3' => 'MAZDA 3',
		'мазда6' => 'MAZDA 6',
		'mazda6' => 'MAZDA 6',
		'cx5' => 'CX5',
		'cx9' => 'CX9'
	  }
	
	#		Хеш для ответа на не заполнение поля Визит		
		hh_client = {
			:number_auto => 'Запишите Гос. номер а/м',
			:auto => 'Выберите марку а/м',
			:modelauto => 'Вы не записали модель а/м',
			:km => 'Запишите пробег в км',
			:ecu => 'Напишите версию калибровок или софта'
		}
	
		#		Получаем переменные из пост - запроса	
			@auto			= params[:auto]
			@modelauto	 	= params[:modelauto]
			@number_auto 	= params[:number_auto]
			@km 			= params[:km]
			@ecu 			= params[:ecu]
			@deffect 		= params[:deffect]
			@phone			= params[:phone]
			@price			= params[:price]
	
						if @modelauto != @hash_model[@key_model]
							@key_model = @modelauto     
							@modelauto = @hash_model[@key_model]
						end
	
	#		Вывод сообщений из хеша в зависимости какое поле не заполнено!
			@error = hh_client.select {|key,_| params[key] == ""}.values.join(", ")
			if @error != ''
				return erb :max
			end
	
			db = init_db
			db.execute 'INSERT INTO
				max
				(
					auto,
					modelauto,
					number_auto,
					km,
					ecu,
					deffect,
					price,
					phone,
					date_time
				)
				values (?, ?, ?, ?, ?, ?, ?, ?, ?)', [@auto, @modelauto, @number_auto, @km, @ecu, @deffect, @price, @phone, @time.strftime('%d %B %Y %H:%M')]
		
				db.close
#				Вывод на экран результата заполнения данных клиента		
			erb "<body>#{@number_auto} #{@auto} #{@modelauto} #{@km}км: Сумма #{@price} Дата #{@time.strftime('%d %B %Y %H:%M')}<br />#{@deffect}</body>" 
		
	end

#	==========================================================

	post '/admin/demidov' do

		@time = Time.now		
	
	#    Хеш с Моделями автомобилей, использовать как словарь
	@hash_model = {
		'q5' => 'Q5',
		'x1' => 'X1',
		'х1' => 'X1',
		'x2' => 'X2',
		'x3' => 'X3',
		'х3' => 'X3',
		'x5' => 'X5',
		'х5' => 'X5',
		'e60' => 'E60',
		'е60' => 'E60',
		'e90' => 'E90',
		'ети' => 'YETI',
		'tnb' => 'YETI',
		'eti' => 'YETI',
		'yeti' => 'YETI',
		'снкщт' => 'CYRON',
		'cyron' => 'CYRON',
		'rfqhjy' => 'CYRON',
		'кайрон' => 'CYRON',
		'kayron' => 'CYRON',
		'silverado' => 'SILVERADO',
		'r2' => 'R2',
		'r4' => 'R4',
		'spark' => 'SPARK',
		'спарк' => 'SPARK',
		'sparkev' => 'SPARK EV',
		'spin' => 'SPIN',
		'ss' => 'SS',
		'tahoe' => 'TAHOE',
		'tracker' => 'TRACKER',
		'trailblazer' => 'TRAILBLAZER',
		'traverse' => 'TRAVERSE',
		'viva' => 'VIVA',
		'volt' => 'VOLT',
		'alero' => 'ALERO',
		'aveo' => 'AVEO',
		'авео' => 'AVEO',
		'blazer' => 'BLAZER',
		'camaro' => 'CAMARO',
		'captiva' => 'CAPTIVA',
		'каптива' => 'CAPTIVA',
		'cobalt' => 'COBALT',
		'кобальт' => 'COBALT',
		'corvette' => 'CORVETTE',
		'cruze' => 'CRUZE',
		'круз' => 'CRUZE',
		'epica' => 'EPICA',
		'епика' => 'EPICA',
		'evanda' => 'EVANDA',
		'эванда' => 'EVANDA',
		'impala' => 'IMPALA',
		'lacetti' => 'LACETTI',
		'лачети' => 'LACETTI',
		'lanos' => 'LANOS',
		'ланос' => 'LANOS',
		'lovarv' => 'LOVA RV',
		'malibu' => 'MALIBU',
		'orlando' => 'ORLANDO',
		'орландо' => 'ORLANDO',
		'rezo' => 'REZZO',
		'резо' => 'REZZO',
		'accent' => 'ACCENT',
		'frwtyn' => 'ACCENT',
		'акцент' => 'ACCENT',
		'фссуте' => 'ACCENT',
		'akcent' => 'ACCENT',
		'coupe' => 'COUPE',
		'creta' => 'CRETA',
		'rhtnf' => 'CRETA',
		'крета' => 'CRETA',
		'скуеф' => 'CRETA',
		'RHTNF' => 'CRETA',
		'kreta' => 'CRETA',
		'elantra' => 'ELANTRA',
		'элантра' => 'ELANTRA',
		'equus' => 'EQUUS',
		'tucson' => 'TUCSON',
		'nercjy' => 'TUCSON',
		'туксон' => 'TUCSON',
		'егсыщт' => 'TUCSON',
		'genesis' => 'GENESIS',
		'генезис' => 'GENESIS',
		'genesis coupe' => 'GENESIS COUPE',
		'gets' => 'GETZ',
		'гетс' => 'GETZ',
		'grand santafe' => 'GRAND SANTAFE',
		'graunder' => 'GRANDEUR',
		'h1' => 'H-1',
		'i10' => 'I10',
		'i20' => 'I20',
		'i30' => 'I30',
		'i40' => 'I40',
		'ioniq' => 'IONIQ',
		'ioniq5' => 'IONIQ 5',
		'ix20 ' => 'IX20',
		'ix25' => 'IX25',
		'ix35' => 'IX35',
		'ix55' => 'IX55',
		'fx35' => 'FX35',
		'kona' => 'KONA',
		'matrix' => 'MATRIX',
		'матрикс' => 'MATRIX',
		'sonatanf' => 'SONATA NF',
		'palisade' => 'PALISADE',
		'santafe' => 'SANTAFE',
		'сантафе' => 'SANTAFE',
		'solaris' => 'SOLARIS',
		'солярис' => 'SOLARIS',
		'sonata' => 'SONATA',
		'соната' => 'SONATA',
		'starex' => 'STAREX',
		'старекс' => 'STAREX',
		'terracan' => 'TERRACAN',
		'trajet' => 'TRAJET',
		'veloster' => 'VELOSTER',
		'venue' => 'VENUE',
		'verna' => 'VERNA',
		'xcent' => 'XCENT',
		'cadenza' => 'CADENZA',
		'carens' => 'CARENS',
		'каренс' => 'CARENS',
		'carnival' => 'CARNIVAL',
		'ceed' => 'CEED',
		'сид' => 'CEED',
		'cerato' => 'CERATO',
		'церато' => 'CERATO',
		'ev6' => 'EV6',
		'k2 cross' => 'K2 CROSS',
		'k5' => 'K5',
		'k9' => 'K9',
		'k900' => 'K900',
		'magentis' => 'MAGENTIS',
		'мажентис' => 'MAGENTIS',
		'mohave' => 'MOHAVE',
		'мохав' => 'MOHAVE',
		'niro' => 'NIRO',
		'opirus' => 'OPIRUS',
		'optima' => 'OPTIMA',
		'оптима' => 'OPTIMA',
		'picanto' => 'PICANTO',
		'пиканто' => 'PICANTO',
		'proceed' => 'PROCEED',
		'quoris' => 'QUORIS',
		'rio' => 'RIO',
		'рио' => 'RIO',
		'seltos' => 'SELTOS',
		'sorento' => 'SORENTO',
		'соренто' => 'SORENTO',
		'сосренто' => 'SORENTO',
		'soul' => 'SOUL',
		'соул' => 'SOUL',
		'soulev' => 'SOUL EV',
		'spectra' => 'SPECTRA',
		'спектра' => 'SPECTRA',
		'sportage' => 'SPORTAGE',
		'спортаж' => 'SPORTAGE',
		'stinger' => 'STINGER',
		'stonic' => 'STONIC',
		'telluride' => 'TELLURIDE',
		'venga' => 'VENGA',
		'xceed' => 'XCEED',
		'amarok' => 'AMAROK',
		'амарок' => 'AMAROK',
		'arteon ' => 'ARTEON',
		'atlascrosssport' => 'ATLAS CROSS SPORT',
		'beetle' => 'BEETLE',
		'bora' => 'BORA',
		'caddy' => 'CADDY',
		'кади' => 'CADDY',
		'crossgolf' => 'CROSS GOLF',
		'crosspolo' => 'CROSS POLO',
		'egolf' => 'E-GOLF',
		'eos' => 'EOS',
		'golf' => 'GOLF',
		'гольф' => 'GOLF',
		'golfalltrack' => 'GOLF ALLTRACK',
		'golfgti' => 'GOLF GTI',
		'golfplus' => 'GOLF PLUS',
		'golfr' => 'GOLF R',
		'golf sportvan' => 'GOLF SPORTSVAN',
		'id.3' => 'ID.3',
		'id.4' => 'ID.4',
		'jetta' => 'JETTA',
		'джета' => 'JETTA',
		'lavida' => 'LAVIDA',
		'multivan' => 'MULTIVAN',
		'newbeetle' => 'NEW BEETLE',
		'passat' => 'PASSAT',
		'пассат' => 'PASSAT',
		'passatalltrack ' => 'PASSAT ALLTRACK',
		'passatcc ' => 'PASSAT CC',
		'passatgte' => 'PASSAT GTE',
		'phaeton' => 'PHAETON',
		'pointer' => 'POINTER',
		'polo' => 'POLO',
		'поло' => 'POLO',
		'scirocco' => 'SCIROCCO',
		'sharan' => 'SHARAN',
		'taos' => 'TAOS',
		'tarek' => 'TAREK',
		'tcross' => 'T-CROSS',
		'teramont' => 'TERAMONT',
		'tiguan' => 'TIGUAN',
		'тигуан' => 'TIGUAN',
		'toureg' => 'TOUAREG',
		'таурег' => 'TOUAREG',
		'touran' => 'TOURAN',
		'тоуран' => 'TOURAN',
		'transporter' => 'TRANSPORTER',
		'транспортер' => 'TRANSPORTER',
		'xl1' => 'XL1',
		'h2' => 'H2',
		'h3' => 'H3',
		'h5' => 'H5',
		'xtral' => 'XTRAL',
		'фдьукф' => 'ALMERA',
		'almera' => 'ALMERA',
		'альмера' => 'ALMERA',
		'примьера' => 'PRIMERA',
		'primera' => 'PRIMERA',
		'qashqai' => 'QASHQAI',
		'кашкай' => 'QASHQAI',
		'tiida' => 'TIIDA',
		'тиида' => 'TIIDA',
		'juke' => 'JUKE',
		'жук' => 'JUKE',
		'teana' => 'TEANA',
		'теана' => 'TEANA',
		'note' => 'NOTE',
		'нот' => 'NOTE',
		'chance' => 'CHANCE',
		'шанс' => 'CHANCE',
		'outlanderxl' => 'OUTLANDER XL',
		'оутландерхл' => 'OUTLANDER XL',
		'оутландер' => 'OUTLANDER',
		'outlander' => 'OUTLANDER',
		'lancer10' => 'LANCER 10',
		'ланцер10' => 'LANCER 10',
		'lancer9' => 'LANCER 9',
		'ланцер9' => 'LANCER 9',
		'pajero' => 'PAJERO',
		'паджеро' => 'PAJERO',
		'nexia' => 'NEXIA',
		'нексия' => 'NEXIA',
		'matiz' => 'MATIZ',
		'матиз' => 'MATIZ',
		'gentra' => 'GENTRA',
		'джентра' => 'GENTRA',
		'largus' => 'LARGUS',
		'ларгус' => 'LARGUS',
		'xray' => 'XRAY',
		'храй' => 'XRAY',
		'хрей' => 'XRAY',
		'гранта' => 'GRANTA',
		'granta' => 'GRANTA',
		'vesta' => 'VESTA',
		'веста' => 'VESTA',
		'astra' => 'ASTRA',
		'астра' => 'ASTRA ',
		'корса' => 'CORSA',
		'corsa' => 'CORSA',
		'астраг' => 'ASTRA G',
		'astrag' => 'ASTRA G',
		'astraj' => 'ASTRA J',
		'астраж' => 'ASTRA J',
		'astrah' => 'ASTRA H',
		'астран' => 'ASTRA H',
		'исигния' => 'ISIGNIA',
		'isignia' => 'ISIGNIA',
		'x60' => 'X60',
		'х60' => 'X60',
		'tigo' => 'TIGO',
		'тиго' => 'TIGO',
		'amulet' => 'AMULET',
		'амулет' => 'AMULET',
		'emgrand' => 'EMGRAND',
		'емгранд' => 'EMGRAND',
		'atlas' => 'ATLAS',
		'атлас' => 'ATLAS',
		'coolray' => 'COOLRAY',
		'кулрей' => 'COOLRAY',
		'кулрай' => 'COOLRAY',
		'logan' => 'LOGAN',
		'логан' => 'LOGAN',
		'sandero' => 'SANDERO',
		'сандеро' => 'SANDERO',
		'arkana' => 'ARKANA',
		'аркана' => 'ARKANA',
		'kaptur' => 'KAPTUR',
		'каптур' => 'KAPTUR',
		'каптюр' => 'KAPTUR',
		'duster' => 'DUSTER',
		'дастер' => 'DUSTER',
		'megan2' => 'MEGAN 2',
		'меган2' => 'MEGAN 2',
		'megan3' => 'MEGAN 3',
		'меган3' => 'MEGAN 3',
		'octavia' => 'OCTAVIA',
		'октавия' => 'OCTAVIA',
		'rapid' => 'RAPID',
		'рапид' => 'RAPID',
		'фабия' => 'FABIA',
		'fabia' => 'FABIA',
		'suprb' => 'SUPERB',
		'суперб' => 'SUPERB',
		'kalina' => 'KALINA',
		'калина' => 'KALINA',
		'шнива' => 'ШЕВИ НИВА',
		'шеви' => 'ШЕВИ НИВА',
		'шевинива' => 'ШЕВИ НИВА',
		'2107' => '2107',
		'2111' => '2111',
		'2114' => '2114',
		'2115' => '2115',
		'2109' => '2109',
		'2110' => '2110',
		'2112' => '2112',
		'gazel' => 'GAZEL',
		'газель' => 'GAZEL',
		'приора' => 'PRIORA',
		'priora' => 'PRIORA',
		'niva' => 'NIVA',
		'нива' => 'NIVA',
		'focus2' => 'FOCUS 2',
		'фокус2' => 'FOCUS 2',
		'focus3' => 'FOCUS 3',
		'фокус3' => 'FOCUS 3',
		'ащсгы3' => 'FOCUS 3',
		'mondeo' => 'MONDEO',
		'мондео' => 'MONDEO',
		'mondeo3' => 'MONDEO 3',
		'ьщтвущ3' => 'MONDEO 3',
		'vjyltj3' => 'MONDEO 3',
		'мондео3' => 'MONDEO 3',
		'mondeo4' => 'MONDEO 4',
		'vjyltj4' => 'MONDEO 4',
		'мондео4' => 'MONDEO 4',
		'ьщтвущ4' => 'MONDEO 4',
		'kuga' => 'KUGA',
		'куга' => 'KUGA',
		'лгпф' => 'KUGA',
		'reuf' => 'KUGA',
		'camry' => 'CAMRY',
		'камри' => 'CAMRY',
		'yaris' => 'YARIS',
		'ярис' => 'YARIS',
		'авенсис' => 'AVENSIS',
		'avensis' => 'AVENSIS',
		'berlingo' => 'BERLINGO',
		'берлинго' => 'BERLINGO',
		'308' => '308',
		'3008' => '3008',
		'408' => '408',
		'4008' => '4008',
		'207' => '207',
		'c4' => 'C4',
		'с4' => 'C4',
		'c3' => 'C3',
		'с3' => 'C3',
		'crv' => 'CRV',
		'срв' => 'CRV',
		'acord' => 'ACORD',
		'акорд' => 'ACORD',
		'civic' => 'CIVIC',
		'цивик'=> 'CIVIC',
		'action' => 'ACTION',
		'экшен' => 'ACTION',
		'sx4' => 'SX4',
		'liana' => 'LIANA',
		'лиана' => 'LIANA',
		'grandvitara' => 'GRAND VITARA',
		'грандвитара' => 'GRAND VITARA',
		'mazda3' => 'MAZDA 3',
		'мазда3' => 'MAZDA 3',
		'мазда6' => 'MAZDA 6',
		'mazda6' => 'MAZDA 6',
		'cx5' => 'CX5',
		'cx9' => 'CX9'
	  }
	
	#		Хеш для ответа на не заполнение поля Визит		
		hh_client = {
			:number_auto => 'Запишите Гос. номер а/м',
			:auto => 'Выберите марку а/м',
			:modelauto => 'Вы не записали модель а/м',
			:km => 'Запишите пробег в км',
			:ecu => 'Напишите версию калибровок или софта'
		}
	
		#		Получаем переменные из пост - запроса	
			@auto			= params[:auto]
			@modelauto	 	= params[:modelauto]
			@number_auto 	= params[:number_auto]
			@km 			= params[:km]
			@ecu 			= params[:ecu]
			@deffect 		= params[:deffect]
			@phone			= params[:phone]
			@price			= params[:price]
	
					if @modelauto != @hash_model[@key_model]
						@key_model = @modelauto     
						@modelauto = @hash_model[@key_model]
					end
	
	#		Вывод сообщений из хеша в зависимости какое поле не заполнено!
			@error = hh_client.select {|key,_| params[key] == ""}.values.join(", ")
			if @error != ''
				return erb :demidov
			end
	
			db = init_db
			db.execute 'INSERT INTO
				demidov
				(
					auto,
					modelauto,
					number_auto,
					km,
					ecu,
					deffect,
					price,
					phone,
					date_time
				)
				values (?, ?, ?, ?, ?, ?, ?, ?, ?)', [@auto, @modelauto, @number_auto, @km, @ecu, @deffect, @price, @phone, @time.strftime('%d %B %Y %H:%M')]
		
				db.close
#				Вывод на экран результата заполнения данных клиента		
			erb "<body>#{@number_auto} #{@auto} #{@modelauto} #{@km}км: Сумма #{@price} Дата #{@time.strftime('%d %B %Y %H:%M')}<br />#{@deffect}</body>" 
		
	end


	#=====================================================


	post '/admin/chatfree' do

		@time = Time.now		
	
#		Хеш для ответа на не заполнение поля Визит		
		hh_client = {
			:firstname => 'Гос номер не записан',
			:lastname => 'Запишите Гос. номер а/м',
			:login => 'Выберите марку а/м',
			:password => 'Вы не записали модель а/м',
			:email => 'Запишите пробег в км',
			:date_time => 'Напишите версию калибровок или софта'
		}
	
#		Получаем переменные из пост - запроса	
			@firstname		= params[:firstname]
			@lastname	 	= params[:lastname]
			@login			= params[:number_auto]
			@password		= params[:password]
			@email			= params[:email]
			@date_time 		= params[:date_time]
	
#		Вывод сообщений из хеша в зависимости какое поле не заполнено!
			@error = hh_client.select {|key,_| params[key] == ""}.values.join(", ")
			if @error != ''
				return erb :chat
			end
	
			db = init_db
			db.execute 'INSERT INTO
				chat
				(
					firstname,
					lastname,
					login,
					password,
					email,
					date_time
				)
				values (?, ?, ?, ?, ?, ?)', [@firstname, @lastname, @login, @password, @email, @time.strftime('%d %B %Y %H:%M')]
		
				db.close
#				Вывод на экран результата заполнения данных клиента		
			erb "<body>#{@firstname} #{@lastname} #{@login} #{@password} #{@email} Дата #{@time.strftime('%d %B %Y %H:%M')}</body>" 
		
	end