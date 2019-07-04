# module TextLayouts

export TextDiv

struct TextDiv
    body::Vector{String}
    layout::NamedTuple{(:margin, :size)}

    function TextDiv(body::Vector{String}; margin::Tuple{Int,Int}=(0,0), size::Tuple{Int,Int})
        layout = (margin=margin, size=size)
        new(body, layout)
    end

    function TextDiv(chars::Array{Char, 2}; margin::Tuple{Int,Int}=(0,0))
        body = [join(chars[:,i]) for i in 1:Base.size(chars)[2]]
        TextDiv(body; margin=margin, size=Base.size(chars))
    end
end

const LF = '\n'

function Base.show(io::IO, divs::Array{TextDiv, 2})
    Base.show(io, TextDiv(divs))
end

function Base.show(io::IO, divs::Array{TextDiv, 1})
    Base.show(io, TextDiv(divs))
end

function Base.show(io::IO, div::TextDiv)
    tb = textblock(div)
    print(io, join(tb.lines, LF))
end

function textblock(div::TextDiv)::NamedTuple{(:lines, :blocksize)}
    lines = Vector{String}()
    (marginleft, margintop) = div.layout.margin
    (width, height) = div.layout.size
    append!(lines, [repeat(' ', marginleft + width) for _ in 1:margintop])
    len = length(div.body)
    append!(lines, map(1:height) do h
        line = h <= len ? div.body[h] : ""
        str = rpad(line, width)
        join((repeat(' ', marginleft), join(collect(str)[1:width])))
    end)
    (lines=lines, blocksize=(marginleft + width, margintop + height))
end


function TextDiv(divs::Array{TextDiv, 2})
    tbs = textblock.(divs)
    height = maximum(map(tbs) do tb
        tb.blocksize[2]
    end)
    width = sum(map(tbs) do tb
        tb.blocksize[1]
    end)
    body = map(1:height) do h
        join(map(tbs) do tb
            if tb.blocksize[2] > h
                tb.lines[h]
            else
                h > length(tb.lines) ? "" : tb.lines[h]
            end
        end)
    end
    TextDiv(body; size=(width, height))
end

function TextDiv(divs::Array{TextDiv, 1})
    tbs = textblock.(divs)
    width = maximum(map(tbs) do tb
        tb.blocksize[1]
    end)
    height = sum(map(tbs) do tb
        tb.blocksize[2]
    end)
    body = mapfoldl(vcat, tbs) do tb
        tb.lines
    end
    TextDiv(body; size=(width, height))
end

# module TextLayouts
