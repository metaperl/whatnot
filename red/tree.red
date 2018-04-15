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

probe parse load input [collect tree]
