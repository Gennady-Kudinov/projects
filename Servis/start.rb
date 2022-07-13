require 'pry'

hh = {
  'ауди' => 'AUDI',
  'audi' => 'AUDI',
  'felb' => 'AUDI',
  'фгвш' => 'AUDI',
  'бмв' => 'BMW',
  'bmw' => 'BMW',
  ',vd' => 'BMW',
  'иьц' => 'BMW',
  'акура' => 'Acura',
  'альфа ромео' => 'Alfa Romeo',
  'кадилак' => 'Cadillac',
  'чери' => 'Chery',
  'шевроле' => 'Chevrolet',
  'ситроен' => 'Citroen',
  'деу' => 'DAEWOO',
  'daewoo' => 'DAEWOO',
  'додж' => 'Dodge',
  'фиат' => 'Fiat',
  'форд' => 'Ford',
  'ащкв' => 'Ford',
  'ford' => 'Ford',
  'ajhl' => 'Ford',
  'focus' => 'Focus',
  'ajrec' => 'Focus',
  'ащсгы' => 'Focus',
  'фокус' => 'Focus',
  'газ' => 'GAZ',
  'пфя' => 'GAZ',
  'gaz' => 'GAZ',
  'ufp' => 'GAZ',
  'джили' => 'Geely',
  'хонда' => 'Honda',
  'хюндай' => 'Hyundai',
  'hyundai' => 'Hyundai',
  'рнгтвфш' => 'Hyundai',
  '[.ylfq' => 'Hyundai',
  'инфинити' => 'Infiniti',
  'ягуар' => 'Jaguar',
  'джип' => 'Jeep',
  'киа' => 'KIA',
  'kia' => 'KIA',
  'rbf' => 'KIA',
  'лшф' => 'KIA',
  'ленд ровер' => 'Land Rover',
  'лексус' => 'Lexus',
  'лифан' => 'Lifan',
  'дшафт' => 'Lifan',
  'lifan' => 'Lifan',
  'kbafy' => 'Lifan',
  'линкольн' => 'Lincoln',
  'мазда' => 'Mazda',
  'mazda' => 'Mazda',
  'vfplf' => 'Mazda',
  'ьфявф' => 'Mazda',
  'мерседес' => 'Mercedes-Benz',
  'мини' => 'Mini',
  'мицубиси' => 'Mitsubishi',
  'мицу' => 'Mitsubishi',
  'ниссан' => 'Nissan',
  'тшыыфт' => 'Nissan',
  'nissan' => 'Nissan',
  'ybccfy' => 'Nissan',
  'опель' => 'Opel',
  'opel' => 'Opel',
  'jgtkm' => 'Opel',
  'щзуд' => 'Opel',
  'пежо' => 'Peugeot',
  'порш' => 'Porsche',
  'рено' => 'Renault',
  'reno' => 'Renault',
  'renault' => 'Renault',
  'кутщ' => 'Renault',
  'htyj' => 'Renault',
  'шкода' => 'Skoda',
  'skoda' => 'Skoda',
  'irjlf' => 'Skoda',
  'саненг' => 'SsangYong',
  'ыфтутп' => 'SsangYong',
  'saneng' => 'SsangYong',
  'ssangYong' => 'SsangYong',
  'субару' => 'Subaru',
  'сузуки' => 'Suzuki',
  'тоета' => 'Toyota',
  'ваз' => 'VAZ',
  'vaz' => 'VAZ',
  'dfp' => 'VAZ',
  'мфя' => 'VAZ',
  'заз' => 'ZAZ',
  'фольцваген' => 'Volkswagen',
  'вольво' => 'Volvo',
  'уаз' => 'UAZ',
  'гфя' => 'UAZ',
  'uaz' => 'UAZ',
  'efp' => 'UAZ',
  'фермер' => 'FERMER',
  'аукьук' => 'FERMER',
  'fermer' => 'FERMER',
  'athvth' => 'FERMER',
  'дайхатсу' => 'DAIHATSU',
  'Daihatsu' => 'DAIHATSU',
  'датсун' => 'DATSUN',
  'Datsun' => 'DATSUN',
  'сеат' => 'SEAT',
  'генезис' => 'Genesis',
  'кфмщт' => 'Ravon',
  'равон' => 'Ravon',
  'hfdjy' => 'Ravon',
  'ровер' => 'Rover',
  'сааб' => 'Saab',
  'смарт' => 'Smart',
  'гритвол' => 'GREAT WALL',
  'great wall' => 'GREAT WALL',
  'mitsubishi' => 'MITSUBISHI',
  'ravon' => 'RAVON',
  'haval' => 'HAVAL'
}

