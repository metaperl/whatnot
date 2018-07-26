\* It is a sin to reinvent the wheel unless it is just for the pleasure of exploration. *\

(define empty? X -> (= X []))

(define cons? [_] -> true _ -> false)

(define append
    [] Y -> Y
    [X | []] Y -> [X | Y]
    [X | Xs] Y -> [X | (append Xs Y)])

(define head
    [] -> []
    [X | Xs] -> X)

(define tail
    [] -> []
    [X | Xs] -> Xs)

(define map
    F [] -> []
    F [X | Xs] -> [(F X) | (map F Xs)])
