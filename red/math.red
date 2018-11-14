Red [
    Title:  "Extended MATH dialect"
    Author: 9214
    Date:   12-Nov-18
]

math: function [
    "Evaluates a block using math precedence rules, returning the last result."
    body [block!] "Block to evaluate."
    /local match
][
    table: [
        '**
        ['* | '/ | '% | '//]
        ['+ | '-]
    ]

    term:   [any-word! | any-path! | scalar! | paren!]
    binary: [term operator term]
    wrap:   [change copy match binary (do match)]

    body: copy/deep body
    do also body foreach operator table [
        parse body rule: [
            any [
                if (operator = '**) term operator rule [fail] 
                | ahead paren! into rule [fail]
                | some [ahead wrap] [fail]
                | skip
            ]
        ]
    ]
]
