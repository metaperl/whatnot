Red [
    Title: "Implesay igpay atinlay anslatortray"
]

pigify: function [str][
    alphabet:   charset [#"a" - #"z"] 
    consonants: exclude alphabet charset "aeiou"

    parse lowercase str [
        (match: copy "")
        remove copy match some consonants
    ]

    rejoin [str match "ay"]
]
