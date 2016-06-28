require_relative './Currency.rb'

class CurrencyConverter

  def initialize(rates)
    @rates = rates
  end

  def convert(other, type)
    new_value = other.value * @rates[type]
    Currency.new(type.to_s, new_value)
  end

end

class UnrecognizedCurrencyError < StandardError; end

rates = {
  USD: 1.0,
  EUR: 0.90,
  CNY: 6.62,
  GBP: 0.73,
  ILS: 3.89,
  INR: 67.89,
  KRW: 1172.28,
  RUB: 65.67,
  UAH: 24.73,
}

currency_converter = CurrencyConverter.new(rates)
# currency_converter.convert(Currency.new("USD", 1), :USD) == Currency.new("USD", 1)    # => false
currency_converter.convert(Currency.new("USD", 1), :EUR)
