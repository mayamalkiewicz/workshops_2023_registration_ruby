class ValidatePassword

  def initialize(password)
    @password = password
  end

  def perform
    long_enough? &&
    has_at_least_one_uppercase? &&
    has_at_least_one_lowercase? &&
    has_special_char? &&
    max_two_repeating_symbols?
  end

  private

  def long_enough?
    @password.length >= 6 && @password.length <= 24
  end

  def has_at_least_one_uppercase?
    !!@password.match(/\p{Upper}/)
  end

  def has_at_least_one_lowercase?
    !!@password.match(/\p{Lower}/)
  end

  def has_special_char?
    !!@password.match(/[!@#$%&*+=:;?<>]/)
  end

  def has_at_least_one_number
    !!@password.match(/\d/)
  end

  def max_two_repeating_symbols?
    !@password.match(/(.)\1{2,}/)
  end
end
