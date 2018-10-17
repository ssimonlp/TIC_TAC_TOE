class BoardCase
  attr_accessor :value
  attr_reader :pos
  def initialize(pos)
    @pos = pos #chacune des case à une position et une valeur 
    @value = " "
  end
end
