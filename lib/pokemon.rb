require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(name:, type:, db:, id: nil)
        @name=name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        # binding.pry
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type)
       
        # id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        db.results_as_hash = true
        row = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
        self.new(name: row["name"], type: row["type"], id: row["id"], db: db)
        # binding.pry
    end
end

# binding.pry
# 0