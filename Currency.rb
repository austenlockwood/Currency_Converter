class Currency

  def initialize(type, value)
    @type = type               # => "SEA", "SEA", "WSK"
    @value = value             # => 10, 190, 10
  end                          # => :initialize

  def type
    return @type  # => "SEA", "SEA", "WSK"
  end             # => :type

  def value
    return @value  # => 190, 190
  end              # => :value

  def ==(other)
    if @type == other.type && @value == other.value
      return true #so if these instance variables match, it returns true instead of default false
    else
      return false
    end
  end                                                # => :==

  def +(other)
    if @type == other.type                                                                         # => true, false
      return @value + other.value                                                                  # => 200
    else
      raise DifferentCurrencyCodeError, "You cannot add values between different currency types."  # ~> DifferentCurrencyCodeError: You cannot add values between different currency types.
    end
  end                                                                                              # => :+

  def -(other)
    if @type == other.type                                                                              # => true
      return @value - other.value                                                                       # => -180
    else
      raise DifferentCurrencyCodeError, "You cannot subtract values between different currency types."
    end
  end                                                                                                   # => :-
end                                                                                                     # => :-

class DifferentCurrencyCodeError < StandardError  # => StandardError
end                                               # => nil




seashell = Currency.new("SEA", 10)        # => #<Currency:0x007fcb7501aa98 @type="SEA", @value=10>
seashell2 = Currency.new("SEA", 190)      # => #<Currency:0x007fcb7501a278 @type="SEA", @value=190>
whiskey_bottle = Currency.new("WSK", 10)  # => #<Currency:0x007fcb75019b98 @type="WSK", @value=10>

test_value = seashell.+(seashell2)        # => 200
test_sub = seashell.-(seashell2)          # => -180
test_clash = seashell.+(whiskey_bottle)
test_clash2 = seashell.-(whiskey_bottle)

seashell.==(seashell2)
whiskey_bottle.==(seashell)


# need a method that will compare an instance variable not the entire shebang

# ~> DifferentCurrencyCodeError
# ~> You cannot add values between different currency types.
# ~>
# ~> /Users/austenlockwood/Desktop/TIYJun/Wk01/currency_converter/Currency.rb:28:in `+'
# ~> /Users/austenlockwood/Desktop/TIYJun/Wk01/currency_converter/Currency.rb:53:in `<main>'
