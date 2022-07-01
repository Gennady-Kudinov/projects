require 'SQlite3'
	
db = SQLite3::Database.new 'brand.db3'

#       Выполним обращение к базе данных
db.execute "INSERT INTO Brandauto (id, name, brand) VALUES (1, kia, KIA)"
db.close