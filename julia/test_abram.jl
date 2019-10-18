using SpecialFunctions

function abramm1(z::Complex{Float64}, ifexpon=1)
    local w:: Complex{Float64} = complex(0.0, 0.0)
    ccall((:abramm1_,:abram), Nothing, 
          (Ptr{Complex{Float64}},Ptr{Complex{Float64}},Ptr{Int64}), 
          Ref(Complex{Float64}(z)), Ref{Complex{Float64}}(w), Ref{Int64}(ifexpon))
    w
end

function abram0(z::Complex{Float64}, ifexpon=1)
    local w:: Complex{Float64} = complex(0.0, 0.0)
    ccall((:abram0_,:abram), Nothing, 
          (Ptr{Complex{Float64}},Ptr{Complex{Float64}},Ptr{Int64}), 
          Ref(Complex{Float64}(z)), Ref{Complex{Float64}}(w), Ref{Int64}(ifexpon))
    w
end

function abram1(z::Complex{Float64}, ifexpon=1)
    local w:: Complex{Float64} = complex(0.0, 0.0)
    ccall((:abram1_,:abram), Nothing, 
          (Ptr{Complex{Float64}},Ptr{Complex{Float64}},Ptr{Int64}), 
          Ref(Complex{Float64}(z)), Ref{Complex{Float64}}(w), Ref{Int64}(ifexpon))
    w
end

function abram2(z::Complex{Float64}, ifexpon=1)
    local w:: Complex{Float64} = complex(0.0, 0.0)
    ccall((:abram2_,:abram), Nothing, 
          (Ptr{Complex{Float64}},Ptr{Complex{Float64}},Ptr{Int64}), 
          Ref(Complex{Float64}(z)), Ref{Complex{Float64}}(w), Ref{Int64}(ifexpon))
    w
end


function test()

ntest = 1000000
z = rand(ntest) + 1im*rand(ntest)
z = z * 10

println("n = ", ntest)

println("abramm1:")
@time w = abramm1.(z)
@time w = abramm1.(z)
@time w = abramm1.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("abram0:")
@time w = abram0.(z)
@time w = abram0.(z)
@time w = abram0.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("abram1:")
@time w = abram1.(z)
@time w = abram1.(z)
@time w = abram1.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("abram2:")
@time w = abram2.(z)
@time w = abram2.(z)
@time w = abram2.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("exp:")
@time w = exp.(z)
@time w = exp.(z)
@time w = exp.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("done.")

end


test()
test()
test()
