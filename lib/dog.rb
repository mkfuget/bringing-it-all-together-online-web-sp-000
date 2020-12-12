class Dog 
  
  def self.create_table
    drop_table    
    sql_create = <<-SQL 
      CREATE TABLE dogs 
    SQL
    
    db[:conn].execute(sql_create)
  end 
  
  def self.drop_table
    sql_drop = <<-SQL 
      DROP TABLE IF EXISTS dogs 
    SQL
    
    db[:conn].execute(sql_drop)
  end
    
end