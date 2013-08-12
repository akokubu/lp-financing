class DayBalance
  
  attr_accessor :day, :inStatements, :outStatements
  def initialize
    @inStatements = Array.new
    @outStatements = Array.new    
  end

  def addStatement(statement)
    if statement.inout == "in" then
      @inStatements.push(statement)
    else
      @outStatements.push(statement)
    end      
  end
  
  def in
    return sum(@inStatements)
  end
  
  def out
    return sum(@outStatements)
  end
  
  def balance(prevBalance) 
    return prevBalance + sum(@inStatements) - sum(@outStatements)
  end
  
  private
  def sum(statements)
    sum = 0
    statements.each do |statement|
      sum += statement.amount
    end
    return sum
  end
  
end