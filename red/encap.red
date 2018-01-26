Red [
    Title:   "ad-hoc build script (encapper?)"
    Author:  9214
    Purpose: "to bypass current compiler limitations (until dyn-stack is implemented)"
    Rationale: {
      As of 0.6.2, alpha Red compiler sometimes can't handle too dynamic code, 
      which leads to all kinds of cryptic errors either DURING or AFTER compilation.
      General solution to this problem is:
          * copy-paste all of your scripts into one block;
          * remove all #include directives (to avoid `cannot open: <file>` errors);
          * write into temporary file `Red <header> do <block of scripts>`;
          * compile this temporary file and do some cleanup.
    }
    Usage: [
        O encap <header> <scripts> <config>

        o <header>  any valid block! header
        o <scripts> block! of [
            <dir1> [<file1> <file2>]
            <dir2> [<file3> <file4>]
            ...
            <dirN> [<fileN> <fileM>]
        ] specs in a *specific* order (mapping your project hierarchy and dependencies)
        o <config>  [
            red: <full path to red toolchain (in system format)>
            opt: <options for red compiler (in system format)>
        ]
    ]
    Example: [
        <header>  [Title: "example" Answer: 42]
        <scripts> [
            %./  [%foo.red %bar.red]
            %../ [%baz.red %qux.red]   
        ]
        <config> [
            red: "X:\path\to\red\executable"
            opt: "-r -o Y:\custom\path\to\exe"
        ]
    ]
    Todo: [
        o come up with more flexible format for <scripts>
    ]
]

source-of: func [
    "get source of the script without preface and header"
    script [file!]
    /header "get only header instead"
    /local
        blanks [bitset!]
        head   [block!]
        source [string!]
        _      [string!]
][  
    parse/case read script [
        (blanks: charset reduce [cr lf space tab] head: copy [])
        thru ["Red" any blanks ahead "["]
        _: to end
    ]
    parse load _ [set head block! source: to end]

    return either header [head][source]
]

uninclude: func [
    "delete all file inclusions from source block"
    source [block!]
][  
    #process off
    replace/deep/all source [#include file!][]
    #process on
]

encap: func [
    "pile up all scripts into one compile-able mess"
    header  [block!]
    folders [block!]
    config  [block!]
    /local
        tangle  [file!]
        body    [block!]
        dir     [file!]
        scripts [block!]
        script  [file!]
        path    [file!]
        exe     [file!]
][  
    tangle: rejoin [what-dir %.tangle- now/date '- now/time]
    do config
    body: collect [
        foreach [dir scripts] folders [
            foreach script scripts [
                keep uninclude source-of rejoin [dir script]
            ]
        ]
    ]
    write/lines tangle compose/only [
        Red (header) 
        do  (body)
    ]

    all [
        set [path exe] split-path to-red-file red
        change-dir path
        not make logic! call/console rejoin [%./ exe space opt space tangle]
        delete tangle
        'OK
    ]
]
