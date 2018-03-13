Red [
    Title:  "Binary addition"
    Author: 9214
    Date:   13-Mar-2018
]

add-binary: function [x y][
    set [x y] reduce [
        reverse to binary! x
        reverse to binary! y
    ]

    append/dup 
        get pick [x y] lesser? length? x length? y 
        0
        absolute subtract length? x length? y

    carry: 0
    to binary! reverse collect [
        forall x [
            keep last to binary! i: x/1 + y/(index? x) + carry
            carry: i >>> 8
        ]
        keep carry
    ]
]

add-binary: function [x y][
    set [x y] reduce [
        to binary! x
        to binary! y
    ]

    insert/dup
        get pick [x y] lesser? length? x length? y
        0
        absolute subtract length? x length? y

    c: 0
    x: tail x y: tail y
    o: make binary! length? x
    until [
        x: back x y: back y
        
        insert o mod i: x/1 + y/1 + c 2 ** 8
        c: i >>> 8
        
        head? x
    ]

    head insert o c
]
