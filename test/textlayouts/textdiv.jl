module test_textlayouts_textdiv

using Test
using TextLayouts

arr = reshape(collect(repeat("12345678901234", 7)), (14,7))
left = TextDiv(arr)
right = TextDiv(["abc", "def", "ghi"], margin=(2,1), size=(5,5))

@test sprint(show, left) == chomp(repeat("12345678901234\n", 7))
@test sprint(show, right) == "       \n  abc  \n  def  \n  ghi  \n       \n       "

@test sprint(show, [left right]) == """
12345678901234       
12345678901234  abc  
12345678901234  def  
12345678901234  ghi  
12345678901234       
12345678901234       
12345678901234       """

@test sprint(show, [left; right]) == """
12345678901234
12345678901234
12345678901234
12345678901234
12345678901234
12345678901234
12345678901234
              
  abc         
  def         
  ghi         
              
              """

end # module test_textlayouts_textdiv
