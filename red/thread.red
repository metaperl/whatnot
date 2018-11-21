Red [
    Date: 21-Nov-2018
]

thread: func [body /local .][
    body: bind copy body '.
    get/any also '. until [
        change any [find/same body '. body] set/any '. do/next body 'body
        empty? body
    ]
]
