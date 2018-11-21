Red [
    Date: 21-Nov-2018
]

thread: func [body /local value][
    body: copy body
    get/any also 'value until [
        change/only 
            any [find/same body '. body] 
            set/any 'value do/next body 'body
        empty? body
    ]
]
