class Guest

attr_reader :name, :age
attr_accessor :wallet


def initialize(name, age, wallet)
  @name = name
  @age = age
  @wallet = wallet
end


end
