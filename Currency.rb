class Currency

  def initialize(type, value)
    @type = type
    @value = value
  end

  def type
    return @type
  end

  def value
    return @value
  end

  def ==(other)
    if @type == other.type && @value == other.value
      return true #so if these instance variables match, it returns true instead of default false
    else
      return false
    end
  end

  def +(other)
    if @type == other.type
      return @value + other.value
    else
      raise DifferentCurrencyCodeError, "You cannot run this calculation between different currency types."
    end
  end

  def -(other)
    if @type == other.type
      return @value - other.value
    else
      raise DifferentCurrencyCodeError, "You cannot run this calculation between different currency types."
    end
  end

  def *(other)
    if other.is_a? Float
      @value *= other
    elsif other.is_a? Fixnum
      other = other.to_f
      @value *= other
    else
      raise BadFactorError, "This is not a valid factor."
    end
  end

end

class DifferentCurrencyCodeError < StandardError
end

class BadFactorError < StandardError
end

seashell = Currency.new("SEA", 10.9)
seashell2 = Currency.new("SEA", 190)
whiskey_bottle = Currency.new("WSK", 10)
#
# test_value = seashell.+(seashell2)
# test_sub = seashell.-(seashell2)
test_multiply = seashell.*(4.3)

# test_clash = seashell.+(whiskey_bottle)
# test_clash2 = seashell.-(whiskey_bottle)
# seashell.==(seashell2)
# whiskey_bottle.==(seashell)


# need a method that will compare an instance variable not the entire shebang
