# encoding: UTF-8
class Currency

@@currency_symbols = {
  "$" => "USD",
  "€" => "EUR",
  "¥" => "CNY",
  "£" => "GBP",
  "₪" => "ILS",
  "₹" => "INR",
  "₩" => "KRW",
  "₽" => "RUB",
  "₴" => "UAH"
}

  def initialize(type, value)
    if @@currency_symbols.has_value?(type)
      @type = type
    elsif @@currency_symbols.has_key?(type) #if the class hash has what you wrote for type as a key, then
      @type = @@currency_symbols.fetch(type) #you will reassign the associated value as the value for @type
    else
      raise UnrecognizedCurrencyError, "This is not a recognized currency symbol."
    end

    if value.is_a? Float
      @value = value
    elsif value.is_a? Fixnum
      @value = value.to_f
    else
      raise BadFactorError, "This is not a valid factor."
    end
  end

  def ==(other)
    if @type == other.type && @value == other.value
      return true
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

class DifferentCurrencyCodeError < StandardError; end
class BadFactorError < StandardError; end
class UnrecognizedCurrencyError < StandardError; end

seashell = Currency.new("£", 10)
seashell2 = Currency.new("GBP", 190.0)
# whiskey_bottle = Currency.new("USD", 10)

# test_value = seashell.+(seashell2)
test_sub = seashell.-(seashell2)
test_multiply = seashell.*(11)

# test_clash = seashell.+(whiskey_bottle)
# test_clash2 = seashell.-(whiskey_bottle)
# seashell.==(seashell2)
# whiskey_bottle.==(seashell)
