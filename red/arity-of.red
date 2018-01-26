Red []

arity-of: function [
    f [word! path!]
    /local match refinement
][
    parse spec: copy/deep spec-of get first to path! f [
        start:
        any [remove [not [word! | refinement!] skip] | skip]
        :start
        (table: make map! length? spec)
        copy match any word! (table/0: length? match)
        any [
            copy match [refinement! any word!](
                unless /local = first match [
                    extend table reduce [to word! first match length? next match]
                ]
            )
        ]
    ]

    also either word? f [table/0][
        arity: 0
        add select table 0 foreach refinement next f [
            arity: arity + select table refinement
        ]
    ](
        clear spec clear table
    )
]
