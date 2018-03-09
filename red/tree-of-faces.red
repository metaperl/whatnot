Red [
    Purpose: "Minimal example of constructing View tree of faces by hand"
]

window: make face! [
    type: 'window
    offset: 100x100
    size: 100x100
    enabled?: yes
    visible?: yes
    parent: system/view/screens/1
]

button: make face! [
    type: 'button
    offset: 10x10
    size: 70x20
    enabled?: yes
    visible?: yes
    parent: window
    text: "wow"
]

window/pane: reduce [center-face button]

view center-face window
