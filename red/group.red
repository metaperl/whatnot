Red [
    Title:  "Group expressions"
    Author: 9214
    Date:   07-Jun-2018
]

group: function [
    list [any-list!]
    /paren
][
    gather: skip [to paren! copy/part list position] pick 0x2 paren
    also list until [
        position: preprocessor/fetch-next list
        tail? list: change/part/only list do gather position
    ]
]
