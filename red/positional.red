Red [
    Title:  "Positional constructor derived from prototype object"
    Date:   20-Apr-2018
    Author: 9214
    Link:   https://gitter.im/red/help?at=5ad8f9af6d7e07082b11962e
]

positional: function [
    prototype [object!] 
    /typed
][
    spec: words: words-of prototype: copy/deep prototype

    if typed [
        spec: collect [
            forall words [
                keep reduce [words/1 to block! type? get words/1]
            ]
        ] 
    ]

    func spec compose/only [
        also (prototype) set (prototype) reduce (words)
    ]
]

x: object [a: 'a b: #b c: 42]

probe make':  positional/typed x
probe make'': positional x

probe make'' 1 2 3
probe make' 'my #constructor "strongly-typed"

