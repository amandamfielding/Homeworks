# Exercise 1
def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n-1)
end

# Exercise 2
def add_numbers(array)
  return array.first if array.length <= 1
  array.pop + add_numbers(array)
end

# Exercise 3
def gamma_fnc(num)
  return nil if num <= 0
  return num if num == 1
  (num-1) * gamma_fnc(num-1)
end
