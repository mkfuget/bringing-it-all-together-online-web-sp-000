class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(data_hash)
    @name = data_hash[:name] 
    @breed = data_hash[:breed] 
    @id = data_hash[:id] 
  end 
  
    
end