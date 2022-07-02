require 'SQlite3'
	
db = SQLite3::Database.new 'brand.db3'

db.execute "SELECT * from Brandauto" do |name|
    puts name
    puts "===="
end
#       Выполним обращение к базе данных
db.execute "INSERT INTO Brandauto (name, brand) VALUES ('great wall', 'GREAT WALL'), ('mitsubishi', 'MITSUBISHI')"


db.close