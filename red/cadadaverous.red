Red [
    Title:      "Lispy reader macro"
    Dedication: "to the spirit that lives in the computer"
    Author:     9214
    Date:       24-Aug-2017
    Usage: {
        o setup:
            o plug in REPL with `do %<filename>.red` or simply copypaste;
            o `load` from `string!`;
        o have fun!
    }
    Tip: "use backtick to quote `paren!` (i.e. s-expressions)"
    Example: [
        SICP ex. 2.25
        
        cadaddr `(1 3 (5 7) 9)
        caar `((7))
        cadadadadadadr `(1 (2 (3 (4 (5 (6 7))))))
    ]
]

system/lexer/pre-load: function [source][
    parser: object [
        state: {}
        reset:    does [clear state]
        format:   func ['word][rejoin [space :word space]]
        add-func: func ['word][append state format :word]
        
        car: does [add-func first]
        cdr: does [add-func next]
    ]
    
    cadr-rule: ["c" some ["a" (parser/car) | "d" (parser/cdr)] "r"]
    lisp: [change cadr-rule (parser/state) (parser/reset) | skip]

    set '` :quote
    parse source [any lisp]
]
