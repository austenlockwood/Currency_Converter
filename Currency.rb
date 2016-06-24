class Currency

  def initialize(type, denom)
    @type = type               # => "SEA", "SEA", "WSK"
    @denom = denom             # => 10, 10, 10
  end                          # => :initialize

  def type
    return @type  # => "SEA", "SEA"
  end             # => :type

  def denom
    return @denom  # => 10
  end              # => :denom

  def ==(other)
    if @type == other.type && @denom == other.denom  # => true, false
      return true #so if these instance variables match, it returns true instead of default false
    else
      return false                                   # => false
    end
  end                                                # => :==

end  # => :==

seashell = Currency.new("SEA", 10)        # => #<Currency:0x007f8a0a81ede0 @type="SEA", @denom=10>
seashell2 = Currency.new("SEA", 10)       # => #<Currency:0x007f8a0a81d170 @type="SEA", @denom=10>
whiskey_bottle = Currency.new("WSK", 10)  # => #<Currency:0x007f8a0a81c928 @type="WSK", @denom=10>

seashell.==(seashell2)       # => true
whiskey_bottle.==(seashell)  # => false

# seashell.denom         # ~> NoMethodError: undefined method `denom' for #<Currency:0x007f878b81bb80 @type="FRC", @denom=0.56>

# need a method that will compare an instance variable not the entire shebang
