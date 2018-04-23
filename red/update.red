Red [
    Title:  "Update record with a given path and monadic function"
    Date:   23-Apr-2018
    Author: 9214
    Link:   https://gitter.im/red/help?at=5ade12d327c509a774413b12
]

update: function [object path tweak][
    path: do compose [
        to path! head insert 
            (pick [to make] word? path) block! path 
            'object
    ]

    also object set/any path tweak get/any path
]

o: object [a: 1 b: object [c: 2]]

foreach [path tweak] reduce [
    'b/c func [x][x + 1]
    'a   func [x][x - 1]
    'b   func [x][42]
][
    probe update o path :tweak
]
