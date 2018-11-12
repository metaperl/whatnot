Red [
	Title:  "Arity of functions."
	Author: 9214
	Date:   27-Jan-2018
]

arity-of: function [
    function [word! path!]
    /local match
][  
    clean: [
        start: 
        any [remove [not [any-word! | refinement!] skip] | skip] 
        :start (
            remove find/same spec quote return:
            table: make map! length? spec
        )
    ]

    main: [copy match any any-word! (table/0: length? match)]

    extra: [
        any [
            copy match [refinement! any any-word!](
                unless /local == first match [
                    extend table reduce [to word! first match length? next match]
                ]
            )
        ]
    ]

    spec: copy/deep spec-of get first to path! function

    parse spec [clean main extra]

    either word? function [table/0][
        arity: 0
        add select table 0 foreach refinement next function [
            arity: arity + select table refinement
        ]
    ]
]

