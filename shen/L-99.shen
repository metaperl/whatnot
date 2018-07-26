\* https://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html *\

\\ find the last box of a list
(define last
    [] -> nil
    [X | Xs] -> (cases (empty? Xs) X 
                       true (last Xs)))

\\ find the last but one box of a list
(define but-last
    [] -> nil
    [X] -> [X]
    [X Y | Xs] -> (cases (empty? Xs) [X Y] 
                         true (but-last [Y | Xs])))

\\ find the K'th element of a list
(define at
    Xs K -> nil where (or (empty? Xs) (<= K 0))
    [X | Xs] K -> (cases (> K 1) (at Xs (- K 1)) 
                         true X))

\\ find the number of elements of a list
(define length?
    [] -> 0
    [X | Xs] -> (+ 1 (length? Xs)))

\\ reverse a list
(define reverse'
    [] -> []
    [X | Xs] -> (append (reverse' Xs) [X]))

\\ find out whether a list is a palindrome
(define palindrome? X -> (= X (reverse' X)))

\\ flatten a nested list structure
(define flatten
    [] -> []
    [X | Xs] -> (let H (cases (or (empty? X) (cons? X)) (flatten X)
                              true [X])
                    (append H (flatten Xs))))

\\ eliminate consecutive duplicates of list elements
(define compress
    [] -> []
    [X | []] -> [X]
    [X X | Xs] -> (compress [X | Xs])
    [X Y | Xs] -> [X | (compress [Y | Xs])])

