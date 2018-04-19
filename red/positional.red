Red [
	Title:  "positional constructor derived from prototype object"
	Date:   20-Apr-2018
	Author: 9214
	Link:   https://gitter.im/red/help?at=5ad8f9af6d7e07082b11962e
]

positional: func [proto [object!]][
    func words-of proto compose/deep/only [
        make (proto) append copy body-of (proto) reduce [
            'set (words-of proto) reduce (words-of proto)
        ]  
    ]
]