hash_model = {
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
  'asx' => 'ASX',
  'асх' => 'ASX',
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
  'mokka' => 'MOKKA',
  'мока' => 'MOKKA',
  'исигния' => 'ISIGNIA',
  'isignia' => 'ISIGNIA',
  'vectra' => 'VECTRA',
  'вектра' => 'VECTRA',
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
  'megan1' => 'MEGAN 1',
  'меган1' => 'MEGAN 1',
  'megan2' => 'MEGAN 2',
  'меган2' => 'MEGAN 2',
  'megan3' => 'MEGAN 3',
  'меган3' => 'MEGAN 3',
  'fluence' => 'FLUENCE',
  'флюенс' => 'FLUENCE',
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
  '2114' => '2114',
  '2107' => '2107',
  '2115' => '2115',
  '2109' => '2109',
  'gazel' => 'GAZEL',
  'газель' => 'GAZEL',
  'приора' => 'PRIORA',
  'priora' => 'PRIORA',
  'niva' => 'NIVA',
  'нива' => 'NIVA',
  'patriot' => 'PATRIOT',
  'патриот' => 'PATRIOT',
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
  'camry' => 'CAMRY',
  'камри' => 'CAMRY',
  'авенсис' => 'AVENSIS',
  'avensis' => 'AVENSIS',
  'corolla' => 'COROLLA',
  'корола' => 'COROLLA',
  'highlander' => 'HIGHLANDER',
  'хайлендер' => 'HIGHLANDER',
  'berlingo' => 'BERLINGO',
  'берлинго' => 'BERLINGO',
  'ландкрузер200' => 'LAND CRUISER 200',
  'LANDCRUISER200' => 'LAND CRUISER 200',
  '407' => '407',
  '408' => '408',
  'c4' => 'C4',
  'с4' => 'C4',
  'c3' => 'C3',
  'с3' => 'C3',
  'partner' => 'PARTNER',
  'партнер' => 'PARTNER',
  'crv' => 'CRV',
  'срв' => 'CRV',
  'acord' => 'ACORD',
  'акорд' => 'ACORD',
  'action' => 'ACTION',
  'экшен' => 'ACTION',
  'sx4' => 'SX4',
  'grandvitara' => 'GRAND VITARA',
  'грандвитара' => 'GRAND VITARA',
  'mazda3' => 'MAZDA 3',
  'мазда3' => 'MAZDA 3',
  'мазда6' => 'MAZDA 6',
  'mazda6' => 'MAZDA 6',
  'cx5' => 'CX5',
  'cx9' => 'CX9',
  'jolion' => 'JOLION',
  'джулион' => 'JOLION'
}

# require 'file'
require 'languager'
require 'fileutils'
require 'tempfile'
# require 'translit'
require 'find'
# require 'cyrillizer'

$time = Time.now
puts $time.strftime('%d %B %Y %H:%M').to_s

print 'Введите Гос.номер автомобиля: '
@number_auto = gets.strip.upcase
puts @number_auto
$baza = File.open('BAZA/database.txt') do |f|
  f.find { |line| line[@number_auto] }
end

print 'Введите Пробег автомобиля: '
$km = gets.strip
puts "#{@number_auto} Пробег: #{$km}"

# Класс для записи клиента который приезжал ранее
# что бы перейти сразу к заполнению дефектов машины и причин приезда
# Необходимо перенести данные о машине из поисковой строки и запустить метод
# ввода деффектов
class Client
  attr_accessor :line

  def initialize(number_auto)
    @number_auto = number_auto
  end

  # binding.pry

  #  Тут записывает в общую базу клиента если он уже был.
  #  путем поиска строки с клиентом и замены пробега и времени приезда
  def quest
    input = File.new('BAZA/database.txt', 'a+')
    input.each do |line|
      next unless line.include?(@number_auto)

      line.gsub!(/(Дата)(.*)$/) { "=> #{$km}км. #{Regexp.last_match(1)} #{$time.strftime('%d %B %Y %H:%M')}" }
      input.puts line
      return
    end
  end

  # Метод поиска по номеру а/м вывод его адреса (полный путь в виде строки)
  def check_engine
    @client_path = Dir.glob("/BAZA/**/#{@number_auto}.html")

    # Метод для добавления коментариев или того, что могли забыть дописать
    # @id_client = File.new((client_path[0]).to_s, 'a+')
    # @id_client.puts "<body><br/>#{$time.strftime('%d %B %Y %H:%M')} #{add_deffect}<br/><body>"
  end

  # Метод ЦЕНА на будущее
  # Статический метод
  def self.price
    price = gets.strip
    price_add = File.new("BAZA/**/#{@number_auto}.html", 'a+')
    price_add.puts "<body><br/>#{$time.strftime('%d %B %Y %H:%M')} Цена: #{price}<br/><body>"
  end
end

if $baza
  # Авто уже в базе
  puts 'Данный а/м уже находится в базе'
  add1 = Client.new(@number_auto)
  add1.quest
else
  # Авто еще нет в базе
  puts 'Данный а/м приехал впервые'
end

# binding.pry

loop do # Метод зацикливания и сравнивания ключа Бренда а/м с ключом хеша
  print 'Введите бренд автомобиля и нажмите Enter: '
  @key = gets.to_s.strip
  break if hh.key?(@key)
end
@auto = hh[@key].upcase # присваиваем переменной , берет правильное название бренда (из хеша)

