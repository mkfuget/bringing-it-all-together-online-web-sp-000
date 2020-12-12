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
      VALUE (? , ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.id)
    
    

end