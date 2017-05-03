# return n! % m == 0
def factorial_div?(n, m)
  return true if m < n
  primes = build_primes(n)
  prime_count_hash = prime_count(primes, n)

  primes.each do |prime|
    prime_count = 0
    factor_max = Math.sqrt(m)
    while prime*prime_count < factor_max
      return false if prime_count > prime_count_hash[prime]
      prime_count += 1
    end
  end

  true
end

def build_primes(n)
  return [] if n < 2
  idx = 2
  primes = []
  while idx <= n
    primes << idx if is_prime?(idx, primes)
    idx += 1
  end

  primes
end

def is_prime?(idx, primes)
  primes.each do |prime|
    return false if idx % prime == 0
  end
  true
end

def prime_count(primes, n)
  prime_count_hash = Hash.new(0)
  primes.each do |prime|
    (1..n).each do |i|
      idx = 1
      while prime*idx <= i
        prime_count_hash[prime] += 1 if i % prime*idx == 0
        idx += 1
      end
    end
  end

  prime_count_hash
end

puts factorial_div?(4, 6)
puts factorial_div?(5, 12)
