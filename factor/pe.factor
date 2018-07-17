USING: math.functions math.ranges ;

! https://projecteuler.net/problem=1
10 3 ^ [1,b) 
[ 
    { 3 5 } 
    [ [ divisor? ] curry ] each 
    bi or 
] 
filter sum .
