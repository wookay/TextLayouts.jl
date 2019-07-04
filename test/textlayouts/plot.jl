using Jive
@useinside module test_textlayouts_plot

using Test
using TextLayouts
using UnicodePlots: spy
using JSON2

path = normpath(@__DIR__, "img.json")
img = JSON2.read(IOBuffer(read(path)))
plot = spy(reshape(img, (28, 28)))

@test Vector{UInt8}(sprint(show, TextDiv(plot.graphics.grid, margin=(2,1)))) ==
UInt8[0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa2, 0x80, 0xe2, 0xa3, 0xa4, 0xe2, 0xa3, 0xa4, 0xe2, 0xa3, 0xb6, 0xe2, 0xa3, 0xb6, 0xe2, 0xa3, 0xb6, 0xe2, 0xa3, 0xb6, 0xe2, 0xa3, 0xb6, 0xe2, 0xa1, 0xb6, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x88, 0xe2, 0xa0, 0xbb, 0xe2, 0xa2, 0xbf, 0xe2, 0xa3, 0xbf, 0xe2, 0xa1, 0x8b, 0xe2, 0xa0, 0x9b, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x88, 0xe2, 0xa0, 0xbb, 0xe2, 0xa3, 0xb7, 0xe2, 0xa3, 0xb6, 0xe2, 0xa3, 0x84, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa3, 0x80, 0xe2, 0xa3, 0xac, 0xe2, 0xa3, 0xbd, 0xe2, 0xa3, 0xbf, 0xe2, 0xa0, 0x86, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa3, 0x80, 0xe2, 0xa3, 0xa4, 0xe2, 0xa3, 0xb6, 0xe2, 0xa3, 0xbf, 0xe2, 0xa3, 0xbf, 0xe2, 0xa0, 0xbf, 0xe2, 0xa0, 0x9b, 0xe2, 0xa0, 0x81, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0x0a, 0x20, 0x20, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x89, 0xe2, 0xa0, 0x89, 0xe2, 0xa0, 0x89, 0xe2, 0xa0, 0x89, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80, 0xe2, 0xa0, 0x80]

end # module test_textlayouts_plot
