Red [
    Title:  "Memoization function"
    Author: 9214
    Date:   16-Nov-2018
]

memoize: func [
    function
    /local
        arguments
        domain
        spec
        match
        block
        cache
        body
][
    arguments: collect [
        domain: parse spec: spec-of :function [
            collect any [
                keep set match [not quote return: any-word!] (keep match)
                | set match refinement! keep (to word! match) 
                | skip        
            ]
        ]
    ]

    cache: context [
        base: :function
        restore: func [domain /local value][
            to path! collect [
                keep 'base
                forall domain [
                    value: attempt [get/any domain/1]
                    all [logic? value value keep domain/1]
                ]
            ]
        ]

        memory: make block! 32
        recall: func [entry][
            select/only/case/skip memory reduce entry 2
        ]
        remember: func [key value][
            last repend memory [reduce key value]        
        ]

        result: leftover: none
        apply: func [function arguments][
            do/next compose [(function) (arguments)] 'leftover
        ]
        fix: func [arguments /local quotes result][
            quotes: [get-word! get-path! paren!]
            also arguments forall arguments [
                if any [
                    lit-word? arguments/1
                    get-word? arguments/1
                ][
                    set/any 'result do arguments/1
                    unless find quotes type?/word :result [
                        set/any 'arguments/1 :result                    
                    ]
                ]
            ]
        ]
    ]
    
    body: compose/deep/only bind [
        any [
            recall (domain)          
            remember (domain) apply restore (domain) fix (arguments)
        ]
    ] cache

    func spec body
]
