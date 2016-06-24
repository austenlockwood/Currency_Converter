class Currency

  def initialize(type, value)
    @type = type               # => "SEA", "SEA", "WSK"
    @value = value             # => 10, 190, 10
  end                          # => :initialize

  def type
    return @type  # => "SEA", "SEA", "WSK", "WSK", "SEA", "SEA"
  end             # => :type

  def value
    return @value  # => 190, 190, 190
  end              # => :value

  def ==(other)
    if @type == other.type && @value == other.value  # => false, false
      return true #so if these instance variables match, it returns true instead of default false
    else
      return false                                   # => false, false
    end
  end                                                # => :==

  def +(other)
    if @type == other.type                                                                                   # => true, false
      return @value + other.value                                                                            # => 200
    else
      raise DifferentCurrencyCodeError, "You cannot run this calculation between different currency types."
    end
  end                                                                                                        # => :+

  def -(other)
    if @type == other.type                                                                                   # => true, false
      return @value - other.value                                                                            # => -180
    else
      raise DifferentCurrencyCodeError, "You cannot run this calculation between different currency types."
    end
  end                                                                                                        # => :-
end                                                                                                          # => :-

class DifferentCurrencyCodeError < StandardError  # => StandardError
end                                               # => nil




seashell = Currency.new("SEA", 10)        # => #<Currency:0x007fa03a0162b0 @type="SEA", @value=10>
seashell2 = Currency.new("SEA", 190)      # => #<Currency:0x007fa03a015b08 @type="SEA", @value=190>
whiskey_bottle = Currency.new("WSK", 10)  # => #<Currency:0x007fa03a015478 @type="WSK", @value=10>

test_value = seashell.+(seashell2)          # => 200
test_sub = seashell.-(seashell2)            # => -180

test_clash = seashell.+(whiskey_bottle)
test_clash2 = seashell.-(whiskey_bottle)
                                      # => nil
seashell.==(seashell2)                      # => false
whiskey_bottle.==(seashell)                 # => false


# need a method that will compare an instance variable not the entire shebang
