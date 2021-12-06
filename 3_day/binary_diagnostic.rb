class BinaryDiagnostic
  attr_reader :numbers

  def initialize(input)
    @numbers = IO.readlines(input)
  end

  
end
