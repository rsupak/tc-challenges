# converts fraction to either a mixed number, whole number, or
# non-reducable fraction
def mixed_fraction(fraction)
  output = negative?(fraction) ? '-' : ''
  fraction = mix_number(reduce_fraction(get_fraction(fraction.tr('-', ''))))
  return '0' if fraction[0].zero?
  return output + fraction[0].to_s if fraction.length == 2 &&
                                      whole_number_only?(fraction)
  if fraction.length == 2 && !whole_number_only?(fraction)
    return output + "#{fraction[0]}/#{fraction[1]}"
  end

  output + "#{fraction[2]} #{fraction[0]}/#{fraction[1]}"
end

# check if fraction < 0
def negative?(fraction)
  count = 0
  fraction.each_char do |char|
    count += 1 if char == '-'
  end
  count.odd?
end

# converts string fraction to array of numbers
def get_fraction(fraction)
  fraction.split('/').map(&:to_i)
end

# reduces fraction by greatest common denominator
# gcd is a method built into Integer class
def reduce_fraction(fraction)
  gcd = fraction[0].gcd(fraction[1])
  fraction.map { |num| num / gcd }
end

# converts into a mixed number
# returns fraction with whole number now in array
def mix_number(fraction)
  if fraction[0] / fraction[1] > 0 && fraction[0] % fraction[1] > 0
    fraction << fraction[0] / fraction[1]
    fraction[0] = fraction[0] % fraction[1]
  end
  fraction
end

# check if fraction can be reduced to a whole number
def whole_number_only?(fraction)
  fraction[1] == 1
end

# Test method
if $PROGRAM_NAME == __FILE__
  p mixed_fraction('43/6')
end
