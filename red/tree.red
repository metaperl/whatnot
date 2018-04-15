Red [
	Title:  "Binary tree parser"
	Date:   15-Apr-2018
	Author: 9214
]

input: {
    tree (
        tree (leaf 1 leaf)
        2
        tree (
            tree (leaf 3 leaf)
            4
            leaf
        )
    )
}

expected: [
    construct [
        left: construct [left: 'leaf value: 1 right: 'leaf]
        value: 2
        right: construct [
            left: construct [left: 'leaf value: 3 right: 'leaf]
            value: 4
            right: 'leaf
        ]
    ]
]

value: integer!
node:  [tree | leaf]
leaf:  ['leaf keep (quote 'leaf)]
tree:  [
    'tree keep ('object) keep ahead collect [
        into [
            keep (quote left:) node 
            keep (quote value:) keep value 
            keep (quote right:) node
        ]
    ] 
    skip
]

actual: parse load input [collect tree]

probe equal? actual expected
