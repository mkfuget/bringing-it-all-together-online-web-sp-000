class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(data_hash)
    @name = data_hash[:name] 
    @breed = data_hash[:breed] 
    @id = data_hash[:id] 
  end 
  
  def self.create_table
    drop_table    
    sql_create = <<-SQL
      CREATE TABLE dogs (
        name TEXT,
        breed TEXT,
        id INTEGER PRIMARY KEY
      )
    SQL
    
    DB[:conn].execute(sql_create)
  end 
  
  def self.drop_table
    sql_drop = <<-SQL
      DROP TABLE IF EXISTS dogs
    SQL
    
    DB[:conn].execute(sql_drop)
  end
  
  def save
    
    sql = <<-SQL
      INSERT INTO DOGS (name, breed) 
      VALUES (? , ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    return self
  end
  def self.new_from_db(data_row)
    hash = {
      :name => data_row[1],
      :breed => data_row[2],
      :id => data_row[0]
    }
    Dog.new(hash)
  end 
  def self.create(data_hash)
    out = Dog.new(data_hash)
    out.save
    return out
  end
  
  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * FROM dogs WHERE name = ?
    SQL
    
    row_data = DB[:conn].execute(sql, self.name).map {|x| self.new_from_db(x)}.first 
  end 

end