Red [
    Title:  "Route parameters to Parse rules"
    Author: 9214
    Date:   05-Apr-2018
    Links: [
        https://laravel.com/docs/5.6/routing#route-parameters
        https://nikic.github.io/2014/02/18/Fast-request-routing-using-regular-expressions.html
    ]
]

emit: function [route [string!] /local label mark][
    rule: [
        collect [
            some [
                keep to "{" skip
                copy label to "}" skip ahead [set mark skip | end (mark: 'end)] 
                keep (
                    compose/only [
                        keep (
                            to paren! reduce ['quote to set-word! label]
                        ) 
                        keep to (mark)
                    ]
                )
            |   thru end keep ([thru end])
            ]
        ]
    ]

    reduce ['collect parse route rule]
]

probe context parse "/user/nikic/42" probe emit "/user/{name}/{id}"
