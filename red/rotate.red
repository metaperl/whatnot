Red [
  Title:  "sophisticated rotate function"
  Author: 9214
  Date:   23-Sep-2017
]

rotate: function [series offset][
    shift: offset: absolute offset % length: length? series
    head do compose [
        move/part (
            pick [
                [series tail series shift]
                [skip series length - shift series offset]
            ] negative? offset
        ) series
    ]
]
