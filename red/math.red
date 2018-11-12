Red [
    Title:  "Extended MATH dialect"
    Author: 9214
    Date:   12-Nov-18
]

math: function [
    "Evaluates a block using math precedence rules, returning the last result."
    expression [block!] "Block to evaluate."
    /only "Apply precedence rules only to numeric expressions."
    /local match
][
    table: [
        '**
        ['* | '/ | '%]
        ['+ | '-]
    ]

    term:   compose [(pick [number! scalar!] only) | paren!]
    binary: [term operator term]
    wrap:   [change only copy match binary (to paren! match)]

    expression: copy/deep expression
    do also expression foreach operator table [
        parse expression rule: [
            any [
                if (operator = '**) ahead [term operator rule] [fail]           ; not general enough
                | some [ahead wrap] skip
                | ahead paren! into rule
                | skip
            ]
        ]
    ]
]
