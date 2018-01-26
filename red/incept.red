Red []

incept: func [block] compose [
    head insert/only append/only (
        collect [loop 3 [keep 'block]]
    )
]

incept [we need to go deeper]
