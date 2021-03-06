Red [
    Title:  "Palette of built-in colors"
    File:   %palette.red
    Author: 9214
    Date:   27-Dec-2017
    Needs:  View
]

colors: exclude sort extract load help-string tuple! 2 [transparent glass]
view/tight collect [
    until [
        foreach color take/part colors 4 [
            keep reduce [
                'base 70x40 form color get color pick [white black] gray > get color
            ]
        ]
        keep 'return empty? colors
    ]
]
