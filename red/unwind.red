Red [
    Date: 22-Jul-2018
]

unwind: function [
    code [string! block! file! url!]
    /local match
] bind [
    code: switch type?/word code [
        string!    [load code]
        file! url! [read code]
        block!     [code]
    ]

    rule: [
        any [
            set match any-word! keep (to get-word! match) 
            | ahead any-list! into rule 
            | skip
        ]
    ]

    before: reduce words: unique parse code [collect rule]
    do code
    after: reduce words

    forall words [
        index: index? words
        unless same? pick before index pick after index [
            set/any words/1 pick before index
        ]
    ]
] copy/deep system/words
