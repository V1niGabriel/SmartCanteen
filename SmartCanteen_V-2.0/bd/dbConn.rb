require 'sqlite3'

db_path = File.join(__dir__, 'sistema_cantina.db')

DB = SQLite3::Database.new(db_path)

#Habilita o uso de chaves estrangeiras
DB.execute("PRAGMA foreign_keys = ON")

#Faz com que os resultados venham como Hash (mais fácil de ler) em vez de Array
DB.results_as_hash = true