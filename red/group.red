Red [
    Title:  "Group expressions"
    Author: 9214
    Date:   07-Jun-2017
]

group: func [
    list [any-list!]
    /paren
    /local position
][
    also list until [
        do/next list 'position
        tail? list: change/part/only 
            list
            do skip [to paren! copy/part list position] pick 0x2 paren
            position
    ]
]
