Red [
    Title:  "Bruteforce search of all available reflectors"
    Author: 9214
    Date:   9-Oct-2018
]

; N.B. KEYS-OF is an alias for VALUES-OF
reflectors: exclude parse help-string "reflect" [
    collect some [
        match: "-of" keep (to word! copy/part find/reverse/tail match space match)
        | skip
    ]
][keys]

datatypes: remove/part sort load help-string datatype! 12

seeds: [[[][]] [1 1 0] 0 0x0 "."]

cartesian: function [domains body][
    product: reduce [body]
    do take forall domains [
        remove back tail spelling: form domains/1
        product: reduce [
            head insert product reduce ['foreach to word! spelling domains/1]
        ] 
    ]
]

catalog: func [list entry][
    unless find list entry [append list entry]
]

probe also sked: make map! length? datatypes cartesian [datatypes reflectors seeds][
    all [
        attempt [reflect make get datatype seed reflector]
        do compose [
            (pick [[catalog select] put] to logic! sked/:datatype)
            sked datatype to block! reflector
        ]
    ]
]
