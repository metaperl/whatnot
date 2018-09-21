\* 99 Lisp problems in Shen
 * https://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html 
 *\

\\ 01 -- find the last box of a list
(define last
    [] -> []
    [X | Xs] -> (if (empty? Xs) 
                    X 
                    (last Xs)))

\\ 02 -- find the last but one box of a list
(define but-last
    Xs -> Xs where (or (empty? Xs) (empty? (tail Xs)))
    [X Y | Xs] -> (if (empty? Xs) 
                      [X Y]
                      (but-last [Y | Xs])))

\\ 03 -- find the K'th element of a list
(define kth
    K Xs -> [] where (or (empty? Xs) (<= K 0))
    K [X | Xs] -> (if (> K 1) 
                      (kth (- K 1) Xs) 
                      X))

\\ 04 -- find the number of elements of a list
(define length?
    [] -> 0
    [X | Xs] -> (+ 1 (length? Xs)))

\\ 05 -- reverse a list
(define flip
    [] -> []
    [X | Xs] -> (append (flip Xs) [X]))

\\ 06 -- find out whether a list is a palindrome
(define palindrome? X -> (= X (flip X)))

\\ 07 -- flatten a nested list structure
(define flatten
    [] -> []
    [X | Xs] -> (let H (if (or (empty? X) (cons? X)) 
                           (flatten X) 
                           [X])
                    (append H (flatten Xs))))

\\ 08 -- eliminate consecutive duplicates of list elements
(define compress
    Xs -> Xs where (or (empty? Xs) (empty? (tail Xs)))
    [X X | Xs] -> (compress [X | Xs])
    [X Y | Xs] -> [X | (compress [Y | Xs])])

\\ 09 -- pack consecutive duplicates of list elements into sublists
(define skip
    N Xs -> Xs where (or (<= N 0) (empty? Xs))
    N [X | Xs] -> (if (= N 1)
                      Xs
                      (skip (- N 1) Xs)))

(define group
    Xs -> Xs where (or (empty? Xs) (empty? (tail Xs)))
    [X X | Xs] -> [X | (group [X | Xs])]
    [X Y | Xs] -> [X])

(define pack
    [] -> []
    [X] -> [[X]]
    Xs -> (let G (group Xs)
            [G | (pack (skip (length G) Xs))]))

\\ 10 -- run-length encoding of a list
(define encode
    Xs -> (map (/. P (let H (head P)
                          L (length P)
                        [L | [H]]))
            (pack Xs)))

\\ 11 -- modified run-length encoding
(define encode-modified
    Xs -> (map (/. P (let H (head P)
                          L (length P)
                        (if (= L 1) H [L | [H]])))
               (pack Xs)))

\\ 12 -- decode a run-length encoded list
(define dup
    1 X -> [X]
    N X -> X where (<= N 0)
    N X -> [X | (dup (- N 1) X)])

(define decode
    [] -> []
    [X | Xs] -> (let Y (if (cons? X)
                           (dup (head X) (last X))
                           [X])
                    (append Y (decode Xs))))

\\ 13 -- run-length encoding of a list (direct solution)
\\ TBD:
(define encode/direct
    X -> tbd)

\\ 14 -- duplicate the elements of a list
(define duplicate
    [] -> []
    [X | Xs] -> [X X | (duplicate Xs)])

\\ 15 -- replicate the elements of a list a given number of times
(define replicate
    0 _ -> []
    N Xs -> Xs where (or (< N 0) (empty? Xs))
    N [X | Xs] -> (append (dup N X) 
                          (replicate N Xs)))

\\ TBD: define 'duplicate' as partial (replicate 2)

\\ 16 -- drop every N'th element from a list
(define curtail Xs -> (reverse (tail (reverse Xs))))

(define take
    0 Xs -> []
    N Xs -> Xs where (or (< N 0) (empty? Xs))
    N [X | Xs] -> [X | (take (- N 1) Xs)])

(define group/by
    N Xs -> Xs where (or (<= N 0) (empty? Xs))
    N Xs -> [(take N Xs) | (group/by N (skip N Xs))])

(define join
    [] -> []
    [X] -> X
    [X | Xs] -> (append X (join Xs)))

(define mod
    X Y -> (let Q (/ X Y)))
