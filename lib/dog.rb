class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(name, breed, id=nil)
    @name = name 
    @breed = breed 
    @id = id 
  end 
  
  def self.create_table
    drop_table    
    sql_create = <<-SQL
      CREATE TABLE dogs
    SQL
    
    DB[:conn].execute(sql_create)
  end 
  
  def self.drop_table
    sql_drop = <<-SQL
      DROP TABLE IF EXISTS dogs
    SQL
    
    DB[:conn].execute(sql_drop)
  end
    
end