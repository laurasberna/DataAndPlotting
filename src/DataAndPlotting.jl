module DataAndPlotting
#using CSV
#using Plots

const ni=30
const nj=30

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

#Read back

#Plot


end # module
