module DataAndPlotting
using HDF5
#using PyPlot
#using Plots

const ni=200
const nj=300

const ki=3
const kj=3

function indextocoord(i,ni)
    @assert ni>1
    @assert 1<= i <= ni
    (i-1)/(ni-1)
    end

#Create standing wave (our data set) 
export initialize 
function initialize()
    arr=zeros(Float64,ni,nj)
    for j in 1:nj, i in 1:ni
        x=indextocoord(i,ni)
        y=indextocoord(j,nj)
        arr[i,j]=sin(2π*ki*x) * sin(2π*kj*y)
    end
    arr
end

#Write to file in CSV form
export output
function output(arr::Array{Float64,2}, filename::String)
    h5write(filename, "data", arr)
    end


#Read back
export readfile
function readfile(filename::String)
    data=h5read(filename, "data")
    end


#Plot
 export myplot
function myplot(arr::Array{Float64,2},filename::String)
    #pyplot()
    heatmap(arr,clim=(-1.0,+1.0),color=:viridis)
    savefig(filename)
    end 

end # module 
