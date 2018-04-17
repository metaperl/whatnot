Red [
    Title:  "Bubble sort"
    Date:   17-Apr-2018
    Author: 9214
]

bubble: func [list [series!]][
    also list until [
        tail? next list: skip list do reduce [
            pick [do last] list/1 > list/2
            [swap list next list negate 1]
        ]
    ]
]
