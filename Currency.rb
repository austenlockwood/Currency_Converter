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

  def type
    @type
  end

  def value
    @value
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
      new_value = @value + other.value
      return Currency.new(@type, new_value)
    else
      raise DifferentCurrencyCodeError, "You cannot run this calculation between different currency types."
    end
  end

  def -(other)
    if @type == other.type
      new_value = @value - other.value
      return Currency.new(@type, new_value)
    else
      raise DifferentCurrencyCodeError, "You cannot run this calculation between different currency types."
    end
  end

  def *(other)
    new_value = @value * other
    Currency.new(@type, new_value)
  end

end

class DifferentCurrencyCodeError < StandardError; end
class BadFactorError < StandardError; end
class UnrecognizedCurrencyError < StandardError; end

pounds = Currency.new("£", 10)
pounds2 = Currency.new("GBP", 190.0)
whiskey_bottle = Currency.new("USD", 10)

test_value = pounds.+(pounds2)
test_sub = pounds.-(pounds2)
test_multiply = pounds.*(11)

# test_clash = pounds.+(whiskey_bottle)
# test_clash2 = pounds.-(whiskey_bottle)
# pounds.==(pounds2)
# whiskey_bottle.==(pounds)
