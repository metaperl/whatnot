Red [
    Title:  "Positional constructor derived from prototype object"
    Date:   20-Apr-2018
    Author: 9214
    Link:   https://gitter.im/red/help?at=5ad8f9af6d7e07082b11962e
]

positional: function [proto [object!]][
    words: words-of proto
    body:  body-of  proto

    func words compose/deep/only [
        object append copy (body) reduce [
            'set (words) reduce (words)
        ]  
    ]
]

make': positional object [a: b: c: 0]
probe make' -1 0 1