loop do # Метод зацикливания и сравнивания ключа модели а/м с ключом хеша
  print 'Введите модель автомобиля и нажмите Enter: '
  @key_model = gets.to_s.strip
  break if hash_model.key?(@key_model)
end
@model_auto = hash_model[@key_model]
# функция << response = FileUtils.mkdir_p >> создает папку для записи клиента
def create_folder
  response = FileUtils.mkdir_p "BAZA/#{@auto}/#{@model_auto}/#{@number_auto}"
end
create_folder
# Метод создания файла с общей базой клиентов в виде списка ( строка - клиент )
def database_file
  database_file = File.new('BAZA/database.txt', 'a+')
  database_file.puts "#{@number_auto}  #{@auto}  #{@model_auto}  #{$km}км. Дата #{$time.strftime('%d %B %Y %H:%M')}"
end
database_file
# Метод вывода директории (место расположения), файла клиента/
def foldres_name_array
  puts foldres_name_array = Dir["**/*/#{@number_auto}.html"]
end

# Метод проверки существует ли файл в выбранной дирректории (папке)
def exist_folder
  File.exist?("BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html")
end

# Метод проверки на отсутствие файла в выбранной дерриктории (папке)
def exist_folder_true
  File.exist?("BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html") != true
end
# Вызов и исполнение метода << foldres_name_array >> при условии << true exist_folders >>
foldres_name_array if exist_folder
#===================================

# Создается папка клиента при условии если она отсутствовала
create_folder if exist_folder_true

# Метод вывода отчета о результате создания папки для клиента если клиент отсутствовал в базе
def report_execution
  puts "Была создана папка  #{$time.strftime('%d %B %Y %H:%M')}: для - BAZA/#{@auto}/#{@model_auto}/#{@number_auto} "
end

report_execution if exist_folder_true

# Метод присвоит переменной, когда он последний раз редактировался Методы аналогичные .ctime, .atime
def number_auto_time
  number_auto_time = File.new("BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html").ctime
end

# Проверит наличие файла в папке и при наличии присвоит время последнего редактирования
number_auto_time if exist_folder

# Создание метода вывода сообщения о последнем времени редактирования
def report_last_time
  puts "Последний раз #{@number_auto} приезжал: #{number_auto_time}"
end

# Выводит сообщение о последнем времени редактирования если файл существует
report_last_time if exist_folder
# В файл клиента вписывается идентификатор эбу или софта.
print 'Введите Идентификатор софта или тип ЭБУ: '
@ecu = gets.strip.upcase

# В файл клиента записывается проблемы авто и неисправности
def one_deffect
  print 'Введите краткое описание неисправностей а/м: '
  @deffect = gets.strip.capitalize
end
one_deffect
# Метод создания файла клиента с описание внутри файла
def id_client
  @id_client = File.new("BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html", 'a+')
  @id_client.puts "<body>#{@number_auto} #{@auto} #{@model_auto} #{$km}км. Тип ЭБУ #{@ecu}: Дата #{$time.strftime('%d %B %Y %H:%M')}<br/>#{@deffect}<br/><body>"
end
id_client

print 'Желаете что-то добавить? Нет - нажать Enter: '
$add_deffect = gets.strip.capitalize
# Метод для добавления коментариев или того, что могли забыть дописать
if @add_deffect != ''
  @id_client = File.new("BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html", 'a+')
  @id_client.puts "<body><br/>#{$add_deffect}<br/><body>"
end

# Метод поиска файла по идентификатору и вывод его адреса (полный путь в виде строки)
puts 'Введите идентификатор софта на английском и нажмите Enter: '
input_sw = gets.to_s.strip
if input_sw != ''
  sw_file = Dir.glob("D:/Damps/Baza/**/*#{input_sw}*.bin")
  # Метод добавления ключей каждому адресу найденого файла.
  sw_file.each_with_index { |path, i| puts "#{i + 1} => #{path}" }
  # Метод выбора пути (адреса) к файлу
  print 'Выбирете номер файла который вы планируете записать: '
  selected = gets.chomp.to_i
  puts sw_file[selected - 1]
  # Метод копирования выбранного файла из одного места в другое.
  FileUtils.cp(sw_file[selected - 1], "E:/BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/")
end
#system('C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe',
#       "E:/BAZA/#{@auto}/#{@model_auto}/#{@number_auto}/#{@number_auto}.html")
exit

# Способ замены все что после слова Дата, на новое время в интерпол. строк.
# line.gsub!(/(Дата)(.*)$/) { "#{$1} #{$time.strftime('%d %B %Y %H:%M')}" }
# @xx[-1].gsub!(/(Дата)(.*)$/) { "#{Regexp.last_match(1)} Дата #{$time.strftime('%d %B %Y %H:%M')}" }

# Метод добавления ключей каждому адресу найденого файла.
# client_path.each_with_index { |path, i| puts path.to_s }
# puts 'Запишите причину приезда а/м: '
# add_deffect = gets.strip
