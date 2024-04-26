def solution(str)
    str.scan(/.{1,2}/).map { |pair| pair.ljust(2, '_') }
   end