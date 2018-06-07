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
            to get pick [paren! block!] paren copy/part list position
            position
    ]
]
