Red []

only: func [:word body][
    do body parse body-of context? word [
        to remove ['only any-word! block!] to end
    ]
]

test: has [once][
    only once [print "Only once"]
    print "Any time"
]

test test ?? test
