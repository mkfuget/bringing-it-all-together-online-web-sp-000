class Dog 
  
  def self.create_table
    sql = <<-SQL 
      DROP TABLE IF EXISTS dogs 
    SQL
    
    db[:conn]