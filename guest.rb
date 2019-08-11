class Guest

attr_reader :name
attr_accessor :wallet


def initialize(name, wallet = 0) #default wallet to zero
  @name = name
  @wallet = wallet
end


end
