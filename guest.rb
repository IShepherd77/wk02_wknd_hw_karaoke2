class Guest

attr_reader :name
attr_accessor :wallet


def initialize(name, wallet = 0)
  @name = name
  @wallet = wallet
end


end
