class Currency

  def initialize(type, rate)
    @type = type
    @rate = rate
  end

  def type
    return @type
  end

  def rate
    return @rate
  end

  def ==(other)
    if @type == other.type && @rate == other.rate
      return true #so if these instance variables match, it returns true instead of default false
    else
      return false
    end
  end

end

francs = Currency.new("FRC", 0.56)
francs2 = Currency.new("FRC", 0.56)

francs.==(francs2)
# francs.rate         # ~> NoMethodError: undefined method `rate' for #<Currency:0x007f878b81bb80 @type="FRC", @rate=0.56>

# need a method that will compare an instance variable not the entire shebang
