Red [
    Date: 21-Nov-2018
]

thread: func [body /local .][
    bind body '.
    get/any also '. until [
        set/any '. do/next body 'body
        empty? body
    ]
]
