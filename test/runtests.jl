using DataAndPlotting
using Test

#@show DataAndPlotting.initialize()
arr=initialize()
filename="array.h5"
rm(filename, force=true)
output(arr,filename)
arr2=readfile(filename)
@show maximum(abs.(arr2-arr))

@test isequal(arr2,arr)

#myplot(arr,"array.png")


