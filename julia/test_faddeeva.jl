using SpecialFunctions


function test()

##z = 1+2im
##w = erfcx(z)

ntest = 1000000
z = rand(ntest) + 1im*rand(ntest)
z = z * 10

println("n = ", ntest)

println("erf:")
@time w = erf.(z)
@time w = erf.(z)
@time w = erf.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("erfc:")
@time w = erfc.(z)
@time w = erfc.(z)
@time w = erfc.(z)
println("isfinite(w) = ", all(isfinite.(w)))

println("erfcx:")
@time w = erfcx.(z)
@time w = erfcx.(z)
@time w = erfcx.(z)
println("isfinite(w) =", all(isfinite.(w)))

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
